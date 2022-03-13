package com.ogani.controller.customer;

import com.ogani.entity.ShoppingCart;
import com.ogani.service.CategoryService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(value = "/shopping-cart")
public class ShoppingCartServlet extends HttpServlet {
    private final CategoryService categoryService = new CategoryService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int cartsSize = 0;

        if(request.getSession().getAttribute("shoppingCart") != null) {
            ShoppingCart shoppingCart = (ShoppingCart)request.getSession().getAttribute("shoppingCart");
            cartsSize = shoppingCart.getSize();
        }

        request.setAttribute("cartSize", cartsSize);
        request.setAttribute("categories", categoryService.list("Hoạt động"));
        request.setAttribute("confirmAlert", request.getSession().getAttribute("confirmAlert"));
        request.getSession().removeAttribute("confirmAlert");
        request.getRequestDispatcher("/views/customer/shopping-cart.jsp").forward(request, response);
    }


}
