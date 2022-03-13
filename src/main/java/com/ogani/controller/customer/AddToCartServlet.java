package com.ogani.controller.customer;

import com.google.gson.Gson;
import com.ogani.entity.ShoppingCart;
import com.ogani.service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(value = "/add-to-cart")
public class AddToCartServlet extends HttpServlet {
    private Gson gson = new Gson();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        int id = Integer.parseInt(request.getParameter("id"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        ShoppingCart shoppingCart = (ShoppingCart) session.getAttribute("shoppingCart");
        if(shoppingCart == null) {
            shoppingCart = new ShoppingCart();
        }
        shoppingCart.add(id, quantity);
        session.setAttribute("shoppingCart", shoppingCart);

        response.sendRedirect("/shopping-cart");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        int id = Integer.parseInt(request.getParameter("id"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        ShoppingCart shoppingCart = (ShoppingCart) session.getAttribute("shoppingCart");
        if(shoppingCart == null) {
            shoppingCart = new ShoppingCart();
        }
        shoppingCart.add(id, quantity);
        session.setAttribute("shoppingCart", shoppingCart);

        int size = shoppingCart.getCarts().size();

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(gson.toJson(size));
    }
}
