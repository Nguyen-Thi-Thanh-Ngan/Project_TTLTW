package controller;

import dao.IUserDao;
import dao.impl.UserDaoImpl;
import service.IUserService;
import service.impl.UserServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(value = "/management-account")
public class AccountManagerController extends HttpServlet {
    private IUserDao userService = new UserDaoImpl();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        req.setAttribute("users", userService.findAllUser());
        RequestDispatcher dispatcher = req.getRequestDispatcher("management-account.jsp");
        dispatcher.forward(req, resp);
    }
}
