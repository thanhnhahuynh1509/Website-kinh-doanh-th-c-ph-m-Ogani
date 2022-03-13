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

@WebServlet(value = "/admin/product/create")
@MultipartConfig()
public class CreateServlet extends HttpServlet {
    private final ProductService productService = new ProductService();
    private final CategoryService categoryService = new CategoryService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("titlePage", "Thêm sản phẩm");
        request.setAttribute("categories", categoryService.list("Hoạt động"));
        request.getRequestDispatcher("/views/admin/product/create.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Product product = new Product();
        Category category = new Category();

        // category
        int categoryId = Integer.parseInt(request.getParameter("categoryId"));
        category.setId(categoryId);

        // product
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        double prices = Double.parseDouble(request.getParameter("prices"));
        double weight = Double.parseDouble(request.getParameter("weight"));
        int sale = Integer.parseInt(request.getParameter("sale"));

        Part part = request.getPart("image");

        if(part != null && part.getSize() > 0) {
            String image = GenerateImageFileName.generate(part);
            part.write(AbsolutePath.getAbsolutePath(request) + "upload/img/" + image);
            product.setImage(image);
        }
        Admin admin = (Admin) (request.getSession().getAttribute("admin"));
        product.setCreatedBy(admin);
        product.setName(name);
        product.setCategory(category);
        product.setDescription(description);
        product.setPrices(prices);
        product.setSale(sale);
        product.setWeight(weight);

        productService.save(product);
        response.sendRedirect("/admin/product");
    }
}
