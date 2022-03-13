package com.ogani.controller.customer;

import com.ogani.entity.Order;
import com.ogani.service.OrderService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(value = "/cancel-order")
public class CancelOrderServlet extends HttpServlet {
    private final OrderService orderService = new OrderService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(request.getSession().getAttribute("customerSession") == null) {
            response.sendRedirect("/login");
            return;
        }
        int id = Integer.parseInt(request.getParameter("id"));
        Order order = orderService.get(id);

        if(order != null && order.getStatus().equals("Chờ xử lý")) {
            order.setStatus("Hủy");
            orderService.update(order);
        }
        response.sendRedirect("/order-details?id=" + id);
    }


}
