package com.ogani.controller.customer;

import com.ogani.entity.Product;
import com.ogani.entity.ShoppingCart;
import com.ogani.service.CategoryService;
import com.ogani.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;

@WebServlet(value = "/shop")
public class ShopServlet extends HttpServlet {
    private final CategoryService categoryService = new CategoryService();
    private final ProductService productService = new ProductService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String requestPage = request.getParameter("page");
        String keySearch = request.getParameter("key");
        String categoryIdStr = request.getParameter("categoryId");

        int page = 1;
        if(requestPage != null && requestPage.matches("\\d+")) {
            page = Integer.parseInt(requestPage);
        }

        HttpSession session = request.getSession();
        int cartsSize = 0;
        int limitItemInPage = 9;

        if(session.getAttribute("shoppingCart") != null) {
            ShoppingCart shoppingCart = (ShoppingCart)session.getAttribute("shoppingCart");
            cartsSize = shoppingCart.getSize();
        }

        List<Product> products = productService.list("Hoạt động");

        List<Product> productsNew = products.stream().sorted(
                (a, b) -> b.getId() - a.getId()
        ).limit(6).collect(Collectors.toList());

        if(categoryIdStr != null) {
            int categoryId = Integer.parseInt(categoryIdStr);
            products = products.stream().filter(m -> m.getCategory().getId() == categoryId).collect(Collectors.toList());
        }

        if(keySearch != null) {
            products = products.stream().filter(m -> m.getName().contains(keySearch)).collect(Collectors.toList());
        }

        List<Product> productsDiscount = products.stream()
                .filter(p -> p.getSale() > 0)
                .sorted((a, b) -> b.getSale() - a.getSale()).limit(9).collect(Collectors.toList());

        request.setAttribute("cartSize", cartsSize);
        request.setAttribute("keySearch", keySearch);
        request.setAttribute("categories", categoryService.list("Hoạt động"));
        request.setAttribute("products", products.stream().skip((long) (page - 1) * limitItemInPage).limit(limitItemInPage).collect(Collectors.toList()));
        request.setAttribute("productsNew", productsNew);
        request.setAttribute("productsDiscount", productsDiscount);
        request.setAttribute("allNumberPage", Math.ceil((double)products.size() / limitItemInPage));
        request.getRequestDispatcher("/views/customer/shop.jsp").forward(request, response);
    }


}
