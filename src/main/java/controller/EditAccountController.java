package controller;

import model.User;
import com.fasterxml.jackson.databind.ObjectMapper;
import service.IUserService;
import service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;

@WebServlet(value = "/account/edit")
public class EditAccountController extends HttpServlet {
    private IUserService userService = new UserServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json");
        ObjectMapper objectMapper = new ObjectMapper();
//        objectMapper.writeValue(resp.getOutputStream(), userService.getById(req.getParameter("id")).getAddress());
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        Date createdAt = new Date(System.currentTimeMillis() + 3600000);
        try {
            User user = new User(
                    req.getParameter("username"),
                    req.getParameter("password"),
                    req.getParameter("name"),
                    req.getParameter("email"),
                    createdAt
            );
            user.setId(Integer.parseInt(req.getParameter("id")));
            userService.update(user);
            resp.sendRedirect("/quanlytaikhoan");
        }catch (Exception e){
            e.printStackTrace();
        }

    }
}
