package com.ogani.controller.admin.account;

import com.ogani.entity.Admin;
import com.ogani.service.AdminService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(value = "/admin/account/trash")
public class TrashServlet extends HttpServlet {
    private final AdminService adminService = new AdminService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("titlePage", "Rác");
        request.setAttribute("admins", adminService.list("Rác"));
        request.getRequestDispatcher("/views/admin/account/trash.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Admin admin = adminService.get(id);
        if(admin != null) {
            admin.setStatus("Rác");
            adminService.update(admin);
        }

        response.getWriter().write("");
    }
}
