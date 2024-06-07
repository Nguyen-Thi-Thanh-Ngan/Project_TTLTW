package controller;

import cart.Cart;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;


@WebServlet(name = "UpdateCartController", value = "/updatecart")
public class UpdateCartController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productId = request.getParameter("productId");
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute(("cart"));
        int quantity = 0;
        try {
            quantity = Integer.parseInt(request.getParameter("quantity1"));


        } catch (NumberFormatException e) {

        }
        if(quantity <=0 ) quantity = 1;
        cart.updateProduct(productId, quantity);

        session.setAttribute("cart", cart);
        response.sendRedirect("giohang.jsp");

    }
}
