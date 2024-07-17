package dao.impl;

import dao.IOrderDAO;
import db.JDBIConnector;
import model.*;

import java.time.Instant;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class OrderDAOImpl implements IOrderDAO {
    private static final String BASE_QUERY = "SELECT id, user_id, address, phone_number, status, note, payment_method, order_date, delivery_date, total_price FROM orders";

    private static final String ORDER_QUERY = "SELECT o.id, o.user_id, o.address, o.phone_number, o.status, o.note, o.payment_method, o.order_date, o.delivery_date, o.total_price " +
            "FROM orders o " +
            "LEFT JOIN users u ON o.user_id = u.id";

    private static final String ORDER_DETAILS_QUERY = "SELECT od.id, od.order_id, od.amount, od.product_id, od.quantity, p.name, i.link_image " +
            "FROM order_details od " +
            "LEFT JOIN product p ON od.product_id = p.id " +
            "LEFT JOIN image i ON p.id = i.product_id";

    @Override
    public List<Order> findAll() {
        List<Order> orders = JDBIConnector.getConnect().withHandle(handle -> {
            return handle.createQuery(BASE_QUERY)
                    .mapToBean(Order.class)
                    .list();
        });
        return orders;
    }

    @Override
    public Order findById(Integer id) {
        Order order = JDBIConnector.getConnect().withHandle(handle -> {
            return handle.createQuery(BASE_QUERY + " WHERE id = :id")
                    .bind("id", id)
                    .mapToBean(Order.class)
                    .findFirst()
                    .orElse(null);
        });
        return order;
    }

    public List<Order> findByIdUser(Integer idUser) {
        List<Order> orders = JDBIConnector.getConnect().withHandle(handle -> {
            return handle.createQuery(ORDER_QUERY + " WHERE o.user_id = :idUser")
                    .bind("idUser", idUser)
                    .map((rs, ctx) -> {
                        Order order = new Order();
                        order.setId(rs.getInt("o.id"));
                        order.setAddress(rs.getString("o.address"));
                        order.setPhone_number(rs.getString("o.status"));
                        order.setNote(rs.getString("o.note"));
                        order.setPayment_method(rs.getString("o.payment_method"));
                        Date orderDate = rs.getDate("o.order_date");
                        Date deliveryDate = rs.getDate("o.delivery_date");

                        LocalDateTime orderDateTime = null;
                        if (orderDate != null) {
                            java.util.Date utilOrderDate = new java.util.Date(orderDate.getTime());
                            Instant instantOrderDate = utilOrderDate.toInstant();
                            orderDateTime = LocalDateTime.ofInstant(instantOrderDate, ZoneId.systemDefault());
                        }

                        LocalDateTime deliveryDateTime = null;
                        if (deliveryDate != null) {
                            java.util.Date utilDeliveryDate = new java.util.Date(deliveryDate.getTime());
                            Instant instantDeliveryDate = utilDeliveryDate.toInstant();
                            deliveryDateTime = LocalDateTime.ofInstant(instantDeliveryDate, ZoneId.systemDefault());
                        }

                        order.setOrderDate(orderDateTime);
                        order.setDeliveryDate(deliveryDateTime);

                        order.setTotalPrice(rs.getDouble("o.total_price"));

                        User user = new User();
                        user.setId(rs.getInt("o.user_id"));

                        order.setUser(user);

                        return order;
                    })
                    .list();
        });
        return orders;
    }

    @Override
    public boolean addOrder(Order order) {
        int rowsAffected = JDBIConnector.getConnect().withHandle(handle -> {
            return handle.createUpdate("INSERT INTO orders(user_id, address, phone_number, status, note, payment_method, order_date, delivery_date, total_price) VALUES (?, ?, ?, ?, ?, ?, ?, ?)")
                    .bind(0, order.getUser().getId())
                    .bind(1, order.getAddress())
                    .bind(2, order.getPhone_number())
                    .bind(3, order.getStatus())
                    .bind(4, order.getNote())
                    .bind(5, order.getPayment_method())
                    .bind(6, order.getOrderDate())
                    .bind(7, order.getDeliveryDate())
                    .bind(8, order.getTotalPrice())
                    .execute();

        });
        return rowsAffected > 0;
    }

    @Override
    public boolean updateOrder(Order order) {
        int rowsAffected = JDBIConnector.getConnect().withHandle(handle -> {
            return handle.createUpdate("UPDATE orders " +
                            "SET user_id = :userId, address = :address, phone_number: phoneNumber, status = :status, payment_method = :payment, " +
                            "order_date = :orderDate, delivery_date = :deliveryDate , total_price = :totalPrice" +
                            "WHERE id = :id")
                    .bind("userId", order.getUser().getId())
                    .bindBean(order)
                    .execute();
        });
        return rowsAffected > 0;
    }

    @Override
    public boolean deleteOrder(Integer idOrder) {
        int rowsAffected = JDBIConnector.getConnect().withHandle(handle ->
                handle.createUpdate("DELETE FROM orders WHERE id = :idOrder")
                        .bind("idOrder", idOrder)
                        .execute()
        );
        return rowsAffected > 0;
    }

    public static void main(String[] args) {
        OrderDAOImpl dao = new OrderDAOImpl();
        List<Order> all = dao.findByIdUser(15);
//        Order order = dao.findByIdUser(15);
        for (Order order : all) {
            System.out.println(order);
        }

    }
}
