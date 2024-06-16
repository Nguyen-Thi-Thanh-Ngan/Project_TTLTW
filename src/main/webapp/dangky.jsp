<%@ page import="model.User" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Đăng ký</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
    <link type="text/css" rel="stylesheet" href="css/bootstrap.min.css"/>
    <link rel="stylesheet" href="css/register.css">
    <link rel="icon" href="./img/logo.png" type="image/x-icon"/>

</head>
<body>
<div class="wrapper">
    <h1>Đăng ký</h1>
    <c:if test="${error != null}">
        <p class="alert alert-danger">${error}</p>
    </c:if>
    <c:if test="${success != null}">
        <p class="alert alert-success">${success}</p>
    </c:if>
    <form id="registrationForm" action="register" method="post">
        <input type="text" class="form-control form-control-xl" placeholder="Tên người dùng" value="${success == null && user != null ? user.name : ""}" name="name" required>
        <input type="email" class="form-control form-control-xl" placeholder="Email" value="${success == null && user != null ? user.email : ""}" name="email" required>
        <input type="text" class="form-control form-control-xl" placeholder="Tên đăng nhập" value="${success == null && user != null ? user.user_name : ""}" name="username" required>
        <input type="password" class="form-control form-control-xl" placeholder="Mật khẩu" value="${success == null && user != null ? user.password : ""}" name="password" id="password" required>
        <input type="password" class="form-control form-control-xl" placeholder="Nhập lại mật khẩu" value="${success == null && user != null ? confirmPassword : ""}" name="confirmPassword" required>
        <input type="date" class="form-control form-control-xl" placeholder="Ngày đăng ký" value="${success == null && user != null ? user.createdAt : ""}" name="createdAt" required>
    </form>
    <div class="terms">
        <input type="checkbox" id="checkbox">
        <label for="checkbox">Tôi đồng ý những<a href="chinhsachbaomat.jsp"> chính sách của cửa hàng</a></label>
    </div>
    <button onclick="validatePassword()">Đăng ký</button>
<div class="member">
    Đã có tài khoản? <a href="dangnhap.jsp">Đăng nhập ở đây</a>
</div>
</div>

<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/slick.min.js"></script>
<script src="js/nouislider.min.js"></script>
<script src="js/jquery.zoom.min.js"></script>
<script src="js/main.js"></script>

<script>
    function validatePassword() {
        var password = document.getElementById("password").value;
        /*Tối thiểu 8 ký tự
        * Tối đa 20 ký tự
        * Gồm chữ hoa, chữ thường, ký tự đặt biệt*/
        var regex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*()_+])[a-zA-Z\d!@#$%^&*()_+]{8,20}$/;

        if (!regex.test(password)) {
            alert("Mật khẩu phải chứa ít nhất 8 ký tự và không chư ký tự đặc biệt");
        } else {
            submitForm();
        }
    }

    function submitForm() {
        var registrationForm = document.getElementById('registrationForm');
        var checkbox = document.getElementById('checkbox');
        if (checkbox.checked && registrationForm.checkValidity()) {
            $('#registrationForm').submit();
        } else {
            alert("Vui lòng điền đầy đủ thông tin và đồng ý với các điều khoản.");
        }
    }
</script>
<div class="overlay" id="overlay">
    <div class="success-message">
        <p> Đăng ký thành công!</p>
        <br><a href="dangnhap.jsp">Đăng nhập ngay</a>
    </div>
</div>

</body>
</html>

