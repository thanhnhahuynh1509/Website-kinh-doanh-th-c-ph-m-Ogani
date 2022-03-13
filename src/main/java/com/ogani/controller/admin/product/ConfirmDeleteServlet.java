package com.ogani.controller.admin.product;

import com.ogani.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(value = "/admin/product/confirm-delete")
public class ConfirmDeleteServlet extends HttpServlet {
    private final ProductService productService = new ProductService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        request.setAttribute("titlePage", "Xác nhận xóa");
        request.setAttribute("product", productService.get(id));
        request.getRequestDispatcher("/views/admin/product/confirm-delete.jsp").forward(request, response);
    }
}
