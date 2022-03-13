package com.ogani.controller.admin.order;

import com.ogani.service.OrderService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(value = "/admin/order/detail")
public class DetailServlet extends HttpServlet {
    private final OrderService orderService = new OrderService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        request.setAttribute("titlePage", "Chi Tiết Đơn Hàng");
        request.setAttribute("order", orderService.get(id));
        request.getRequestDispatcher("/views/admin/order/detail.jsp").forward(request, response);
    }

}
