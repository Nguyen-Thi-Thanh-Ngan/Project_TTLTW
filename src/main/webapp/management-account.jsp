<%@ page import="service.impl.UserServiceImpl" %>
<%@ page import="utils.SessionUtil" %>
<%@ page import="model.User" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    <link type="text/css" rel="stylesheet" href="css/style.css"/>
    <!-- End import lib -->
    <link rel="stylesheet" type="text/css" href="css/styleAdmin.css">

    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/datatables/1.10.21/css/jquery.dataTables.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/datatables/1.10.21/js/jquery.dataTables.min.js"
            integrity="sha512-BkpSL20WETFylMrcirBahHfSnY++H2O1W+UnEEO4yNIl+jI2+zowyoGJpbtk6bx97fBXf++WJHSSK2MV4ghPcg=="
            crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/js/bootstrap.bundle.min.js"
            crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdn.datatables.net/2.0.8/js/dataTables.bootstrap5.js"
            crossorigin="anonymous" referrerpolicy="no-referrer"></script>

    <script src="https://cdn.jsdelivr.net/npm/gasparesganga-jquery-loading-overlay@2.1.7/dist/loadingoverlay.min.js"></script>
</head>
<body class="overlay-scrollbar">

<!-- navbar -->
<div class="navbar">
    <!-- nav left -->
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
    <!-- end nav left -->

    <!-- nav right -->
    <ul class="navbar-nav nav-right">
        <li class="nav-item">
            <div class="avt dropdown">
                <c:if test="${sessionScope.user != null}">
                    <%--                    <a href="user-information.jsp?id=<%=new User ServiceImpl().getRoleIdByUsername(SessionUtil.getInstance().getKey((HttpServletRequest) request, "><i class="fa fa-user-o"></i> <%= new UserServiceImpl().getRoleIdByUsername(SessionUtil.getInstance().getKey((HttpServletRequest) request, "user").%></a>--%>
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

    <!-- end nav right -->
</div>
<!-- end navbar -->
<!-- sidebar -->
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
<!-- end sidebar -->

<!-- main content -->
<div class="wrapper">
    <div class="row">
        <div class="col-8 col-m-12 col-sm-12">
            <div class="card">
                <div class="card-header" style="display: flex">
                    <h3>Quản lý tài khoản</h3>
                </div>
                <div class="card-content">
                    <table>
                        <thead>
                        <tr>
                            <th>#</th>
                            <th>Họ tên</th>
                            <th>Email</th>
                            <th>Username</th>
                            <th>Đơn hàng</th>
                            <th class="edit-column">Chỉnh sửa</th>
                            <th class="block-delete-column">Chặn / Xóa</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="item" items="${users}">
                            <tr>
                                <td>${item.id}</td>
                                <td>${item.name}</td>
                                <td>${item.email}</td>
                                <td>${item.username}</td>
                                <td>

                                </td>
                                <!-- Button để mở modal chỉnh sửa -->
                                <td>
                                    <a href="#" class="edit"
                                       onclick="editUser(${item.id}, '${item.name}', '${item.email}', '${item.username}', '${item.roleId}')">
                                        <img src="https://cdn-icons-png.flaticon.com/128/1827/1827933.png" width="40px"
                                             height="40px" alt="">
                                    </a>
                                </td>
                                <td>
                                    <a href="#blockUnblockUserModal" class="block" data-toggle="modal"
                                       onclick="setModalContent(${item.id}, ${item.status})">
                                        <img id="blockUserImg"
                                             src="${item.status == 1 ? 'https://cdn-icons-png.flaticon.com/128/889/889758.png' : 'https://cdn-icons-png.flaticon.com/128/889/889754.png'}"
                                             height="40px" width="40px" alt="">
                                    </a>
                                    <span class="line-span">/</span>
                                    <a href="#deleteEmployeeModal" class="delete" data-toggle="modal"
                                       onclick="deleteUser(${item.id})">
                                        <img src="https://cdn-icons-png.flaticon.com/128/10309/10309493.png"
                                             height="40px" width="40px" alt="">
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <!-- Edit-->
    <div id="editEmployeeModal" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <form action="editRoleUser" method="post">
                    <div class="modal-header">
                        <h4 class="modal-title">Chỉnh sửa vai trò người dùng</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label>ID</label>
                            <input type="text" class="form-control" required name="idEdit" id="editId" readonly>
                        </div>
                        <div class="form-group">
                            <label>Họ tên</label>
                            <input type="text" class="form-control" required name="nameEdit" id="editName" readonly>
                        </div>
                        <div class="form-group">
                            <label>Email</label>
                            <input type="email" class="form-control" required name="emailEdit" id="editEmail" readonly>
                        </div>
                        <div class="form-group">
                            <label>Username</label>
                            <input type="text" class="form-control" required name="usernameEdit" id="editUser" readonly>
                        </div>
                        <div class="form-group">
                            <label>Vai trò</label>
                            <input type="hidden" name="idUserToEditRole" id="idUserToEditRole" value="">
                            <!-- ID người dùng -->
                            <select class="form-control" name="editRole" id="editRole">
                                <option value="1">ADMIN</option>
                                <option value="2">MOD</option>
                                <option value="4">USER</option>
                            </select>
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
    <%--    Block--%>
    <div id="blockUnblockUserModal" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <form id="blockUnblockForm" action="block" method="post">
                    <div class="modal-header">
                        <h4 id="modalTitle" class="modal-title">Chặn người dùng này</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    </div>
                    <div class="modal-body">
                        <p id="modalBodyText">Bạn có chắc chắn muốn chặn người dùng này?</p>
                        <p class="text-warning"><small>Hành động này sẽ có thể hoàn lại.</small></p>
                    </div>
                    <div class="modal-footer">
                        <input type="button" class="btn btn-default" data-dismiss="modal" value="Hủy">
                        <input id="modalSubmitBtn" type="submit" class="btn btn-danger" value="Chặn">
                        <input type="hidden" id="userIdToBlockOrUnblock" name="userIdToBlockOrUnblock" value="">
                        <input type="hidden" id="processAction" name="processAction" value="block">
                    </div>
                </form>
            </div>
        </div>
    </div>
    <%--    Block--%>
    <!-- Delete-->
    <div id="deleteEmployeeModal" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <form id="deleteForm" action="account/delete" method="post">
                    <div class="modal-header">
                        <h4 class="modal-title">Xóa sản phẩm này</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    </div>
                    <div class="modal-body">
                        <p>Bạn có chắc chắn muốn xóa người dùng này?</p>
                        <p class="text-warning"><small>Hành động này sẽ không thể hoàn lại.</small></p>
                    </div>
                    <div class="modal-footer">
                        <input type="button" class="btn btn-default" data-dismiss="modal" value="Hủy">
                        <input type="submit" class="btn btn-danger" value="Xóa" onclick="submitDeleteForm()">
                        <input type="hidden" id="userIdToDelete" name="userIdToDelete" value="">
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!--/ Delete-->
</div>

<!-- end main content -->


<!-- import script -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js"></script>
<script src="js/admin.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<!-- end import script -->
<script>
    function setModalContent(userId, status) {
        $('#userIdToBlockOrUnblock').val(userId);

        if (status == 1) {
            $('#modalTitle').text('Chặn người dùng này');
            $('#modalBodyText').text('Bạn có chắc chắn muốn chặn người dùng này?');
            $('#modalSubmitBtn').val('Chặn');
            $('#processAction').val('block');
        } else if (status == 2) {
            $('#modalTitle').text('Bỏ chặn người dùng này');
            $('#modalBodyText').text('Bạn có chắc chắn muốn bỏ chặn người dùng này?');
            $('#modalSubmitBtn').val('Bỏ chặn');
            $('#processAction').val('unblock');
        }
    }
</script>

<script>
    function deleteUser(userId) {
        document.getElementById('userIdToDelete').value = userId;
        $('#deleteEmployeeModal').modal('show');
    }

    function submitDeleteForm() {
        document.getElementById('deleteForm').submit();
        $('#deleteEmployeeModal').modal('hide');
    }

    function editUser(userId, name, email, username, role) {
        // Cập nhật các trường trong modal
        document.getElementById('editId').value = userId;
        document.getElementById('editName').value = name;
        document.getElementById('editEmail').value = email;
        document.getElementById('editUser').value = username;
        document.getElementById('idUserToEditRole').value = userId;

        // Chọn vai trò hiện tại
        document.getElementById('editRole').value = role;

        // Hiển thị modal
        $('#editEmployeeModal').modal('show');
    }
</script>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        // Lấy vai trò người dùng từ session hoặc một biến toàn cục
        var userRole = "${sessionScope.user.roleId}"; // Hoặc cách khác để lấy vai trò

        // Nếu vai trò không phải là ADMIN, ẩn các nút chỉnh sửa, khóa/mở khóa và xóa
        if (userRole != 1) { // 1: ADMIN
            document.querySelectorAll(".edit, .block, .delete").forEach(function (el) {
                el.style.display = "none"; // Ẩn các nút
            });
            document.querySelectorAll(".edit-column, .block-delete-column, .line-span").forEach(function (el) {
                el.style.display = "none"; // Ẩn các tiêu đề cột
            });

        }
    });
