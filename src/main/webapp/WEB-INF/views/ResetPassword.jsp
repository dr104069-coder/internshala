<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reset Password | SmartIntern</title>

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
    padding-right:38px;
    height:46px;
    border-radius:10px;
}

.toggle{
    position:absolute;
    top:50%;
    right:12px;
    transform:translateY(-50%);
    background:none;
    border:none;
    cursor:pointer;
}

.btn-reset{
    background:linear-gradient(to right,#0d6efd,#6f42c1);
    color:white;
    border:none;
    border-radius:30px;
    padding:12px;
    font-weight:600;
}

.strength-bar{
    height:6px;
    background:#e9ecef;
    border-radius:5px;
}

.strength-fill{
    height:100%;
    width:0%;
}

.weak{background:#dc3545;width:33%}
.medium{background:#ffc107;width:66%}
.strong{background:#198754;width:100%}

.login-link{
    text-align:center;
    margin-top:18px;
}
</style>
</head>

<body>

<div class="card-box">

    <div class="title">Reset Password</div>
    <div class="subtitle">Enter OTP and your new password</div>

    <!-- Display success/error messages -->
    <c:if test="${not empty error}">
        <div class="alert alert-danger text-center">${error}</div>
    </c:if>
    <c:if test="${not empty success}">
        <div class="alert alert-success text-center">${success}</div>
    </c:if>

    <!-- Reset Password Form -->
   <form action="verifyOtp" method="post" id="resetForm">

        <!-- Hidden Email Field -->
        <input type="hidden" name="email" value="${email}">

        <!-- New Password -->
        <div class="input-group">
            <i class="bi bi-lock"></i>
            <input type="password" name="newPassword" id="newPassword" class="form-control" placeholder="New Password" required oninput="checkStrength()">
            <button type="button" class="toggle" onclick="toggle('newPassword')">
                <i class="bi bi-eye"></i>
            </button>
        </div>

        <div class="strength-bar mb-2">
            <div class="strength-fill" id="strengthFill"></div>
        </div>
        <small id="strengthText" class="d-block mb-3 text-center"></small>

        <!-- Confirm Password -->
        <div class="input-group">
            <i class="bi bi-lock-fill"></i>
            <input type="password" name="confirmPassword" id="confirmPassword" class="form-control" placeholder="Confirm Password" required>
            <button type="button" class="toggle" onclick="toggle('confirmPassword')">
                <i class="bi bi-eye"></i>
            </button>
        </div>

        <!-- OTP Field -->
        <div class="input-group">
            <i class="bi bi-key"></i>
            <input type="text" name="otp" class="form-control" placeholder="Enter OTP" required>
        </div>

        <!-- Reset Button -->
        <div class="d-grid">
            <button type="button" class="btn btn-reset" onclick="submitForm()">Reset Password</button>
        </div>

        <div class="login-link">
            <a href="login">Back to Login</a>
        </div>

    </form>
</div>

<script>
function toggle(id){
    const f=document.getElementById(id);
    f.type=f.type==="password"?"text":"password";
}

function checkStrength(){
    const pwd=document.getElementById("newPassword").value;
    const fill=document.getElementById("strengthFill");
    const text=document.getElementById("strengthText");

    if(pwd.length<6){
        fill.className="strength-fill weak";
        text.textContent="Weak password";
    }else if(/[A-Z]/.test(pwd)&&/[0-9]/.test(pwd)&&/[@$!%*?&]/.test(pwd)){
        fill.className="strength-fill strong";
        text.textContent="Strong password";
    }else{
        fill.className="strength-fill medium";
        text.textContent="Medium password";
    }
}

function submitForm(){
    const p1=document.getElementById("newPassword").value;
    const p2=document.getElementById("confirmPassword").value;

    if(p1!==p2){
        alert("Passwords do not match");
        return;
    }

    const otp=document.querySelector('input[name="otp"]').value;
    if(otp.trim()===""){
        alert("Please enter OTP");
        return;
    }

    document.getElementById("resetForm").submit();
}
</script>

</body>
</html>