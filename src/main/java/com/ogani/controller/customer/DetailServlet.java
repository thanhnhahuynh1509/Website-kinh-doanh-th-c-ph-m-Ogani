package com.ogani.controller.customer;

import com.ogani.entity.Product;
import com.ogani.entity.ShoppingCart;
import com.ogani.service.CategoryService;
import com.ogani.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.stream.Collectors;

@WebServlet(value = "/detail")
public class DetailServlet extends HttpServlet {
    private final ProductService productService = new ProductService();
    private final CategoryService categoryService = new CategoryService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        int cartsSize = 0;

        if(request.getSession().getAttribute("shoppingCart") != null) {
            ShoppingCart shoppingCart = (ShoppingCart)request.getSession().getAttribute("shoppingCart");
            cartsSize = shoppingCart.getSize();
        }

        Product product = productService.get(id);

        if(product != null) {
            request.setAttribute("productRelated", categoryService.get(product.getCategory().getId()).getProducts().stream().limit(4).collect(Collectors.toList()));
        }

        request.setAttribute("cartSize", cartsSize);
        request.setAttribute("categories", categoryService.list("Hoạt động"));
        request.setAttribute("product", product);
        request.getRequestDispatcher("/views/customer/detail.jsp").forward(request, response);
    }

}
