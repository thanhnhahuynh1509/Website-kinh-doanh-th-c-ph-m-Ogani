package com.ogani.controller.admin.product;

import com.ogani.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(value = "/admin/product")
public class HomeServlet extends HttpServlet {
    private final ProductService productService = new ProductService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("titlePage", "Danh sách sản phẩm");
        request.setAttribute("products", productService.list("Hoạt động"));
        request.getRequestDispatcher("/views/admin/product/home.jsp").forward(request, response);
    }
}
