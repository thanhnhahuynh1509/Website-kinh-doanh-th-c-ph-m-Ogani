package com.ogani.controller.customer;

import com.ogani.entity.Category;
import com.ogani.entity.Product;
import com.ogani.entity.ShoppingCart;
import com.ogani.helper.JPAUtil;
import com.ogani.service.CategoryService;
import com.ogani.service.ProductService;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@WebServlet(value = "")
public class HomeServlet extends HttpServlet {
    private final CategoryService categoryService = new CategoryService();
    private final ProductService productService = new ProductService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        int cartsSize = 0;

        if(session.getAttribute("shoppingCart") != null) {
            ShoppingCart shoppingCart = (ShoppingCart)session.getAttribute("shoppingCart");
            cartsSize = shoppingCart.getSize();
        }

        List<Product> products = productService.list("Hoạt động");

        List<Product> productsNew = products.stream().sorted(
                (a, b) -> b.getId() - a.getId()
        ).limit(6).collect(Collectors.toList());

        List<Product> productTopRating = products.stream()
                .sorted((a, b) -> (int) (b.averageRating() - a.averageRating()))
                .limit(6)
                .collect(Collectors.toList());

        List<Product> productTopReviews = products.stream()
                .sorted((a, b) -> b.getReviews().size() - a.getReviews().size())
                .limit(6)
                .collect(Collectors.toList());

        request.setAttribute("cartSize", cartsSize);
        request.setAttribute("categories", categoryService.list("Hoạt động"));
        request.setAttribute("products", products.stream().limit(8).collect(Collectors.toList()));
        request.setAttribute("productsNew", productsNew);
        request.setAttribute("productsTopRate", productTopRating);
        request.setAttribute("productsTopReviews", productTopReviews);
        request.getRequestDispatcher("/views/customer/home.jsp").forward(request, response);
    }

}
