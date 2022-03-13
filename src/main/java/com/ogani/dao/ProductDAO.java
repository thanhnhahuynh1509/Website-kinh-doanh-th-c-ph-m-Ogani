package com.ogani.dao;

import com.ogani.entity.Product;

import java.util.List;

public class ProductDAO extends JPADao<Product>{

    @Override
    public Product save(Product object) {
        return super.save(object);
    }

    @Override
    public Product get(Class<Product> type, Object id) {
        return super.get(type, id);
    }

    @Override
    public List<Product> list(String nameQuery) {
        return super.list(nameQuery);
    }

    @Override
    public Product update(Product object) {
        return super.update(object);
    }

    @Override
    public void delete(Class<Product> type, int id) {
        super.delete(type, id);
    }
}
