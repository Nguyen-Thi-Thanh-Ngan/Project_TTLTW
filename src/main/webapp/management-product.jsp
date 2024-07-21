<%@ page import="java.util.Objects" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head lang="en">
    <title>Admin</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport"
          content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
    <link rel="icon" href="./img/logo.png" type="image/x-icon"/>

    <!-- Import lib -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.css">
    <link rel="stylesheet" type="text/css" href="./css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
    <link type="text/css" rel="stylesheet" href="css/bootstrap.min.css"/>
    <link type="text/css" rel="stylesheet" href="./css/style.css"/>
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/datatables/1.10.21/css/jquery.dataTables.min.css">
    <script type="text/javascript" charset="utf8" src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/datatables/1.10.21/js/jquery.dataTables.min.js"
            integrity="sha512-BkpSL20WETFylMrcirBahHfSnY++H2O1W+UnEEO4yNIl+jI2+zowyoGJpbtk6bx97fBXf++WJHSSK2MV4ghPcg=="
            crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdn.datatables.net/2.0.8/js/dataTables.bootstrap5.js"
            crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <!-- End import lib -->

    <link rel="stylesheet" type="text/css" href="css/styleAdmin.css">

    <!-- import script -->


    <jsp:useBean id="a" class="dao.impl.ProductDAOImpl" scope="request"></jsp:useBean>
    <jsp:useBean id="b" class="dao.impl.ProducerDAOImpl" scope="request"></jsp:useBean>
    <jsp:useBean id="c" class="dao.impl.ProductTypeDAOImpl" scope="request"></jsp:useBean>
</head>
<body class="overlay-scrollbar">
<!-- navbar -->
<div class="navbar" style="z-index: 1000; background: white">
    <!-- nav left -->
    <ul class="navbar-nav">
        <li class="nav-item">
            <a class="nav-link">
                <i class="fa-solid fa-bars" onclick="collapseSidebar()"></i>
            </a>
        </li>
        <li class="nav-item">
            <img src="./img/logo.png" alt="logo" class="logo logo-light">
        </li>
    </ul>
    <!-- end nav left -->

    <!-- nav right -->
    <ul class="navbar-nav nav-right">
        <li class="nav-item dropdown">
            <a class="nav-link">
                <i class="fas fa-bell dropdown-toggle" data-toggle="notification-menu"></i>
                <span class="navbar-badge">1</span>
            </a>
            <ul id="notification-menu" class="dropdown-menu notification-menu">
                <div class="dropdown-menu-header">
						<span>
							Thông báo
						</span>
                </div>
                <div class="dropdown-menu-content overlay-scrollbar scrollbar-hover">
                    <li class="dropdown-menu-item">
                        <a href="#" class="dropdown-menu-link">
                            <div>
                                <i class="fas fa-gift"></i>
                            </div>
                            <span>
									Thông báo kết thúc khuyến mãi
									<br>
									<span>
										15/07/2020
									</span>
								</span>
                        </a>
                    </li>
                </div>
                <div class="dropdown-menu-footer">
						<span>
						</span>
                </div>
            </ul>
        </li>

        <li class="nav-item avt-wrapper">
            <div class="avt dropdown">
                <img src="./img/admin1.jpg" alt="User image" class="dropdown-toggle" data-toggle="user-menu">
                <ul id="user-menu" class="dropdown-menu">
                    <li class="dropdown-menu-item">
                        <a class="dropdown-menu-link">
                            <div>
                                <i class="fas fa-user-tie"></i>
                            </div>
                            <span>Thông tin cá nhân</span>
                        </a>
                    </li>
                    <li class="dropdown-menu-item">
                        <a href="#" class="dropdown-menu-link">
                            <div>
                                <i class="fas fa-sign-out-alt"></i>
                            </div>
                            <span>Đăng xuất</span>
                        </a>
                    </li>
                </ul>
            </div>
        </li>
    </ul>
    <!-- end nav right -->
