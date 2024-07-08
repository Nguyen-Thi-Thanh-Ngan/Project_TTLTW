package controller;

import javax.servlet.annotation.WebServlet;

@WebServlet(name = "OrderController", value = "/order")
public class OrderController{
//    private OrderDAO orderDAO = new OrderDAO();
//    private OrderDetailsDAO orderDetailsDAO = new OrderDetailsDAO();
//
//    private UserDAO userDAO = new UserDAO();
//
//    private IUserService userService = new UserServiceImpl();
//    private static final AtomicLong counter = new AtomicLong(System.currentTimeMillis());
//
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        doPost(request, response);
//    }
//
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        request.setCharacterEncoding("utf-8");
//        response.setCharacterEncoding("utf-8");
//
//        HttpSession session = request.getSession();
//        Cart cart = (Cart) session.getAttribute("cart");
//
//        if (cart != null) {
//
//            Date orderDate = new Date(System.currentTimeMillis() + 3600000);
//            long sevenDaysInMillis = 3 * 24 * 60 * 60 * 1000;
//            Date deliverDate = new Date(orderDate.getTime() + sevenDaysInMillis);
//
//            String idOrder = "or_" + String.valueOf(counter.getAndIncrement());
//
//            String name = request.getParameter("name");
//            String email = request.getParameter("email");
//            String address = request.getParameter("delivery_address");
//            String phone = request.getParameter("phoneNumber");
//            String paymentMethod = request.getParameter("payment");
//
//            if (email != null && !email.isEmpty()) {
//                User user = userDAO.getUserByEmail(email);
//                user.setId(userDAO.getUserByEmail(email).getId());
//
//                Order order = new Order(idOrder, user, address, "xác nhận đơn hàng", paymentMethod, orderDate, deliverDate);
//                orderDAO.insert(order);
//                List<CartProduct> cartProducts = cart.getCartProducts();
//                for (CartProduct cartProduct : cartProducts) {
//                    String idOrderDetail = "od_" + String.valueOf(counter.getAndIncrement());
//                    OrderDetails orderDetails = new OrderDetails();
//                    double amount = cartProduct.getProduct().getPrice() * cartProduct.getQuantity();
//                    orderDetails.setId(idOrderDetail);
//                    orderDetails.setOrder(order);
//                    orderDetails.setProduct(cartProduct.getProduct());
//                    orderDetails.setQuantity(cartProduct.getQuantity());
//                    orderDetails.setPrice(cartProduct.getProduct().getPrice());
//                    orderDetails.setDiscount(0);
//                    orderDetails.setAmount(amount);
//
//                    orderDetailsDAO.insert(orderDetails);
//                }
//                session.removeAttribute("cart");
//            } else {
//                request.setAttribute("error", "Tên người dùng hoặc email hoặc số điện thoại không chính xác!");
//                RequestDispatcher dispatcher = request.getRequestDispatcher("check-out.jsp");
//                dispatcher.forward(request, response);
//            }
//        }
//        session.setAttribute("OrderSuccess", true);
//        response.sendRedirect("check-out.jsp");
//    }

}