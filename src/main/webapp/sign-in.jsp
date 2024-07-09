<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Đăng nhập</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
    <link type="text/css" rel="stylesheet" href="css/bootstrap.min.css"/>
    <link rel="stylesheet" href="css/register.css">
    <link rel="icon" href="./img/logo.png" type="image/x-icon"/>

</head>
<body>
<div class="wrapper">
    <h1>Đăng nhập</h1>
    <c:if test="${error != null}">
        <p class="alert alert-danger">${error}</p>
    </c:if>
    <form action="login" method="post">
        <input type="text" placeholder="Tên đăng nhập" name="username" required value="${username}">
        <input type="password" placeholder="Mật khẩu" name="password" required value="${password}">
        <div class="recover">
            <a href="quenmatkhau">Quên mật khẩu?</a>
        </div>
        <button style="border: none"> Đăng nhập</button>
    </form>
    <div class="logo">
        <a href="https://www.facebook.com/v19.0/dialog/oauth?client_id=336799002804887&redirect_uri=http://localhost:8080/home/login-fb"><img class="fb"
                                                                                                                                              src="https://cdn-icons-png.freepik.com/256/5968/5968764.png?ga=GA1.1.2079026882.1697034920&"
                                                                                                                                              alt="logo_facebook"></a>
        <a href="https://accounts.google.com/o/oauth2/auth?scope=email profile openid&redirect_uri=http://localhost:8080/home/login&response_type=code&client_id=422034366950-db6h041tigi2dd7n7c18fbbhlrs348gc.apps.googleusercontent.com&approval_prompt=force"><img
                class="gg" src="https://cdn-icons-png.freepik.com/256/300/300221.png?ga=GA1.1.2079026882.1697034920&"
                alt="logo_google"></a>
    </div>
    <div class="member">
        Chưa có tài khoản ? <a href="sign-up.jsp">
        Đăng ký ngay
    </a>
    </div>
</div>
<script>
    function submitForm() {
        var registrationForm = document.getElementById('registrationForm');
        if (registrationForm.checkValidity()) {
            var overlay = document.getElementById('overlay');
            overlay.style.display = 'flex';
        } else {
            alert("Vui lòng điền đầy đủ thông tin và đồng ý với các điều khoản.");
        }
    }
</script>
</body>
</html>