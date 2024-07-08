package dao;

import model.cart.CartItem;

import java.util.List;

public interface ICartItemDAO {
    List<CartItem> findAll();
    boolean addCartItem(CartItem cartItem);
    boolean updateCartItem(CartItem cartItem);
    boolean removeCartItem(CartItem cartItem);
}
