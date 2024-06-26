
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1"> <!-- Phù hợp mọi loại màn hình -->


    <title>Thanh toán</title>

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
    <link type="text/css" rel="stylesheet" href="css/style.css"/>
    <link rel="icon" href="./img/logo.png" type="image/x-icon"/>

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
            <form>
                <div class="col-md-7">
                    <!-- Billing Details -->
                    <div class="billing-details">
                        <div class="section-title">
                            <h3 class="title">Thông tin thanh toán</h3>
                        </div>
                        <div class="form-group">
                            <input class="input" type="text" name="name" placeholder="Họ và tên" required
                                   value="${name}">
                        </div>
                        <div class="form-group">
                            <input class="input" type="email" name="email" placeholder="Email" required
                                   value="${email}">
                        </div>
                        <div class="form-group">
                            <input class="input" type="text" name="delivery_address" placeholder="Địa chỉ nhận hàng"
                                   required>
                        </div>
                        <div class="form-group">
                            <input class="input" type="tel" name="phoneNumber" placeholder="Số điện thoại" required
                                   value="${phoneNumber}">
                        </div>

                    </div>
                    <!-- /Billing Details -->

                    <!-- Shiping Details -->
                    <div class="shiping-details">
                        <div class="section-title">
                            <h3 class="title">Yêu cầu khác</h3>
                        </div>

                    </div>
                    <!-- /Shiping Details -->

                    <!-- Order notes -->
                    <div class="order-notes">
                        <textarea class="input" placeholder="Yêu cầu khác(Không bắt buộc)"></textarea>
                    </div>
                    <!-- /Order notes -->
                </div>
            </form>
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