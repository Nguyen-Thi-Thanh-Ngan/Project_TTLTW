package controller;

import model.User;
import model.cart.CartItem;
import service.ICartItemService;
import service.impl.CartItemServiceImpl;
import service.impl.ICartItemServiceImpl;
import utils.SessionUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.UUID;


@WebServlet(name = "AddCartController", value = "/add-cart")
public class AddCartItemController extends HttpServlet {
    private ICartItemService cartItemService = new ICartItemServiceImpl();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String productId = request.getParameter("productId");

        User user = (User) SessionUtil.getInstance().getKey(request, "user");
        Integer userId = user.getId();

        Integer cartId = (Integer) SessionUtil.getInstance().getKey(request, "cartId");

        if (productId != null && userId != null && cartId != null) {
            CartItem cartItem = new CartItem();
            cartItem.setId(UUID.randomUUID().toString());
            cartItem.setCartId(cartId);
            cartItem.setProductId(Integer.parseInt(productId));
            cartItem.setQuantity(1);

            boolean isAdded = cartItemService.addCartItem(cartItem);

            if (isAdded) {
                response.getWriter().write("CartItem added successfully!");
            } else {
                response.getWriter().write("Failed to add CartItem.");
            }
        } else {
            response.getWriter().write("Invalid input data.");
        }
    }
}

