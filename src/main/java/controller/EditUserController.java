package controller;

import dao.IUserDao;
import dao.impl.UserDaoImpl;
import model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(value = "/editRoleUser")
public class EditUserController extends HttpServlet {
    private IUserDao userDao = new UserDaoImpl();
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy thông tin người dùng từ session
        User currentUser = (User) request.getSession().getAttribute("user");

        // Kiểm tra quyền của người dùng hiện tại
        if (currentUser == null || currentUser.getRoleId() != 1) { // 1: ADMIN
            // Nếu không phải ADMIN, không cho phép thực hiện hành động này
            System.out.println("Khong co quyen cap nhat");
            response.sendRedirect("management-account"); // Redirect đến trang quản lý tài khoản sau khi cập nhật
            return;
        }

        int id = Integer.parseInt(request.getParameter("idUserToEditRole"));
        int roleId = Integer.parseInt(request.getParameter("editRole"));

        // Cập nhật vai trò người dùng
        userDao.updateRole(id, roleId); // Phải đảm bảo rằng phương thức updateRole tồn tại
        System.out.println("Cap nhat vai tro thanh cong");


        response.sendRedirect("management-account"); // Redirect đến trang quản lý tài khoản sau khi cập nhật
    }
}
