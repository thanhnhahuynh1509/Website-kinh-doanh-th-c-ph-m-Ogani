package com.ogani.controller.admin.customer;

import com.ogani.service.CustomerService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(value = "/admin/customer")
public class HomeServlet extends HttpServlet {
    private final CustomerService customerService = new CustomerService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("titlePage", "Tài khoản người dùng");
        request.setAttribute("customers", customerService.list());
        request.getRequestDispatcher("/views/admin/customer/home.jsp").forward(request, response);
    }

}
