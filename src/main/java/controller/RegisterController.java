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
import java.text.SimpleDateFormat;
import java.util.Random;

@WebServlet(value = "/sign-up")
public class RegisterController extends HttpServlet {
    private IUserService userService = new UserServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("sign-up.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

        User user = new User();

        String email = req.getParameter("email");
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String confirmPassword = req.getParameter("confirmPassword");
        String fullName = req.getParameter("name");

        user.setEmail(email);
        user.setUsername(username);
        user.setPassword(password);
        user.setName(fullName);

        req.setAttribute("user", user);
        req.setAttribute("confirmPassword", req.getParameter("confirmPassword"));

        if (!req.getParameter("password").equals(req.getParameter("confirmPassword"))) {
            req.setAttribute("error", "Mật khẩu và nhập lại mật khẩu không giống nhau");
            RequestDispatcher dispatcher = req.getRequestDispatcher("sign-up.jsp");
            dispatcher.forward(req, resp);
            return;
        }

        if (userService.isUserNameExists(username)) {
            req.setAttribute("error", "Tên người dùng đã tồn tại!");
            RequestDispatcher dispatcher = req.getRequestDispatcher("sign-up.jsp");
            dispatcher.forward(req, resp);
            return;
        }

        SessionUtil.getInstance().putKey(req, "userObj", user);

        String code = generateOTP();
        MailUtil.getInstance().sendMail("Mã code của bạn: " + code, "Mã code của bạn", user.getEmail());
        SessionUtil.getInstance().putKey(req, "codes", code);

        resp.sendRedirect("enter-code");
    }

    private String generateOTP() {
        Random random = new Random();
        int randomNumber = random.nextInt(999999);
        return String.format("%06d", randomNumber);
    }
}
