<%@ page import="cart.Cart" %>
<%@ page import="model.cart.CartProduct" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Product" %>
<%@ page import="java.util.Map" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" href="./img/logo.png" type="image/x-icon"/>
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <title>Giỏ hàng</title>

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

    <%--    <jsp:useBean id="a" class="dao.impl.NewProductDAO" scope="request"/>--%>
</head>
<body>
<!-- HEADER -->
<jsp:include page="header.jsp"/>
<!-- /HEADER -->

<!-- MENU -->
<jsp:include page="menu.jsp"/>
<!-- /MENU -->
<!-- BREADCRUMB -->
<div id="breadcrumb" class="section">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">
            <div class="col-md-12">
                <ul class="breadcrumb-tree">
                    <li><a href="index.jsp">Trang chủ</a></li>
                    <li class="active">Giỏ hàng</li>
                </ul>
            </div>
        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>
<!-- /BREADCRUMB -->

<!-- SECTION -->
<div class="container main-section">
    <div class="row">
        <div class="col-lg-12 pl-3 pt-3">
            <table class="table table-hover border bg-white">
                <thead>
                <tr>
                    <input type="checkbox" id="selectAll" onchange="selectAll()"> Chọn tất cả<br>
                    <th>
                        <h4><b>Thông tin sản phẩm</b></h4>
                    </th>
                    <th style="width:20%;">
                        <h4><b>Đơn Giá</b></h4>
                    </th>
                    <th style="width:10%;">
                        <h4><b>Số lượng</b></h4>
                    </th>
                    <th style="width:20%;">
                        <h4><b>Số tiền</b></h4>
                    </th>
                    <th>
                        <h4><b>Xóa</b></h4>
                    </th>
                </tr>

                </thead>
                <form action="updatecart" method="post" id="formupdate">
                    <tbody>
                    <tr>
                        <td>

                            <input type="checkbox" class="productCheckbox" name="selectedProducts"
                                   value=""
                                   data-price=""
                                   data-quantity=""
                                   onchange="updateTotalAmount()" style="margin-left: -30px; position: absolute;">

                            <div class="row">
                                <div class="col-lg-2 Product-img">
                                    <img src="" alt="..." class="img-responsive"/>
                                </div>
                                <div class="col-lg-10">
                                    <h5 class="nomargin"><b>
                                    </b></h5>
                                    <p></p>
                                </div>
                            </div>

                            <input type="hidden" name=""
                                   value=""/>
                            <input type="hidden" name=""
                                   value="">
                        </td>
                        <fmt:formatNumber value="" type="number" pattern="#,##0"
                                          var="formattedPrice"/>
                        <td><strong> ${formattedPrice} VND</strong></td>
                        <%--                        Cập nhật số lượng--%>
                        <td data-th="Quantity">

                            <table class="table table-hover border bg-white">
                                <td style="border: none"><b> <input type="text"
                                                                    name=""
                                                                    value=""

                                                                    style="width: 45px"> </b>
                                </td>

                                <td style="border: none"><input type="hidden" name="productId"
                                                                value="">
                                    <input type="submit" name="action" class="btn btn-success btn-block"
                                           value="Cập nhật">
                                </td>
                            </table>

                            <%--                        Cập nhật số lượng--%>
                        </td>

                        <fmt:formatNumber value=""
                                          type="number" pattern="#,##0"
                                          var="formattedPrice1"/>
                        <td><strong> ${formattedPrice1} VND</strong></td>
                        <td class="actions" data-th="" style="width:10%;">
                            <!-- Delete-->
                            <div id="" class="modal fade">
                                <div class="modal-dialog">
                                    <div class="modal-content">

                                        <div class="modal-header">
                                            <h4 class="modal-title">Xóa sản phẩm này khỏi giỏ hàng</h4>
                                            <button type="button" class="close" data-dismiss="modal"
                                                    aria-hidden="true">
                                                &times;
                                            </button>
                                        </div>
                                        <div class="modal-footer">
                                            <input type="button" class="btn btn-default" data-dismiss="modal"
                                                   value="Hủy">
                                            <input type="hidden" name="productId"
                                                   value="">
                                            <input type="submit" class="btn btn-danger" name="action" value="Xóa">
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <!--/ Delete-->
                            <p data-toggle="modal"
                               data-target=""
                               class="btn btn-danger btn-sm"><i class="fa fa-trash-o"> </i></p>
                        </td>
                    </tr>
                    </tbody>
                    <tfoot>

                    <tr>
                        <td><a href="index.jsp" class="btn btn-success "> <i class="fa fa-angle-left"> </i> Tiếp tục mua
                            sắm
                        </a></td>
                        <td colspan="2" class="hidden-xs"></td>

                        <td class="hidden-xs text-center" style="width:10%;">
                            <fmt:formatNumber value="" type="number" pattern="#,##0"
                                              var="formattedPrice2"/>
                            <span id="totalAmountLabel" style="font-weight: bold;">
                            <strong>Tổng tiền : 0 VND</strong>
                              </span>
                        </td>

                        <td>
                            <input type="submit" id="paybutton" name="action" class="btn btn-success btn-block"
                                   value="Thanh toán">
                        </td>

                    </tr>

                    </tfoot>
                </form>
            </table>

        </div>
        <!-- Xử lý khi giỏ hàng không tồn tại -->
        <a style=" text-align: center; margin-left: 500px; font-size: 30px">
            <strong>Giỏ hàng trống</strong>
            <br>
            <br>
            <a href="index.jsp" class="btn btn-success " style="margin-left: 540px;"> <i class="fa fa-angle-left"> </i>
                Tiếp tục mua sắm </a>
            <br>
        </a>
    </div>
