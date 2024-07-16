package dao;

import model.OrderDetails;

import java.util.List;

public interface IOrderDetailDAO {
    List<OrderDetails> findAll();
    OrderDetails findById(Integer id);
    boolean addOrderDetails(OrderDetails orderDetails);
    boolean updateOrderDetails(OrderDetails orderDetails);
    boolean deleteOrder(Integer idOrderDetails);
}
