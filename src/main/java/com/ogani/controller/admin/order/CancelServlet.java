package com.ogani.controller.admin.order;

import com.ogani.service.OrderService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(value = "/admin/order/cancel")
public class CancelServlet extends HttpServlet {
    private final OrderService orderService = new OrderService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("titlePage", "Hủy");
        request.setAttribute("orders", orderService.list("Hủy"));
        request.getRequestDispatcher("/views/admin/order/cancel.jsp").forward(request, response);
    }
}
