package model;

import java.sql.Date;

public class Order {
    private String id;
    private User user;
    private String address;
    private String status;
    private String note;
    private String payment_method;
    private Date orderDate;
    private Date deliveryDate;
    private Double totalPrice;

    public Order() {
    }

    public Order(String id, User user, String address, String status, String note, String payment_method, Date orderDate, Date deliveryDate, double totalPrice) {
        this.id = id;
        this.user = user;
        this.address = address;
        this.status = status;
        this.note = note;
        this.payment_method = payment_method;
        this.orderDate = orderDate;
        this.deliveryDate = deliveryDate;
        this.totalPrice = totalPrice;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getNote() { return note;}

    public void setNote(String note) {
        this.note = note;
    }

    public String getPayment_method() { return payment_method;}

    public void setPayment_method(String payment_method) {
        this.payment_method = payment_method;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public Date getDeliveryDate() {
        return deliveryDate;
    }

    public void setDeliveryDate(Date deliveryDate) {
        this.deliveryDate = deliveryDate;
    }

    public Double getTotalPrice() { return totalPrice;}

    public void setTotalPrice(Double totalPrice) { this.totalPrice = totalPrice;}

    @Override
    public String toString() {
        return "Order{" +
                "id='" + id + '\'' +
                ", user=" + user +
                ", address='" + address + '\'' +
                ", status='" + status + '\'' +
                ", note='" + note + '\'' +
                ", payment_method='" + payment_method + '\'' +
                ", orderDate=" + orderDate +
                ", deliveryDate=" + deliveryDate +
                ", totalPrice=" + totalPrice +
                '}';
    }
}
