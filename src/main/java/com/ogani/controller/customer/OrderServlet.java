package com.ogani.controller.customer;

import com.ogani.entity.Customer;
import com.ogani.entity.ShoppingCart;
import com.ogani.service.CustomerService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(value = "/orders")
public class OrderServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int cartsSize = 0;

        if(request.getSession().getAttribute("shoppingCart") != null) {
            ShoppingCart shoppingCart = (ShoppingCart)request.getSession().getAttribute("shoppingCart");
            cartsSize = shoppingCart.getSize();
        }

        Customer customer = (Customer) request.getSession().getAttribute("customerSession");
        if(customer == null) {
            response.sendRedirect("/login");
            return;
        }
        request.setAttribute("cartSize", cartsSize);
        request.setAttribute("customer", new CustomerService().get(customer.getId()));
        request.getRequestDispatcher("/views/customer/order.jsp").forward(request, response);
    }

}
