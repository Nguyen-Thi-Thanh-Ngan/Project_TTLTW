package service.impl;

import dao.ICartDAO;
import dao.impl.CartDAOImpl;
import service.ICartService;

public class CartItemServiceImpl implements ICartService {
    private ICartDAO cartDAO = new CartDAOImpl();
    @Override
    public boolean createCart(Integer userId) {
        return cartDAO.createCart(userId);
    }
}
