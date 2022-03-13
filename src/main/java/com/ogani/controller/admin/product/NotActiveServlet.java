package com.ogani.controller.admin.product;

import com.ogani.entity.Admin;
import com.ogani.entity.Product;
import com.ogani.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Timestamp;

@WebServlet(value = "/admin/product/not-active")
public class NotActiveServlet extends HttpServlet {
    private final ProductService productService = new ProductService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("titlePage", "Không hoạt động");
        request.setAttribute("products", productService.list("Không hoạt động"));
        request.getRequestDispatcher("/views/admin/product/not-active.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Product item = productService.get(id);

        if(item != null) {
            item.setUpdatedAt(new Timestamp(System.currentTimeMillis()));
            item.setStatus("Không hoạt động");
            Admin admin = (Admin) (request.getSession().getAttribute("admin"));
            item.setUpdatedBy(admin);
            productService.update(item);
        }
        response.getWriter().write("");
    }
}
