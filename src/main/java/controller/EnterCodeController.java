package controller;

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

@WebServlet(value = "/enter-code")
public class EnterCodeController extends HttpServlet {
    private IUserService userService = new UserServiceImpl();
    private ICartService cartService = new CartServiceImpl();
    private ILogService logService = new LogServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher dispatcher = req.getRequestDispatcher("enter-code.jsp");
        dispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if(SessionUtil.getInstance().getKey(req, "email") != null){
            String code = SessionUtil.getInstance().getKey(req, "codes").toString();
            if(code.equals(req.getParameter("code"))){
                SessionUtil.getInstance().deleteKey(req, "code");
                resp.sendRedirect("resetpassword");
                return;
            }
            req.setAttribute("error", "Mã code không chính xác");
            RequestDispatcher dispatcher = req.getRequestDispatcher("enter-code.jsp");
            dispatcher.forward(req, resp);
            return;
        }else{
            if(SessionUtil.getInstance().getKey(req, "codes") != null){
                String code = SessionUtil.getInstance().getKey(req, "codes").toString();
                if(code.equals(req.getParameter("code"))){
                    if(SessionUtil.getInstance().getKey(req, "userObj") != null){
                        User user = (User) SessionUtil.getInstance().getKey(req, "userObj");
                        boolean signUp = userService.register(user);
                        if(!signUp){
                            Log log = new Log();
                            log.setUserId(0);
                            log.setAction("Đăng ký thất bại");
                            log.setAddressIP(req.getRemoteAddr());
                            log.setLevel(LevelLog.WARN);
                            logService.save(log);
                            req.setAttribute("error", "Đăng ký thất bại!");
                            RequestDispatcher dispatcher = req.getRequestDispatcher("enter-code.jsp");
                            dispatcher.forward(req, resp);
                        }else{
                            req.setAttribute("success", "Đăng ký thành công!");

                            Integer userId = userService.getIdByUserName(user.getUsername());
                            cartService.createCart(userId);

                            SessionUtil.getInstance().deleteKey(req, "code");
                            SessionUtil.getInstance().deleteKey(req, "userObj");
                            SessionUtil.getInstance().putKey(req, "user", signUp);
                            RequestDispatcher dispatcher = req.getRequestDispatcher("enter-code.jsp");
                            dispatcher.forward(req, resp);
                        }
                    }else{
                        resp.sendRedirect("sign-in.jsp");
                    }
                }else{
                    req.setAttribute("error", "Mã code không chính xác");
                }
                RequestDispatcher dispatcher = req.getRequestDispatcher("enter-code.jsp");
                dispatcher.forward(req, resp);
            }else{
                resp.sendRedirect("sign-in.jsp");
            }
        }
    }
}
