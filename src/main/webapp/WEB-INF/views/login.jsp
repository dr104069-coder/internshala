<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login | SmartIntern</title>

<!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">

<style>
body{
    min-height:100vh;
    background:linear-gradient(-45deg,#0d6efd,#6f42c1,#20c997,#0dcaf0);
    background-size:400% 400%;
    animation:gradientBG 12s ease infinite;
    display:flex;
    align-items:center;
    justify-content:center;
    font-family:'Segoe UI',sans-serif;
}

@keyframes gradientBG{
    0%{background-position:0% 50%}
    50%{background-position:100% 50%}
    100%{background-position:0% 50%}
}

.login-card{
    width:100%;
    max-width:420px;
    background:#fff;
    border-radius:18px;
    padding:35px;
    box-shadow:0 25px 60px rgba(0,0,0,.3);
}

.brand{
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

.form-control{
    height:46px;
    border-radius:10px;
}

.btn-login{
    border-radius:30px;
    padding:12px;
    font-weight:600;
    background:linear-gradient(to right,#0d6efd,#6f42c1);
    border:none;
}

.error{
    display:none;
    color:#dc3545;
    background:rgba(220,53,69,.08);
    border-left:4px solid #dc3545;
    padding:10px;
    font-size:13px;
    margin-bottom:15px;
}

.links{
    display:flex;
    justify-content:space-between;
    font-size:14px;
    margin:18px 0;
}
</style>
</head>

<body>

<div class="login-card">
    <div class="brand">SmartIntern</div>
    <div class="subtitle">Login to Your Account</div>

    <c:if test="${not empty error}">
    <div class="error" style="display:block;">
        ${error}
    </div>
</c:if>


    <form action="/authenticate" method="post">

        <!-- Email -->
        <div class="input-group mb-3">
            <span class="input-group-text">
                <i class="bi bi-envelope"></i>
            </span>
            <input type="email" name="email" class="form-control" placeholder="Email" required>
        </div>

        <!-- Password -->
        <div class="input-group mb-3">
            <span class="input-group-text">
                <i class="bi bi-lock"></i>
            </span>
            <input type="password" name="password" id="password" class="form-control" placeholder="Password" required>
            <button class="btn btn-outline-secondary" type="button" onclick="togglePassword()">
                <i id="eyeIcon" class="bi bi-eye"></i>
            </button>
        </div>

        <!-- Role -->
        <div class="input-group mb-3">
            <span class="input-group-text">
                <i class="bi bi-person-badge"></i>
            </span>
            <select name="role" class="form-control" required>
                <option value="" disabled selected>Select Role</option>
                <option value="STUDENT">Student</option>
                <option value="FACULTY">Faculty</option>
                <option value="EMPLOYER">Employer</option>
                <option value="ADMIN">Admin</option>
            </select>
        </div>

        <div class="links">
            <a href="signup">Create Account</a>
            <a href="forgetpassword">Forgot Password?</a>
        </div>

        <div class="d-grid">
            <button type="submit" class="btn btn-login text-white">
                Login
            </button>
        </div>

    </form>
</div>

<script>
function togglePassword(){
    const pass = document.getElementById("password");
    const eye = document.getElementById("eyeIcon");
    if(pass.type === "password"){
        pass.type = "text";
        eye.classList.replace("bi-eye","bi-eye-slash");
    }else{
        pass.type = "password";
        eye.classList.replace("bi-eye-slash","bi-eye");
    }
}
</script>

</body>
</html>
