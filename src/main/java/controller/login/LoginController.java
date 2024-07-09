package controller.login;

import model.GoogleAccount;
import model.User;
import service.IUserService;
import service.impl.UserServiceImpl;
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
            Integer roleId = userService.getRoleIdByUsername(username);
            if (roleId == 1) {
                resp.sendRedirect("admin.jsp");
            } else {
                RequestDispatcher dispatcher = req.getRequestDispatcher("index.jsp");
                dispatcher.forward(req, resp);
            }
        } else {
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
            Integer roleId = userService.getRoleIdByUsername(user.getUsername());
            if (roleId == 1) response.sendRedirect("admin.jsp");
            else {
                response.sendRedirect("/home");
            }
        } else {
            userService.register(user);
            SessionUtil.getInstance().putKey(request, "user", userService.getUserByUsername(user.getUsername()));
            Integer roleId = userService.getRoleIdByUsername(user.getUsername());
            if (roleId == 1) response.sendRedirect("admin.jsp");
            else {
                response.sendRedirect("/home");
            }
        }
    }
}
