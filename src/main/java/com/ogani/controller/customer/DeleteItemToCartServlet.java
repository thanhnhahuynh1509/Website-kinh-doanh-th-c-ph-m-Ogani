package com.ogani.controller.customer;

import com.google.gson.Gson;
import com.ogani.entity.ShoppingCart;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(value = "/delete-item-to-cart")
public class DeleteItemToCartServlet extends HttpServlet {
    private final Gson gson = new Gson();
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        int id = Integer.parseInt(request.getParameter("id"));
        ShoppingCart shoppingCart = (ShoppingCart) request.getSession().getAttribute("shoppingCart");
        if(shoppingCart != null) {
            shoppingCart.delete(id);
            List<String> list = new ArrayList<>();
            list.add(shoppingCart.getSize() + "");
            list.add(shoppingCart.getTotalPrices());

            response.getWriter().write(gson.toJson(list));
            return;
        }
        response.getWriter().write(gson.toJson("failed"));
    }
}
