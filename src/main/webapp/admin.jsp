<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <title>Admin</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport"
          content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
    <link rel="icon" href="./img/logo.png" type="image/x-icon"/>

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.css">
    <link rel="stylesheet" type="text/css" href="./css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
    <link type="text/css" rel="stylesheet" href="css/style.css"/>
    <link rel="stylesheet" type="text/css" href="css/styleAdmin.css">

    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/datatables/1.10.21/css/jquery.dataTables.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/datatables/1.10.21/js/jquery.dataTables.min.js"
            integrity="sha512-BkpSL20WETFylMrcirBahHfSnY++H2O1W+UnEEO4yNIl+jI2+zowyoGJpbtk6bx97fBXf++WJHSSK2MV4ghPcg=="
            crossorigin="anonymous" referrerpolicy="no-referrer"></script>

    <script src="https://cdn.jsdelivr.net/npm/gasparesganga-jquery-loading-overlay@2.1.7/dist/loadingoverlay.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/toastify-js/src/toastify.min.css">
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/toastify-js"></script>

    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/toastify-js/src/toastify.min.css">
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/toastify-js"></script>

    <jsp:useBean id="c" class="dao.impl.ProductTypeDAOImpl" scope="request"/>
    <jsp:useBean id="b" class="dao.impl.ProducerDAOImpl" scope="request"/>
</head>
<body class="overlay-scrollbar">
<c:out value="${product}"/>
<div class="navbar">
    <ul class="navbar-nav">
        <li class="nav-item">
            <a class="nav-link">
                <i class="fa-solid fa-bars" onclick="collapseSidebar()"></i>
            </a>
        </li>
        <li class="nav-item">
            <a href="index.jsp"><img src="./img/logo.png" alt="logo" class="logo logo-light"></a>
        </li>
    </ul>
    <ul class="navbar-nav nav-right">
        <li class="nav-item">
            <div class="avt dropdown">
                <c:if test="${sessionScope.user != null}">
                </c:if>
                <ul id="user-menu" class="dropdown-menu">
                    <li class="dropdown-menu-item">
                        <a href="logout" class="dropdown-menu-link">
                            <div>
                                <i class="fas fa-sign-out-alt"></i>
                            </div>
                            <span>Đăng xuất</span>
                        </a>
                    </li>
                </ul>
            </div>
        </li>
        <li class="nav-item">
            <div class="avt dropdown">
                <img src="./img/admin1.jpg" alt="User image" class="dropdown-toggle" data-toggle="user-menu">
            </div>
        </li>
    </ul>
</div>
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
            <a href="#user-manager" id="user-manager" data-id-display="#user-manager-display"
               class="sidebar-nav-link  menu-item-manager">
                <div>
                    <i class="fa fa-user"></i>
                </div>
                <span>Quản lý nhân viên</span>
            </a>
        </li>
        <li class="sidebar-nav-item">
            <a href="#product-manager" id="product-manager" data-id-display="#product-manager-display"
               class="sidebar-nav-link menu-item-manager">
                <div>
                    <i class="fa fa-mobile"></i>
                </div>
                <span>Quản lý sản phẩm</span>
            </a>
        </li>
        <li class="sidebar-nav-item">
            <a href="#log-manager" id="log-manager" data-id-display="#log-manager-display"
               class="sidebar-nav-link  menu-item-manager">
                <div>
                    <i class="fa fa-mobile"></i>
                </div>
                <span>Lịch sử truy cập</span>
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
<div class="wrapper">
    <div id="product-manager-display" hidden class="manager-display row overflow-hidden">
        <div class="col-8 col-m-12 col-sm-12">
            <div class="card">
                <div class="card-header" style="display: flex; justify-content: space-between; align-items: center; ">
                    <h3>
                        Quản lý sản phẩm
                    </h3>
                    <div>
                        <a class="btn" data-toggle="modal" data-target="#addProductModal"
                           style="background-color: #d10024; color: white">
                            <span>Thêm sản phẩm</span>
                        </a>
                        <a class="btn all-product" data-toggle="modal"
                           style="background-color: #d10024; color: white">
                            <span>Tất cả sản phẩm</span>
                        </a>
                        <a class="btn" id="product-to-import" data-toggle="modal"
                           style="background-color: #d10024; color: white">
                            <span>Sản phảm cần nhập</span>
                        </a>
                        <a class="btn" id="product-stock" data-toggle="modal"
                           style="background-color: #d10024; color: white">
                            <span>Sản phẩm tồn kho</span>
                        </a>
                        <a class="btn" id="best-selling-products" data-toggle="modal"
                           style="background-color: #d10024; color: white">
                            <span>Sản phẩm bán chạy</span>
                        </a>
                    </div>
                </div>
                <div class="card-content">
                </div>
            </div>
        </div>
    </div>
    <div id="log-manager-display" hidden class="manager-display row overflow-hidden">
        <div class="col-8 col-m-12 col-sm-12">
            <div class="card">
                <div class="card-header" style="display: flex; justify-content: space-between; align-items: center; ">
                    <h3>
                        Lịch sử truy cập
                    </h3>
                    <div>
                        <a class="btn" id="" data-toggle="modal"
                           style="background-color: #d10024; color: white">
                            <span>Tất cả lịch sử</span>
                        </a>
                    </div>
                </div>
                <div class="card-content">
                </div>
            </div>
        </div>
    </div>
