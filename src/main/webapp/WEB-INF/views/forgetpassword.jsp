<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Forgot Password | SmartIntern</title>

<!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">

<style>
body{
    min-height:100vh;
    background: linear-gradient(-45deg,#0d6efd,#6f42c1,#20c997,#0dcaf0);
    background-size:400% 400%;
    animation: gradientBG 12s ease infinite;
    display:flex;
    justify-content:center;
    align-items:center;
    font-family:'Segoe UI',sans-serif;
}

@keyframes gradientBG{
    0%{background-position:0% 50%}
    50%{background-position:100% 50%}
    100%{background-position:0% 50%}
}

.card-box{
    background:white;
    padding:35px;
    width:100%;
    max-width:420px;
    border-radius:18px;
    box-shadow:0 25px 60px rgba(0,0,0,0.3);
}

.title{
    text-align:center;
    font-size:26px;
    font-weight:700;
    color:#0d6efd;
}

.subtitle{
    text-align:center;
    font-size:14px;
    color:#6c757d;
    margin-bottom:25px;
}

.input-group{
    position:relative;
    margin-bottom:18px;
}

.input-group i{
    position:absolute;
    top:50%;
    left:12px;
    transform:translateY(-50%);
    color:#6c757d;
}

.form-control{
    padding-left:38px;
    height:46px;
    border-radius:10px;
}

.btn-reset{
    background:linear-gradient(to right,#0d6efd,#6f42c1);
    color:white;
    border:none;
    border-radius:30px;
    padding:12px;
    font-weight:600;
}

.login-link{
    text-align:center;
    margin-top:18px;
}
</style>
</head>

<body>

<div class="card-box">
    <div class="title">Forgot Password</div>
    <div class="subtitle">Reset your SmartIntern password</div>

    <!-- Success/Error messages -->
    <c:if test="${not empty error}">
        <div class="alert alert-danger text-center mt-2">${error}</div>
    </c:if>

    <c:if test="${not empty success}">
        <div class="alert alert-success text-center mt-2">${success}</div>
    </c:if>

    <form action="sendOtp" method="post" id="forgotForm">

        <div class="input-group">
            <i class="bi bi-envelope"></i>
            <input type="email" name="email" class="form-control" placeholder="Registered Email" required value="${email}">
        </div>

        <div class="d-grid">
            <button type="submit" class="btn btn-reset">Send OTP</button>
        </div>

        <div class="login-link">
            <a href="login">Back to Login</a>
        </div>

    </form>
</div>

</body>
</html>