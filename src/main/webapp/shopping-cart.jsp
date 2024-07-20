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

    <script src="js/jquery.min.js"></script>

    <!-- jQuery Plugins -->
    <script src="js/bootstrap.min.js"></script>
    <script src="js/slick.min.js"></script>
    <script src="js/nouislider.min.js"></script>
    <script src="js/jquery.zoom.min.js"></script>

    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/toastify-js/src/toastify.min.css">
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/toastify-js"></script>

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
                <form id="checkoutForm" action="check-out" method="post">
                    <tbody>
                    <c:forEach items="${cartItems}" var="item">
                        <tr class="cart-item" id="item-${item.product.id}">
                            <td>

                                <input type="checkbox" class="productCheckbox" name="selectedProductIds"
                                       value="${item.product.id}"
                                       data-price="${item.product.price}"
                                       data-quantity="${item.quantity}"
                                       onchange="updateTotalAmount()" style="margin-left: -30px; position: absolute;">

                                <div class="row">
                                    <div class="col-lg-2 Product-img">
                                        <img src="${item.product.images[0].linkImage}" alt=".   .."
                                             class="img-responsive"/>
                                    </div>
                                    <div class="col-lg-10">
                                        <h5 class="nomargin"><b>${item.product.name}
                                        </b></h5>
                                        <p></p>
                                    </div>
                                </div>

                                <input type="hidden" name="${item.product.id}"
                                       value="${item.product.name}"/>

                            </td>
                            <fmt:formatNumber value="${item.product.price}" type="number" pattern="#,##0"
                                              var="formattedPrice"/>
                            <td class="product-price"><strong class="product-price">${formattedPrice} VNĐ</strong></td>
                                <%--                        Cập nhật số lượng--%>
                            <td data-th="Quantity">
                                <table class="table table-hover border bg-white">
                                    <td style="border: none"><b>
                                        <input type="number" id="quantity-${item.product.id}"
                                               name="quantity-${item.product.id} quantity"
                                               value="${item.quantity}" style="width: 45px">
                                    </b></td>
                                    <td style="border: none">
                                        <input type="hidden" id="productId" name="productId"
                                               value="${item.product.id}">
                                        <input type="button" name="action" class="btn btn-success btn-block"
                                               value="Cập nhật" onclick="updateQuantity(${item.product.id})"/>
                                    </td>
                                </table>
                            </td>

                            <fmt:formatNumber value="${item.product.price * item.quantity}"
                                              type="number" pattern="#,##0"
                                              var="formattedPrice1"/>
                            <td id="subtotal-${item.product.id}">
                                <strong class="total-price">${formattedPrice1} VNĐ</strong></td>
                            <td class="actions" data-th="" style="width:10%;">
                                <p data-toggle="modal" data-product-id="${item.product.id}" data-target="#delete"
                                   class="btn btn-danger btn-sm delete-product"><i class="fa fa-trash-o"></i></p>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                    <tfoot>

                    <tr>
                        <td><a href="index.jsp" class="btn btn-success "> <i class="fa fa-angle-left"> </i> Tiếp tục mua
                            sắm
                        </a></td>
                        <td colspan="2" class="hidden-xs"></td>

                        <td class="hidden-xs text-center" style="width:10%;">
                            <fmt:formatNumber value="${totalPrice}" type="number" pattern="#,##0"
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
            <!-- Delete-->
            <div id="delete" class="modal fade">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">Xóa sản phẩm này khỏi giỏ hàng</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Hủy">
                            <input type="hidden" name="productId" value="${item.product.id}">
                            <button id="confirm-delete" type="button" class="btn btn-danger">Xóa</button>
                        </div>
                    </div>
                </div>
            </div>

            <!--/ Delete-->
        </div>
        <!-- Xử lý khi giỏ hàng không tồn tại -->
        <%--        <a style=" text-align: center; margin-left: 500px; font-size: 30px">--%>
        <%--            <strong>Giỏ hàng trống</strong>--%>
        <%--            <br>--%>
        <%--            <br>--%>
        <%--            <a href="index.jsp" class="btn btn-success " style="margin-left: 540px;"> <i class="fa fa-angle-left"> </i>--%>
        <%--                Tiếp tục mua sắm </a>--%>
        <%--            <br>--%>
        <%--        </a>--%>
    </div>
</div>


