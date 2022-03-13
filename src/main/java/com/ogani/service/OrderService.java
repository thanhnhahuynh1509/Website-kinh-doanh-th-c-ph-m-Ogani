package com.ogani.service;

import com.ogani.dao.OrderDAO;
import com.ogani.entity.Order;

import java.util.List;

public class OrderService {
    private final OrderDAO orderDAO = new OrderDAO();

    public Order save(Order order) {
        return orderDAO.save(order);
    }

    public Order get(int id) {
        return orderDAO.get(Order.class, id);
    }

    public List<Order> list(String status) {
        status = status.replaceAll("[\"'`]", "");
        String hql = "SELECT o FROM Order o WHERE o.status like '" + status + "'";
        return orderDAO.list(hql);
    }

    public List<Order> listAll() {
        String hql = "SELECT o FROM Order o";
        return orderDAO.list(hql);
    }

    public Order update(Order order) {
        return orderDAO.update(order);
    }

    public void delete(int id) {
        orderDAO.delete(Order.class, id);
    }
}
