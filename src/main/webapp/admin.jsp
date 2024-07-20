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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/js/bootstrap.bundle.min.js"
            crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdn.datatables.net/2.0.8/js/dataTables.bootstrap5.js"
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
            <a href="#quan-ly-nhan-vien" id="user-manager" data-id-display="#user-manager-display"
               class="sidebar-nav-link">
                <div>
                    <i class="fa fa-user"></i>
                </div>
                <span>Quản lý nhân viên</span>
            </a>
        </li>
        <li class="sidebar-nav-item">
            <a href="#quan-ly-san-pham" id="product-manager" data-id-display="#product-manager-display"
               class="sidebar-nav-link">
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
<div class="wrapper">
    <div id="user-manager-display" class="row manager-display">
        <div class="col-8 col-m-12 col-sm-12">
            <div class="card">
                <div class="card-header" style="display: flex">
                    <h3>
                        Quản lý nhân viên
                    </h3>
                    <a href="#addEmployeeModal" class="btn btn-success" data-toggle="modal" style="margin-left: auto">
                        <span>Thêm nhân viên mới</span></a>

                </div>
                <div class="card-content">
                    <table>
                        <thead>
                        <tr>
                            <th>#</th>
                            <th>Công việc</th>
                            <th>Họ tên</th>
                            <th>Số điện thoại</th>
                            <th>Ngày Sinh</th>
                            <th>Giới tính</th>
                            <th>Email</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>u_1</td>
                            <td>Quản lý</td>
                            <td>Hà Huy Dũng</td>
                            <td>0973206403</td>
                            <td>10/12/2002</td>
                            <td>Nam</td>
                            <td>20130235@st.hcmuaf.edu.vn</td>
                            <td>
                                <a href="#editEmployeeModal" class="edit" data-toggle="modal"><i class="material-icons"
                                                                                                 data-toggle="tooltip"
                                                                                                 title="Edit">&#xE254;</i></a>
                                <a href="#deleteEmployeeModal" class="delete" data-toggle="modal"><i
                                        class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a>
                            </td>
                        </tr>
                        <tr>
                            <td>u_2</td>
                            <td>Kĩ thuật</td>
                            <td>Phan Tuấn Dũng</td>
                            <td>0972226466</td>
                            <td>30/7/2002</td>
                            <td>Nam</td>
                            <td>20130237@st.hcmuaf.edu.vn</td>
                            <td>
                                <a href="#editEmployeeModal" class="edit" data-toggle="modal"><i class="material-icons"
                                                                                                 data-toggle="tooltip"
                                                                                                 title="Edit">&#xE254;</i></a>
                                <a href="#deleteEmployeeModal" class="delete" data-toggle="modal"><i
                                        class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a>
                            </td>
                        </tr>
                        <tr>
                            <td>u_3</td>
                            <td>Bán hàng</td>
                            <td>Nguyễn Thị Thanh Ngân</td>
                            <td>0365548488</td>
                            <td>22/10/2003</td>
                            <td>Nữ</td>
                            <td>21130116@st.hcmuaf.edu.vn</td>
                            <td>
                                <a href="#editEmployeeModal" class="edit" data-toggle="modal"><i class="material-icons"
                                                                                                 data-toggle="tooltip"
                                                                                                 title="Edit">&#xE254;</i></a>
                                <a href="#deleteEmployeeModal" class="delete" data-toggle="modal"><i
                                        class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <div id="product-manager-display" hidden class="row overflow-hidden">
        <div class="col-8 col-m-12 col-sm-12">
            <div class="card">
                <div class="card-header" style="display: flex; justify-content: space-between; align-items: center; ">
                    <h3>
                        Quản lý sản phẩm
                    </h3>
                    <div>
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
                    <table>
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
                </div>
            </div>
        </div>
    </div>
