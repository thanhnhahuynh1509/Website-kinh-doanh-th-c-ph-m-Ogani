package com.ogani.controller.admin.product;

import com.ogani.entity.Admin;
import com.ogani.entity.Product;
import com.ogani.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Timestamp;

@WebServlet(value = "/admin/product/active")
public class ActiveServlet extends HttpServlet {
    private final ProductService productService = new ProductService();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Product item = productService.get(id);

        if(item != null) {
            item.setStatus("Hoạt động");
            item.setUpdatedAt(new Timestamp(System.currentTimeMillis()));
            Admin admin = (Admin) (request.getSession().getAttribute("admin"));
            item.setUpdatedBy(admin);
            productService.update(item);
        }

        response.getWriter().write("");
    }
}
