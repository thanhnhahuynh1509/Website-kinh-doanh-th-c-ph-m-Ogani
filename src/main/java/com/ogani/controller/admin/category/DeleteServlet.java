package com.ogani.controller.admin.category;

import com.ogani.entity.Category;
import com.ogani.helper.AbsolutePath;
import com.ogani.service.CategoryService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.File;
import java.io.IOException;

@WebServlet(value = "/admin/category/delete")
public class DeleteServlet extends HttpServlet {
    private final CategoryService categoryService = new CategoryService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Category item = categoryService.get(id);

        if(item.getProducts().size() > 0) {
            request.getSession().setAttribute("message", "Thể loại có liên quan đến vài sản phẩm. Vui lòng xóa hết sản phẩm liên quan nếu muốn xóa thể loại!");
            response.sendRedirect("/admin/category/trash");
            return;
        }

        if(item != null) {
            boolean rs = new File(AbsolutePath.getAbsolutePath(request) + "upload/img/" + item.getImage()).delete();
            categoryService.delete(id);
        }

        response.sendRedirect("/admin/category/trash");
    }
}
