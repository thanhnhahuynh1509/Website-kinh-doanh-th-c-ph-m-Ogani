package com.ogani.service;

import com.ogani.dao.CategoryDAO;
import com.ogani.entity.Category;

import javax.persistence.TypedQuery;
import java.util.List;

public class CategoryService {
    private final CategoryDAO categoryDAO = new CategoryDAO();

    public Category save(Category category) {
        return categoryDAO.save(category);
    }

    public Category get(int id) {
        return categoryDAO.get(Category.class, id);
    }

    public List<Category> list(String status) {
        status = status.replaceAll("[\"']", "");
        String hql = "SELECT c FROM Category c WHERE c.status LIKE '" + status + "'";
        return categoryDAO.list(hql);
    }

    public List<Category> list() {
        String hql = "SELECT c FROM Category c";
        return categoryDAO.list(hql);
    }

    public Category update(Category category) {
        return categoryDAO.update(category);
    }

    public void delete(int id) {
        categoryDAO.delete(Category.class, id);
    }
}
