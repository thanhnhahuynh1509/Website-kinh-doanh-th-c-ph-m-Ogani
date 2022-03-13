package com.ogani.controller.common;

import com.ogani.entity.Admin;
import com.ogani.entity.RememberClass;
import com.ogani.service.AdminService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(value = "/login-admin")
public class LoginAdminServlet extends HttpServlet {
    private final AdminService adminService = new AdminService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("message", request.getSession().getAttribute("message"));
        request.getSession().removeAttribute("message");
        request.getRequestDispatcher("/views/admin/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String remember = request.getParameter("remember");

        Admin admin = adminService.checkLogin(username, password);

        if(admin != null) {
            if(!admin.getStatus().equals("Hoạt động")) {
                session.setAttribute("message", "Tài khoản không còn hoạt động nữa");
                response.sendRedirect("/login-admin");
                return;
            }
            session.setAttribute("admin", admin);

            if(remember != null) {
                RememberClass rememberClass = new RememberClass(username, password, remember);
                session.setAttribute("rememberAdmin", rememberClass);
            } else {
                session.removeAttribute("rememberAdmin");
            }
            response.sendRedirect("/admin");
        } else {
            session.setAttribute("message", "Tên tài khoản hoặc mật khẩu không đúng");
            response.sendRedirect("/login-admin");
        }
    }
}
