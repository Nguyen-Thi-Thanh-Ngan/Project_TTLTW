package dao.impl;

import dao.IOrderDAO;
import db.JDBIConnector;
import model.Order;

import java.util.List;

public class OrderDAOImpl implements IOrderDAO {
    private static final String BASE_QUERY = "SELECT id, user_id, address, phone_number, status, note, payment_method, order_date, delivery_date, total_price FROM orders";

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
}
