package controller;

import model.User;
import utils.SessionUtil;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "HomeController", urlPatterns = {"/home"})
public class HomeController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        User user = (User) SessionUtil.getInstance().getKey(request, "user");

        // Kiểm tra quyền của người dùng
        if (user != null && (user.getRoleId() == 1 || user.getRoleId() == 2)) {
            // Nếu người dùng là admin hoặc mod, đặt biến session
            request.getSession().setAttribute("fromHome", true);
        } else {
            request.getSession().removeAttribute("fromHome"); // Xóa thuộc tính nếu không phải admin hoặc mod
        }

        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
}
