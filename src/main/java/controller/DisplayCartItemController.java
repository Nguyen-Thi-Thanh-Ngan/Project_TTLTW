package controller;

import model.CartResponse;
import model.User;
import model.cart.Cart;
import service.ICartService;
import service.impl.CartServiceImpl;
import utils.SessionUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "DisplayCartItemController", value = "/cart.html")
public class DisplayCartItemController extends HttpServlet {
    private ICartService cartService = new CartServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        User user = (User) SessionUtil.getInstance().getKey(req, "user");
        if(user == null) {
            resp.sendRedirect("sign-in.jsp");
            return;
        }
        Integer userId = user.getId();

        Cart cart = cartService.findByUserId(userId);
        if (cart != null) {
            Double totalPrice = 0d;
            List<CartResponse> cartItems = cartService.getCartItemByCartId(cart.getId());
            for (CartResponse cartResponse : cartItems){
                Double total = cartResponse.getQuantity() * cartResponse.getProduct().getPrice();
                totalPrice += total;
            }

            req.setAttribute("cartItems", cartItems);
            req.setAttribute("totalPrice", totalPrice);
        }
        req.getRequestDispatcher("shopping-cart.jsp").forward(req, resp);
    }
}