</div>
<!-- end navbar -->
<div class="sidebar">
    <ul class="sidebar-nav">
        <li class="sidebar-nav-item">
            <a href="thongso.jsp" class="sidebar-nav-link" style="margin-top: 20px;">
                <div>
                    <i class="fa-solid fa-signal"></i>
                </div>
                <span>Thông số bán hàng</span>
            </a>
        </li>
        <li class="sidebar-nav-item">
            <%--            <a href="admin.jsp" class="sidebar-nav-link">--%>
            <div>
                <i class="fa fa-user"></i>
            </div>
            <span>Quản lý nhân viên</span>
            <%--            </a>--%>
        </li>
        <li class="sidebar-nav-item">
            <a href="admin.jsp" class="sidebar-nav-link">
                <div>
                    <i class="fa fa-mobile"></i>
                </div>
                <span>Quản lý sản phẩm</span>
            </a>
        </li>
        <li class="sidebar-nav-item">
            <a href="quanlyhoadon.jsp" class="sidebar-nav-link">
                <div>
                    <i class="fa-solid fa-layer-group"></i>
                </div>
                <span>Quản lý hóa đơn</span>
            </a>
        </li>
        <li class="sidebar-nav-item">
            <a href="management-account" class="sidebar-nav-link">
                <div>
                    <i class="fa-solid fa-circle-user"></i>
                </div>
                <span>Quản lý tài khoản</span>
            </a>
        </li>
    </ul>
</div>
<!-- end sidebar -->
<!-- main content -->
<div class="wrapper">

    <!-- Edit-->
    <div id="editEmployeeModal" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <form id="editForm" action="edit" method="post">
                    <div class="modal-header">
                        <h4 class="modal-title">Thay đổi thông tin</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label>Tên sản phẩm</label>
                            <input name="name" value="" type="text" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label>Giá</label>
                            <input name="price" value="" type="text" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label>Mã loại sản phẩm</label>
                            <select name="productType" class="form-select">
                                <%--                                <c:forEach items="${c.selectAll()}" var="pt">--%>
                                <%--                                    <option value="${pt.id}">${pt.id}</option>--%>
                                <%--                                </c:forEach>--%>
                            </select>
                        </div>
                        <div class="form-group">
                            <label>Tồn kho</label>
                            <input name="quantity" value="" type="number" class="form-control"
                                   required>
                        </div>
                        <div class="form-group">
                            <label>Mã hãng sản xuất</label>
                            <select name="productCategory" class="form-select">
                                <%--                                <c:forEach items="${b.selectAll()}" var="pc">--%>
                                <%--                                    <option value="${pc.id}">${pc.id}</option>--%>
                                <%--                                </c:forEach>--%>
                            </select>
                        </div>
                        x
                        <div class="form-group">
                            <label>Hình ảnh</label>
                            <input name="img" value="" type="text" class="form-control" required>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <input type="button" class="btn btn-default" data-dismiss="modal" value="Hủy">
                        <input type="submit" class="btn btn-info" value="Lưu">
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!--/ Edit-->

    <!-- Delete-->
    <div id="deleteEmployeeModal" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <form id="deleteForm" action="delete" method="post">
                    <div class="modal-header">
                        <h4 class="modal-title">Xóa sản phẩm này</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    </div>
                    <div class="modal-body">
                        <p>Bạn có chắc chắn muốn xóa sản phẩm này?</p>
                        <p class="text-warning"><small>Hành động này sẽ không thể hoàn lại.</small></p>
                    </div>
                    <div class="modal-footer">
                        <input type="button" class="btn btn-default" data-dismiss="modal" value="Hủy">
                        <input type="submit" class="btn btn-danger" value="Xóa" onclick="submitDeleteForm()">
                        <input type="hidden" id="productIdToDelete" name="productIdToDelete" value="">
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!--/ Delete-->
    <!--/ Add-->
    <div id="addEmployeeModal" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <form action="add" method="post">
                    <div class="modal-header">
                        <h4 class="modal-title">Thêm sản phẩm</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label>#</label>
                            <input name="id" type="text" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label>Tên sản phẩm</label>
                            <input name="name" type="text" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label>Giá</label>
                            <input name="price" type="text" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label>Mã loại sản phẩm</label>
                            <select name="productType" class="form-select">
                                <c:forEach items="${c.selectAll()}" var="pt">
                                    <option value="${pt.id}">${pt.id}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="form-group">
                            <label>Tồn kho</label>
                            <input name="quantity" type="number" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label>Mã hãng sản xuất</label>
                            <select name="productCategory" class="form-select">
                                <c:forEach items="${b.selectAll()}" var="pc">
                                    <option value="${pc.id}">${pc.id}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="form-group">
                            <label>Hình ảnh</label>
                            <input name="img" type="text" class="form-control" required>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <input type="button" class="btn btn-default" data-dismiss="modal" value="Hủy">
                        <input type="submit" class="btn btn-success" value="Thêm">
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!--/ Add -->
</div>
<!-- end main content -->

