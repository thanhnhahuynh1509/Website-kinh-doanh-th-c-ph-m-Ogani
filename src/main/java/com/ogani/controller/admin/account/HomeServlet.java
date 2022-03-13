package com.ogani.controller.admin.account;

import com.ogani.entity.Admin;
import com.ogani.service.AdminService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(value = "/admin/account")
public class HomeServlet extends HttpServlet {
    private final AdminService adminService = new AdminService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(!((Admin)request.getSession().getAttribute("admin")).isHighLevel()) {
            response.sendRedirect("/admin");
        }
        request.setAttribute("titlePage", "Danh sách quản trị viên");
        request.setAttribute("admins", adminService.list("Hoạt động"));
        request.getRequestDispatcher("/views/admin/account/home.jsp").forward(request, response);
    }

}
