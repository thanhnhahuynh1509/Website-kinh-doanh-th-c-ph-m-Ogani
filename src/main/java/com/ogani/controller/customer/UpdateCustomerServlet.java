package com.ogani.controller.customer;

import com.ogani.entity.Customer;
import com.ogani.service.CustomerService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(value = "/update-customer")
public class UpdateCustomerServlet extends HttpServlet {
    private final CustomerService customerService = new CustomerService();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(request.getSession().getAttribute("customerSession") == null) {
            response.sendRedirect("/login");
            return;
        }
        int id = Integer.parseInt(request.getParameter("id"));
        String password = request.getParameter("password");
        Customer customer = customerService.get(id);
        customer.setPassword(password);
        customerService.update(customer);
        response.sendRedirect("/customer-info");
    }
}
