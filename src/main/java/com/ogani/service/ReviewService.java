package com.ogani.service;

import com.ogani.dao.ReviewDAO;
import com.ogani.entity.Review;

import java.util.List;

public class ReviewService {
    private final ReviewDAO reviewDAO = new ReviewDAO();

    public Review save(Review review) {
        return reviewDAO.save(review);
    }

    public Review get(int id) {
        return reviewDAO.get(Review.class, id);
    }

    public List<Review> list() {
        String hql = "SELECT r FROM Review r";
        return reviewDAO.list(hql);
    }

    public Review getByCustomerAndProduct(int customerId, int productId) {
        String hql = "SELECT r FROM Review r WHERE r.customer.id = " + customerId + " AND r.product.id = " + productId;
        List<Review> list = reviewDAO.list(hql);
        return list.size() > 0 ? list.get(0) : null;
    }

    public Review update(Review review) {
        return reviewDAO.update(review);
    }

    public void delete(int id) {
        reviewDAO.delete(Review.class, id);
    }
}
