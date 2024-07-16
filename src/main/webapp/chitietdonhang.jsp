
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="model.Order" %>
<%@ page import="model.OrderDetails" %>
<%@ page import="dao.impl.OrderDetailsDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="dao.impl.ProductDAOImpl" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1"> <!-- Phù hợp mọi loại màn hình -->


    <title>Chi tiết đơn hàng</title>

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
    <link rel="stylesheet" href="css/details.css">
    <link type="text/css" rel="stylesheet" href="css/style.css"/>
    <link rel="icon" href="./img/logo.png" type="image/x-icon"/>
    <!-- jQuery Plugins -->
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/slick.min.js"></script>
    <script src="js/nouislider.min.js"></script>
    <script src="js/jquery.zoom.min.js"></script>

    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/toastify-js/src/toastify.min.css">
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/toastify-js"></script>
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
        <div class="row row1">
            <div><h3>Chi tiết</h3></div>
            <div class="menu">
                <div class="menu-left">
                    <%
                        OrderDAO orderDAO = new OrderDAO();
                        Order order = orderDAO.getById(request.getParameter("id"));
                    %>
                    <div class="form-group">
                        <div class="top top1">Mã đơn hàng</div>
                        <div class="bottom bot1"><%=order.getId()%></div>
                    </div>
                    <div class="form-group">
                        <div class="top top1">Ngày Đặt hàng</div>
                        <div class="bottom bot1"><%=order.getOrderDate()%></div>
                    </div>
                    <div class="form-group">
                        <div class="top top1">Trạng thái giao hàng</div>
                        <div class="bottom bot1"><%=order.getStatus()%></div>
                    </div>
                </div>
                <div class="inform-detail">
                    <div class="inform-detail detail-left">
                        <div class="left-top">
                            <table class="table">
                                <thead class="head">
                                <tr>
                                    <th>Hình ảnh</th>
                                    <th>Tên sản phẩm</th>
                                    <th>Số lượng</th>
                                    <th>Giá</th>
                                </tr>
                                </thead>
                                <tbody>
                                <%
                                    OrderDetailsDAO orderDetailsDAO = new OrderDetailsDAO();
                                    List<OrderDetails> listOrderDetails = orderDetailsDAO.getByIdOrder(request.getParameter("id"));
                                    for (OrderDetails orderDetails : listOrderDetails){
                                %>
                                <tr>
                                    <td><img src="<%=orderDetails.getProduct().getImg()%>" width="70px" height="70px"></td>
                                    <td><%=orderDetails.getProduct().getName()%></td>
                                    <td><%=orderDetails.getQuantity()%></td>
                                    <fmt:formatNumber value="<%=orderDetails.getPrice()%>" type="number"
                                                      pattern="#,##0" var="formattedPrice"/>
                                    <td>${formattedPrice} VNĐ</td>
                                </tr>
                                <%
                                    }
                                %>
                                </tbody>
                            </table>
                        </div>
                        <div class="left-center">
                            <div class="form-group gr1">
                                <div class="top">Mã vận chuyển</div>
                                <div class="bottom"></div>
                            </div>
                            <div class="form-group gr1">
                                <div class="top">Nhà vận chuyển</div>
                                <div class="bottom"></div>
                            </div>
                            <div class="form-group gr1">
                                <div class="top">Trạng thái vận chuyển</div>
                                <div class="bottom"></div>
                            </div>
                            <div class="form-group gr1">
                                <div class="top">Khối lượng đơn hàng</div>
                                <div class="bottom"></div>
                            </div>
                        </div>
                        <div class="left-bottom">
                            <div class="form-group gr2">
                                <div class="top">Tổng Tiền</div>
                                <div class="bottom"></div>
                            </div>
                            <div class="form-group gr2">
                                <div class="top">Số lượng sản phẩm</div>
                                <div class="bottom"></div>
                            </div>
                            <div class="form-group gr2">
                                <div class="top">Giảm giá</div>
                                <div class="bottom"></div>
                            </div>
                            <div class="form-group gr2">
                                <div class="top">Vận chuyển</div>
                                <div class="bottom"></div>
                            </div>
                            <div class="form-group gr2">
                                <div class="top"><strong>Tổng giá trị đơn hàng</strong></div>
                                <div class="bottom"></div>
                            </div>
                        </div>
                    </div>
                    <div class="inform-detail detail-right">

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
<script src="js/main.js"></script>
<!-- /FOOTER -->



</body>
</html>

