package com.ogani.controller.customer;

import com.ogani.entity.*;
import com.ogani.service.OrderService;
import com.ogani.service.ReviewService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(value = "/review")
public class ReviewServlet extends HttpServlet {
    private final OrderService orderService = new OrderService();
    private final ReviewService reviewService = new ReviewService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Customer customer = (Customer) request.getSession().getAttribute("customerSession");
        if(customer == null) {
            response.sendRedirect("/login");
            return;
        }

        int orderId = Integer.parseInt(request.getParameter("orderId"));
        int orderDetailId = Integer.parseInt(request.getParameter("orderDetailId"));

        OrderDetail orderDetail = orderService.get(orderId)
                .getOrderDetails()
                .stream()
                .filter(m -> m.getId() == orderDetailId)
                .findFirst()
                .orElse(null);

        Review review = new Review();

        if(orderDetail != null) {
            review = reviewService.getByCustomerAndProduct(customer.getId(), orderDetail.getProduct().getId());
            if(review == null) {
                review = new Review();
                review.setRating(5);
                review.setProduct(orderDetail.getProduct());
            }
        }

        int cartsSize = 0;

        if(request.getSession().getAttribute("shoppingCart") != null) {
            ShoppingCart shoppingCart = (ShoppingCart)request.getSession().getAttribute("shoppingCart");
            cartsSize = shoppingCart.getSize();
        }

        request.setAttribute("cartSize", cartsSize);
        request.setAttribute("orderDetail", orderDetail);
        request.setAttribute("review", review);
        request.getRequestDispatcher("/views/customer/review.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Customer customer = (Customer) request.getSession().getAttribute("customerSession");
        if(customer == null) {
            response.sendRedirect("/login");
            return;
        }

        int productId = Integer.parseInt(request.getParameter("productId"));
        String content = request.getParameter("content");
        float stars = Float.parseFloat(request.getParameter("star"));

        Review review = reviewService.getByCustomerAndProduct(customer.getId(), productId);

        if(review != null) {
            review.setRating(stars);
            review.setContent(content);
            reviewService.update(review);

        } else {
            review = new Review();

            Product product = new Product();
            product.setId(productId);

            review.setRating(stars);
            review.setContent(content);
            review.setProduct(product);
            review.setCustomer(customer);
            reviewService.save(review);
        }

        response.sendRedirect("/detail?id=" + review.getProduct().getId());
    }
}
