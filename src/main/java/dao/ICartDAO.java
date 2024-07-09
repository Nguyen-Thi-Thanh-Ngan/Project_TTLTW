package dao;

import model.cart.Cart;
import model.cart.CartItem;
import model.Product;

import java.util.List;
import java.util.Map;

public interface ICartDAO {
    boolean createCart(Integer userId);
    Map<Integer, List<CartItem>> getProductInCart(Integer idUser);
    boolean removeProductInCart(Integer userId, Integer productId);
    boolean updateProductInCart(Integer userId, Product product, Integer quantity);
    boolean removeAllProductInCart(Integer userId);
}
