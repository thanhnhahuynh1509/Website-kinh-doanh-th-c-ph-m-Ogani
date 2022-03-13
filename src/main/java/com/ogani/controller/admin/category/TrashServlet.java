package com.ogani.controller.admin.category;

import com.ogani.entity.Admin;
import com.ogani.entity.Category;
import com.ogani.service.CategoryService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Timestamp;

@WebServlet(value = "/admin/category/trash")
public class TrashServlet extends HttpServlet {
    private final CategoryService categoryService = new CategoryService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("message", request.getSession().getAttribute("message"));
        request.getSession().removeAttribute("message");
        request.setAttribute("titlePage", "Rác");
        request.setAttribute("categories", categoryService.list("Rác"));
        request.getRequestDispatcher("/views/admin/category/trash.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Category category = categoryService.get(id);

        if(category != null) {
            category.setStatus("Rác");
            category.setUpdatedAt(new Timestamp(System.currentTimeMillis()));
            Admin admin = (Admin) (request.getSession().getAttribute("admin"));
            category.setUpdatedBy(admin);
            categoryService.update(category);
        }

        response.getWriter().write("");
    }
}
