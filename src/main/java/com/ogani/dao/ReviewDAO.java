package com.ogani.dao;

import com.ogani.entity.Review;

import java.util.List;

public class ReviewDAO extends JPADao<Review> {
    @Override
    public Review save(Review object) {
        return super.save(object);
    }

    @Override
    public Review get(Class<Review> type, Object id) {
        return super.get(type, id);
    }

    @Override
    public List<Review> list(String nameQuery) {
        return super.list(nameQuery);
    }

    @Override
    public Review update(Review object) {
        return super.update(object);
    }

    @Override
    public void delete(Class<Review> type, int id) {
        super.delete(type, id);
    }
}
