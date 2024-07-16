package dao.impl;

import dao.IOrderDetailDAO;
import db.JDBIConnector;
import model.OrderDetails;

import java.util.List;

public class OrderDetailDAOImpl implements IOrderDetailDAO {
    private static final String BASE_QUERY = "SELECT id, order_id, amount, product_id, quantity FROM order_details";

    @Override
    public List<OrderDetails> findAll() {
        return null;
    }

    @Override
    public OrderDetails findById(Integer id) {
        OrderDetails orderDetails = JDBIConnector.getConnect().withHandle(handle -> {
            return handle.createQuery(BASE_QUERY + " WHERE id = :id")
                    .bind("id", id)
                    .mapToBean(OrderDetails.class)
                    .findFirst()
                    .orElse(null);
        });
        return orderDetails;
    }

    @Override
    public boolean addOrderDetails(OrderDetails orderDetails) {
        int rowsAffected = JDBIConnector.getConnect().withHandle(handle -> {
            return handle.createUpdate("INSERT INTO order_details(order_id, amount, product_id, quantity) VALUES (?, ?, ?, ?)")
                    .bind(0, orderDetails.getOrder().getId())
                    .bind(1, orderDetails.getAmount())
                    .bind(2, orderDetails.getProduct().getId())
                    .bind(3, orderDetails.getQuantity())
                    .execute();

        });
        return rowsAffected > 0;
    }

    @Override
    public boolean updateOrderDetails(OrderDetails orderDetails) {
        int rowsAffected = JDBIConnector.getConnect().withHandle(handle -> {
            return handle.createUpdate("UPDATE orders " +
                            "SET order_id = :orderId, amount: amount, product_id = :productId, quantity = :quantity" +
                            "WHERE id = :id")
                    .bind("orderId", orderDetails.getOrder().getId())
                    .bindBean(orderDetails)
                    .execute();
        });
        return rowsAffected > 0;
    }

    @Override
    public boolean deleteOrder(Integer idOrderDetails) {
        int rowsAffected = JDBIConnector.getConnect().withHandle(handle ->
                handle.createUpdate("DELETE FROM order_details WHERE id = :idOrderDetails")
                        .bind("idOrderDetails", idOrderDetails)
                        .execute()
        );
        return rowsAffected > 0;
    }
}
