package controller;


import dao.IUserDao;
import dao.impl.UserDaoImpl;
import model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/getUserInfoServlet")
public class GetUserInfoController extends HttpServlet {
    private IUserDao userService = new UserDaoImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("idUser"));
        User user = userService.getUserByUserId(id);
        request.getSession().setAttribute("userToEdit", user);
        response.sendRedirect("management-account.jsp"); // Chuyển hướng về trang quản lý tài khoản
    }
}