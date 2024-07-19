package controller;

import model.Log;
import model.User;
import service.ILogService;
import service.impl.LogServiceImpl;
import utils.LevelLog;
import utils.SessionUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "LogoutController", value = "/logout")
public class LogoutController extends HttpServlet {
    private ILogService logService = new LogServiceImpl();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) SessionUtil.getInstance().getKey(req, "user");
        Log log = new Log();
        log.setUserId(user.getId());
        log.setAction("Đăng xuất tài khoản khỏi trang web");
        log.setAddressIP(req.getRemoteAddr());
        log.setLevel(LevelLog.INFO);
        logService.save(log);
        SessionUtil.getInstance().deleteKey(req, "user");
        resp.sendRedirect("index.jsp");
    }
}
