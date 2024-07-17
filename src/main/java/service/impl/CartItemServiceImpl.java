package service.impl;

import dao.ICartDAO;
import dao.impl.CartDAOImpl;
import model.CartResponse;
import model.cart.Cart;
import model.cart.CartItem;
import service.ICartService;

import java.util.List;

public class CartItemServiceImpl implements ICartService {
    private ICartDAO cartDAO = new CartDAOImpl();

    @Override
    public CartItem getCartItemByCartId(Integer cartId, Integer productId) {
        return null;
    }

    @Override
    public boolean addCartItem(CartItem cartItem) {
        return false;
    }

    @Override
    public boolean createCart(Integer userId) {
        return cartDAO.createCart(userId);
    }

    @Override
    public Cart findByUserId(Integer userId) {
        return null;
    }

    @Override
    public Integer getTotalCartItem(Integer cartId) {
        return null;
    }

    @Override
    public List<CartResponse> getCartItemByCartId(Integer cartId) {
        return null;
    }

    @Override
    public boolean removeCartItem(Integer productId, Integer cartId) {
        return false;
    }
}
