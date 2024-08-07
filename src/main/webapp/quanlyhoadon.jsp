
<%@ page import="model.Order" %>
<%@ page import="java.util.List" %>
<%@ page import="model.User" %>

<%@ page import="utils.SessionUtil" %>
<%@ page import="service.impl.UserServiceImpl" %>
<%@ page import="dao.impl.OrderDAOImpl" %>
<%@ page import="dao.impl.UserDaoImpl" %>
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
    <link type="text/css" rel="stylesheet" href="css/style.css"/>
    <!-- End import lib -->
    <!-- import script -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js"></script>

    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="css/styleAdmin.css">

    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/toastify-js/src/toastify.min.css">
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/toastify-js"></script>
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
            <img src="./img/logo.png" alt="logo" class="logo logo-light">
        </li>
    </ul>
    <!-- end nav left -->

    <!-- nav right -->
    <ul class="navbar-nav nav-right">
        <li class="nav-item">
            <div class="avt dropdown">
                <c:if test="${sessionScope.user != null}">
<%--                    <a><i class="fa fa-user-o"></i> <%= new UserServiceImpl().getRoleIdByUsername(SessionUtil.getInstance().getKey((HttpServletRequest) request, "user").toString()).getFullName() %></a>--%>
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
                <span>
						Thông số bán hàng
					</span>
            </a>
        </li>
        <li class="sidebar-nav-item">
            <a href="admin.jsp" class="sidebar-nav-link">
                <div>
                    <i class="fa fa-user"></i>
                </div>
                <span>Quản lý nhân viên</span>
            </a>
        </li>
        <li class="sidebar-nav-item">
            <a href="management-product.jsp" class="sidebar-nav-link">
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
    <div class="row">
        <div class="col-8 col-m-12 col-sm-12">
            <div class="card">
                <div class="card-header" style="display: flex">
                    <h3>
                        Quản lý hóa đơn
                    </h3>
                    <a href="#addEmployeeModal" class="btn btn-success" data-toggle="modal" style="margin-left: auto">
                        <span>Thêm đơn hàng mới</span></a>
                </div>
                <div class="card-content">
                    <table>
                        <thead>
                        <tr>
                            <th>#</th>
                            <th>Mã khách hàng</th>
                            <th>Địa chỉ giao hàng</th>
                            <th>Trạng thái đơn hàng</th>
                            <th>Phương thức thanh toán</th>
                            <th>Ngày đặt hàng</th>
                            <th>Ngày nhận hàng</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%
                            OrderDAOImpl orderDAO = new OrderDAOImpl();
                            List<Order> list = orderDAO.findAll();
                            for (Order order : list) {
                        %>
                        <tr>
                            <td><%=order.getId()%>
                            </td>
                            <td><%=order.getUser().getId()%>
                            </td>
                            <td><%=order.getAddress()%>
                            </td>
                            <td><%=order.getStatus()%>
                            </td>
                            <td><%=order.getPayment_method()%>
                            </td>
                            <td><%=order.getOrderDate()%>
                            </td>
                            <td><%=order.getDeliveryDate()%>
                            </td>
                            <td>
                                <a href="#editEmployeeModal" class="edit" data-toggle="modal"
                                   data-order-id="<%=order.getId()%>"
                                   data-order-user-id="<%=order.getUser().getId()%>"
                                   data-order-address="<%=order.getAddress()%>"
                                   data-order-status="<%=order.getStatus()%>"
                                   data-order-payment="<%=order.getPayment_method()%>"
                                   data-order-order-date="<%=order.getOrderDate()%>"
                                   data-order-delivery-date="<%=order.getDeliveryDate()%>">
                                    <i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
                            </td>
                        </tr>
                        <%}%>
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
                <form action="oderedit" method="post">
                    <div class="modal-header">
                        <h4 class="modal-title">Thay đổi thông tin</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label>#</label>
                            <input type="text" name="id" class="form-control" required readonly>
                        </div>
                        <div class="form-group">
                            <label>Mã khách hàng</label>
                            <input type="text" name="userId" class="form-control" required readonly>
                        </div>
                        <div class="form-group">
                            <label>Địa chỉ giao hàng</label>
                            <input type="text" name="address" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label>Trạng thái đơn hàng</label>
                            <select name="status" class="form-control" required onclick="return checkStatusBeforeOpen()">
                                <option name="status" value="Xác nhận đơn hàng">Xác nhận đơn hàng</option>
                                <option name="status" value="Chuẩn bị đơn hàng">Chuẩn bị đơn hàng</option>
                                <option name="status" value="Đang giao">Đang giao</option>
                                <option name="status" value="Hoàn tất">Hoàn tất</option>
                                <option name="status" value="Hủy đơn hàng">Hủy đơn hàng</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label>Phương thức thanh toán</label>
                            <select name="payment" class="form-control" required>
                                <option name="payment" value="Chuyển khoản trực tiếp">Chuyển khoản trực tiếp</option>
                                <option name="payment" value="Thanh toán khi nhận hàng">Thanh toán khi nhận hàng</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label>Ngày đặt hàng</label>
                            <input type="date" name="dateOder" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label>Ngày nhận hàng</label>
                            <input type="date" name="doneDate" class="form-control" required>
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

    <!--/ Add-->
    <div id="addEmployeeModal" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <form action="oderadmin" method="post">
                    <div class="modal-header">
                        <h4 class="modal-title">Thêm hóa đơn</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label>Mã khách hàng</label>
                            <select name="userId" class="form-control" required>
                                <option value="" disabled selected>Chọn mã khách hàng</option>
                                <% List<User> u = new UserDaoImpl().findAll();
                                    for (User user : u) {%>
                                <option value="<%= user.getId() %>"><%= user.getId() %></option>
                                <%
                                    }
                                %>
                            </select>
                        </div>
                        <div class="form-group">
                            <label>Địa chỉ giao hàng</label>
                            <input type="text" name="address" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label>Trạng thái đơn hàng</label>
                            <select name="status" class="form-control" required>
                                <option value="" disabled selected>Trạng thái</option>
                                <option value="Xác nhận đơn hàng">Xác nhận đơn hàng</option>
                                <option value="Chuẩn bị đơn hàng">Chuẩn bị đơn hàng</option>
                                <option value="Đang giao">Đang giao</option>
                                <option value="Hoàn tất">Hoàn tất</option>
                                <option value="Hủy đơn hàng">Hủy đơn hàng</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label>Phương thức thanh toán</label>
                            <select name="payment" class="form-control" required>
                                <option value="" disabled selected>Phương thức thanh toán</option>
                                <option value="Chuyển khoản trực tiếp">Chuyển khoản trực tiếp</option>
                                <option value="Thanh toán khi nhận hàng">Thanh toán khi nhận hàng</option>
                            </select>

                        </div>
                        <div class="form-group">
                            <label>Ngày đặt hàng</label>
                            <input type="date" name="dateOder" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label>Ngày nhận hàng</label>
                            <input type="date" name="doneDate" class="form-control" required>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <input type="button" class="btn btn-default" data-dismiss="modal" value="Hủy">
                        <input type="submit" class="btn btn-info" value="Thêm">
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!--/ Add -->
</div>
<!-- end main content -->


