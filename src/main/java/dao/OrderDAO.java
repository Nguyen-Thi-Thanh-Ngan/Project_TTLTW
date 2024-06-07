package dao;

import dao.impl.UserDAO;
import db.JDBIConnector;
import model.*;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

public class OrderDAO {
    public List<Order> selectAll() {
        List<Order> ketQua = JDBIConnector.getConnect().withHandle(handle -> {
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
            return null;
        });
        return null;
    }
}