</div>


<!-- /SECTION -->


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
<script>
    function updateTotalAmount() {
        var checkboxes = document.querySelectorAll('input[name="selectedProducts"]');
        var totalAmount = 0;

        for (var i = 0; i < checkboxes.length; i++) {
            if (checkboxes[i].checked) {
                var price = checkboxes[i].getAttribute('data-price');
                var quantity = checkboxes[i].getAttribute('data-quantity');
                var productTotal = price * quantity;
                totalAmount += productTotal;
            }
        }

        var formattedTotalAmount = new Intl.NumberFormat('vi-VN', {
            style: 'currency',
            currency: 'VND'
        }).format(totalAmount);
        formattedTotalAmount = formattedTotalAmount.replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,');
        formattedTotalAmount = formattedTotalAmount.replace('₫', ' VND');
        document.getElementById('totalAmountLabel').textContent = 'Tổng tiền: ' + formattedTotalAmount;
    }


</script>
<script type="text/javascript">
    window.onload = function () {
        var selectAllCheckbox = document.getElementById('selectAllCheckbox');
        selectAllCheckbox.onclick = selectAll;
    }

    function selectAll() {
        var checkboxes = document.querySelectorAll('input[type="checkbox"]');
        var selectAllCheckbox = document.getElementById('selectAll');

        for (var i = 0; i < checkboxes.length; i++) {
            if (checkboxes[i] !== selectAllCheckbox) {
                checkboxes[i].checked = selectAllCheckbox.checked;
            }
        }
        updateTotalAmount();
    }
</script>
<script>
    // Lấy tham chiếu đến nút thanh toán
    var thanhToanButton = document.getElementById('paybutton');

    var cacSanPham = document.querySelectorAll('input[type="checkbox"]');

    // Kiểm tra khi nút thanh toán được nhấn
    thanhToanButton.addEventListener('click', function (event) {
        var daChonSanPham = false;


        cacSanPham.forEach(function (sanPham) {

            if (sanPham.checked) {
                daChonSanPham = true;
                return;
            }
        });


        if (!daChonSanPham) {
            event.preventDefault();
            alert('Vui lòng chọn sản phẩm trước khi thanh toán.');
        }
    });
</script>

</body>
</html>