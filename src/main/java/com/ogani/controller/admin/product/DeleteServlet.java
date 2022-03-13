package com.ogani.controller.admin.product;

import com.ogani.entity.Product;
import com.ogani.helper.AbsolutePath;
import com.ogani.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.File;
import java.io.IOException;

@WebServlet(value = "/admin/product/delete")
public class DeleteServlet extends HttpServlet {
    private final ProductService productService = new ProductService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = productService.get(id);

        if(product != null) {
            boolean rs = new File(AbsolutePath.getAbsolutePath(request) + "upload/img/" + product.getImage()).delete();
        }

        productService.delete(id);
        response.sendRedirect("/admin/product/trash");
    }
}
