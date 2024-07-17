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

@WebServlet(value = "/block")
public class BlockAccountController extends HttpServlet {
    private IUserDao userService = new UserDaoImpl();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");

        String userIdToBlock = request.getParameter("userIdToBlock");
        if(userIdToBlock != null && !userIdToBlock.isEmpty()){
            userService.blockUser(userIdToBlock);
//            request.getSession().setAttribute("blockSuccess", true);'
            System.out.println("Chan thanh cong");
            response.sendRedirect("management-account");

        }else{
//            response.sendRedirect("index.jsp");
        }
    }

}

