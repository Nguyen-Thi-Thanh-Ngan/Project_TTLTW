<%@ page import="model.User" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Đăng ký</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
    <link type="text/css" rel="stylesheet" href="css/bootstrap.min.css"/>
    <link rel="stylesheet" href="./css/register.css">
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
    <form id="registrationForm" action="sign-up" method="post">
        <input class="form-control form-control-xl" type="text" placeholder="Họ và Tên" name="name" required
               value="${success == null && user != null ? user.name : ""}">
        <input class="form-control form-control-xl" type="email" placeholder="Email"
               value="${success == null && user != null ? user.email : ""}" name="email" required>
        <input type="text" class="form-control form-control-xl" placeholder="Tên đăng nhập"
               value="${success == null && user != null ? user.user_name : ""}" name="username" required>
        <input class="form-control form-control-xl" type="password" placeholder="Mật khẩu"
               value="${success == null && user != null ? user.password : ""}" name="password" id="password" required>
        <input class="form-control form-control-xl" type="password" placeholder="Nhập lại mật khẩu"
               value="${success == null && user != null ? confirmPassword : ""}" name="confirmPassword" required>
    </form>
    <div class="terms">
        <input type="checkbox" id="checkbox">
        <label for="checkbox">Tôi đồng ý những<a href="chinhsachbaomat.jsp"> chính sách của cửa hàng</a></label>
    </div>

    <button onclick="validatePassword()">Đăng ký</button>
    <div class="member">
        Đã có tài khoản? <a href="sign-in.jsp">Đăng nhập ở đây</a>
    </div>
    <div class="logo">
        <a href="https://www.facebook.com/v19.0/dialog/oauth?client_id=336799002804887&redirect_uri=http://localhost:8080/home/login-fb"><img class="fb"
                                                 src="https://cdn-icons-png.freepik.com/256/5968/5968764.png?ga=GA1.1.2079026882.1697034920&"
                                                 alt="logo_facebook"></a>
        <a href="https://accounts.google.com/o/oauth2/auth?scope=email profile openid&redirect_uri=http://localhost:8080/home/login&response_type=code&client_id=422034366950-db6h041tigi2dd7n7c18fbbhlrs348gc.apps.googleusercontent.com&approval_prompt=force"><img
                class="gg" src="https://cdn-icons-png.freepik.com/256/300/300221.png?ga=GA1.1.2079026882.1697034920&"
                alt="logo_google"></a>
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
    }            System.out.println("New user registered: " + user.getEmail());


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
        <br><a href="sign-in.jsp">Đăng nhập ngay</a>
    </div>
</div>

</body>
</html>

