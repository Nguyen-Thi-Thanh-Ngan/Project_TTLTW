package service.impl;

import dao.ICartItemDAO;
import dao.impl.CartItemDAOImpl;
import model.cart.CartItem;
import service.ICartItemService;

public class ICartItemServiceImpl implements ICartItemService {
    private ICartItemDAO cartItemDAO = new CartItemDAOImpl();

    @Override
    public boolean addCartItem(CartItem cartItem) {
        return cartItemDAO.addCartItem(cartItem);
    }
}
