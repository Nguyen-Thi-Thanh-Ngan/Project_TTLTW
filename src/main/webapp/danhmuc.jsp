<%@ page import="model.Product" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Danh mục sản phẩm</title>
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">
    <link type="text/css" rel="stylesheet" href="css/bootstrap.min.css"/>
    <link type="text/css" rel="stylesheet" href="css/slick.css"/>
    <link type="text/css" rel="stylesheet" href="css/slick-theme.css"/>
    <link type="text/css" rel="stylesheet" href="css/nouislider.min.css"/>
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link type="text/css" rel="stylesheet" href="css/style.css"/>
    <link rel="icon" href="./img/logo.png" type="image/x-icon"/>
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/slick.min.js"></script>
    <script src="js/nouislider.min.js"></script>
    <script src="js/jquery.zoom.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/toastify-js/src/toastify.min.css">
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/toastify-js"></script>
    <jsp:useBean id="a" class="service.impl.ProductServiceImpl" scope="request"></jsp:useBean>
    <jsp:useBean id="b" class="dao.impl.ProducerDAOImpl" scope="request"></jsp:useBean>
    <jsp:useBean id="c" class="dao.impl.ProductTypeDAOImpl" scope="request"></jsp:useBean>
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
                    <li><a href="#">Danh mục sản phẩm</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>
<div class="section">
    <div class="container">
        <div class="row">
            <div id="aside" class="col-md-3">
                <div class="aside">
                    <h3 class="aside-title">Hãng sản xuất</h3>
                    <div class="checkbox-filter">
                        <c:forEach items="${b.findAll()}" var="producer">
                            <div class="input-checkbox">
                                <a href="producer?id=${producer.id}">${producer.name}</a>
                            </div>
                        </c:forEach>
                    </div>
                </div>
                <div class="aside">
                    <h3 class="aside-title">Danh mục</h3>
                    <div class="checkbox-filter">
                        <c:forEach items="${c.findAll()}" var="productType">
                            <div class="input-checkbox">
                                <a href="type?id=${productType.id}">${productType.name}</a>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
            <div id="content" class="row">
                <c:forEach var="product" items="${a.findAll()}">
                    <div class="col-md-4 col-xs-6">
                        <div class="product">
                            <div class="product-img">
                                <img src="${product.images[0].linkImage}" alt="">
                            </div>
                            <div class="product-body">
                                <p class="product-category">${product.producer.name}</p>
                                <h3 class="product-name"><a href="product?id=${product.id}">${product.name}</a></h3>
                                <fmt:formatNumber value="${product.price}" type="number" pattern="#,##0" var="formattedPrice"/>
                                <h4 class="product-price">${formattedPrice} VNĐ</h4>
                                <div class="product-rating">
                                </div>
                                <div class="product-btns">
                                </div>
                            </div>
                            <div class="add-to-cart">
                                    <button class="add-to-cart-btn" data-product="${product.id}">
                                        <i class="fa fa-shopping-cart"></i> Thêm vào giỏ hàng
                                    </button>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>

        </div>
    </div>
</div>
<jsp:include page="footer.jsp"/>
<script src="js/main.js"></script>
</body>
</html>