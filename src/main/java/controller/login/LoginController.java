package controller.login;

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

@WebServlet(name = "LoginController", value = "/login")
public class LoginController extends HttpServlet {
    private IUserService userService = new UserServiceImpl();
    private ICartService cartService = new CartServiceImpl();
    private ILogService logService = new LogServiceImpl();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("username", req.getParameter("username"));
        req.setAttribute("password", req.getParameter("password"));

        String username = req.getParameter("username");
        String password = req.getParameter("password");

        if (userService.login(username, password)) {
            req.setAttribute("success", "Đăng nhập thành công!");
            req.setAttribute("username", "");
            req.setAttribute("password", "");
            SessionUtil.getInstance().putKey(req, "user", userService.getUserByUsername(username));
            User user = userService.getUserByUsername(username);
            Log log = new Log();
            log.setUserId(user.getId());
            log.setAction("Đăng nhập bằng tài khoản");
            log.setAddressIP(req.getRemoteAddr());
            log.setLevel(LevelLog.INFO);
            logService.save(log);
            Integer roleId = userService.getRoleIdByUsername(username);
            if (roleId == 1) {
                resp.sendRedirect("admin.jsp");
            } else {
                RequestDispatcher dispatcher = req.getRequestDispatcher("index.jsp");
                dispatcher.forward(req, resp);
            }
        } else {
            Log log = new Log();
            log.setUserId(0);
            log.setAction("Đăng nhập bằng tài khoản thất bại");
            log.setAddressIP(req.getRemoteAddr());
            log.setLevel(LevelLog.WARN);
            logService.save(log);
            req.setAttribute("error", "Tên người dùng hoặc mật khẩu không chính xác!");
            RequestDispatcher dispatcher = req.getRequestDispatcher("sign-in.jsp");
            dispatcher.forward(req, resp);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String code = request.getParameter("code");
        String error = request.getParameter("error");
        if (error != null) {
            request.getRequestDispatcher("sign-in.jsp").forward(request, response);
        }
        GoogleLogin gg = new GoogleLogin();
        String accessToken = gg.getToken(code);
        GoogleAccount googleAccount = gg.getUserInfo(accessToken);
        User user = gg.createUserFromGoogleAccount(googleAccount, accessToken);

        if (userService.isUserExists("google", googleAccount.getId()) != null) {
            SessionUtil.getInstance().putKey(request, "user", userService.getUserByUsername(user.getUsername()));
            Integer userId = userService.getUserByUsername(user.getUsername()).getId();
            Log log = new Log();
            log.setUserId(userId);
            log.setAction("Đăng nhập bằng Google");
            log.setAddressIP(request.getRemoteAddr());
            log.setLevel(LevelLog.INFO);
            logService.save(log);
            Integer roleId = userService.getRoleIdByUsername(user.getUsername());
            if (roleId == 1) response.sendRedirect("admin.jsp");
            else {
                response.sendRedirect("/home");
            }
        } else {
            if (userService.register(user)){
                Integer userId = userService.getIdByUserName(user.getUsername());
                Log log = new Log();
                log.setUserId(userId);
                log.setAction("Đăng nhập bằng Google");
                log.setAddressIP(request.getRemoteAddr());
                log.setLevel(LevelLog.INFO);
                logService.save(log);
                cartService.createCart(userId);
            }
            SessionUtil.getInstance().putKey(request, "user", userService.getUserByUsername(user.getUsername()));
            Integer roleId = userService.getRoleIdByUsername(user.getUsername());
            if (roleId == 1) response.sendRedirect("admin.jsp");
            else {
                response.sendRedirect("/home");
            }
        }
    }
}
