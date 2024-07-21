package controller;

import model.User;
import utils.SessionUtil;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebFilter("/*") // Áp dụng cho tất cả các URL
public class AdminFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;
        User user = (User) SessionUtil.getInstance().getKey(req, "user");
        String requestURI = req.getRequestURI();

        // Kiểm tra nếu đang truy cập vào các trang admin
        if (requestURI.startsWith(req.getContextPath() + "/admin")) {
            Boolean fromHome = (Boolean) req.getSession().getAttribute("fromHome");

            // Nếu thuộc tính "fromHome" là true, không cho phép vào trang admin
            if (fromHome != null && fromHome) {
                // Nếu từ trang home, không cho phép vào trang admin
                resp.sendRedirect(req.getContextPath() + "/home");
                return;
            }

            // Kiểm tra quyền truy cập
            if (user == null || (user.getRoleId() != 1 && user.getRoleId() != 2)) {
                resp.sendRedirect(req.getContextPath() + "/home"); // Chuyển hướng nếu không có quyền
                return;
            }
        }

        // Kiểm tra nếu đang ở trang home
        if (requestURI.equals(req.getContextPath() + "/home")) {
            // Nếu người dùng có quyền admin hoặc mod, không cho phép quay lại trang admin
            if (user != null && (user.getRoleId() == 1 || user.getRoleId() == 2)) {
                req.getSession().setAttribute("fromHome", true);
            } else {
                req.getSession().removeAttribute("fromHome"); // Xóa thuộc tính nếu không phải admin hoặc mod
            }
        }

        // Thực hiện tiếp tục với bộ lọc
        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {
    }
}