<!-- /SECTION -->


<!-- FOOTER -->
<jsp:include page="footer.jsp"/>
<!-- /FOOTER -->

<script>
    $('#checkoutForm').on('submit', function (event) {
        var checkboxes = $('input[name="selectedProductIds"]:checked');
        if (checkboxes.length === 0) {
            event.preventDefault();
            Toastify({
                text: "Vui lòng chọn ít nhất một sản phẩm trước khi thanh toán",
                duration: 3000,
                newWindow: true,
                close: true,
                gravity: "top",
                position: "right",
                stopOnFocus: true,
                style: {
                    background: "#D10024",
                },
                onClick: function () {
                }
            }).showToast();
        }
    });

    $('#selectAll').on('change', function () {
        var isChecked = $(this).is(':checked');
        $('input[name="selectedProductIds"]').prop('checked', isChecked);
        updateTotalAmount();
    });

    $('input[name="selectedProductIds"]').on('change', function () {
        updateTotalAmount();
    });

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
        formattedTotalAmount = formattedTotalAmount.replace('₫', ' VNĐ');
        document.getElementById('totalAmountLabel').textContent = 'Tổng tiền: ' + formattedTotalAmount;
    }
</script>
<script>
    // window.onload = function () {
    //     var selectAllCheckbox = document.getElementById('selectAllCheckbox');
    //     selectAllCheckbox.onclick = selectAll;
    // }
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

    function addSelectedProductsToForm() {
        var checkboxes = document.querySelectorAll('input[name="selectedProducts"]:checked');
        var selectedProductIds = [];

        checkboxes.forEach(function (checkbox) {
            selectedProductIds.push(checkbox.value);
        });

        var selectedProductIdsInput = document.getElementById('selectedProductIds');
        selectedProductIdsInput.value = selectedProductIds.join(',');
    }

    document.getElementById('checkoutForm').addEventListener('submit', function (event) {
        addSelectedProductsToForm();
    });

</script>
<script>
    function removeCartItem(productId) {
        $.ajax({
            url: 'api/remove-cart-item?productId=' + productId,
            type: 'DELETE',
            success: function (response) {
                $('#item-' + productId).remove();
                $(`#delete`).modal('hide');
                const totalItem = $(`#cart-quantity`);
                totalItem.text(parseInt(totalItem.text()) - 1);
            },
            error: function (error) {
                console.error('Có lỗi xảy ra khi xóa sản phẩm:', error);
            }
        });
    }

    $(document).ready(function () {
        $('.delete-product').click(function () {
            let productId = $(this).data('product-id');
            $(`#delete`).data('product-id', productId);
        });

        $('#confirm-delete').click(function () {
            let productId = $(`#delete`).data('product-id');
            removeCartItem(productId);
        });
    });

    const formatter = Intl.NumberFormat('vi-VN', {
        style: 'currency',
        currency: 'VND'
    });

    function updateQuantity(productId) {
        var quantity = $('#quantity-' + productId).val();
        var data = {
            productId: productId,
            quantity: parseInt(quantity)
        };

        $.ajax({
            url: '/home/update-quantity-cart-item',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(data),
            success: function (response) {
                Toastify({
                    text: response.message,
                    duration: 3000,
                    newWindow: true,
                    close: true,
                    gravity: "top",
                    position: "right",
                    stopOnFocus: true,
                    style: {
                        background: "green",
                    },
                    onClick: function () {
                    } // Callback after click
                }).showToast();
                // productId = response.productId;
                updateCartItem(productId, response)
            },
            error: function (xhr) {
                console.log(xhr)
                Toastify({
                    text: 'Cập nhật thất bại',
                    duration: 3000,
                    newWindow: true,
                    close: true,
                    gravity: "top",
                    position: "right",
                    stopOnFocus: true,
                    style: {
                        background: "#D10024",
                    },
                    onClick: function () {
                    } // Callback after click
                }).showToast();
            }
        });
    }


    const updateCartItem = (productId, reponse) => {
        const cartItem = $(`#item- \${productId}`);
        const eTotalPrice = cartItem.find('.total-price');
        eTotalPrice.text(formatter.format(reponse.newPrice).substring(0, formatter.format(reponse.newPrice).length - 1) + "VNĐ");
    }
</script>
<script src="js/main.js"></script>
</body>
</html>