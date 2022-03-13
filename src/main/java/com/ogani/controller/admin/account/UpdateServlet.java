package com.ogani.controller.admin.account;

import com.ogani.entity.Admin;
import com.ogani.helper.AbsolutePath;
import com.ogani.helper.GenerateImageFileName;
import com.ogani.service.AdminService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet(value = "/admin/account/update")
@MultipartConfig()
public class UpdateServlet extends HttpServlet {
    private final AdminService adminService = new AdminService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        request.setAttribute("titlePage", "Cập nhật tài khoản");
        request.setAttribute("admin", adminService.get(id));
        request.getRequestDispatcher("/views/admin/account/update.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        Admin admin = adminService.get(id);

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");

        Timestamp birthdate = null;
        try {
            Date date = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("birthdate"));
            birthdate = new Timestamp(date.getTime());
        } catch (ParseException e) {
            e.printStackTrace();
        }

        Part part = request.getPart("image");
        if(part != null && part.getSize() > 0) {
            boolean rs = new File(AbsolutePath.getAbsolutePath(request) + "upload/img/" + admin.getImage()).delete();
            String image = GenerateImageFileName.generate(part);
            admin.setImage(image);
            part.write(AbsolutePath.getAbsolutePath(request) + "upload/img/" + image);
        }

        admin.setAddress(address);
        admin.setBirthdate(birthdate);
        admin.setEmail(email);
        admin.setName(name);
        admin.setPhone(phone);

        adminService.update(admin);

        request.getSession().setAttribute("admin", admin);

        response.sendRedirect("/admin/account/update?id=" + id);
    }
}
