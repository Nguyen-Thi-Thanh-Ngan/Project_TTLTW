package dao.impl;

import dao.DAOInterface;
import model.*;
import db.JDBIConnector;

import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class OrderDAO implements DAOInterface<Order> {
    @Override
    public List<Order> selectAll() {
        List<Order> ketQua = JDBIConnector.getConnect().withHandle((handle ->
        {
            List<Order> orders = new ArrayList<>();

            handle.createQuery("SELECT * FROM orders")
                    .map((rs, ctx) -> {
                        String id = rs.getString("id");
                        String userId = rs.getString("user_id");
                        String deliveryAddress = rs.getString("address");
                        String orderStatus = rs.getString("status");
                        String note = rs.getString("note");
                        String paymentMethod = rs.getString("payment_method");
                        Date orderDate = rs.getDate("order_date");
                        Date deliveryDate = rs.getDate("delivery_date");
                        double totalPrice = rs.getDouble("total_price");

                        User user = new UserDAO().selectById(new User(userId, null, null, null, null,
                                null, null, null, null, null));

                        Order order = new Order(id, user, deliveryAddress, orderStatus, note, paymentMethod, orderDate, deliveryDate, totalPrice);
                        orders.add(order);

                        return null;
                    })
                    .list();

            return orders;
        }));

        return ketQua;
    }

    @Override
    public Order selectById(Order orderP) {
        try {
            return JDBIConnector.getConnect().withHandle(handle ->
                    handle.createQuery("SELECT id, user_id, delivery_address, order_status," +
                                    " payment_method, order_date, delivery_date FROM orders WHERE id=?")
                            .bind(0, orderP.getId())
                            .map((rs, ctx) -> {
                                String id = rs.getString("id");
                                String userId = rs.getString("user_id");
                                String deliveryAddress = rs.getString("address");
                                String orderStatus = rs.getString("status");
                                String note = rs.getString("note");
                                String paymentMethod = rs.getString("payment_method");
                                Date orderDate = rs.getDate("order_date");
                                Date deliveryDate = rs.getDate("delivery_date");
                                double totalPrice = rs.getDouble("total_price");

                                User user = new UserDAO().selectById(new User(userId, null, null, null, null,
                                        null, null, null, null, null));
                                return new Order(id, user, deliveryAddress, orderStatus, note, paymentMethod, orderDate, deliveryDate, totalPrice);
                            })
                            .findFirst()
                            .orElse(null)
            );
        } catch (Exception e) {
            e.printStackTrace(); // In ra lỗi để debug
            return null;
        }
    }

    public static Order getById(String id) {
        try {
            return JDBIConnector.getConnect().withHandle(handle ->
                    handle.createQuery("SELECT id, user_id, delivery_address, order_status," +
                                    " payment_method, order_date, delivery_date FROM orders WHERE id=?")
                            .bind(0, id)
                            .map((rs, ctx) -> {
                                String orderId = rs.getString("id");
                                String userId = rs.getString("user_id");
                                String address = rs.getString("address");
                                String orderStatus = rs.getString("status");
                                String note = rs.getString("note");
                                String paymentMethod = rs.getString("payment_method");
                                Date orderDate = rs.getDate("order_date");
                                Date deliveryDate = rs.getDate("delivery_date");
                                double totalPrice = rs.getDouble("total_price");

                                User user = new UserDAO().selectById(new User(userId, null, null, null, null, null, null, null, null, null));
                                return new Order(orderId, user, address, orderStatus, note, paymentMethod, orderDate, deliveryDate, totalPrice);
                            })
                            .findFirst()
                            .orElse(null)
            );
        } catch (Exception e) {
            e.printStackTrace(); // In ra lỗi để debug
            return null;
        }
    }

    public static Order getByIdUser(String user_id) {
        try {
            return JDBIConnector.getConnect().withHandle(handle ->
                            handle.createQuery("SELECT id, user_id, delivery_address, order_status," +
                                            " payment_method, order_date, delivery_date FROM orders WHERE user_id=?")
                                    .bind(0, user_id)
                                    .map((rs, ctx) -> {
                                        String orderId = rs.getString("id");
                                        String userId = rs.getString("user_id");
                                        String address = rs.getString("address");
                                        String orderStatus = rs.getString("status");
                                        String note = rs.getString("note");
                                        String paymentMethod = rs.getString("payment_method");
                                        Date orderDate = rs.getDate("order_date");
                                        Date deliveryDate = rs.getDate("delivery_date");
                                        double totalPrice = rs.getDouble("total_price");

//                                User user = new UserDAO().selectById(new User(userId, null, null, null, null, null, null, null, null, null));
                                        return new Order(orderId, null, address, orderStatus, note, paymentMethod, orderDate, deliveryDate, totalPrice);
                                    })
                                    .findFirst()
                                    .orElse(null)
            );
        } catch (Exception e) {
            e.printStackTrace(); // In ra lỗi để debug
            return null;
        }
    }


    @Override
    public int insert(Order order) {
        int ketQua = JDBIConnector.getConnect().withHandle(handle ->
                handle.createUpdate("INSERT INTO orders (id, user_id , address, status, note, payment_method, order_date, delivery_date,total_price) " +
                                "VALUES (:id, :user_id, :address, :status, :note, :payment_method, :order_date, :delivery_date, :total_price)")
                        .bind("id", order.getId())
                        .bind("user_id", order.getUser().getId())
                        .bind("address", order.getAddress())
                        .bind("status", order.getStatus())
                        .bind("note", order.getNote())
                        .bind("payment_method", order.getPayment_method())
                        .bind("order_date", order.getOrderDate())
                        .bind("delivery_date", order.getDeliveryDate())
                        .bind("total_price", order.getTotalPrice())
                        .execute()
        );
        return ketQua;
    }

    public int delete(Order order) {
        int ketQua = JDBIConnector.getConnect().withHandle(handle ->
                handle.createUpdate("DELETE FROM orders WHERE id = :id")
                        .bind("id", order.getId())
                        .execute()
        );
        return ketQua;
    }


    public int update(Order order) {
        int ketQua = JDBIConnector.getConnect().withHandle(handle ->
                handle.createUpdate("UPDATE orders SET user_id = :user_id, address = :address, status = :status, note = :note, payment_method = :payment_method, order_date = :orderDate, delivery_date = :deliveryDate, total_price = :totalPrice WHERE id = :id")
                        .bind("user_id", order.getUser().getId())
                        .bindBean(order)
                        .execute()
        );
        return ketQua;
    }


    public int countOrdersInMonth(LocalDate localDate) {
        int count = JDBIConnector.getConnect().withHandle(handle ->
                handle.createQuery("SELECT COUNT(*) FROM orders WHERE MONTH(order_date) = :month AND YEAR(order_date) = :year")
                        .bind("month", localDate.getMonthValue())
                        .bind("year", localDate.getYear())
                        .mapTo(Integer.class)
                        .one()
        );
        return count;
    }


    public int countCustomersWithOrdersInMonth(LocalDate localDate) {
        int count = JDBIConnector.getConnect().withHandle(handle ->
                handle.createQuery("SELECT COUNT(DISTINCT user_id) FROM orders WHERE MONTH(order_date) = :month AND YEAR(order_date) = :year")
                        .bind("month", localDate.getMonthValue())
                        .bind("year", localDate.getYear())
                        .mapTo(Integer.class)
                        .one()
        );
        return count;
    }


    public static void main(String[] args) {
        OrderDAO orderDAO = new OrderDAO();
        Date order_date = new Date(System.currentTimeMillis() + 3600000);
        User user = new User(1, "hadung", "Hà Huy Dũng", "hadung6765@gmail.com");
        Order order = new Order("3", user, "SD", "Chuan bi hang", "abc", "Chuyển khoản", order_date, order_date, 100000);
       System.out.println(orderDAO.update(order));

    }
}