<!-- Modal Thông báo-->

<!-- Modal Thông báo Xóa Thành Công -->
<div id="deleteSuccessModal" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Xóa Thành Công</h4>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            </div>
            <div class="modal-body">
                <p>Sản phẩm đã được xóa thành công!</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
            </div>
        </div>
    </div>
</div>
<!-- Modal Thông báo Xóa Thành Công -->

<!-- Modal Thông báo Thêm Sản Phẩm Thành Công -->
<div id="addProductSuccessModal" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Thêm sản phẩm thành công</h4>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            </div>
            <div class="modal-body">
                <p>Sản phẩm đã được thêm thành công!</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
            </div>
        </div>
    </div>
</div>
<!-- Modal Thông báo Thêm Sản Phẩm Thành Công -->

<!-- Modal Thông báo Sửa Sản Phẩm Thành Công -->
<div id="editProductSuccessModal" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Sửa sản phẩm thành công</h4>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            </div>
            <div class="modal-body">
                <p>Sản phẩm đã được sửa thành công!</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
            </div>
        </div>
    </div>
</div>
<!-- Modal Thông báo Sửa Sản Phẩm Thành Công -->

<!-- Modal Thông báo-->


<!-- end import script -->
<!--Script-->
<!--Script Xóa Sản Phẩm-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/toastify-js/src/toastify.min.css">
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/toastify-js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<script src="js/admin.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/datatables/1.10.21/js/jquery.dataTables.min.js"
        integrity="sha512-BkpSL20WETFylMrcirBahHfSnY++H2O1W+UnEEO4yNIl+jI2+zowyoGJpbtk6bx97fBXf++WJHSSK2MV4ghPcg=="
        crossOrigin="anonymous" referrerpolicy="no-referrer"></script>
<%--<script>
    $(document).ready(function () {
        $('#product-list').DataTable({
            "processing": true,
            "serverSide": true,
            "ajax": {
                "url": "/home/product-manager",
                "type": "GET"
            },
            "columns": [
                {"data": "id"},
                {"data": "name"},
                {"data": "price"},
                {"data": "productType.code"},
                {"data": "quantity"},
                {"data": "producer.code"},
                {"data": "images[0].linkImage"},
                {
                    "data": "id",
                    "render": function (data, type, row) {
                        return '<button class="btn btn-danger btn-sm btn-delete"  data-id="' + row.id + '">Xóa</button>' +
                            '<a href="edit-user?id=' + row.id + '"><button style="margin-left: .2em" class="btn btn-primary btn-sm" data-id="' + row.id + '">Sửa</button></a>';

                    }
                }
            ]
        });
    });
</script>--%>
<script type="text/javascript">
    $('#editEmployeeModal').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget);
        var productId = button.data('product-id');
        var productName = button.data('product-name');
        var productPrice = button.data('product-price');
        var productTypeId = button.data('product-productTypeId');
        var productQuantity = button.data('product-quantity');
        var productProducerId = button.data('product-producerId');
        var productImg = button.data('product-img');

        $('#editForm input[name="id"]').val(productId);
        $('#editForm input[name="name"]').val(productName);
        $('#editForm input[name="price"]').val(productPrice);
        $('#editForm input[name="productTypeId"]').val(productTypeId);
        $('#editForm input[name="quantity"]').val(productQuantity);
        $('#editForm input[name="producerId"]').val(productProducerId);
        $('#editForm input[name="img"]').val(productImg);
    });

    function submitEditForm() {
        document.getElementById('editForm').submit();
        $('#editEmployeeModal').modal('hide');
    }
</script>
</body>
</html>