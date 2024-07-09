package dao.impl;

import dao.ICartDAO;
import db.JDBIConnector;
import model.cart.Cart;
import model.cart.CartItem;
import model.Product;

import java.util.List;
import java.util.Map;

public class CartDAOImpl implements ICartDAO {

    @Override
    public boolean createCart(Integer userId) {
        int rowsrAffected = JDBIConnector.getConnect().withHandle(handle -> {
            return handle.createUpdate("INSERT INTO carts(user_id) VALUES (?)")
                    .bind(0, userId)
                    .execute();
        });
        return rowsrAffected > 0;
    }

    @Override
    public Map<Integer, List<CartItem>> getProductInCart(Integer idUser) {
        return Map.of();
    }

    @Override
    public boolean removeProductInCart(Integer userId, Integer productId) {
        return false;
    }

    @Override
    public boolean updateProductInCart(Integer userId, Product product, Integer quantity) {
        return false;
    }

    @Override
    public boolean removeAllProductInCart(Integer userId) {
        return false;
    }
}