<!-- end import script -->
<script src="js/admin.js"></script>
<script>
    $('#editEmployeeModal').on('show.bs.modal', function (event){
        var button = $(event.relatedTarget);
        var orderId = button.data('order-id');
        var orderUserId = button.data('order-user-id');
        var orderAddress = button.data('order-address');
        var orderStatus = button.data('order-status');
        var orderPayment = button.data('order-payment');
        var orderDate = button.data('order-order-date');
        var orderDeliveryDate = button.data('order-delivery-date');

        $('#editEmployeeModal input[name="id"]').val(orderId);
        $('#editEmployeeModal input[name="userId"]').val(orderUserId);
        $('#editEmployeeModal input[name="address"]').val(orderAddress);
        $('#editEmployeeModal select[name="status"]').val(orderStatus);
        $('#editEmployeeModal select[name="payment"]').val(orderPayment);
        $('#editEmployeeModal input[name="dateOder"]').val(orderDate);
        $('#editEmployeeModal input[name="doneDate"]').val(orderDeliveryDate);
    })
</script>

<script>
    function checkStatusBeforeOpen() {
        var status = document.getElementsByName("status")[0].value;
        if (status === "Hoàn tất") {
            alert("Đơn hàng đã hoàn tất, không thể thay đổi trạng thái.");
            return false;
        }
        return true;
    }
</script>

</body>
</html>