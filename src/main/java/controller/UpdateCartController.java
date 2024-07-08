package controller;

import javax.servlet.annotation.WebServlet;


@WebServlet(name = "UpdateCartController", value = "/updatecart")
public class UpdateCartController{
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        doPost(request, response);
//    }
//
//    // Phuong thuc dung cho form cap nhat lai so luong san pham trong gio hang hoac la click nut thanh toan
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        request.setCharacterEncoding("UTF-8");
//        String action = request.getParameter("action");
//        if (action.equals("Cập nhật")) {
//            HttpSession session = request.getSession();
//            Cart cart = (Cart) session.getAttribute("cart");
//
//            // Lấy danh sách sản phẩm trong giỏ hàng
//            List<CartProduct> products = cart.getCartProducts();
//
//            // Duyệt qua tất cả các sản phẩm trong giỏ hàng và cập nhật số lượng
//            for (CartProduct product : products) {
//                String productId = product.getProduct().getId();
//                int quantity = 0;
//                try {
//                    quantity = Integer.parseInt(request.getParameter("quantity_" + productId));
//                } catch (NumberFormatException e) {
//                    // Xử lý ngoại lệ nếu số lượng không hợp lệ
//                }
//                if (quantity <= 0) {
//                    quantity = 1;
//                }
//                cart.updateProduct(productId, quantity);
//                System.out.println("Da cap nhat sp id:" + productId + "so luong: " + quantity);
//            }
//
//            // Cập nhật giỏ hàng trong session
//            session.setAttribute("cart", cart);
//            response.sendRedirect("shopping-cart.jsp");
//        } else if (action != null && action.equals("Xóa")) {
//            String productId = request.getParameter("productId");
//
//            // Lấy giỏ hàng từ session
//            Cart cart = (Cart) request.getSession().getAttribute("cart");
//
//            // Gọi phương thức xóa sản phẩm từ giỏ hàng
//            if (cart != null) {
//                cart.removeProduct(productId);
//            }
//
//            // Chuyển hướng trở lại trang giỏ hàng
//            response.sendRedirect("shopping-cart.jsp");
//        } else if (action != null && action.equals("Thanh toán")) {
//            String[] selectedProducts = request.getParameterValues("selectedProducts");
//
//            // Xử lý logic của việc thanh toán các sản phẩm đã chọn
//            List<Product> selectedProductsList = new ArrayList<>();
//            // Lấy thông tin về tên, số lượng và giá của các sản phẩm đã chọn
//            if (selectedProducts != null) {
//                for (int i = 0; i < selectedProducts.length; i++) {
//                    String productId = selectedProducts[i];
//                    String name = request.getParameter("name_" + productId);
//                    double price = Double.parseDouble(request.getParameter("price_" + productId));
//                    int quantity = Integer.parseInt(request.getParameter("quantity_" + productId));
//
//
//                    Product product = new Product(name, price, quantity);
//                    selectedProductsList.add(product);
//                    System.out.println(name + price + "X" + quantity) ;
//                }
//
//            }
//
//            // Đặt danh sách sản phẩm đã được chọn vào thuộc tính của request
//            request.setAttribute("selectedProductsList", selectedProductsList);
//            request.getRequestDispatcher("check-out.jsp").forward(request, response);
//        }
//
//    }
}
