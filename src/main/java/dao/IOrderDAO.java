package dao;

import model.Order;

import java.util.List;

public interface IOrderDAO {
    List<Order> findAll();
    Order findById(Integer id);
    boolean addOrder(Order order);
    boolean updateOrder(Order order);
    boolean deleteOrder(Integer idOrder);
}
