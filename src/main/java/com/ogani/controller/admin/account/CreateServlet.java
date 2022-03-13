package com.ogani.controller.admin.account;

import com.ogani.entity.Admin;
import com.ogani.helper.AbsolutePath;
import com.ogani.helper.GenerateImageFileName;
import com.ogani.service.AdminService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet(value = "/admin/account/create")
@MultipartConfig()
public class CreateServlet extends HttpServlet {
    private final AdminService adminService = new AdminService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(!((Admin)request.getSession().getAttribute("admin")).isHighLevel()) {
            response.sendRedirect("/admin");
        }
        request.setAttribute("titlePage", "Thêm quản trị viên");
        request.setAttribute("message", request.getSession().getAttribute("message"));
        request.getSession().removeAttribute("message");
        request.getRequestDispatcher("/views/admin/account/create.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(!((Admin)request.getSession().getAttribute("admin")).isHighLevel()) {
            response.sendRedirect("/admin");
        }
        String username = request.getParameter("username");

        if(adminService.isUsernameExists(username)) {
            request.getSession().setAttribute("message", "Tên tài khoản đã tồn tại");
            response.sendRedirect("/admin/account/create");
        }

        String password = request.getParameter("password");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");

        Part part = request.getPart("image");
        String image = GenerateImageFileName.generate(part);
        boolean isHighLevel = request.getParameter("isHighLevel") != null;
        Timestamp birthdate = null;
        try {
            Date date = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("birthdate"));
            birthdate = new Timestamp(date.getTime());
        } catch (ParseException e) {
            e.printStackTrace();
        }

        Admin admin = new Admin();
        admin.setAddress(address);
        admin.setBirthdate(birthdate);
        admin.setEmail(email);
        admin.setHighLevel(isHighLevel);
        admin.setImage(image);
        admin.setName(name);
        admin.setPassword(password);
        admin.setUsername(username);
        admin.setPhone(phone);

        adminService.save(admin);

        part.write(AbsolutePath.getAbsolutePath(request) + "upload/img/" + image);

        response.sendRedirect("/admin/account");
    }
}
