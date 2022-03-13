package com.ogani.controller.admin.category;

import com.ogani.entity.Admin;
import com.ogani.entity.Category;
import com.ogani.helper.AbsolutePath;
import com.ogani.helper.GenerateImageFileName;
import com.ogani.service.CategoryService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;

@WebServlet(value = "/admin/category/update")
@MultipartConfig()
public class UpdateServlet extends HttpServlet {
    private final CategoryService categoryService = new CategoryService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        request.setAttribute("titlePage", "Cập nhật");
        request.setAttribute("category", categoryService.get(id));

        request.getRequestDispatcher("/views/admin/category/update.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        Part part = request.getPart("image");

        Category category = categoryService.get(id);

        if(category != null) {
            if(part != null && part.getSize() > 0) {
                String pathFileDelete = AbsolutePath.getAbsolutePath(request) + "upload/img/" + category.getImage();
                boolean deleteResult = new File(pathFileDelete).delete();

                String fileName = GenerateImageFileName.generate(part);
                part.write(AbsolutePath.getAbsolutePath(request) + "upload/img/" + fileName);
                category.setImage(fileName);
            }

            category.setName(name);
            Admin admin = (Admin) (request.getSession().getAttribute("admin"));
            category.setUpdatedBy(admin);
            category.setUpdatedAt(new Timestamp(System.currentTimeMillis()));
            categoryService.update(category);

            if(category.getStatus().equals("Hoạt động"))
                response.sendRedirect("/admin/category");
            else if(category.getStatus().equals("Không hoạt động"))
                response.sendRedirect("/admin/category/not-active");
        } else {
            response.sendRedirect("/admin/category");
        }
    }
}
