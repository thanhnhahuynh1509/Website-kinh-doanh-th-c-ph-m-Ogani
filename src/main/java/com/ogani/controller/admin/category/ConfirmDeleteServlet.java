package com.ogani.controller.admin.category;

import com.ogani.service.CategoryService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(value = "/admin/category/confirm-delete")
public class ConfirmDeleteServlet extends HttpServlet {
    private final CategoryService categoryService = new CategoryService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        request.setAttribute("titlePage", "Xác nhận xóa");
        request.setAttribute("category", categoryService.get(id));
        request.getRequestDispatcher("/views/admin/category/confirm-delete.jsp").forward(request, response);
    }

}
