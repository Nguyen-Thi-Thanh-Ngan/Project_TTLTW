package controller;

import dao.impl.OrderDAO;
import dao.impl.UserDAO;
import model.Order;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.util.List;
import java.util.Objects;

@WebServlet(name = "EditOrderControll", value = "/oderedit")
public class EditOrderController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        OrderDAO orderDAO = new OrderDAO();

        String id = request.getParameter("id");
        String userId = request.getParameter("userId");
        String address = request.getParameter("address");
        String orderStatus = request.getParameter("status");
        String payment = request.getParameter("payment");
        Date orderDate = Date.valueOf(request.getParameter("dateOder"));
        Date deliveryDate = Date.valueOf(request.getParameter("doneDate"));

        List<Order> list = orderDAO.selectAll();
        boolean isExists = false;

        for (Order od : list) {
            if (Objects.equals(id, od.getId())) {
                isExists = true;
                break;
            }
        }

        if (isExists) {
            response.sendRedirect("error.jsp");
        } else {
            Order order = new Order();
            order.setId(id);
            order.setUser(new UserDAO().getById(userId));
            order.setAddress(address);
            order.setStatus(orderStatus);
            order.setPayment(payment);
            order.setOrderDate(orderDate);
            order.setDeliveryDate(deliveryDate);

            orderDAO.insert(order);
            response.sendRedirect("success.jsp");
        }
    }
}