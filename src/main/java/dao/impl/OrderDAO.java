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

            handle.createQuery("SELECT id, user_id, delivery_address, order_status, payment_method, " +
                            "order_date, delivery_date FROM orders")
                    .map((rs, ctx) -> {
                        String id = rs.getString("id");
                        String userId = rs.getString("user_id");
                        String deliveryAddress = rs.getString("delivery_address");
                        String orderStatus = rs.getString("order_status");
                        String paymentMethod = rs.getString("payment_method");
                        Date orderDate = rs.getDate("order_date");
                        Date deliveryDate = rs.getDate("delivery_date");

                        User user = new UserDAO().selectById(new User(userId, null, null, null, null,
                                null, null, null, null, null));

                        Order order = new Order(id, user, deliveryAddress, orderStatus, paymentMethod, orderDate, deliveryDate);
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
                                String orderId = rs.getString("id");
                                String userId = rs.getString("user_id");
                                String address = rs.getString("delivery_address");
                                String orderStatus = rs.getString("order_status");
                                String paymentMethod = rs.getString("payment_method");
                                Date orderDate = rs.getDate("order_date");
                                Date deliveryDate = rs.getDate("delivery_date");

                                User user = new UserDAO().selectById(new User(userId, null, null, null, null, null, null, null, null, null));
                                return new Order(orderId, user, address, orderStatus, paymentMethod, orderDate, deliveryDate);
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
                                String address = rs.getString("delivery_address");
                                String orderStatus = rs.getString("order_status");
                                String paymentMethod = rs.getString("payment_method");
                                Date orderDate = rs.getDate("order_date");
                                Date deliveryDate = rs.getDate("delivery_date");

                                User user = new UserDAO().selectById(new User(userId, null, null, null, null, null, null, null, null, null));
                                return new Order(orderId, user, address, orderStatus, paymentMethod, orderDate, deliveryDate);
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
                                        String address = rs.getString("delivery_address");
                                        String orderStatus = rs.getString("order_status");
                                        String paymentMethod = rs.getString("payment_method");
                                        Date orderDate = rs.getDate("order_date");
                                        Date deliveryDate = rs.getDate("delivery_date");
//                                User user = new UserDAO().selectById(new User(userId, null, null, null, null, null, null, null, null, null));
                                        return new Order(orderId, null, address, orderStatus, paymentMethod, orderDate, deliveryDate);
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
        int ketQua = JDBIConnector.getConnect().withHandle(handle -> {
            return handle.createUpdate("INSERT INTO orders (id, user_id, delivery_address, order_status, payment_method, order_date, delivery_date) " +
                    " VALUES (?,?,?,?,?,?,?)").execute();
        });
        return ketQua;
    }

    @Override
    public int delete(Order order) {
        int ketQua = JDBIConnector.getConnect().withHandle(handle ->
                    handle.createUpdate("DELETE FROM orders WHERE id = :id")
                            .bind("id", order.getId())
                            .execute()
            );
        return ketQua;
    }

    @Override
    public int update(Order order) {
        int ketQua = JDBIConnector.getConnect().withHandle(handle ->
                handle.createUpdate("UPDATE orders " +
                                "SET user_id = :userId, delivery_address = :address, order_status = :status, " +
                                "payment_method = :payment, order_date = :orderDate, delivery_date = :deliveryDate " +
                                "WHERE id = :id")
                        .bind("userId", order.getUser().getId())
                        .bindBean(order)
                        .execute()
        );
        return ketQua;
    }


    public int countOrdersInMonth(LocalDate localDate) {
        int count =  JDBIConnector.getConnect().withHandle(handle ->
                    handle.createQuery("SELECT COUNT(*) FROM orders WHERE MONTH(order_date) = :month AND YEAR(order_date) = :year")
                            .bind("month", localDate.getMonthValue())
                            .bind("year", localDate.getYear())
                            .mapTo(Integer.class)
                            .one()
            );
        return count;
    }


    public int countCustomersWithOrdersInMonth(LocalDate localDate) {
        int count =  JDBIConnector.getConnect().withHandle(handle ->
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

       List<Order> a = orderDAO.selectAll();
       for (Order o : a){
           String u = o.getUser().getId();
           System.out.println(u);
       }


//        System.out.println(getByIdUser("u_3"));

    }
}