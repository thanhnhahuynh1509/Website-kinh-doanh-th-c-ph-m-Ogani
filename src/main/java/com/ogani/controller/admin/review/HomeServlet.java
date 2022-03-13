package com.ogani.controller.admin.review;

import com.ogani.service.ReviewService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(value = "/admin/review")
public class HomeServlet extends HttpServlet {
    private final ReviewService reviewService = new ReviewService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("titlePage", "Đánh giá");
        request.setAttribute("reviews", reviewService.list());
        request.getRequestDispatcher("/views/admin/review/home.jsp").forward(request, response);
    }

}
