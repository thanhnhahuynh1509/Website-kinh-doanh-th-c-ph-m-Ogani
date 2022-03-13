package com.ogani.controller.admin.order;

import com.ogani.service.OrderService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(value = "/admin/order/waiting")
public class WaitingServlet extends HttpServlet {
    private final OrderService orderService = new OrderService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("titlePage", "Chờ Xử Lý");
        request.setAttribute("orders", orderService.list("Chờ xử lý"));
        request.getRequestDispatcher("/views/admin/order/waiting.jsp").forward(request, response);
    }

}
