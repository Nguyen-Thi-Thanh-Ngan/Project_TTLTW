<%--
  Created by IntelliJ IDEA.
  User: hadun
  Date: 11/12/2023
  Time: 10:17 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Header</title>
    <link rel="icon" type="image/png" href="./img/logo.png"/>


</head>
<body>
<!-- HEADER -->
<header>
    <!-- TOP HEADER -->
    <div id="top-header">
        <div class="container">
            <ul class="header-links pull-left">
                <li><a href="#"><i class="fa fa-phone"></i> 0973206403</a></li>
                <li><a href="#"><i class="fa fa-envelope-o"></i> hadung6765@gmail.com</a></li>
                <li><a href="#"><i class="fa fa-map-marker"></i>Quận Thủ Đức - Tp.Hồ Chí Minh</a></li>
            </ul>
            <ul class="header-links pull-right">
                <c:set var="user" value="${sessionScope.user}"/>
                <c:choose>
                    <c:when test="${user != null}">
                        <c:if test="${user.roleId == 1 || user.roleId == 2}">
                            <li><a href="admin"><i class="fa fa-user-o"></i> Quản trị</a></li>
                        </c:if>
                        <li><a href="user-information.jsp?id=${user.id}"><i class="fa fa-user-o"></i> ${user.name}</a></li>
                        <li><a href="logout"><i class="fa fa-user-o"></i> Đăng xuất</a></li>
                    </c:when>
                    <c:otherwise>
                        <li><a href="sign-up.jsp"><i class="fa fa-user-o"></i> Đăng kí</a></li>
                        <li><a href="sign-in.jsp"><i class="fa fa-user-o"></i> Đăng nhập</a></li>
                    </c:otherwise>
                </c:choose>

            </ul>
        </div>
    </div>
    <!-- /TOP HEADER -->

    <!-- MAIN HEADER -->
    <div id="header">
        <!-- container -->
        <div class="container">
            <!-- row -->
            <div class="row">
                <!-- LOGO -->
                <div class="col-md-3">
                    <div class="header-logo">
                        <a href="index.jsp" class="logo">
                            <img src="img/logo.png" alt="">
                        </a>
                    </div>
                </div>
                <!-- /LOGO -->

                <!-- SEARCH BAR -->
                <div class="col-md-6">
                    <div class="header-search">
                        <form action="search" method="get">
                            <input class="input" name="name" placeholder="Tìm kiếm tại đây" value="${param.name}">
                            <input class="search-btn" type="submit" name="" value="Tìm kiếm">
                        </form>
                    </div>
                </div>
                <!-- /SEARCH BAR -->

                <!-- ACCOUNT -->
                <div class="col-md-3 clearfix">
                    <div class="header-ctn">
                        <!-- cart -->
                        <div class="dropdown">
                            <a class="dropdown-toggle" href="cart.html">
                                <i class="fa fa-shopping-cart"></i>
                                <span>Giỏ Hàng</span>
                                <div id="cart-quantity" class="qty"><c:out value="${totalItem}"/></div>
                            </a>
                        </div>
                        <!-- /cart -->

                        <!-- Menu Toogle -->
                        <div class="menu-toggle">
                            <a href="#">
                                <i class="fa fa-bars"></i>
                                <span>Menu</span>
                            </a>
                        </div>
                        <!-- /Menu Toogle -->
                    </div>
                </div>
                <!-- /ACCOUNT -->
            </div>
            <!-- row -->
        </div>
        <!-- container -->
    </div>
    <!-- /MAIN HEADER -->
</header>
<!-- /HEADER -->
<script>
    $(document).ready(function () {
        <%if (session.getAttribute("user") != null) { %>
            $.ajax({
                url: 'api/cart/total-cart-item',
                method: 'GET',
                dataType: 'json',
                success: function (response) {
                    $('#cart-quantity').text(response);
                },
                error: function (xhr, status, error) {
                    console.error('Failed to fetch cart count:', error);
                }
            })
        <%} else {%>
            $('#cart-quantity').text("0");
        <%}%>
    });
</script>
</body>
</html>