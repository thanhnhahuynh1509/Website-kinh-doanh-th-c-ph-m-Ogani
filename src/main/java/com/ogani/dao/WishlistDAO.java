package com.ogani.dao;

import com.ogani.entity.Wishlist;

import java.util.List;

public class WishlistDAO extends JPADao<Wishlist> {
    @Override
    public Wishlist save(Wishlist object) {
        return super.save(object);
    }

    @Override
    public Wishlist get(Class<Wishlist> type, Object id) {
        return super.get(type, id);
    }

    @Override
    public List<Wishlist> list(String nameQuery) {
        return super.list(nameQuery);
    }

    @Override
    public Wishlist update(Wishlist object) {
        return super.update(object);
    }

    @Override
    public void delete(Class<Wishlist> type, int id) {
        super.delete(type, id);
    }
}
