package com.ogani.controller.admin.account;

import com.ogani.service.AdminService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(value = "/admin/account/confirm-delete")
public class ConfirmDeleteServlet extends HttpServlet {
    private final AdminService adminService = new AdminService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        request.setAttribute("titlePage", "Xác nhận xóa");
        request.setAttribute("admin", adminService.get(id));
        request.getRequestDispatcher("/views/admin/account/confirm-delete.jsp").forward(request, response);
    }

}
