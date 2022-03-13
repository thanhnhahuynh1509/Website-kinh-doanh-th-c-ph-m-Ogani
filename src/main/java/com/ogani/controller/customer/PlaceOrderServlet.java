package com.ogani.controller.customer;

import com.ogani.entity.*;
import com.ogani.service.OrderService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Map;

@WebServlet(value = "/place-order")
public class PlaceOrderServlet extends HttpServlet {

    private final OrderService orderService = new OrderService();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Customer customer = (Customer) session.getAttribute("customerSession");
        ShoppingCart shoppingCart = (ShoppingCart) session.getAttribute("shoppingCart");

        if(customer == null) {
            response.sendRedirect("/login");
            return;
        }

        if(shoppingCart == null || shoppingCart.getSize() == 0) {
            response.sendRedirect("/");
            return;
        }

        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String email = request.getParameter("email");

        Order order = new Order();
        order.setRecipientName(name);
        order.setRecipientEmail(email);
        order.setRecipientPhone(phone);
        order.setRecipientAddress(address);
        order.setCustomer(customer);
        order.setTotalPrices(shoppingCart.getTotalPricesPure());
        order.setTotalQuantity(shoppingCart.getTotalQuantity());

        for(Map.Entry<Product, Integer> item : shoppingCart.getCarts().entrySet()) {
            OrderDetail orderDetail = new OrderDetail();
            orderDetail.setProduct(item.getKey());
            orderDetail.setQuantity(item.getValue());
            order.getOrderDetails().add(orderDetail);
        }

        orderService.save(order);
        shoppingCart.clear();
        request.getSession().setAttribute("confirmAlert", "Cảm ơn bạn đã thanh toán");
        response.sendRedirect("/shopping-cart");
    }
}
