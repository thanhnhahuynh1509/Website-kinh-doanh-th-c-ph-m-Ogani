package com.ogani.service;

import com.ogani.dao.WishlistDAO;
import com.ogani.entity.Wishlist;

import java.util.List;

public class WishlistService {
    private final WishlistDAO wishlistDAO = new WishlistDAO();

    public Wishlist save(Wishlist wishlist) {
        return wishlistDAO.save(wishlist);
    }

    public Wishlist get(int id) {
        return wishlistDAO.get(Wishlist.class, id);
    }

    public List<Wishlist> list() {
        String hql = "FROM Wishlist";
        return wishlistDAO.list(hql);
    }

    public List<Wishlist> list(int id) {
        String hql = "SELECT w FROM Wishlist w WHERE w.customer.id = " + id;
        return wishlistDAO.list(hql);
    }

    public Wishlist update(Wishlist wishlist) {
        return wishlistDAO.update(wishlist);
    }

    public void delete(int id) {
        wishlistDAO.delete(Wishlist.class, id);
    }
}
