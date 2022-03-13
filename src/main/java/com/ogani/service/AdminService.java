package com.ogani.service;

import com.ogani.dao.AdminDAO;
import com.ogani.entity.Admin;

import java.util.List;

public class AdminService {
    private final AdminDAO adminDAO = new AdminDAO();

    public Admin save(Admin admin) {
        return adminDAO.save(admin);
    }

    public Admin get(int id) {
        return adminDAO.get(Admin.class, id);
    }

    public List<Admin> list(String status) {
        status = status.replaceAll("[\"'`]", "");
        String hql = "SELECT a FROM Admin a WHERE a.status like '" + status + "'";
        return adminDAO.list(hql);
    }

    public List<Admin> listAll() {
        String hql = "SELECT a FROM Admin a";
        return adminDAO.list(hql);
    }

    public Admin update(Admin admin) {
        return adminDAO.update(admin);
    }

    public void delete(int id) {
        adminDAO.delete(Admin.class, id);
    }

    public boolean isUsernameExists(String username) {
        username = username.replaceAll("[\"'`]", "");
        String hql = "SELECT a FROM Admin a WHERE a.username like '" + username + "'";
        List<Admin> list = adminDAO.list(hql);
        return list.size() > 0;
    }

    public Admin checkLogin(String username, String password) {
        username = username.replaceAll("[\"'`]", "");
        password = password.replaceAll("[\"'`]", "");
        String hql = "SELECT a FROM Admin a WHERE a.username LIKE '" + username + "' AND a.password LIKE '" + password + "'";
        List<Admin> list = adminDAO.list(hql);
        return list.size() > 0 ? list.get(0) : null;
    }
}
