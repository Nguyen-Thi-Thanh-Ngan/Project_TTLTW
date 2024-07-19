package controller.login;

import model.FacebookAccount;
import model.GoogleAccount;
import model.Log;
import model.User;
import service.ICartService;
import service.ILogService;
import service.IUserService;
import service.impl.CartServiceImpl;
import service.impl.LogServiceImpl;
import service.impl.UserServiceImpl;
import utils.LevelLog;
import utils.SessionUtil;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet(name = "FacebookLoginController", value = "/login-fb")
public class FacebookLoginController extends HttpServlet {
    private IUserService userService = new UserServiceImpl();
    private ICartService cartService = new CartServiceImpl();
    private ILogService logService = new LogServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String code = request.getParameter("code");
        String error = request.getParameter("error");

        if (error != null) {
            request.getRequestDispatcher("sign-in.jsp").forward(request, response);
        }
        FacebookLogin fb = new FacebookLogin();
        String accessToken = fb.getToken(code);
        FacebookAccount facebookAccount = fb.getUserInfo(accessToken);
        User user = fb.createUserFromFacebookAccount(facebookAccount, accessToken);

        if (userService.isUserExists("facebook", facebookAccount.getId()) != null) {
            SessionUtil.getInstance().putKey(request, "user", userService.getUserByUsername(user.getUsername()));
            User user1 = userService.getUserByUsername(user.getUsername());
            Log log = new Log();
            log.setUserId(user1.getId());
            log.setAction("Đăng nhập bằng Facebook");
            log.setAddressIP(request.getRemoteAddr());
            log.setLevel(LevelLog.INFO);
            logService.save(log);
            Integer roleId = userService.getRoleIdByUsername(user.getUsername());
            if (roleId == 1) {
                response.sendRedirect("admin.jsp");
            } else {
                response.sendRedirect("/home");
            }
        } else {
            boolean isRegister = userService.register(user);
            if (isRegister) {
                Integer userId = userService.getIdByUserName(user.getUsername());
                Log log = new Log();
                log.setUserId(userId);
                log.setAction("Đăng nhập bằng Facebook");
                log.setAddressIP(request.getRemoteAddr());
                log.setLevel(LevelLog.INFO);
                logService.save(log);
                cartService.createCart(userId);
            }
            System.out.println("New user registered: " + user.getEmail());
            SessionUtil.getInstance().putKey(request, "user", userService.getUserByUsername(user.getUsername()));
            Integer roleId = userService.getRoleIdByUsername(user.getUsername());
            if (roleId == 1) {
                response.sendRedirect("admin.jsp");
            } else {
                response.sendRedirect("/home");
            }
        }
    }
}
