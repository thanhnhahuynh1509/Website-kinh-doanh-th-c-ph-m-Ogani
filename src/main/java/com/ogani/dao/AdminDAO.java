package com.ogani.dao;

import com.ogani.entity.Admin;

import java.util.List;

public class AdminDAO extends JPADao<Admin> {
    @Override
    public Admin save(Admin object) {
        return super.save(object);
    }

    @Override
    public Admin get(Class<Admin> type, Object id) {
        return super.get(type, id);
    }

    @Override
    public List<Admin> list(String nameQuery) {
        return super.list(nameQuery);
    }

    @Override
    public Admin update(Admin object) {
        return super.update(object);
    }

    @Override
    public void delete(Class<Admin> type, int id) {
        super.delete(type, id);
    }
}