</div>
<div id="editProductModal" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="add" method="post">
                <div class="modal-header">
                    <h4 class="modal-title">Sửa sản phẩm</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label>Tên sản phẩm<span class="text-danger">*</span></label>
                        <input name="name" type="text" class="form-control" value="${product.name}" required>
                    </div>
                    <div class="form-group">
                        <label>Giá<span class="text-danger">*</span></label>
                        <input name="price" type="text" class="form-control" value="${product.price}" required>
                    </div>
                    <div class="form-group">
                        <label>Mô tả chi tiết<span class="text-danger">*</span></label>
                        <input name="description" type="text" class="form-control" value="${product.description}"
                               required>
                    </div>
                    <div class="form-group">
                        <label>Mã loại sản phẩm<span class="text-danger">*</span></label>
                        <select name="productType" class="form-select">
                            <c:forEach items="${c.findAll()}" var="productType">
                                <option value="${productType.id}" ${product.productType.id == productType.id ? 'selected' : ''}>
                                        ${productType.code}
                                </option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>Mã hãng sản xuất<span class="text-danger">*</span></label>
                        <select name="productCategory" class="form-select">
                            <c:forEach items="${b.findAll()}" var="pc">
                                <option value="${pc.id}" ${product.productCategory.id == pc.id ? 'selected' : ''}>
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
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js"></script>
<script src="js/admin.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<script>
    <%--    // const loadData = () => {--%>
    <%--    //     $('.manager-display').hidden--%>
    <%--    //--%>
    <%--    //     $.ajax({--%>
    <%--    //         url: "/home/product-manager",--%>
    <%--    //         type: "GET",--%>
    <%--    //         beforeSend: function () {--%>
    <%--    //             $.LoadingOverlay("show", {--%>
    <%--    //                 image: "",--%>
    <%--    //                 fontawesome: "fa fa-spinner fa-spin",--%>
    <%--    //                 background: "rgba(0, 0, 0, 0.5)"--%>
    <%--    //             });--%>
    <%--    //         },--%>
    <%--    //         success: function (data) {--%>
    <%--    //             loadDataTale(data);--%>
    <%--    //         },--%>
    <%--    //         complete: function () {--%>
    <%--    //             $.LoadingOverlay("hide");--%>
    <%--    //         }--%>
    <%--    //     })--%>
    <%--    //     $('a[data-toggle="modal"]').on('click', function () {--%>
    <%--    //         var type = $(this).text().trim().toLowerCase().replace(/\s+/g, '-');--%>
    <%--    //         loadData(type);--%>
    <%--    //     });--%>
    <%--    //--%>
    <%--    //     const loadDataTale = (data) => {--%>
    <%--    //         var datatable = $('#product-manager-display table').DataTable({--%>
    <%--    //             data: data,--%>
    <%--    //             "columns": [--%>
    <%--    //                 {"data": "id"},--%>
    <%--    //                 {"data": "name"},--%>
    <%--    //                 {"data": "price"},--%>
    <%--    //                 {"data": "productType.code"},--%>
    <%--    //                 {"data": "quantity"},--%>
    <%--    //                 {"data": "producer.code"},--%>
    <%--    //                 {--%>
    <%--    //                     "data": "images[0].linkImage",--%>
    <%--    //                     "render": function (data, type, row) {--%>
    <%--    //                         return '<img src="' + data + '" style="width: 50px; height: 50px">'--%>
    <%--    //                     }--%>
    <%--    //                 },--%>
    <%--    //                 {--%>
    <%--    //                     "data": "id",--%>
    <%--    //                     "render": function (data, type, row) {--%>
    <%--    //                         return '<button id="del-product" class="btn btn-danger btn-sm btn-delete" data-delete-product-id="' + row.id + '">Xóa</button></a>' +--%>
    <%--    //                             '<button style="margin-left: .2em" class="btn btn-primary btn-sm btn-edit" data-edit-id="' + row.id + '" data-toggle="modal" data-target="#editProductModal">Sửa</button>' +--%>
    <%--    //                             '<button style="margin-left: .2em" class="btn btn-sm btn-success btn-add" data-id="' + row.id + '" data-toggle="modal" data-target="#addProductModal">Thêm</button>';--%>
    <%--    //--%>
    <%--    //                     }--%>
    <%--    //                 }--%>
    <%--    //             ],--%>
    <%--    //             initComplete: function () {--%>
    <%--    //                 $('#product-manager-display table').on('click', '.btn-delete', function () {--%>
    <%--    //                     var productId = $(this).data('delete-product-id');--%>
    <%--    //                     if (window.confirm("Bạn có muốn xóa sản phẩm này hay không?")) {--%>
    <%--    //                         $.ajax({--%>
    <%--    //                             url: '/home/delete-product?id=' + productId,--%>
    <%--    //                             method: 'DELETE',--%>
    <%--    //                             success: function (response) {--%>
    <%--    //                                 window.location.reload();--%>
    <%--    //                             },--%>
    <%--    //                             error: function (xhr, status, error) {--%>
    <%--    //                                 console.log(xhr.responseText);--%>
    <%--    //                             }--%>
    <%--    //                         });--%>
    <%--    //                     }--%>
    <%--    //                 });--%>
    <%--    //             },--%>
    <%--    //         });--%>
    <%--    //     }--%>
    <%--    // }--%>
    <%--    const loadDataTable = (data) => {--%>
    <%--        // Nếu DataTable đã tồn tại, hãy xóa nó trước khi tạo mới--%>
    <%--        if ($.fn.DataTable.isDataTable('#product-manager-display table')) {--%>
    <%--            $('#product-manager-display table').DataTable().clear().destroy();--%>
    <%--        }--%>

    <%--        $('#product-manager-display table').DataTable({--%>
    <%--            data: data,--%>
    <%--            "columns": [--%>
    <%--                {"data": "id"},--%>
    <%--                {"data": "name"},--%>
    <%--                {"data": "price"},--%>
    <%--                {"data": "productType.code"},--%>
    <%--                {"data": "quantity"},--%>
    <%--                {"data": "producer.code"},--%>
    <%--                {--%>
    <%--                    "data": "images[0].linkImage",--%>
    <%--                    "render": function (data) {--%>
    <%--                        return '<img src="' + data + '" style="width: 50px; height: 50px">';--%>
    <%--                    }--%>
    <%--                },--%>
    <%--                {--%>
    <%--                    "data": "id",--%>
    <%--                    "render": function (data, type, row) {--%>
    <%--                        return '<button class="btn btn-danger btn-sm btn-delete" data-delete-product-id="' + row.id + '">Xóa</button>' +--%>
    <%--                            '<button style="margin-left: .2em" class="btn btn-primary btn-sm btn-edit" data-edit-id="' + row.id + '" data-toggle="modal" data-target="#editProductModal">Sửa</button>' +--%>
    <%--                            '<button style="margin-left: .2em" class="btn btn-sm btn-success btn-add" data-id="' + row.id + '" data-toggle="modal" data-target="#addProductModal">Thêm</button>';--%>
    <%--                    }--%>
    <%--                }--%>
    <%--            ],--%>
    <%--            destroy: true // Đảm bảo DataTable được khởi tạo lại nếu đã tồn tại--%>
    <%--        });--%>
    <%--    };--%>

    <%--    // Hàm để tải dữ liệu cho DataTable dựa trên loại sản phẩm--%>
    <%--    const loadData = (type) => {--%>
    <%--        $('.manager-display').hide(); // Ẩn phần hiển thị quản lý trước khi tải dữ liệu--%>

    <%--        $.ajax({--%>
    <%--            url: `/home/${type}`,--%>
    <%--            type: "GET",--%>
    <%--            beforeSend: function () {--%>
    <%--                $.LoadingOverlay("show", {--%>
    <%--                    image: "",--%>
    <%--                    fontawesome: "fa fa-spinner fa-spin",--%>
    <%--                    background: "rgba(0, 0, 0, 0.5)"--%>
    <%--                });--%>
    <%--            },--%>
    <%--            success: function (data) {--%>
    <%--                loadDataTable(data); // Gọi hàm để tải dữ liệu vào DataTable--%>
    <%--            },--%>
    <%--            complete: function () {--%>
    <%--                $.LoadingOverlay("hide");--%>
    <%--                $('.manager-display').show(); // Hiện phần hiển thị quản lý khi dữ liệu đã được tải--%>
    <%--            }--%>
    <%--        });--%>
    <%--    };--%>

    <%--    // // Load dữ liệu ban đầu từ product-manager--%>
    <%--    // loadData('product-manager');--%>

    <%--    // Xử lý sự kiện click cho các nút--%>
    <%--    $('#product-to-import').on('click', function () {--%>
    <%--        loadData('product-to-import'); // Tải dữ liệu cho loại sản phẩm cần nhập--%>
    <%--    });--%>

    <%--    $('#product-stock').on('click', function () {--%>
    <%--        loadData('product-stock'); // Tải dữ liệu cho sản phẩm tồn kho--%>
    <%--    });--%>

    <%--    $('#best-selling-products').on('click', function () {--%>
    <%--        loadData('best-selling-products'); // Tải dữ liệu cho sản phẩm bán chạy--%>
    <%--    });--%>

    <%--    const showDisplay = (id) => {--%>
    <%--        $('.manager-display').removeClass("d-flex").addClass("d-none")--%>
    <%--        $(id).addClass("d-flex").removeClass("d-none");--%>
    <%--    }--%>

    <%--    $("#product-manager").click(function () {--%>
    <%--        if ($(this).hasClass("active")) return;--%>
    <%--        $(this).addClass("active");--%>
    <%--        const id = $(this).data("id-display");--%>
    <%--        showDisplay(id)--%>
    <%--        loadData('product-manager')--%>
    <%--    });--%>

    <%--    $("#user-manager").click(function () {--%>
    <%--        if ($(this).has("active")) return;--%>
    <%--        $(this).addClass("active");--%>
    <%--        const id = $(this).data("id-display");--%>
    <%--        showDisplay(id)--%>
    <%--    });--%>

    <%--    $(document).ready(function () {--%>
    <%--        const hash = window.location.hash;--%>
    <%--        if (hash === "#quan-ly-san-pham")--%>
    <%--            $("#product-manager").click();--%>
    <%--    });--%>

    <%--    $(document).ready(function () {--%>
    <%--        const productId = $(this).data("edit-id").val();--%>
    <%--        $.ajax({--%>
    <%--            url: '/home/edit-product?id=' + productId,--%>
    <%--            method: 'GET',--%>
    <%--            dataType: 'json',--%>
    <%--            success: function (response) {--%>
    <%--                const product = response.product;--%>

    <%--                // Cập nhật giá trị của các input--%>
    <%--                $('#editProductModal input[name="name"]').val(product.name);--%>
    <%--                $('#editProductModal input[name="price"]').val(product.price);--%>
    <%--                $('#editProductModal input[name="description"]').val(product.description);--%>
    <%--                $('#editProductModal select[name="productType"]').val(product.productTypeId); // hoặc product.productType.id nếu có--%>
    <%--                $('#editProductModal select[name="productCategory"]').val(product.productCategoryId); // hoặc product.productCategory.id nếu có--%>
    <%--                $('#editProductModal input[name="img"]').val(product.img);--%>
    <%--                $('#editProductModal').modal('show');--%>
    <%--            },--%>
    <%--            error: function (xhr, status, error) {--%>
    <%--                console.error('Failed to fetch cart count:', error);--%>
    <%--            }--%>
    <%--        })--%>
    <%--    });--%>
