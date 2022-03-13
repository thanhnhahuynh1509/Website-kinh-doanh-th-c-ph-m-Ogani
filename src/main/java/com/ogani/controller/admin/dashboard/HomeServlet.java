package com.ogani.controller.admin.dashboard;

import com.ogani.entity.*;
import com.ogani.service.*;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import static java.util.stream.Collectors.groupingBy;

@WebServlet(value = "/admin")
public class HomeServlet extends HttpServlet {
    private final OrderService orderService = new OrderService();
    private final OrderDetailService orderDetailService = new OrderDetailService();
    private final ReviewService reviewService = new ReviewService();
    private final CustomerService customerService = new CustomerService();
    private final AdminService adminService = new AdminService();
    private final WishlistService wishlistService = new WishlistService();
    private final ProductService productService = new ProductService();
    private final CategoryService categoryService = new CategoryService();


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("titlePage", "Trang chủ");
        request.setAttribute("totalUser", totalUser());
        request.setAttribute("totalAdmin", totalAdmin());
        request.setAttribute("totalWishList", totalWishList());
        request.setAttribute("totalProduct", totalProduct());
        request.setAttribute("totalOrder", totalOrder());
        request.setAttribute("totalCategory", totalCategory());
        request.setAttribute("totalReview", totalReview());
        request.setAttribute("totalOrderCancel", totalOrderCancel());
        request.setAttribute("totalRevenues", formatPrices(totalRevenues("Giao hàng thành công")));
        request.setAttribute("totalRevenuesWaiting", formatPrices(totalRevenues("Chờ xử lý")));
        request.setAttribute("totalRevenuesShipping", formatPrices(totalRevenues("Đang giao hàng")));
        request.setAttribute("averageReview", averageRating());
        request.setAttribute("totalOrderWaiting", totalOrderWaiting());
        request.setAttribute("totalOrderShipping", totalOrderShipping());
        request.setAttribute("productBestSeller", productBestSeller().stream().limit(10).collect(Collectors.toList()));
        request.getRequestDispatcher("/views/admin/dashboard/home.jsp").forward(request, response);
    }

    public int totalUser() {
        List<Customer> list = customerService.list();
        return list.size();
    }

    public int totalAdmin() {
        List<Admin> list = adminService.listAll();
        return list.size();
    }

    public int totalWishList() {
        List<Wishlist> list = wishlistService.list();
        return list.size();
    }

    public int totalProduct() {
        List<Product> list = productService.list();
        return list.size();
    }

    public int totalOrder() {
        List<Order> list = orderService.listAll();
        return list.size();
    }

    public int totalCategory() {
        List<Category> list = categoryService.list();
        return list.size();
    }

    public int totalReview() {
        List<Review> list = reviewService.list();
        return list.size();
    }

    public int totalOrderCancel() {
        List<Order> list = orderService.listAll();
        return (int) list.stream().filter(m -> m.getStatus().equals("Hủy")).count();
    }

    public double totalRevenues(String status) {
        double total = 0;
        List<Order> list = orderService.listAll()
                .stream()
                .filter(m -> m.getStatus().equals(status))
                .collect(Collectors.toList());

        for (Order order : list) {
            total += order.getTotalPrices();
        }
        return total;
    }

    public float averageRating() {
        float sum = 0;
        List<Review> list = reviewService.list();

        for(Review review : list) {
            sum += review.getRating();
        }

        return list.size() == 0 ? 0 : sum / list.size();
    }

    public int totalOrderWaiting() {
        List<Order> list = orderService
                .listAll()
                .stream()
                .filter(m -> m.getStatus().equals("Chờ xử lý"))
                .collect(Collectors.toList());
        return list.size();
    }

    public int totalOrderShipping() {
        List<Order> list = orderService
                .listAll()
                .stream()
                .filter(m -> m.getStatus().equals("Đang giao hàng"))
                .collect(Collectors.toList());
        return list.size();
    }

    public String formatPrices(double price) {
        return String.format("%,.0f", price);
    }

    public List<ProductDashboard> productBestSeller() {
        List<Order> orders = orderService.list("Giao hàng thành công");
        List<OrderDetail> list = new ArrayList<>();

        for(Order order : orders) {
            list.addAll(order.getOrderDetails());
        }

        List<ProductDashboard> products = new ArrayList<>();

        for(Product product : productService.list()) {
            int sumQuantity = 0;
            for(OrderDetail item : list) {
                if(item.getProduct().getId() == product.getId()) {
                    sumQuantity += item.getQuantity();
                }
            }
            ProductDashboard productDashboard = new ProductDashboard();
            productDashboard.setProduct(product);
            productDashboard.setQuantity(sumQuantity);
            productDashboard.setTotalPrices(product.getPrices() * sumQuantity);
            products.add(productDashboard);
        }
        return products.stream().sorted((a, b) -> b.getQuantity() - a.getQuantity()).collect(Collectors.toList());
    }
}
