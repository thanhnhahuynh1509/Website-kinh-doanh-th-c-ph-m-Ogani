package com.ogani.controller.admin.account;

import com.ogani.entity.Admin;
import com.ogani.helper.AbsolutePath;
import com.ogani.service.AdminService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.File;
import java.io.IOException;

@WebServlet(value = "/admin/account/delete")
public class DeleteServlet extends HttpServlet {
    private final AdminService adminService = new AdminService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Admin admin = adminService.get(id);

        adminService.delete(id);
        boolean result = new File(AbsolutePath.getAbsolutePath(request) + "upload/img/" + admin.getImage()).delete();
        response.sendRedirect("/admin/account/trash");
    }

}
