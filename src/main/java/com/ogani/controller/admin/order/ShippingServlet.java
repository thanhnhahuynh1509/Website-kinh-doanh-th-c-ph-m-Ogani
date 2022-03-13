package com.ogani.controller.admin.order;

import com.ogani.service.OrderService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(value = "/admin/order/shipping")
public class ShippingServlet extends HttpServlet {
    private final OrderService orderService = new OrderService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("titlePage", "Đang Giao Hàng");
        request.setAttribute("orders", orderService.list("Đang giao hàng"));
        request.getRequestDispatcher("/views/admin/order/shipping.jsp").forward(request, response);
    }
}
