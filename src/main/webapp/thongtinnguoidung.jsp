<%@ page import="Model.User" %>
<%@ page import="DAO.UserDAO" %>
<%@ page import="DAO.OrderDAO" %>
<%@ page import="Model.Order" %>
<%@ page import="java.util.List" %>
<%@ page import="Model.OrderDetails" %>
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
    <link rel="stylesheet" href="css/infor.css">
    <link type="text/css" rel="stylesheet" href="css/style.css"/>
    <link rel="icon" href="./img/logo.png" type="image/x-icon"/>

    <jsp:useBean id="a" class="DAO.UserDAO" scope="request"/>

    <style>
        .top, .card-content th {
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
                            UserDAO userDAO = new UserDAO();
                            User user = userDAO.getById(request.getParameter("id"));
                        %>
                        <div class="form-group">
                            <div class="top">Tên Người Dùng</div>
                            <div class="bot"><%=user.getName()%></div>
                        </div>
                        <div class="form-group">
                            <div class="top">Giới tính</div>
                            <div class="bot"><%=user.getSex()%></div>
                        </div>
                        <div class="form-group">
                            <div class="top">Ngày sinh nhật</div>
                            <div class="bot"><%=user.getBirthDay()%></div>
                        </div>
                        <div class="form-group">
                            <div class="top">Email</div>
                            <div class="bot"><%=user.getEmail()%></div>
                        </div>
                        <div class="form-group">
                            <div class="top">Số điện thoại</div>
                            <div class="bot"><%=user.getPhoneNumber()%></div>
                        </div>
                        <div class="form-group">
                            <div class="top">Địa chỉ giao hàng</div>
                            <div class="bot"><%=user.getAddress()%></div>
                        </div>
                        <div class="form-group">
                            <div class="top">Tên đăng nhập</div>
                            <div class="bot"><%=user.getUserName()%></div>
                        </div>
                        <!-- /Billing Details -->
                    </div>
                </div>
            </form>
            <div class="order-detail">

                <div class="detail" style="width: 777px">

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
                                        <th>Chi tiết đơn hàng</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <%
                                        OrderDAO orderDAO = new OrderDAO();
                                        List<Order> orders = orderDAO.selectAll();

                                        for (Order order : orders) {
                                            if (order.getUser().getId().equals(request.getParameter("id"))) {
                                    %>
                                    <tr style="background-color: #fff2db">

                                        <td><%=order.getId()%>
                                        </td>
                                        <td><%=order.getAddress()%>
                                        </td>
                                        <td><%=order.getStatus()%>
                                        </td>
                                        <td><%=order.getPayment()%>
                                        </td>
                                        <td><%=order.getOrderDate()%>
                                        </td>
                                        <td><%=order.getDeliveryDate()%>
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

                        </div>
                    </div>
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /SECTION -->
    </div>
    <!-- FOOTER -->
    <jsp:include page="footer.jsp"/>
    <!-- /FOOTER -->

    <!-- jQuery Plugins -->
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/slick.min.js"></script>
    <script src="js/nouislider.min.js"></script>
    <script src="js/jquery.zoom.min.js"></script>
    <script src="js/main.js"></script>

</body>

</html>


