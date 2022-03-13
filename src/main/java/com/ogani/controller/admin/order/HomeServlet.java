package com.ogani.controller.admin.order;

import com.ogani.service.OrderService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(value = "/admin/order")
public class HomeServlet extends HttpServlet {
    private final OrderService orderService = new OrderService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("titlePage", "Hóa đơn");
        request.setAttribute("orders", orderService.listAll());
        request.getRequestDispatcher("/views/admin/order/home.jsp").forward(request, response);
    }

}
