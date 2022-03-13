package com.ogani.controller.admin.account;

import com.ogani.service.AdminService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(value = "/admin/account/detail")
public class DetailServlet extends HttpServlet {
    private final AdminService accountService = new AdminService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        request.setAttribute("titlePage", "Thông tin");
        request.setAttribute("account", accountService.get(id));
        request.getRequestDispatcher("/views/admin/account/detail.jsp").forward(request, response);
    }
}
