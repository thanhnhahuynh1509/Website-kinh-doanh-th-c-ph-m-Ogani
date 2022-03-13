package com.ogani.service;

import com.ogani.dao.ProductDAO;
import com.ogani.entity.Product;

import java.util.List;

public class ProductService {
    private final ProductDAO productDAO = new ProductDAO();

    public Product save(Product product) {
        return productDAO.save(product);
    }

    public Product get(int id) {
        return productDAO.get(Product.class, id);
    }

    public List<Product> list(String status) {
        status = status.replaceAll("[\"']", "");
        String hql = "SELECT p FROM Product p WHERE p.status like '" + status + "'";
        return productDAO.list(hql);
    }

    public List<Product> list() {
        String hql = "SELECT p FROM Product p";
        return productDAO.list(hql);
    }

    public Product update(Product product) {
        return productDAO.update(product);
    }

    public void delete(int id) {
        productDAO.delete(Product.class, id);
    }
}
