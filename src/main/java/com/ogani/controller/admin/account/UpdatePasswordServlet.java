package com.ogani.controller.admin.account;

import com.ogani.entity.Admin;
import com.ogani.service.AdminService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(value = "/admin/account/update-password")
public class UpdatePasswordServlet extends HttpServlet {
    private final AdminService adminService = new AdminService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        request.setAttribute("titlePage","Đổi mật khẩu");
        request.setAttribute("admin", adminService.get(id));
        request.setAttribute("message", request.getSession().getAttribute("message"));
        request.getSession().removeAttribute("message");
        request.getRequestDispatcher("/views/admin/account/update-password.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String oldPassword = request.getParameter("password");
        String newPassword = request.getParameter("passwordNew");

        Admin admin = adminService.get(id);
        if(!admin.getPassword().equals(oldPassword)) {
            request.getSession().setAttribute("message", "Mật khẩu cũ không đúng");
            response.sendRedirect("/admin/account/update-password?id=" + id);
            return;
        }
        admin.setPassword(newPassword);
        adminService.update(admin);
        response.sendRedirect("/admin/account");
    }
}