</div>
<div id="editProductModal" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <form id="editProductForm">
                <input type="hidden" name="id">
                <div class="modal-header">
                    <h4 class="modal-title">Sửa sản phẩm</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label>Tên sản phẩm<span class="text-danger">*</span></label>
                        <input name="name" type="text" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label>Giá<span class="text-danger">*</span></label>
                        <input name="price" type="text" class="form-control" value="${formattedPrice}" required>
                    </div>
                    <div class="form-group">
                        <label>Mô tả chi tiết<span class="text-danger">*</span></label>
                        <input name="description" type="text" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label>Mã loại sản phẩm<span class="text-danger">*</span></label>
                        <select name="productTypeId" class="form-select">
                            <c:forEach items="${c.findAll()}" var="productType">
                                <option data-product-type-id="${productType.id}"
                                        value="${productType.code}" ${product.productType.code == productType.code ? 'selected' : ''}>
                                        ${productType.code}
                                </option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>Mã hãng sản xuất<span class="text-danger">*</span></label>
                        <select name="producerId" class="form-select">
                            <c:forEach items="${b.findAll()}" var="pc">
                                <option data-producer-id="${pc.id}"
                                        value="${pc.code}" ${product.productCategory.code == pc.code ? 'selected' : ''}>
                                        ${pc.code}
                                </option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>Hình ảnh</label>
                        <input name="img" type="text" class="form-control" value="${product.img}">
                    </div>
                </div>
                <div class="modal-footer">
                    <input type="button" class="btn btn-default" data-dismiss="modal" value="Hủy">
                    <input type="submit" class="btn btn-success" value="Cập nhật">
                </div>
            </form>
        </div>
    </div>
</div>
<div id="addProductModal" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="add" method="post">
                <div class="modal-header">
                    <h4 class="modal-title">Thêm sản phẩm</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label>Tên sản phẩm<span class="text-danger">*</span></label>
                        <input name="name" type="text" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label>Giá<span class="text-danger">*</span></label>
                        <input name="price" type="text" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label>Mô tả chi tiết<span class="text-danger">*</span></label>
                        <input name="desciption" type="text" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label>Mã loại sản phẩm<span class="text-danger">*</span></label>
                        <select name="productType" class="form-select">
                            <c:forEach items="${c.findAll()}" var="pt">
                                <option value="${pt.id}">${pt.id}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>Mã hãng sản xuất<span class="text-danger">*</span></label>
                        <select name="productCategory" class="form-select">
                            <c:forEach items="${b.findAll()}" var="pc">
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
<div id="editEmployeeModal" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <form>
                <div class="modal-header">
                    <h4 class="modal-title">Thay đổi thông tin</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label>Công viêc</label>
                        <input type="text" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label>Họ tên</label>
                        <input type="text" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label>Số điện thoại</label>
                        <input type="text" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label>Ngày sinh</label>
                        <input type="date" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label>Giới tính</label>
                        <input type="text" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label>Email</label>
                        <input type="email" class="form-control" required>
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
<div id="deleteEmployeeModal" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <form>
                <div class="modal-header">
                    <h4 class="modal-title">Xóa nhân viên này</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <div class="modal-body">
                    <p>Bạn có chắc chắn muốn xóa người này?</p>
                    <p class="text-warning"><small>Hành động này sẽ không thể hoàn lại.</small></p>
                </div>
                <div class="modal-footer">
                    <input type="button" class="btn btn-default" data-dismiss="modal" value="Hủy">
                    <input type="submit" class="btn btn-danger" value="Xóa">
                </div>
            </form>
        </div>
    </div>
