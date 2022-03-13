package com.ogani.controller.customer;

import com.ogani.entity.Customer;
import com.ogani.entity.ShoppingCart;
import com.ogani.service.CustomerService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(value = "/login")
public class LoginCustomerServlet extends HttpServlet {
    private final CustomerService customerService = new CustomerService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(request.getSession().getAttribute("customerSession") != null) {
            response.sendRedirect("/");
            return;
        }
        int cartsSize = 0;

        if(request.getSession().getAttribute("shoppingCart") != null) {
            ShoppingCart shoppingCart = (ShoppingCart)request.getSession().getAttribute("shoppingCart");
            cartsSize = shoppingCart.getSize();
        }

        request.setAttribute("cartSize", cartsSize);
        request.setAttribute("message", request.getSession().getAttribute("message"));
        request.getSession().removeAttribute("message");
        request.getRequestDispatcher("/views/customer/sign-in.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(request.getSession().getAttribute("customerSession") != null) {
            response.sendRedirect("/");
            return;
        }
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        Customer customer = customerService.getCustomerByUAP(username, password);

        if(customer != null) {
            request.getSession().setAttribute("customerSession",customerService.save(customer));
            response.sendRedirect("/");
        } else {
            request.getSession().setAttribute("message", "Tên đăng nhập hoặc mật khẩu không đúng");
            response.sendRedirect("/login");
        }
    }
}
