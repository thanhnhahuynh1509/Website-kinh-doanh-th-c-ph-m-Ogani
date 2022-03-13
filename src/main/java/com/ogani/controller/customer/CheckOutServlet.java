package com.ogani.controller.customer;

import com.ogani.entity.*;
import com.ogani.service.OrderService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Map;

@WebServlet(value = "/check-out")
public class CheckOutServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ShoppingCart shoppingCart = (ShoppingCart) request.getSession().getAttribute("shoppingCart");
        Customer customer = (Customer) request.getSession().getAttribute("customerSession");

        if(customer == null) {
            response.sendRedirect("/login");
            return;
        }

        if(shoppingCart == null || shoppingCart.getSize() == 0) {
            response.sendRedirect("/");
            return;
        }
        int cartsSize = 0;

        if(request.getSession().getAttribute("shoppingCart") != null) {
            cartsSize = shoppingCart.getSize();
        }

        request.setAttribute("cartSize", cartsSize);
        request.getRequestDispatcher("/views/customer/check-out.jsp").forward(request, response);
    }
}
