<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Signup | SmartIntern</title>

<!-- Bootstrap 5 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Bootstrap Icons -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">

<style>
body {
    min-height: 100vh;
    background: linear-gradient(-45deg, #0d6efd, #6f42c1, #20c997, #0dcaf0);
    background-size: 400% 400%;
    animation: gradientBG 12s ease infinite;
    display: flex;
    align-items: center;
    justify-content: center;
    font-family: 'Segoe UI', sans-serif;
}

@keyframes gradientBG {
    0% { background-position: 0% 50%; }
    50% { background-position: 100% 50%; }
    100% { background-position: 0% 50%; }
}

.signup-card {
    background: rgba(255,255,255,0.96);
    border-radius: 18px;
    padding: 35px;
    width: 100%;
    max-width: 520px;
    box-shadow: 0 25px 60px rgba(0,0,0,0.3);
}

.brand {
    text-align: center;
    font-size: 26px;
    font-weight: 700;
    color: #0d6efd;
}

.subtitle {
    text-align: center;
    font-size: 14px;
    color: #6c757d;
    margin-bottom: 25px;
}

.input-group {
    position: relative;
    margin-bottom: 18px;
}

.input-group i {
    position: absolute;
    top: 50%;
    left: 12px;
    transform: translateY(-50%);
    color: #6c757d;
}

.form-control {
    padding-left: 38px;
    padding-right: 45px;
    border-radius: 10px;
    height: 46px;
    font-size: 15px;
    color: #495057;   /* SAME color for all fields */
    background-color: #fff;
    transition: all 0.3s ease;
}

.form-control::placeholder {
    color: #6c757d;
}

.form-control:focus {
    border-color: #6f42c1;
    box-shadow: 0 0 0 0.15rem rgba(111,66,193,.25);
    color: #495057;
}

/* ===== GENDER COLOR FIX ===== */
select.form-control {
    color: #6c757d;        /* placeholder look */
    appearance: none;
    cursor: pointer;
}

select.form-control option {
    color: #495057;        /* dropdown options */
}

select.form-control.valid {
    color: #495057;        /* selected value SAME as other fields */
}
/* ============================ */

.password-toggle {
    position: absolute;
    top: 50%;
    right: 12px;
    transform: translateY(-50%);
    background: none;
    border: none;
    cursor: pointer;
    color: #6c757d;
}

.password-toggle:hover {
    color: #0d6efd;
}

.btn-signup {
    border-radius: 30px;
    padding: 12px;
    font-weight: 600;
    background: linear-gradient(to right, #0d6efd, #6f42c1);
    border: none;
}

.strength-bar {
    height: 6px;
    background: #e9ecef;
    border-radius: 5px;
    margin-top: 6px;
}

.strength-fill {
    height: 100%;
    width: 0%;
}

.weak { background: #dc3545; width: 33%; }
.medium { background: #ffc107; width: 66%; }
.strong { background: #198754; width: 100%; }

.strength-text {
    font-size: 13px;
    margin-top: 4px;
    font-weight: 500;
}

.login-text {
    text-align: center;
    margin-top: 18px;
    font-size: 14px;
}
</style>
</head>

<body>

<div class="signup-card">
    <div class="brand">SmartIntern</div>
    <div class="subtitle">Your gateway to internships & training</div>

    <form action="register" method="post" id="signupForm">

        <div class="row">
            <div class="col">
                <div class="input-group">
                    <i class="bi bi-person"></i>
                    <input type="text" name="firstName" class="form-control" placeholder="First Name" required>
                </div>
            </div>
            <div class="col">
                <div class="input-group">
                    <i class="bi bi-person"></i>
                    <input type="text" name="lastName" class="form-control" placeholder="Last Name" required>
                </div>
            </div>
        </div>

        <div class="input-group">
            <i class="bi bi-envelope"></i>
            <input type="email" name="email" class="form-control" placeholder="Email" required>
        </div>

        <div class="input-group">
            <i class="bi bi-telephone"></i>
            <input type="text" name="phone" class="form-control" placeholder="Phone" required>
        </div>
        <div class="row">
    <div class="col">
        <div class="input-group">
            <i class="bi bi-mortarboard"></i>
            <input type="text" name="qualification" class="form-control" placeholder="Qualification" required>
        </div>
    </div>
    <div class="input-group">
    <i class="bi bi-person-badge"></i>
    <select name="usertype" class="form-control" required onchange="this.classList.add('valid')">
        <option value="" selected disabled>UserType</option>
        <option value="ADMIN">ADMIN</option>
        <option value="STUDENT">STUDENT</option>
        <option value="FACULTY">FACULTY</option>
        <option value="EMPLOYER">EMPLOYER</option>
    </select>
</div>

        <!-- Gender -->
        <div class="input-group">
            <i class="bi bi-gender-ambiguous"></i>
            <select name="gender" class="form-control" required
                    onchange="this.classList.add('valid')">
                <option value="" selected disabled>Select Gender</option>
                <option value="Male">Male</option>
                <option value="Female">Female</option>
                <option value="Other">Other</option>
            </select>
        </div>

        <div class="row">
            <div class="col">
                <div class="input-group">
                    <i class="bi bi-globe"></i>
                    <input type="text" name="country" class="form-control" placeholder="Country" required>
                </div>
            </div>
            <div class="col">
        <div class="input-group">
            <i class="bi bi-pin-map"></i>
            <input type="text" name="state" class="form-control" placeholder="State" required>
        </div>
    </div>
</div>
            <div class="col">
                <div class="input-group">
                    <i class="bi bi-geo-alt"></i>
                    <input type="text" name="city" class="form-control" placeholder="City" required>
                </div>
            </div>
        </div>

        <div class="input-group">
            <i class="bi bi-calendar"></i>
            <input type="number" name="birthYear" class="form-control"
                   placeholder="Birth Year (e.g. 2002)" min="1980" max="2010" required>
        </div>

        <div class="input-group">
            <i class="bi bi-lock"></i>
            <input type="password" id="password" name="password" class="form-control"
                   placeholder="Password" onkeyup="checkStrength()" required>
            <button type="button" class="password-toggle" onclick="togglePassword('password')">
                <i class="bi bi-eye"></i>
            </button>
        </div>

        <div class="strength-bar">
            <div id="strengthFill" class="strength-fill"></div>
        </div>
        <div id="strengthText" class="strength-text"></div>

        <div class="input-group">
            <i class="bi bi-lock-fill"></i>
            <input type="password" id="confirmPassword" class="form-control"
                   placeholder="Confirm Password" required>
            <button type="button" class="password-toggle" onclick="togglePassword('confirmPassword')">
                <i class="bi bi-eye"></i>
            </button>
        </div>

        <div class="d-grid">
            <button type="button" class="btn btn-signup text-white" onclick="submitForm()">
                Create Account
            </button>
        </div>

        <div class="login-text">
            Already Registered ? <a href="login">Login</a>
        </div>

    </form>
</div>

<script>
function checkStrength() {
    const pwd = document.getElementById("password").value;
    const fill = document.getElementById("strengthFill");
    const text = document.getElementById("strengthText");

    if (pwd.length < 6) {
        fill.className = "strength-fill weak";
        text.textContent = "Weak password";
    } else if (pwd.match(/[A-Z]/) && pwd.match(/[0-9]/) && pwd.match(/[@$!%*?&]/)) {
        fill.className = "strength-fill strong";
        text.textContent = "Strong password";
    } else {
        fill.className = "strength-fill medium";
        text.textContent = "Medium password";
    }
}

function togglePassword(id) {
    const field = document.getElementById(id);
    field.type = field.type === "password" ? "text" : "password";
}

function submitForm() {
    const pwd = document.getElementById("password").value;
    const cpwd = document.getElementById("confirmPassword").value;

    if (pwd !== cpwd) {
        alert("Passwords do not match");
        return;
    }
    document.getElementById("signupForm").submit();
}
</script>

</body>
</html>