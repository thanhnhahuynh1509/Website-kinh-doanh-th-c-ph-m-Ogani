package com.ogani.controller.admin.category;

import com.ogani.entity.Admin;
import com.ogani.entity.Category;
import com.ogani.helper.AbsolutePath;
import com.ogani.helper.GenerateImageFileName;
import com.ogani.helper.GenerateString;
import com.ogani.service.CategoryService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.File;
import java.io.IOException;
import java.util.List;

@WebServlet(value = "/admin/category/create")
@MultipartConfig()
public class CreateServlet extends HttpServlet {
    private final CategoryService categoryService = new CategoryService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("titlePage", "Thêm thể loại");
        request.getRequestDispatcher("/views/admin/category/create.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Admin admin = (Admin) (request.getSession().getAttribute("admin"));

        Category category = new Category();
        category.setCreatedBy(admin);

        String name = request.getParameter("name");
        Part part = request.getPart("image");

        if(part != null && part.getSize() > 0) {
            String fileSave = GenerateImageFileName.generate(part);
            category.setImage(fileSave);
            part.write(AbsolutePath.getAbsolutePath(request) + "upload/img/" + fileSave);
        }

        category.setName(name);
        categoryService.save(category);

        response.sendRedirect("/admin/category");
    }
}
