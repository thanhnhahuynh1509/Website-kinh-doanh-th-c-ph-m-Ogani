package com.ogani.controller.customer;

import com.ogani.entity.Customer;
import com.ogani.entity.Product;
import com.ogani.entity.Wishlist;
import com.ogani.service.CustomerService;
import com.ogani.service.WishlistService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(value = "/remove-to-wishlist")
public class RemoveToWishlistServlet extends HttpServlet {
    private final WishlistService wishlistService = new WishlistService();
    private final CustomerService customerService = new CustomerService();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Customer customer = (Customer) session.getAttribute("customerSession");
        if(customer == null) {
            response.sendRedirect("/login");
            return;
        }
        int id = Integer.parseInt(request.getParameter("id"));
        wishlistService.delete(id);
        request.getSession().setAttribute("customerSession", customerService.get(customer.getId()));
        response.getWriter().write("");
    }
}
