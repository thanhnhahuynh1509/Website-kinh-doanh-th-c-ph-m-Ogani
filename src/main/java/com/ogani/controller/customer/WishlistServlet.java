package com.ogani.controller.customer;

import com.ogani.entity.Customer;
import com.ogani.entity.ShoppingCart;
import com.ogani.service.CategoryService;
import com.ogani.service.CustomerService;
import com.ogani.service.WishlistService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(value = "/wishlist")
public class WishlistServlet extends HttpServlet {
    private final CustomerService customerService = new CustomerService();
    private final CategoryService categoryService = new CategoryService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Customer customer = (Customer)request.getSession().getAttribute("customerSession");
        if(customer == null) {
            response.sendRedirect("/login");
            return;
        }
        int cartsSize = 0;
        if(session.getAttribute("shoppingCart") != null) {
            ShoppingCart shoppingCart = (ShoppingCart)session.getAttribute("shoppingCart");
            cartsSize = shoppingCart.getSize();
        }
        request.getSession().setAttribute("customerSession", customerService.get(customer.getId()));
        request.setAttribute("cartSize", cartsSize);
        request.setAttribute("categories", categoryService.list("Hoạt động"));

        request.getRequestDispatcher("/views/customer/wishlist.jsp").forward(request, response);
    }


}
