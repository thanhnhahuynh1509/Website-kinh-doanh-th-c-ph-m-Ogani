package com.ogani.dao;

import com.ogani.entity.Category;

import java.util.List;

public class CategoryDAO extends JPADao<Category>{

    @Override
    public Category save(Category object) {
        return super.save(object);
    }

    @Override
    public Category get(Class<Category> type, Object id) {
        return super.get(type, id);
    }

    @Override
    public List<Category> list(String nameQuery) {
        return super.list(nameQuery);
    }

    @Override
    public Category update(Category object) {
        return super.update(object);
    }

    @Override
    public void delete(Class<Category> type, int id) {
        super.delete(type, id);
    }
}
