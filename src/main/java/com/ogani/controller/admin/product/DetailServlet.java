package com.ogani.controller.admin.product;

import com.ogani.entity.Product;
import com.ogani.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(value = "/admin/product/detail")
public class DetailServlet extends HttpServlet {
    private final ProductService productService = new ProductService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = productService.get(id);
        request.setAttribute("titlePage", product.getName());
        request.setAttribute("product", product);
        request.getRequestDispatcher("/views/admin/product/detail.jsp").forward(request, response);
    }

}
