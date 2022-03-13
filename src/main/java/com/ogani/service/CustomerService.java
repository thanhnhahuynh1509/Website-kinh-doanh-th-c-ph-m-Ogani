package com.ogani.service;

import com.ogani.dao.CustomerDAO;
import com.ogani.entity.Customer;

import java.util.List;

public class CustomerService {
    private final CustomerDAO customerDAO = new CustomerDAO();

    public Customer save(Customer customer) {
        return customerDAO.save(customer);
    }

    public Customer get(int id) {
        return customerDAO.get(Customer.class, id);
    }

    public boolean userExists(String username) {
        username = username.replaceAll("[\"'`]", "");
        String hql = "SELECT c FROM Customer c WHERE c.username like '" + username + "'";
        List<Customer> list = customerDAO.list(hql);
        return list.size() > 0;
    }

    public Customer getCustomerByUAP(String username, String password) {
        username = username.replaceAll("[\"'`]", "");
        password = password.replaceAll("[\"'`]", "");
        String hql = "SELECT c FROM Customer c WHERE c.username like '" + username + "' AND c.password like '" + password + "'";
        List<Customer> list = customerDAO.list(hql);
        return list.size() > 0 ? list.get(0) : null;
    }

    public List<Customer> list() {
        String hql = "SELECT c FROM Customer c";
        return customerDAO.list(hql);
    }

    public Customer update(Customer customer) {
        return customerDAO.update(customer);
    }

    public void delete(int id) {
        customerDAO.delete(Customer.class, id);
    }
}
