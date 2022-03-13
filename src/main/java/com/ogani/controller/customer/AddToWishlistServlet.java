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

@WebServlet(value = "/add-to-wishlist")
public class AddToWishlistServlet extends HttpServlet {
    private final CustomerService customerService = new CustomerService();
    private final WishlistService wishlistService = new WishlistService();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Customer customer = (Customer) session.getAttribute("customerSession");
        if(customer == null) {
            response.getWriter().write("failed");
            return;
        }

        int productId = Integer.parseInt(request.getParameter("productId"));

        Wishlist wishlist = new Wishlist();

        Product product = new Product();
        product.setId(productId);

        wishlist.setProduct(product);
        wishlist.setCustomer(customer);

        wishlist = wishlistService.save(wishlist);

        String id = wishlist.getId() + "";

        request.getSession().setAttribute("customerSession", customerService.get(customer.getId()));
        response.getWriter().write(id);
    }
}
