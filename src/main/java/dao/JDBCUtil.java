package dao;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
public class JDBCUtil {
    public static Connection getConnection() {
        Connection conn = null;

        try {
            // Đăng ký MySQL Driver với DriverManager
            DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());

            // Các thông số
            String url = "jdbc:mySQL://localhost:3306/banlinhkiendienthoai";
            String username = "root";
            String password = "123456";

            // Tạo kết nối
            conn = DriverManager.getConnection(url, username, password);

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return conn;
    }

    public static void closeConnection(Connection c) {
        try {
            if(c!=null) {
                c.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}

