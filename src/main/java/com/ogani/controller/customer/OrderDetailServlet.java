package com.ogani.controller.customer;

import com.ogani.entity.Customer;
import com.ogani.entity.ShoppingCart;
import com.ogani.service.OrderService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(value = "/order-details")
public class OrderDetailServlet extends HttpServlet {
    private final OrderService orderService = new OrderService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int cartsSize = 0;

        if(request.getSession().getAttribute("shoppingCart") != null) {
            ShoppingCart shoppingCart = (ShoppingCart)request.getSession().getAttribute("shoppingCart");
            cartsSize = shoppingCart.getSize();
        }

        if(request.getSession().getAttribute("customerSession") == null) {
            response.sendRedirect("/login");
            return;
        }

        int id = Integer.parseInt(request.getParameter("id"));
        request.setAttribute("cartSize", cartsSize);
        request.setAttribute("order", orderService.get(id));
        request.getRequestDispatcher("/views/customer/order-detail.jsp").forward(request, response);
    }

}
