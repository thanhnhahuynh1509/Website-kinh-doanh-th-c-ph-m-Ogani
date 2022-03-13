package com.ogani.dao;

import com.ogani.entity.Order;
import com.ogani.entity.OrderDetail;
import com.ogani.helper.JPAUtil;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import java.util.List;

public class OrderDAO extends JPADao<Order> {
    private final EntityManagerFactory entityManagerFactory = JPAUtil.getEntityManagerFactory();
    private final EntityManager entityManager = entityManagerFactory.createEntityManager();

    @Override
    public Order save(Order object) {
        return super.save(object);
    }

    @Override
    public Order get(Class<Order> type, Object id) {
        return super.get(type, id);
    }

    @Override
    public List<Order> list(String nameQuery) {
        return super.list(nameQuery);
    }

    @Override
    public Order update(Order object) {
        return super.update(object);
    }

    @Override
    public void delete(Class<Order> type, int id) {
        super.delete(type, id);
    }
}
