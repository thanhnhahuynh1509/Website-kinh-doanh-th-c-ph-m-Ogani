package com.ogani.dao;

import com.ogani.entity.Customer;

import java.util.List;

public class CustomerDAO extends JPADao<Customer> {

    @Override
    public Customer save(Customer object) {
        return super.save(object);
    }

    @Override
    public Customer get(Class<Customer> type, Object id) {
        return super.get(type, id);
    }

    @Override
    public List<Customer> list(String nameQuery) {
        return super.list(nameQuery);
    }

    @Override
    public Customer update(Customer object) {
        return super.update(object);
    }

    @Override
    public void delete(Class<Customer> type, int id) {
        super.delete(type, id);
    }
}
