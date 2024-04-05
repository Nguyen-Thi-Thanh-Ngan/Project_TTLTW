package controller;

import dao.OrderDAO;
import dao.UserDAO;
import model.Order;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.util.concurrent.atomic.AtomicLong;

@WebServlet(name = "AdminOderControll", value = "/oderadmin")
public class AdminOrderController extends HttpServlet {
    private static final AtomicLong counter = new AtomicLong(System.currentTimeMillis());

    UserDAO userDAO = new UserDAO();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        OrderDAO orderDAO = new OrderDAO();

        Order order = new Order();

        String id = "or_" + String.valueOf(counter.getAndIncrement());
        String userId = request.getParameter("userId");
        String address = request.getParameter("address");
        String oderStatus =  request.getParameter("status");
        String payment = request.getParameter("payment");
        Date oderDate = Date.valueOf(request.getParameter("dateOder"));
        Date deliveryDate = Date.valueOf(request.getParameter("doneDate"));

        order.setId(id);
        order.setUser(userDAO.getById(userId));
        order.setAddress(address);
        order.setStatus(oderStatus);
        order.setPayment(payment);
        order.setOrderDate(oderDate);
        order.setDeliveryDate(deliveryDate);

        orderDAO.insert(order);
        response.sendRedirect("success.jsp");
    }
}