</script>
<script>
    $(document).ready(function () {
        // Hàm để tải dữ liệu vào DataTable
        const loadDataTable = (data) => {
            // Nếu DataTable đã tồn tại, hãy xóa nó trước khi tạo mới
            if ($.fn.DataTable.isDataTable('#product-manager-display table')) {
                $('#product-manager-display table').DataTable().clear().destroy();
            }

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
                                '<button style="margin-left: .2em" class="btn btn-primary btn-sm btn-edit" data-edit-id="' + row.id + '" data-toggle="modal" data-target="#editProductModal">Sửa</button>' +
                                '<button style="margin-left: .2em" class="btn btn-sm btn-success btn-add" data-id="' + row.id + '" data-toggle="modal" data-target="#addProductModal">Thêm</button>';
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

        // Hàm để tải dữ liệu cho DataTable dựa trên loại sản phẩm
        const loadData = (type) => {
            $('.manager-display').hide(); // Ẩn phần hiển thị quản lý trước khi tải dữ liệu

            $.ajax({
                url: `/home/` + type,
                type: "GET",
                beforeSend: function () {
                    $.LoadingOverlay("show", {
                        image: "",
                        fontawesome: "fa fa-spinner fa-spin",
                        background: "rgba(0, 0, 0, 0.5)"
                    });
                },
                success: function (data) {
                    loadDataTable(data);
                },
                complete: function () {
                    $.LoadingOverlay("hide");
                    $('.manager-display').show();
                }
            });
        };

        // Xử lý sự kiện click cho các nút
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

        $("#product-manager").click(function () {
            if ($(this).hasClass("active")) return;
            $(this).addClass("active");
            const id = $(this).data("id-display");
            showDisplay(id)
            loadData('product-manager')
        });

        $("#user-manager").click(function () {
            if ($(this).hasClass("active")) return;
            $(this).addClass("active");
            const id = $(this).data("id-display");
            showDisplay(id)
        });

        // Hiển thị phần hiển thị dựa trên ID
        const showDisplay = (id) => {
            $('.manager-display').removeClass("d-flex").addClass("d-none")
            $(id).addClass("d-flex").removeClass("d-none");
        }

        // Kiểm tra hash trong URL khi trang được tải
        const hash = window.location.hash;
        if (hash === "#quan-ly-san-pham")
            $("#product-manager").click();

        // Xử lý sự kiện click cho nút sửa sản phẩm
        $('#product-manager-display').on('click', '.btn-edit', function () {
            var productId = $(this).data('edit-id');
            $.ajax({
                url: '/home/edit-product?id=' + productId,
                method: 'GET',
                dataType: 'json',
                success: function (response) {
                    const product = response.product;

                    // Cập nhật giá trị của các input
                    $('#editProductModal input[name="name"]').val(product.name);
                    $('#editProductModal input[name="price"]').val(product.price);
                    $('#editProductModal input[name="description"]').val(product.description);
                    $('#editProductModal select[name="productType"]').val(product.productTypeId); // hoặc product.productType.id nếu có
                    $('#editProductModal select[name="productCategory"]').val(product.productCategoryId); // hoặc product.productCategory.id nếu có
                    $('#editProductModal input[name="img"]').val(product.img);
                    $('#editProductModal').modal('show');
                },
                error: function (xhr, status, error) {
                    console.error('Failed to fetch product details:', error);
                }
            });
        });
    });

</script>
</body>
</html>