</script>
<script>

    const loadData = () => {
        $('.manager-display').hidden
        $.ajax({
            url: "/home/product-manager",
            type: "GET",
            beforeSend: function () {
                $.LoadingOverlay("show", {
                    image: "",
                    fontawesome: "fa fa-spinner fa-spin",
                    background: "rgba(0, 0, 0, 0.5)"
                });
            },
            success: function (data) {
                loadDataTale(data);
            },
            complete: function () {
                $.LoadingOverlay("hide");
            }
        })


        const loadDataTale = (data) => {
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
                        "render": function (data, type, row) {
                            return '<img src="' + data + '" style="width: 50px; height: 50px">'
                        }
                    },
                    {
                        "data": "id",
                        "render": function (data, type, row) {
                            return '<button class="btn btn-danger btn-sm btn-delete"  data-id="' + row.id + '">Xóa</button>' +
                                '<a href="edit-user?id=' + row.id + '"><button style="margin-left: .2em" class="btn btn-primary btn-sm" data-id="' + row.id + '">Sửa</button></a>';

                        }
                    }
                ]
            });
        }
    }

    const showDisplay = (id) => {
        $('.manager-display').removeClass("d-flex").addClass("d-none")
        $(id).addClass("d-flex").removeClass("d-none");
    }

    $("#product-manager").click(function () {
        if ($(this).hasClass("active")) return;
        $(this).addClass("active");
        const id = $(this).data("id-display");
        showDisplay(id)
        loadData();
    });

    $("#user-manager").click(function () {
        if ($(this).has("active")) return;
        $(this).addClass("active");
        const id = $(this).data("id-display");
        showDisplay(id)
    });

    $(document).ready(function () {
        const hash = window.location.hash;
        if (hash === "#quan-ly-san-pham")
            $("#product-manager").click();
    });
</script>
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
            loadData('product-to-import', loadProductDataTable);
        });

        $('#product-stock').on('click', function () {
            loadData('product-stock', loadProductDataTable);
        });

        $('#best-selling-products').on('click', function () {
            loadData('best-selling-products', loadProductDataTable);
        });
        $('.all-product').on('click', function () {
            loadData('product-manager', loadProductDataTable);
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


    const frameHTLMProductManager = `
        <table className="frame-data-table" style="width: 100% !important;">
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
        </table>
        `;


    const frameHTMLLogManager = `
        <table className="frame-data-table" style="width: 100% !important;">
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
        </table>
        `;

    const mapFrameManager = {
        "#product-manager-display": frameHTLMProductManager,
        "#log-manager-display": frameHTMLLogManager,
    }
</script>
</body>
</html>