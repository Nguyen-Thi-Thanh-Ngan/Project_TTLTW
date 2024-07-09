<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="model.Product" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Danh mục sản phẩm</title>

    <!-- Google font -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">

    <!-- Bootstrap -->
    <link type="text/css" rel="stylesheet" href="css/bootstrap.min.css"/>

    <!-- Slick -->
    <link type="text/css" rel="stylesheet" href="css/slick.css"/>
    <link type="text/css" rel="stylesheet" href="css/slick-theme.css"/>

    <!-- nouislider -->
    <link type="text/css" rel="stylesheet" href="css/nouislider.min.css"/>

    <!-- Font Awesome Icon -->
    <link rel="stylesheet" href="css/font-awesome.min.css">

    <!-- Custom stlylesheet -->
    <link type="text/css" rel="stylesheet" href="css/style.css"/>
    <link rel="icon" href="./img/logo.png" type="image/x-icon"/>
</head>
<body>
<jsp:include page="header.jsp"/>
<jsp:include page="menu.jsp"/>

<div id="breadcrumb" class="section">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <ul class="breadcrumb-tree">
                    <li><a href="index.jsp">Trang chủ</a></li>
                    <li><a href="#">Sản phẩm tìm kiếm</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>

<div class="section">
    <div class="container">
        <div class="row">
            <div id="content" class="row">
                <c:choose>
                    <c:when test="${not empty listProduct}">
                        <c:forEach var="product" items="${listProduct}">
                            <div class="col-md-4 col-xs-6">
                                <div class="product">
                                    <div class="product-img">
                                        <img src="${product.images[0].linkImage}" alt="">
                                    </div>
                                    <div class="product-body">
                                        <p class="product-category">${product.producer.name}</p>
                                        <h3 class="product-name"><a href="product?id=${product.id}">${product.name}</a></h3>
                                        <h4 class="product-price">
                                            <fmt:formatNumber value="${product.price}" type="number" pattern="#,##0"/>
                                            VNĐ
                                        </h4>
                                        <div class="product-rating">
                                        </div>
                                        <div class="product-btns">
                                        </div>
                                    </div>
                                    <div class="add-to-cart">
                                            <%--                                        <form action="add-cart" method="post">--%>
                                            <%--                                            <input type="hidden" name="id" value="${product.id}">--%>
                                            <%--                                            <button type="submit" class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> Thêm vào giỏ hàng</button>--%>
                                            <%--                                        </form>--%>
                                        <c:choose>
                                            <c:when test="${not empty sessionScope.user}">
                                                <form action="add-cart" method="post">
                                                    <input type="hidden" name="id" value="${product.id}">
                                                    <button type="submit" class="add-to-cart-btn">
                                                        <i class="fa fa-shopping-cart"></i> Thêm vào giỏ hàng
                                                    </button>
                                                </form>
                                            </c:when>
                                            <c:otherwise>
                                                <button type="button" class="add-to-cart-btn"
                                                        onclick="alert('Bạn cần đăng nhập để thêm sản phẩm vào giỏ hàng!')">
                                                    <i class="fa fa-shopping-cart"></i> Thêm vào giỏ hàng
                                                </button>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <a style="margin-left: 300px" href="index.jsp">Rất tiếc, Phone Accessories không tìm thấy kết
                            quả nào phù hợp với từ khóa.</a>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
</div>

<jsp:include page="footer.jsp"/>

<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/slick.min.js"></script>
<script src="js/nouislider.min.js"></script>
<script src="js/jquery.zoom.min.js"></script>
<script src="js/main.js"></script>

</body>
</html>

