package com.ogani.controller.admin.order;

import com.ogani.service.OrderService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(value = "/admin/order/success")
public class SuccessServlet extends HttpServlet {
    private final OrderService orderService = new OrderService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("titlePage", "Giao Hàng Thành Công");
        request.setAttribute("orders", orderService.list("Giao hàng thành công"));
        request.getRequestDispatcher("/views/admin/order/success.jsp").forward(request, response);
    }
}
