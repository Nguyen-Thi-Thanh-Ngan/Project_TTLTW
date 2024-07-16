package controller;

import model.CartResponse;
import model.Product;
import model.User;
import model.cart.Cart;
import model.cart.CartItem;
import service.ICartService;
import service.impl.CartServiceImpl;
import utils.SessionUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(value = "/check-out")
public class CheckOutController extends HttpServlet {
    private ICartService cartService = new CartServiceImpl();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        User user = (User) SessionUtil.getInstance().getKey(req, "user");
        Integer userId = user.getId();
        Cart cart = cartService.findByUserId(userId);

        String selectedProductIds = req.getParameter("selectedProductIds");
        List<CartItem> selectedProductsList = new ArrayList<>();

        if (selectedProductIds != null && !selectedProductIds.isEmpty()) {
            String[] productIdsArray = selectedProductIds.split(",");
            for (String productId : productIdsArray) {
                Integer id = Integer.parseInt(productId);
                CartItem item = cartService.getCartItemByCartId(id, cart.getId());
                selectedProductsList.add(item);
            }
        }

        req.setAttribute("selectedProductsList", selectedProductsList);
        req.getRequestDispatcher("checkout.jsp").forward(req, resp);
    }
}
