package com.ogani.dao;

import com.ogani.entity.OrderDetail;

import java.util.List;

public class OrderDetailDAO extends JPADao<OrderDetail> {

    @Override
    public OrderDetail save(OrderDetail object) {
        return super.save(object);
    }

    @Override
    public OrderDetail get(Class<OrderDetail> type, Object id) {
        return super.get(type, id);
    }

    @Override
    public List<OrderDetail> list(String nameQuery) {
        return super.list(nameQuery);
    }

    @Override
    public OrderDetail update(OrderDetail object) {
        return super.update(object);
    }

    @Override
    public void delete(Class<OrderDetail> type, int id) {
        super.delete(type, id);
    }
}
