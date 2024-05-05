package dao;

import model.*;
import db.JDBIConector;
import utils.JDBCUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

public class OrderDetailsDAO implements DAOInterface<OrderDetails> {

    @Override
    public List<OrderDetails> selectAll() {
        List<OrderDetails> orderDetails = JDBIConector.me().withHandle((handle ->
                handle.createQuery("SELECT id, order_id, product_id, quantity, price, discount, amount FROM order_details")
                        .mapToBean(OrderDetails.class).stream().collect(Collectors.toList())
        ));
        return orderDetails;
    }

    @Override
    public OrderDetails selectById(OrderDetails orderDetailsP) {
        Optional<OrderDetails> orderDetails = JDBIConector.me().withHandle((handle ->
                handle.createQuery("SELECT id, order_id, product_id, quantity, price, discount, amount FROM order_details WHERE id=?")
                        .bind(0, orderDetailsP.getId())
                        .mapToBean(OrderDetails.class).stream().findFirst()
        ));
        return orderDetails.isEmpty() ? null : orderDetails.get();
    }

    public List<OrderDetails> getByIdOrder(String order_id) {
        try {
            return JDBIConector.me().withHandle(handle -> handle.createQuery("SELECT order_details.id, order_details.order_id, product_id, order_details.quantity, order_details.price, order_details.discount, amount, products.name, products.image FROM order_details, products WHERE products.id = order_details.product_id and order_id=?")
                    .bind(0, order_id)
                    .map((rs, ctx) -> {
                        String oddId = rs.getString("id");
                        String orderId = rs.getString("order_id");
                        String productId = rs.getString("product_id");
                        String name = rs.getString("name");
                        String img = rs.getString("image");
                        int quantity = rs.getInt("quantity");
                        double price = rs.getDouble("price");
                        double discount = rs.getDouble("discount");
                        double amount = rs.getDouble("amount");
                        Order order = new Order(orderId, null, null, null, null, null, null);
                        Product product = new Product(productId, name, 0, null, 0, null, img);
                        return new OrderDetails(oddId, order, product, quantity, price, discount, amount);
                    })
                    .list()
            );
        } catch (Exception e) {
            e.printStackTrace(); // In ra lỗi để debug
            return null;
        }
    }


    @Override
    public int insert(OrderDetails orderDetails) {

        int ketQua = 0;
        try {
            // Bước 1: tạo kết nối đến CSDL
            Connection con = JDBCUtil.getConnection();

            // Bước 2: tạo ra đối tượng statement
            String sql = "INSERT INTO order_details (id, order_id, product_id, quantity, price, discount, amount) " +
                    " VALUES (?,?,?,?,?,?,?)";

            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, orderDetails.getId());
            if (orderDetails.getOrder() != null) {
                st.setString(2, orderDetails.getOrder().getId());
            } else {
                st.setNull(2, Types.VARCHAR);
            }
            st.setString(3, orderDetails.getProduct().getId());
            st.setInt(4, orderDetails.getQuantity());
            st.setDouble(5, orderDetails.getPrice());
            st.setDouble(6, orderDetails.getDiscount());
            st.setDouble(7, orderDetails.getAmount());


            // Bước 3: thực thi câu lệnh SQL
            ketQua = st.executeUpdate();

            // Bước 4:
            System.out.println("Bạn đã thực thi: " + sql);
            System.out.println("Có " + ketQua + " dòng bị thay đổi!");

            // Bước 5:
            JDBCUtil.closeConnection(con);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return ketQua;
    }

    @Override
    public int delete(OrderDetails orderDetails) {

        int ketQua = 0;
        try {
            // Bước 1: tạo kết nối đến CSDL
            Connection con = JDBCUtil.getConnection();

            // Bước 2: tạo ra đối tượng statement
            String sql = "DELETE from order_details " +
                    " WHERE id=?";

            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, orderDetails.getId());

            // Bước 3: thực thi câu lệnh SQL
            System.out.println(sql);
            ketQua = st.executeUpdate();

            // Bước 4:
            System.out.println("Bạn đã thực thi: " + sql);
            System.out.println("Có " + ketQua + " dòng bị thay đổi!");

            // Bước 5:
            JDBCUtil.closeConnection(con);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return ketQua;
    }

    @Override
    public int update(OrderDetails orderDetails) {

        int ketQua = 0;
        try {
            // Bước 1: tạo kết nối đến CSDL
            Connection con = JDBCUtil.getConnection();

            // Bước 2: tạo ra đối tượng statement
            String sql = "UPDATE orders " +
                    " SET " +
                    " order_id=?" +
                    " product_id=?" +
                    " quantity=?" +
                    " price=?" +
                    " discount=?" +
                    " amount=?" +
                    " WHERE id=?";
            PreparedStatement st = con.prepareStatement(sql);

            st.setString(1, orderDetails.getOrder().getId());
            st.setString(2, orderDetails.getProduct().getId());
            st.setInt(3, orderDetails.getQuantity());
            st.setDouble(4, orderDetails.getPrice());
            st.setDouble(5, orderDetails.getDiscount());
            st.setDouble(6, orderDetails.getAmount());
            st.setString(7, orderDetails.getId());


            // Bước 3: thực thi câu lệnh SQL

            System.out.println(sql);
            ketQua = st.executeUpdate();

            // Bước 4:
            System.out.println("Bạn đã thực thi: " + sql);
            System.out.println("Có " + ketQua + " dòng bị thay đổi!");

            // Bước 5:
            JDBCUtil.closeConnection(con);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return ketQua;
    }

    public int countSoldProductsInThisMonth() {
        int count = 0;
        try {
            // Bước 1: tạo kết nối đến CSDL
            Connection con = JDBCUtil.getConnection();

            // Bước 2: tạo ra đối tượng statement
            String sql = "SELECT SUM(order_details.quantity) as product_count " +
                    "FROM order_details " +
                    "JOIN orders ON order_details.order_id = orders.id " +
                    "WHERE MONTH(orders.order_date) = MONTH(CURRENT_DATE()) " +
                    "AND YEAR(orders.order_date) = YEAR(CURRENT_DATE())";

            PreparedStatement st = con.prepareStatement(sql);

            // Bước 3: thực thi câu lệnh SQL và lấy kết quả
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                count = rs.getInt("product_count");
            }

            // Bước 4: Đóng kết nối
            JDBCUtil.closeConnection(con);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return count;
    }

    public double calculateRevenueInThisMonth() {
        double revenue = 0.0;
        try {
            // Bước 1: tạo kết nối đến CSDL
            Connection con = JDBCUtil.getConnection();

            // Bước 2: tạo ra đối tượng statement
            String sql = "SELECT SUM(amount) as total_revenue " +
                    "FROM order_details " +
                    "JOIN orders ON order_details.order_id = orders.id " +
                    "WHERE MONTH(orders.order_date) = MONTH(CURRENT_DATE()) " +
                    "AND YEAR(orders.order_date) = YEAR(CURRENT_DATE())";

            PreparedStatement st = con.prepareStatement(sql);

            // Bước 3: thực thi câu lệnh SQL và lấy kết quả
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                revenue = rs.getDouble("total_revenue");
            }

            // Bước 4: Đóng kết nối
            JDBCUtil.closeConnection(con);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return revenue;
    }

    public static void main(String[] args) {
        OrderDetailsDAO odd = new OrderDetailsDAO();
        List<OrderDetails> o = odd.getByIdOrder("or_1711955239956");
        System.out.println(o);

    }
}