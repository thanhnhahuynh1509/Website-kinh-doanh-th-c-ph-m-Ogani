package com.ogani.entity;

public class ProductDashboard {
    private Product product;
    private int quantity;
    private double totalPrices;

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getTotalPrices() {
        return totalPrices;
    }

    public void setTotalPrices(double totalPrices) {
        this.totalPrices = totalPrices;
    }

    public String formatPrices(double price) {
        return String.format("%,.0f", price);
    }
}
