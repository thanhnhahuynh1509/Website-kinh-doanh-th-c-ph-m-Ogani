package com.ogani.controller.customer;

import com.ogani.entity.ShoppingCart;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Arrays;

@WebServlet(value = "/update-cart")
public class UpdateCartServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ShoppingCart shoppingCart = (ShoppingCart) request.getSession().getAttribute("shoppingCart");
        if(shoppingCart != null && shoppingCart.getSize() > 0) {
            String[] params = request.getParameterValues("quantity");
            int[] quantities = Arrays.stream(params).mapToInt(Integer::parseInt).toArray();
            shoppingCart.update(quantities);
        }
        response.sendRedirect("/shopping-cart");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
