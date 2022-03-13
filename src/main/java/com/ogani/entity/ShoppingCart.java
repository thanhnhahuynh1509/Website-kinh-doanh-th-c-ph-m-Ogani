package com.ogani.entity;

import com.ogani.service.ProductService;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

public class ShoppingCart {
    private final Map<Integer, Integer> carts;
    private final ProductService productService;

    public ShoppingCart() {
        carts = new LinkedHashMap<>();
        productService = new ProductService();
    }

    public void add(int itemId, int quantity) {
        if (carts.containsKey(itemId))
            carts.put(itemId, carts.get(itemId) + quantity);
         else
            carts.put(itemId, quantity);
    }

    public void update(int[] quantities) {
        int i = 0;
        for(Map.Entry<Integer, Integer> item : carts.entrySet()) {
            if(quantities[i] == 0)
                quantities[i] = 1;
            carts.put(item.getKey(), quantities[i++]);
        }
    }

    public void delete(int itemId) {
        carts.remove(itemId);
    }

    public void remove(int itemId, int quantity) {
        if(carts.get(itemId) - quantity > 0)
            carts.put(itemId, carts.get(itemId) - quantity);
    }

    public void clear() {
        carts.clear();
    }

    public int getSize() {
        return carts.size();
    }

    public String getTotalPrices() {
        double sum = 0;
        Map<Product, Integer> temp = getCarts();
        for(Map.Entry<Product, Integer> item : temp.entrySet()) {
            sum += (item.getValue() * (item.getKey().getPrices() - item.getKey().getPricesSale()));
        }
        return sum > 0 ? String.format("%,.0f", sum) : "0";
    }

    public double getTotalPricesPure() {
        double sum = 0;
        Map<Product, Integer> temp = getCarts();
        for(Map.Entry<Product, Integer> item : temp.entrySet()) {
            sum += (item.getValue() * item.getKey().getPrices() - item.getKey().getPricesSale());
        }
        return sum;
    }

    public int getTotalQuantity() {
        int total = 0;
        Map<Product, Integer> temp = getCarts();
        for(Map.Entry<Product, Integer> item : temp.entrySet()) {
            total += item.getValue();
        }
        return total;
    }

    public Map<Product, Integer> getCarts() {
        Map<Product, Integer> productCart = new LinkedHashMap<>();
        for(Map.Entry<Integer, Integer> entry : carts.entrySet()) {
            productCart.put(productService.get(entry.getKey()), entry.getValue());
        }
        return productCart;
    }

}