</div>
<div id="addEmployeeModal" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <form>
                <div class="modal-header">
                    <h4 class="modal-title">Thêm nhân viên</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label>#</label>
                        <input type="text" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label>Công việc</label>
                        <input type="text" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label>Họ tên</label>
                        <input type="text" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label>Số điện thoại</label>
                        <input type="text" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label>Ngày sinh</label>
                        <input type="date" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label>Giới tính</label>
                        <input type="text" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label>Email</label>
                        <input type="email" class="form-control" required>
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js"></script>
<script src="js/admin.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<script>
    $(document).ready(function () {
        // Hàm để tải dữ liệu vào DataTable
        const loadProductDataTable = (data) => {
            $('#product-manager-display table').DataTable({
                data: data,
                "columns": [
                    {"data": "id"},
                    {"data": "name"},
                    {"data": "price"},
                    {"data": "productType.code"},
                    {"data": "quantity"},
                    {"data": "producer.code"},
                    {
                        "data": "images[0].linkImage",
                        "render": function (data) {
                            return '<img src="' + data + '" style="width: 50px; height: 50px">';
                        }
                    },
                    {
                        "data": "id",
                        "render": function (data, type, row) {
                            return '<button class="btn btn-danger btn-sm btn-delete" data-delete-product-id="' + row.id + '">Xóa</button>' +
                                '<button style="margin-left: .2em" class="btn btn-primary btn-sm btn-edit" data-edit-id="' + row.id + '" data-toggle="modal" data-target="#editProductModal">Sửa</button>';
                        }
                    }
                ],
                initComplete: function () {
                    $('#product-manager-display table').on('click', '.btn-delete', function () {
                        var productId = $(this).data('delete-product-id');
                        if (window.confirm("Bạn có muốn xóa sản phẩm này hay không?")) {
                            $.ajax({
                                url: '/home/delete-product?id=' + productId,
                                method: 'DELETE',
                                success: function (response) {
                                    window.location.reload();
                                },
                                error: function (xhr, status, error) {
                                    console.log(xhr.responseText);
                                }
                            });
                        }
                    });
                },
            });
        };
        const loadLogDataTable = (data) => {
            const logDataTableElement = $('#log-manager-display');

            data = data.data;
            logDataTableElement.show()
            logDataTableElement.find("table").DataTable({
                data: data,
                "columns": [
                    {"data": "id"},
                    {"data": "level"},
                    {"data": "action"},
                    {"data": "addressIP"},
                    {"data": "userId"},
                    {"data": "createdAt"},
                ],
            });
        };

        const loadData = (pathLoad, callback) => {
            $('.manager-display').hide(); // Ẩn phần hiển thị quản lý trước khi tải dữ liệu

            $.ajax({
                url: `/home/` + pathLoad,
                type: "GET",
                beforeSend: function () {
                    $.LoadingOverlay("show", {
                        image: "",
                        fontawesome: "fa fa-spinner fa-spin",
                        background: "rgba(0, 0, 0, 0.5)"
                    });
                },
                success: function (data) {
                    callback(data);
                },
                complete: function () {
                    $.LoadingOverlay("hide");
                    $('.manager-display').show();
                }
            });
        };

        $('#product-to-import').on('click', function () {
            loadData('product-to-import');
        });

        $('#product-stock').on('click', function () {
            loadData('product-stock');
        });

        $('#best-selling-products').on('click', function () {
            loadData('best-selling-products');
        });
        $('.all-product').on('click', function () {
            loadData('product-manager');
        });

        $('.menu-item-manager').on("click", function () {
            if ($(this).hasClass("active")) return;
            const idDisplayFrameManager = $(this).data('id-display');
            const managerDisplayElement = $('.manager-display');

            managerDisplayElement.removeClass("d-flex").addClass("d-none")
            $(idDisplayFrameManager).addClass("d-flex").removeClass("d-none");

            $('.menu-item-manager').removeClass("active")
            $(this).addClass("active")

            managerDisplayElement.find(".card-content").empty()
            $(idDisplayFrameManager).find(".card-content").append(mapFrameManager[idDisplayFrameManager])
        });

        $('#log-manager').on('click', function () {
            loadData('admin/log', loadLogDataTable);
        });

        $("#product-manager").click(function () {
            loadData('product-manager', loadProductDataTable)
        });

        $("#user-manager").click(function () {
            // loadData('product-manager', loadProductDataTable)
        });


        const hash = window.location.hash;
        if (hash) $(hash).click();

        // Xử lý sự kiện click cho nút sửa sản phẩm
        $('#product-manager-display').on('click', '.btn-edit', function () {
            var productId = $(this).data('edit-id');
            $.ajax({
                url: '/home/edit-product?id=' + productId,
                method: 'GET',
                dataType: 'json',
                success: function (response) {
                    const product = response;
                    $('#editProductModal input[name="id"]').val(productId);
                    $('#editProductModal input[name="name"]').val(product.name);
                    $('#editProductModal input[name="price"]').val(product.price);
                    $('#editProductModal input[name="description"]').val(product.detail);
                    $('#editProductModal select[name="productTypeId"]').val(product.productType.code);
                    $('#editProductModal select[name="producerId"]').val(product.producer.code);
                    $('#editProductModal input[name="img"]').val(product.images[0].link);
                    $('#editProductModal').modal('show')
                },
                error: function (xhr, status, error) {
                    console.error('Failed to fetch product details:', error);
                }
            });
        });
    });

    $('#editProductForm').on('submit', function (event) {
        event.preventDefault();
        var arrayValue = $(this).serializeArray();
        const formData = {}
        arrayValue.forEach(item => {
            formData[item.name] = item.value
        })
        formData.productTypeId = $(`#editProductModal select[name="productTypeId"] option:selected`).data('product-type-id')
        formData.producerId = $(`#editProductModal select[name="producerId"] option:selected`).data('producer-id')
        $.ajax({
            url: '/home/edit-product',
            type: 'POST',
            data: formData,
            success: function (response) {
                $('#editProductModal').modal('hide')
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
                    }
                }).showToast();
                window.location.reload();
            },
            error: function (xhr) {
                Toastify({
                    text: xhr.responseJSON.message,
                    duration: 3000,
                    newWindow: true,
                    close: true,
                    gravity: "top",
                    position: "right",
                    stopOnFocus: true,
                    style: {
                        background: "red",
                    },
                    onClick: function () {
                    }
                }).showToast();
            }
        });
    });


    const frameHTLMProductManager = `<table class="frame-data-table" style="width: 100% !important;">
                        <thead>
                        <tr>
                            <th>#</th>
                            <th>Tên sản phẩm</th>
                            <th>Giá</th>
                            <th style="display: flex; justify-content: center; align-items: center">Mã loại sản phẩm
                            </th>
                            <th>Tồn kho</th>
                            <th>Mã hãng sản xuất</th>
                            <th>Hình ảnh</th>
                            <th>Thao tác</th>
                        </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>`;


    const frameHTMLLogManager = `<table class="frame-data-table"  style="width: 100% !important;">
                        <thead>
                        <tr>
                            <th>#</th>
                            <th>Level</th>
                            <th>Hoạt động</th>
                            <th>Địa chỉ IP</th>
                            <th>ID người dùng</th>
                            <th>Ngày tạo</th>
                        </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>`;

    const mapFrameManager = {
        "#product-manager-display": frameHTLMProductManager,
        "#log-manager-display": frameHTMLLogManager,
    }
</script>

</body>
</html>