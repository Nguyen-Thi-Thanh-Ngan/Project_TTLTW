<%@ page import="model.User" %>
<%@ page import="dao.impl.UserDaoImpl" %>
<%--<%@ page import="dao.impl.OrderDAO" %>--%>
<%@ page import="model.Order" %>
<%@ page import="java.util.List" %>
<%@ page import="model.OrderDetails" %>
<%@ page import="dao.impl.OrderDAOImpl" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1"> <!-- Phù hợp mọi loại màn hình -->


    <title>Thông tin người dùng</title>

    <!-- Google font -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">

    <!-- Bootstrap -->
    <link type="text/css" rel="stylesheet" href="css/bootstrap.min.css"/>

    <!-- Slick -->
    <link type="text/css" rel="stylesheet" href="css/slick.css"/>
    <link type="text/css" rel="stylesheet" href="css/slick-theme.css"/>


    <link type="text/css" rel="stylesheet" href="css/nouislider.min.css"/>

    <!-- Font Awesome Icon -->
    <link rel="stylesheet" href="css/font-awesome.min.css">

    <!-- stlylesheet -->
    <link rel="stylesheet" href="css/information.css">
    <link type="text/css" rel="stylesheet" href="css/style.css"/>
    <link rel="icon" href="./img/logo.png" type="image/x-icon"/>

    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/slick.min.js"></script>
    <script src="js/nouislider.min.js"></script>
    <script src="js/jquery.zoom.min.js"></script>

    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/toastify-js/src/toastify.min.css">
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/toastify-js"></script>

    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/toastify-js/src/toastify.min.css">
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/toastify-js"></script>

    <jsp:useBean id="a" class="dao.impl.UserDaoImpl" scope="request"/>

        <style>
            .top, .card-content th{
                color: white;
            }
        </style>

</head>
<body>

<!-- HEADER -->
<jsp:include page="header.jsp"/>
<!-- /HEADER -->

<!-- MENU -->
<jsp:include page="menu.jsp"/>
<!-- /MENU -->

<!-- SECTION -->
<div class="section">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">
            <form class="form">
                <div class="col-md-7">
                    <!-- Billing Details -->
                    <div class="billing-details">
                        <div class="section-title">
                            <h4 class="title">Thông tin người dùng</h4>
                        </div>
                        <%
                            UserDaoImpl userDAO = new UserDaoImpl();
                            Integer idUser = Integer.parseInt(request.getParameter("id"));
                            User user = userDAO.getUserByUserId(idUser);
                        %>
                        <div class="form-group">
                            <div class="top">Tên Người Dùng</div>
                            <div class="bot"><%=user.getName()%>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="top">Email</div>
                            <div class="bot"><%=user.getEmail()%>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="top">Ngày tạo</div>
                            <div class="bot"><%=user.getCreatedAt()%>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="top">Tên đăng nhập</div>
                            <div class="bot"><%=user.getUsername()%>
                            </div>
                        </div>
                    </div>
                    <!-- /Billing Details -->
                </div>
            </form>
            <div class="order-detail">
                <div class="detail">
                    <div class="detail">
                        <div class="title-2">Đơn hàng đã đặt</div>
                        <div>
                            <div class="card-content">
                                <table>
                                    <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Địa chỉ giao hàng</th>
                                        <th>Trạng thái đơn hàng</th>
                                        <th>Phương thức thanh toán</th>
                                        <th>Ngày đặt hàng</th>
                                        <th>Ngày nhận hàng</th>
                                        <th>Tổng giá đơn hàng</th>
                                        <th>Chi tiết đơn hàng</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <%
                                        OrderDAOImpl orderDAO = new OrderDAOImpl();
                                        List<Order> orders = orderDAO.findByIdUser(idUser);

                                        for (Order order : orders) {
                                            if ((!order.getStatus().equals("Hoàn tất"))) {
                                    %>
                                    <tr style="background-color: #fff2db">
                                        <td><%=order.getId()%>
                                        </td>
                                        <td><%=order.getAddress()%>
                                        </td>
                                        <td><%=order.getStatus()%>
                                        </td>
                                        <td><%=order.getPayment_method()%>
                                        </td>
                                        <td><%=order.getOrderDate()%>
                                        </td>
                                        <td><%=order.getDeliveryDate()%>
                                        </td>
                                        <td><%=order.getTotalPrice()%>
                                        </td>
                                        <td>
                                            <a href="chitietdonhang.jsp?id=<%=order.getId()%>">
                                                <img src="https://cdn-icons-png.flaticon.com/128/9183/9183248.png"
                                                     width="35px" height="35px" style="margin-left: 20px" alt="">
                                            </a>
                                        </td>
                                    </tr>
                                    <%
                                            }
                                        }
                                    %>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="history">
                        <div class="title-3">Lịch sử đơn hàng</div>
                        <div class="complete">
                            <div>
                                <div class="card-content-his">
                                    <table>
                                        <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Địa chỉ giao hàng</th>
                                            <th>Trạng thái đơn hàng</th>
                                            <th>Phương thức thanh toán</th>
                                            <th>Ngày đặt hàng</th>
                                            <th>Ngày nhận hàng</th>
                                            <th>Tổng giá đơn hàng</th>
                                            <th>Chi tiết đơn hàng</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <%
                                            for (Order order : orders) {
                                                if (order.getStatus().equals("Hoàn tất")) {
                                        %>
                                        <tr style="background-color: #fff2db">
                                            <td><%=order.getId()%>
                                            </td>
                                            <td><%=order.getAddress()%>
                                            </td>
                                            <td><%=order.getStatus()%>
                                            </td>
                                            <td><%=order.getPayment_method()%>
                                            </td>
                                            <td><%=order.getOrderDate()%>
                                            </td>
                                            <td><%=order.getDeliveryDate()%>
                                            </td>
                                            <td><%=order.getTotalPrice()%>
                                            </td>
                                            <td>
                                                <a href="chitietdonhang.jsp?id=<%=order.getId()%>">
                                                    <img src="https://cdn-icons-png.flaticon.com/128/9183/9183248.png"
                                                         width="35px" height="35px" style="margin-left: 20px" alt="">
                                                </a>
                                            </td>
                                        </tr>
                                        <%
                                                }
                                            }
                                        %>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /SECTION -->
    </div>
</div>
<!-- FOOTER -->
<jsp:include page="footer.jsp"/>
<!-- /FOOTER -->
<!-- jQuery Plugins -->

<script src="js/main.js"></script>
</body>

</html>