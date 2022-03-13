package com.ogani.service;

import com.ogani.dao.OrderDetailDAO;
import com.ogani.entity.OrderDetail;

import java.util.List;

public class OrderDetailService {
    private final OrderDetailDAO orderDetailDAO = new OrderDetailDAO();

    public List<OrderDetail> list() {
        String hql = "FROM OrderDetail";
        return orderDetailDAO.list(hql);
    }
}
