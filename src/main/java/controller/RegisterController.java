package controller;

import model.User;
import service.IUserService;
import service.impl.UserServiceImpl;
import utils.MailUtil;
import utils.SessionUtil;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Random;

@WebServlet(value = "/register")
public class RegisterController extends HttpServlet {
    private IUserService userService = new UserServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("dangky.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        Date createdAt = new Date(System.currentTimeMillis() + 3600000);
        req.setAttribute("user", new User(
                req.getParameter("username"),
                req.getParameter("password"),
                req.getParameter("name"),
                req.getParameter("email"),
                createdAt
                ));
        req.setAttribute("confirmPassword", req.getParameter("confirmPassword"));
        if(req.getParameter("password").toString().equals(req.getParameter("confirmPassword").toString())){
            if(userService.isUserNameExists(req.getParameter("username").toString())){
                req.setAttribute("error", "Tên người dùng đã tồn tại!");
                RequestDispatcher dispatcher = req.getRequestDispatcher("dangky.jsp");
                dispatcher.forward(req, resp);
            }else{
                User user = new User(
                        req.getParameter("username"),
                        req.getParameter("password"),
                        req.getParameter("name"),
                        req.getParameter("email"),
                        createdAt,
                        0
                );
                SessionUtil.getInstance().putKey(req, "userObj", user);
                Random random = new Random();
                String randomNumber = random.nextInt(999999) + "";
                String code = "";
                for(int i = randomNumber.length(); i < 6; i++){
                    code += "0";
                }
                code += randomNumber;
                MailUtil.getInstance().sendMail("Mã code của bạn: " + code, "Mã code của bạn", user.getEmail());
                SessionUtil.getInstance().putKey(req, "codes", code);
                resp.sendRedirect("entercode");
            }
        }else{
            System.out.println(false);
            req.setAttribute("error", "Mật khẩu và nhập lại mật khẩu không giống nhau");
            RequestDispatcher dispatcher = req.getRequestDispatcher("dangky.jsp");
            dispatcher.forward(req, resp);
        }
    }
}
