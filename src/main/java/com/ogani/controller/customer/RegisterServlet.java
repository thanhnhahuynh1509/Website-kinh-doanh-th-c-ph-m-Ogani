package com.ogani.controller.customer;

import com.ogani.entity.Customer;
import com.ogani.entity.ShoppingCart;
import com.ogani.service.CustomerService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(value = "/register")
public class RegisterServlet extends HttpServlet {
    private final CustomerService customerService = new CustomerService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(request.getSession().getAttribute("customerSession") != null) {
            response.sendRedirect("/");
            return;
        }
        int cartsSize = 0;

        if(request.getSession().getAttribute("shoppingCart") != null) {
            ShoppingCart shoppingCart = (ShoppingCart)request.getSession().getAttribute("shoppingCart");
            cartsSize = shoppingCart.getSize();
        }

        request.setAttribute("cartSize", cartsSize);
        request.getRequestDispatcher("/views/customer/sign-up.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(request.getSession().getAttribute("customerSession") != null) {
            response.sendRedirect("/");
            return;
        }
        String username = request.getParameter("username");

        if(customerService.userExists(username)) {
            request.setAttribute("username", username);
            request.setAttribute("message", "Tài khoản đã tồn tại");
            request.getRequestDispatcher("/views/customer/sign-up.jsp").forward(request, response);
            return;
        }

        String password = request.getParameter("password");
        Customer customer = new Customer();
        customer.setUsername(username);
        customer.setPassword(password);

        request.getSession().setAttribute("customerSession",customerService.save(customer));
        response.sendRedirect("/");
    }
}
