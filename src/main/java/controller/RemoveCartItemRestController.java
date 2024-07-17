package controller;

import model.User;
import service.ICartService;
import service.impl.CartServiceImpl;
import utils.SessionUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "RemoveCartItem", value = "/api/remove-cart-item")
public class RemoveCartItemRestController extends HttpServlet {
    private ICartService cartService = new CartServiceImpl();

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        Integer productId = Integer.parseInt(req.getParameter("productId"));
        User user = (User) SessionUtil.getInstance().getKey(req, "user");
        Integer userId = user.getId();
        Integer cartId = cartService.findByUserId(userId).getId();

        boolean isRemoved = false;
        if (productId != null && userId != null && cartId != null) {
            isRemoved = cartService.removeCartItem(productId, cartId);
        }

        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        if (isRemoved) {
            resp.getWriter().write("{\"status\": \"success\"}");
        } else {
            resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            resp.getWriter().write("{\"status\": \"error\"}");
        }
    }
}
