/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class Cart {

    private List<Item> items;

    public Cart(List<Item> items) {
        this.items = new ArrayList<>();
    }

    public List<Item> getItems() {
        return items;
    }

    public void setItems(List<Item> items) {
        this.items = items;
    }

    public int getQuantityByID(int id) {  
        return getItemByID(id).getQuantity();
    }

    private Item getItemByID(int id) {
        for (Item item : items) {
            if (item.getProduct().getId() == id) {
                return item;
            }
        }
        return null;
    }

    public void addItem(Item t) {
        if (getItemByID(t.getProduct().getId()) != null) { 
            Item m = getItemByID(t.getProduct().getId());
            m.setQuantity(t.getQuantity() + m.getQuantity());
        } else {
            items.add(t);
        }
    }

    public void removeItem(int id) {
        if (getItemByID(id) != null) {
            items.remove(getItemByID(id));
        }
    }

    public double getTotalMoney() {
        double t = 0;
        for (Item item : items) {
            t += (item.getQuantity() * item.getPrice());
        }
        return t;
    }

    private Product getProductByID(int id, List<Product> list) {
        for (Product product : list) {
            if (product.getId() == id) {
                return product;
            }

        }
        return null;
    }

public Cart(String txt, List<Product> list) {
    items = new ArrayList<>();
    try {
        if (txt != null && !txt.isEmpty()) {
            String[] s = txt.split("\\|"); // ✅ Sửa lỗi tách chuỗi
            for (String string : s) {
                String[] n = string.split(":");
                
                if (n.length == 2) { // ✅ Kiểm tra tránh lỗi ArrayIndexOutOfBoundsException
                    int id = Integer.parseInt(n[0]);
                    int quantity = Integer.parseInt(n[1]);
                    
                    Product p = getProductByID(id, list);
                    if (p != null) { // ✅ Kiểm tra tránh lỗi null
                        Item t = new Item(p, quantity, p.getPrice());
                        addItem(t);
                    }
                }
            }
        }
    } catch (Exception e) {
        e.printStackTrace(); // ✅ In lỗi chi tiết để debug dễ hơn
    }
}


    public String toCookieString() {
        StringBuilder sb = new StringBuilder();
        for (Item item : items) {
            sb.append(item.getProduct().getId()).append(":").append(item.getQuantity()).append(",");
        }
        if (sb.length() > 0) {
            sb.setLength(sb.length() - 1); // Xóa dấu phẩy cuối cùng
        }
        return sb.toString();
    }
}
