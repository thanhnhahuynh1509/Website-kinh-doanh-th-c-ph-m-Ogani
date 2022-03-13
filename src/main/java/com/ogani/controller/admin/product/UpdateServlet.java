package com.ogani.controller.admin.product;

import com.ogani.entity.Admin;
import com.ogani.entity.Category;
import com.ogani.entity.Product;
import com.ogani.helper.AbsolutePath;
import com.ogani.helper.GenerateImageFileName;
import com.ogani.service.CategoryService;
import com.ogani.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;

@WebServlet(value = "/admin/product/update")
@MultipartConfig()
public class UpdateServlet extends HttpServlet {
    private final ProductService productService = new ProductService();
    private final CategoryService categoryService = new CategoryService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = productService.get(id);
        request.setAttribute("titlePage", "Cập nhật");
        request.setAttribute("product", product);
        request.setAttribute("categories", categoryService.list("Hoạt động"));
        request.getRequestDispatcher("/views/admin/product/update.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Category category = new Category();

        // category
        int categoryId = Integer.parseInt(request.getParameter("categoryId"));
        category.setId(categoryId);

        // product
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        double prices = Double.parseDouble(request.getParameter("prices"));
        double weight = Double.parseDouble(request.getParameter("weight"));
        int sale = Integer.parseInt(request.getParameter("sale"));

        Part part = request.getPart("image");

        Product product = productService.get(id);

        if(product != null) {
            if(part != null && part.getSize() > 0) {
                boolean rs = new File(AbsolutePath.getAbsolutePath(request) + "upload/img/" + product.getImage()).delete();
                String image = GenerateImageFileName.generate(part);
                product.setImage(image);
                part.write(AbsolutePath.getAbsolutePath(request) + "upload/img/" + image);
            }

            product.setName(name);
            product.setCategory(category);
            product.setDescription(description);
            product.setPrices(prices);
            product.setSale(sale);
            product.setWeight(weight);
            product.setUpdatedAt(new Timestamp(System.currentTimeMillis()));
            Admin admin = (Admin) (request.getSession().getAttribute("admin"));
            product.setUpdatedBy(admin);

            productService.update(product);

            if(product.getStatus().equals("Hoạt động"))
                response.sendRedirect("/admin/product");
            else if(product.getStatus().equals("Không hoạt động"))
                response.sendRedirect("/admin/product/not-active");
        } else {
            response.sendRedirect("/admin/product");
        }

    }
}
