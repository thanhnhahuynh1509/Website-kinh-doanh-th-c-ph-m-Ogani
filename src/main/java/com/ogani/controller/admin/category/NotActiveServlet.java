package com.ogani.controller.admin.category;

import com.ogani.entity.Admin;
import com.ogani.entity.Category;
import com.ogani.service.CategoryService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Timestamp;

@WebServlet(value = "/admin/category/not-active")
public class NotActiveServlet extends HttpServlet {
    private final CategoryService categoryService = new CategoryService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("titlePage", "Không hoạt động");
        request.setAttribute("categories", categoryService.list("Không hoạt động"));
        request.getRequestDispatcher("/views/admin/category/not-active.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Category category = categoryService.get(id);

        if(category != null) {
            category.setStatus("Không hoạt động");
            category.setUpdatedAt(new Timestamp(System.currentTimeMillis()));
            Admin admin = (Admin) (request.getSession().getAttribute("admin"));
            category.setUpdatedBy(admin);
            categoryService.update(category);
        }

        response.getWriter().write("");
    }
}
