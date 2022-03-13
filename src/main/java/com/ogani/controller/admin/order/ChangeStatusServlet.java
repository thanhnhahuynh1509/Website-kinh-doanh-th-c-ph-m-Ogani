package com.ogani.controller.admin.order;

import com.ogani.entity.Admin;
import com.ogani.entity.Order;
import com.ogani.service.OrderService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Timestamp;

@WebServlet(value = "/admin/order/change-status")
public class ChangeStatusServlet extends HttpServlet {
    private final OrderService orderService = new OrderService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String status = request.getParameter("status");
        Order order = orderService.get(id);
        if(order != null) {
            order.setStatus(status);
            order.setUpdatedBy(((Admin) request.getSession().getAttribute("admin")));
            order.setUpdatedAt(new Timestamp(System.currentTimeMillis()));
            orderService.update(order);
        }
        if(status.equals("Đang giao hàng"))
            response.sendRedirect("/admin/order/shipping");
        else if(status.equals("Giao hàng thành công"))
            response.sendRedirect("/admin/order/success");
        else
            response.sendRedirect("/admin/order/cancel");
    }

}
