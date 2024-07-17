package controller;

import dao.IUserDao;
import dao.impl.UserDaoImpl;
import model.User;
import service.IUserService;
import service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(value = "/block")
public class BlockAccountController extends HttpServlet {
    private IUserDao userService = new UserDaoImpl();
    private User user = new User();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int userIdToBlockOrUnblock = Integer.parseInt(request.getParameter("userIdToBlockOrUnblock"));

        if (userIdToBlockOrUnblock > 0) { // Kiểm tra điều kiện nếu cần thiết
            // Lấy thông tin người dùng từ userService hoặc từ cơ sở dữ liệu
            User user = userService.getUserByUserId(userIdToBlockOrUnblock);

            if (user != null) {
                if (user.getStatus() == 1) {
                    userService.blockUser(String.valueOf(userIdToBlockOrUnblock)); // Nếu đang có status = 1, chuyển thành status = 2 (block)
                    System.out.println("Da chan nguoi dung co ID: " + userIdToBlockOrUnblock);
                } else if (user.getStatus() == 2) {
                    userService.unBlock(String.valueOf(userIdToBlockOrUnblock)); // Nếu đang có status = 2, chuyển thành status = 1 (unblock)
                    System.out.println("Da bo chan nguoi dung co ID: " + userIdToBlockOrUnblock);
                }

                response.sendRedirect("management-account");
            } else {
                System.out.println("Khong tim thay nguoi dung co ID: " + userIdToBlockOrUnblock);
                response.sendRedirect("error-page.jsp"); // Xử lý khi không tìm thấy người dùng
            }
        } else {
            System.out.println("ID người dùng không hợp lệ: " + userIdToBlockOrUnblock);
            response.sendRedirect("error-page.jsp"); // Xử lý khi userIdToBlock không hợp lệ
        }
    }
}
