package com.ogani.controller.admin.category;

import com.ogani.service.CategoryService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(value = "/admin/category")
public class HomeServlet extends HttpServlet {
    private final CategoryService categoryService = new CategoryService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("titlePage", "Danh sách thể loại");
        request.setAttribute("categories", categoryService.list("Hoạt động"));
        request.getRequestDispatcher("/views/admin/category/home.jsp").forward(request,response);
    }
}
