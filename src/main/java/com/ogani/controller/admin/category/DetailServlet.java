package com.ogani.controller.admin.category;

import com.ogani.entity.Category;
import com.ogani.service.CategoryService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(value = "/admin/category/detail")
public class DetailServlet extends HttpServlet {
    private final CategoryService categoryService = new CategoryService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Category category = categoryService.get(id);
        request.setAttribute("titlePage", category.getName());
        request.setAttribute("category", category);
        request.getRequestDispatcher("/views/admin/category/detail.jsp").forward(request, response);
    }

}
