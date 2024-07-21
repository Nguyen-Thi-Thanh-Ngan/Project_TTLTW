package controller;

import dao.IUserDao;
import dao.impl.UserDaoImpl;
import model.User;
import service.IUserService;
import service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(value = "/account/delete")
public class DeleteAccountController extends HttpServlet {
    private IUserDao userService = new UserDaoImpl();


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");

        int userIdToDelete = Integer.parseInt(request.getParameter("userIdToDelete"));
        if (userIdToDelete > 0) { // Kiểm tra điều kiện nếu cần thiết
            // Lấy thông tin người dùng từ userService hoặc từ cơ sở dữ liệu
            User user = userService.getUserByUserId(userIdToDelete);
            userService.deleteById(userIdToDelete);
            response.sendRedirect(request.getContextPath() + "/management-account");
        }


    }
}