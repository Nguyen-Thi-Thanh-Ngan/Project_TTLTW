package controller;

import cart.Cart;
import dao.impl.OrderDAOImpl;
import dao.impl.OrderDetailDAOImpl;
import dao.impl.OrderDetailsDAO;
import dao.impl.UserDaoImpl;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.CartResponse;
import model.Order;
import model.OrderDetails;
import model.User;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.concurrent.atomic.AtomicLong;

@WebServlet(name = "OrderController", value = "/order")
public class OrderController extends HttpServlet {
    private OrderDAOImpl orderDAO = new OrderDAOImpl();
    private OrderDetailDAOImpl orderDetailsDAO = new OrderDetailDAOImpl();

    private UserDaoImpl userDAO = new UserDaoImpl();
    private static final AtomicLong counter = new AtomicLong(System.currentTimeMillis());

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");

        HttpSession session = request.getSession();

        List<CartResponse> selectedProductsList = new ArrayList<>();
        request.setAttribute("selectedProductsList", selectedProductsList);

        if (!selectedProductsList.isEmpty()) {

            LocalDateTime orderDate = LocalDateTime.now();
            LocalDateTime deliverDate = orderDate.plusDays(3);

            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String address = request.getParameter("delivery_address");
            String phone = request.getParameter("phoneNumber");
            String paymentMethod = request.getParameter("payment");
            String note = request.getParameter("note");
            double totalPrice = 0;

            if (email != null && !email.isEmpty()) {
                Integer idUser = Integer.parseInt(request.getParameter("id"));
                User user = userDAO.getUserByUserId(idUser);
                user.setId(idUser);

                String status = String.valueOf(user.getStatus());
                Order order = new Order(idUser, user, address, phone, status, note, paymentMethod, orderDate,  deliverDate, totalPrice);
                orderDAO.addOrder(order);

                for (CartResponse cartItem : selectedProductsList) {
                    OrderDetails orderDetails = new OrderDetails();
                    double amount = cartItem.getProduct().getPrice();
                    orderDetails.setOrder(order);
                    orderDetails.setProduct(cartItem.getProduct());
                    orderDetails.setQuantity(cartItem.getQuantity());
                    orderDetails.setAmount(amount);

                    orderDetailsDAO.addOrderDetails(orderDetails);
                }
            } else {
                request.setAttribute("error", "Tên người dùng hoặc email hoặc số điện thoại không chính xác!");
                RequestDispatcher dispatcher = request.getRequestDispatcher("check-out.jsp");
                dispatcher.forward(request, response);
            }
        }
        session.setAttribute("OrderSuccess", true);
        response.sendRedirect("index.jsp");
    }
}