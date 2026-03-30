<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SmartIntern | Complete Profile</title>

<!-- Bootstrap 5 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Bootstrap Icons -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">
<!-- Font Awesome 6 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800;900&display=swap" rel="stylesheet">
<!-- AOS Animation -->
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">

<style>
:root {
    --cerulean: #247ba0;
    --cerulean-dark: #1a5f7e;
    --cerulean-light: #4098c0;
    --tropical-teal: #70c1b3;
    --tropical-teal-dark: #5aa394;
    --celadon: #b2dbbf;
    --cream: #f3ffbd;
    --hot-fuchsia: #ff1654;
    --light-skyblue: #e6f3ff;
    --skyblue: #b8e1fc;
    
    --primary: #4361ee;
    --secondary: #06b6d4;
    --success: #10b981;
    --warning: #f59e0b;
    --danger: #ef4444;
    --dark: #0f172a;
    --gray: #475569;
    --card-shadow: 0 20px 40px -12px rgba(0, 0, 0, 0.08);
    --hover-shadow: 0 25px 45px -15px rgba(0, 0, 0, 0.15);
    --transition-bounce: 500ms cubic-bezier(0.34, 1.56, 0.64, 1);
    --footer-bg: linear-gradient(135deg, var(--cerulean) 0%, var(--tropical-teal) 100%);
}

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: 'Inter', sans-serif;
    background: linear-gradient(135deg, #d9efff 0%, #c6e6ff 50%, #b8e1fc 100%);
    color: var(--dark);
    overflow-x: hidden;
    display: flex;
    flex-direction: column;
    min-height: 100vh;
}

::-webkit-scrollbar {
    width: 8px;
    height: 8px;
}

::-webkit-scrollbar-track {
    background: var(--skyblue);
    border-radius: 10px;
}

::-webkit-scrollbar-thumb {
    background: linear-gradient(135deg, var(--cerulean), var(--tropical-teal));
    border-radius: 10px;
}

::-webkit-scrollbar-thumb:hover {
    background: linear-gradient(135deg, var(--hot-fuchsia), var(--tropical-teal));
}

@keyframes logoMove {
    0%, 100% { transform: translateY(0) rotate(0deg) scale(1); }
    25% { transform: translateY(-8px) rotate(5deg) scale(1.05); }
    50% { transform: translateY(5px) rotate(-3deg) scale(0.98); }
    75% { transform: translateY(-3px) rotate(2deg) scale(1.02); }
}

@keyframes iconMove {
    0%, 100% { transform: scale(1) rotate(0deg); color: white; }
    33% { transform: scale(1.15) rotate(10deg); }
    66% { transform: scale(0.95) rotate(-10deg); }
}

@keyframes headerFade {
    from { opacity: 0; transform: translateY(-30px); }
    to { opacity: 1; transform: translateY(0); }
}

@keyframes mainFade {
    from { opacity: 0; transform: translateY(20px); }
    to { opacity: 1; transform: translateY(0); }
}

@keyframes cardAppear {
    from { opacity: 0; transform: scale(0.95) translateY(20px); }
    to { opacity: 1; transform: scale(1) translateY(0); }
}

@keyframes rotate {
    from { transform: rotate(0deg); }
    to { transform: rotate(360deg); }
}

@keyframes pulse {
    0% { transform: scale(1); }
    50% { transform: scale(1.1); }
    100% { transform: scale(1); }
}

@keyframes float {
    0% { transform: translateY(0px); }
    50% { transform: translateY(-10px); }
    100% { transform: translateY(0px); }
}

/* Modern Header */
.modern-header {
    background: linear-gradient(135deg, var(--cerulean) 0%, var(--tropical-teal) 100%);
    padding: 1.5rem 0;
    position: sticky;
    top: 0;
    z-index: 1000;
    box-shadow: 0 8px 25px rgba(0, 0, 0, 0.15);
    animation: headerFade 0.8s ease-out;
    border-bottom: 2px solid rgba(255, 255, 255, 0.2);
}

.header-container {
    max-width: 1600px;
    margin: 0 auto;
    padding: 0 2rem;
    display: flex;
    justify-content: space-between;
    align-items: center;
    flex-wrap: wrap;
    gap: 1.5rem;
}

.logo-area {
    display: flex;
    align-items: center;
    gap: 1rem;
}

.smartintern-logo {
    position: relative;
    width: 65px;
    height: 65px;
    display: flex;
    align-items: center;
    justify-content: center;
}

.logo-blue {
    width: 45px;
    height: 45px;
    background: linear-gradient(135deg, var(--primary), var(--secondary));
    border-radius: 14px;
    display: flex;
    align-items: center;
    justify-content: center;
    position: relative;
    animation: logoMove 4s var(--transition-bounce) infinite;
    box-shadow: 0 0 20px rgba(67, 97, 238, 0.3);
}

.logo-blue i {
    font-size: 24px;
    color: white;
    animation: iconMove 3s var(--transition-bounce) infinite;
}

.logo-text h1 {
    color: white;
    font-size: 1.5rem;
    font-weight: 700;
    margin: 0;
}

.logo-text p {
    color: rgba(255, 255, 255, 0.85);
    margin: 0;
    font-size: 0.75rem;
    font-weight: 500;
}

.header-nav {
    display: flex;
    align-items: center;
    gap: 0.75rem;
    background: rgba(255, 255, 255, 0.2);
    backdrop-filter: blur(10px);
    padding: 0.3rem 1rem;
    border-radius: 60px;
    border: 1px solid rgba(255, 255, 255, 0.25);
}

.nav-link-header {
    display: flex;
    align-items: center;
    gap: 0.6rem;
    padding: 0.5rem 1rem;
    border-radius: 40px;
    color: white;
    text-decoration: none;
    font-weight: 600;
    font-size: 0.9rem;
    transition: all 0.3s;
}

.nav-link-header i {
    font-size: 1rem;
}

.nav-link-header:hover {
    background: rgba(255, 255, 255, 0.25);
    color: var(--cream);
    transform: translateY(-2px);
}

.profile-dropdown {
    position: relative;
    display: flex;
    align-items: center;
    gap: 0.8rem;
    cursor: pointer;
    padding: 0.4rem 1rem;
    border-radius: 50px;
    background: rgba(255, 255, 255, 0.2);
    transition: all 0.3s;
}

.profile-dropdown:hover {
    background: rgba(255, 255, 255, 0.3);
    transform: translateY(-2px);
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
}

.profile-avatar {
    width: 38px;
    height: 38px;
    background: linear-gradient(135deg, var(--success), var(--secondary));
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    color: white;
    font-weight: 600;
    font-size: 1rem;
    overflow: hidden;
    transition: all 0.3s;
    border: 2px solid rgba(255, 255, 255, 0.5);
}

.profile-dropdown:hover .profile-avatar {
    transform: rotate(360deg);
    transition: transform 0.6s;
    border-color: white;
}

.profile-avatar img {
    width: 100%;
    height: 100%;
    object-fit: cover;
}

.profile-name {
    color: white;
    font-weight: 600;
    font-size: 0.9rem;
}

.profile-arrow {
    color: white;
    font-size: 0.75rem;
    transition: transform 0.3s;
}

.profile-dropdown:hover .profile-arrow {
    transform: rotate(180deg);
}

.dropdown-menu-custom {
    position: absolute;
    top: calc(100% + 8px);
    right: 0;
    background: white;
    border-radius: 16px;
    box-shadow: 0 20px 40px rgba(0, 0, 0, 0.2);
    min-width: 220px;
    display: none;
    z-index: 1000;
    overflow: hidden;
    animation: dropdownFade 0.3s ease-out;
    border: 1px solid rgba(0, 0, 0, 0.05);
}

@keyframes dropdownFade {
    from { opacity: 0; transform: translateY(-10px); }
    to { opacity: 1; transform: translateY(0); }
}

.profile-dropdown:hover .dropdown-menu-custom,
.dropdown-menu-custom:hover {
    display: block;
}

.dropdown-item-custom {
    display: flex;
    align-items: center;
    gap: 0.8rem;
    padding: 0.8rem 1.2rem;
    color: var(--dark);
    text-decoration: none;
    transition: all 0.3s;
    font-size: 0.85rem;
    font-weight: 500;
    border-left: 3px solid transparent;
    cursor: pointer;
}

.dropdown-item-custom i {
    width: 20px;
    font-size: 0.9rem;
    color: var(--cerulean);
}

.dropdown-item-custom:hover {
    background: var(--light-skyblue);
    color: var(--cerulean);
    border-left-color: var(--cerulean);
    padding-left: 1.4rem;
}

.dropdown-divider {
    height: 1px;
    background: #e2e8f0;
    margin: 0.4rem 0;
}

.dropdown-item-custom.logout {
    color: var(--danger);
}

.dropdown-item-custom.logout i {
    color: var(--danger);
}

.dropdown-item-custom.logout:hover {
    background: #fee2e2;
    color: var(--danger);
    border-left-color: var(--danger);
}

.header-actions {
    display: flex;
    align-items: center;
    gap: 1.5rem;
}

.notification-badge {
    position: relative;
    cursor: pointer;
    transition: all 0.3s;
    padding: 0.3rem;
}

.notification-badge:hover {
    transform: scale(1.1);
}

.notification-badge i {
    font-size: 1.3rem;
    color: white;
}

.notification-count {
    position: absolute;
    top: -8px;
    right: -8px;
    background: var(--danger);
    color: white;
    font-size: 0.7rem;
    font-weight: 600;
    width: 18px;
    height: 18px;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    border: 2px solid white;
    animation: pulse 2s infinite;
}

/* Main Content */
.main-content {
    max-width: 1000px;
    margin: 2rem auto;
    padding: 0 1.5rem;
    flex: 1;
    width: 100%;
}

/* Welcome Banner */
.welcome-banner {
    background: linear-gradient(135deg, var(--cerulean), var(--tropical-teal));
    border-radius: 24px;
    padding: 2rem;
    margin-bottom: 2rem;
    text-align: center;
    position: relative;
    overflow: hidden;
    box-shadow: 0 10px 30px rgba(36, 123, 160, 0.2);
}

.welcome-banner::before {
    content: '';
    position: absolute;
    top: -50%;
    right: -50%;
    width: 200%;
    height: 200%;
    background: radial-gradient(circle, rgba(255,255,255,0.1) 0%, transparent 70%);
    animation: rotate 20s linear infinite;
}

.banner-content {
    position: relative;
    z-index: 1;
}

.banner-icon {
    font-size: 3rem;
    color: white;
    margin-bottom: 1rem;
    animation: float 3s ease-in-out infinite;
}

.banner-content h2 {
    color: white;
    font-size: 1.8rem;
    font-weight: 700;
    margin-bottom: 0.5rem;
}

.banner-content p {
    color: rgba(255, 255, 255, 0.9);
    font-size: 0.9rem;
    margin: 0;
}

/* Form Card */
.form-card {
    background: white;
    border-radius: 28px;
    padding: 2rem;
    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
    border: 1px solid #e2e8f0;
    margin-bottom: 2rem;
}

.form-header {
    text-align: center;
    margin-bottom: 2rem;
    padding-bottom: 1rem;
    border-bottom: 2px solid #f1f5f9;
}

.form-header h3 {
    font-size: 1.5rem;
    font-weight: 700;
    color: var(--dark);
    margin-bottom: 0.3rem;
}

.form-header p {
    color: var(--gray);
    font-size: 0.85rem;
}

/* Form Groups */
.form-group {
    margin-bottom: 1.5rem;
}

.form-label {
    display: flex;
    align-items: center;
    gap: 0.5rem;
    font-weight: 600;
    color: var(--cerulean);
    font-size: 0.85rem;
    margin-bottom: 0.5rem;
}

.form-label i {
    width: 20px;
    font-size: 0.9rem;
}

.form-control {
    width: 100%;
    padding: 0.8rem 1rem;
    border: 1.5px solid #e2e8f0;
    border-radius: 14px;
    font-size: 0.9rem;
    font-family: 'Inter', sans-serif;
    transition: all 0.3s;
    background: #fafbfc;
}

.form-control:focus {
    outline: none;
    border-color: var(--cerulean);
    background: white;
    box-shadow: 0 0 0 3px rgba(36, 123, 160, 0.1);
}

.form-control::placeholder {
    color: #cbd5e1;
}

/* Grid Layout */
.form-row {
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    gap: 1.5rem;
}

/* Submit Button */
.btn-submit {
    width: 100%;
    background: linear-gradient(135deg, var(--cerulean), var(--tropical-teal));
    color: white;
    padding: 1rem;
    border: none;
    border-radius: 16px;
    font-size: 1rem;
    font-weight: 700;
    cursor: pointer;
    transition: all 0.3s;
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 0.5rem;
    margin-top: 0.5rem;
}

.btn-submit:hover {
    transform: translateY(-2px);
    box-shadow: 0 10px 25px rgba(36, 123, 160, 0.3);
}

.btn-submit:active {
    transform: translateY(0);
}

/* Back Button */
.btn-back {
    display: inline-flex;
    align-items: center;
    gap: 0.5rem;
    background: white;
    color: var(--cerulean);
    padding: 0.6rem 1.2rem;
    border-radius: 40px;
    text-decoration: none;
    font-weight: 600;
    font-size: 0.85rem;
    transition: all 0.3s;
    border: 1px solid #e2e8f0;
    margin-top: 1rem;
}

.btn-back:hover {
    background: var(--cerulean);
    border-color: var(--cerulean);
    color: white;
    transform: translateX(-3px);
}

/* Footer */
.modern-footer {
    background: var(--footer-bg);
    color: rgba(255, 255, 255, 0.85);
    padding: 1rem 0;
    margin-top: 2rem;
    border-top: 1px solid rgba(255, 255, 255, 0.1);
}

.footer-container {
    max-width: 1200px;
    margin: 0 auto;
    padding: 0 1.5rem;
    display: flex;
    justify-content: space-between;
    align-items: center;
    flex-wrap: wrap;
    gap: 1rem;
}

.footer-logo {
    display: flex;
    align-items: center;
    gap: 0.6rem;
}

.footer-logo i {
    font-size: 1.2rem;
    color: var(--cream);
}

.footer-logo span {
    font-size: 0.9rem;
    font-weight: 600;
    color: white;
}

.footer-links {
    display: flex;
    gap: 1.2rem;
}

.footer-links a {
    color: rgba(255, 255, 255, 0.75);
    text-decoration: none;
    font-size: 0.75rem;
    font-weight: 500;
    transition: all 0.3s;
}

.footer-links a:hover {
    color: var(--cream);
}

.footer-copyright {
    font-size: 0.7rem;
    color: rgba(255, 255, 255, 0.7);
}

.footer-copyright i {
    color: var(--hot-fuchsia);
}

.footer-copyright strong {
    color: var(--cream);
}

/* Responsive */
@media (max-width: 768px) {
    .header-container {
        flex-direction: column;
        gap: 1rem;
    }
    
    .header-nav {
        width: 100%;
        justify-content: center;
        flex-wrap: wrap;
    }
    
    .header-actions {
        width: 100%;
        justify-content: center;
    }
    
    .form-row {
        grid-template-columns: 1fr;
        gap: 1rem;
    }
    
    .form-card {
        padding: 1.5rem;
    }
    
    .banner-content h2 {
        font-size: 1.4rem;
    }
    
    .footer-container {
        flex-direction: column;
        text-align: center;
        gap: 0.6rem;
    }
    
    .footer-links {
        justify-content: center;
        flex-wrap: wrap;
    }
}

@media (max-width: 480px) {
    .form-card {
        padding: 1.2rem;
    }
    
    .form-control {
        padding: 0.7rem 0.9rem;
    }
    
    .btn-submit {
        padding: 0.8rem;
    }
}
</style>
</head>
<body>

<!-- Modern Header -->
<header class="modern-header">
    <div class="header-container">
        <div class="logo-area">
            <div class="smartintern-logo">
                <div class="logo-blue">
                    <i class="bi bi-briefcase-fill"></i>
                </div>
            </div>
            <div class="logo-text">
                <h1>SmartIntern</h1>
                <p>AI-Powered Internship Platform</p>
            </div>
        </div>
        
        <div class="header-nav">
            <a href="studentDashboard" class="nav-link-header">
                <i class="fas fa-th-large"></i>
                <span>Dashboard</span>
            </a>
            <a href="myinternships" class="nav-link-header">
                <i class="fas fa-briefcase"></i>
                <span>My Internships</span>
            </a>
            <a href="/myApplications" class="nav-link-header">
                <i class="fas fa-file-alt"></i>
                <span>Applications</span>
            </a>
            <a href="internships" class="nav-link-header">
                <i class="fas fa-search"></i>
                <span>Internships</span>
            </a>
        </div>
        
        <div class="header-actions">
            <div class="notification-badge">
                <i class="far fa-bell"></i>
                <span class="notification-count">3</span>
            </div>
            
            <div class="profile-dropdown">
                <div class="profile-avatar">
                    <c:choose>
                        <c:when test="${not empty user.profilePicURL}">
                            <img src="${user.profilePicURL}" alt="Profile">
                        </c:when>
                        <c:otherwise>
                            <span>👤</span>
                        </c:otherwise>
                    </c:choose>
                </div>
                <div class="profile-name">Student</div>
                <i class="fas fa-chevron-down profile-arrow"></i>
                <div class="dropdown-menu-custom">
                    <a href="profile" class="dropdown-item-custom">
                        <i class="fas fa-user-circle"></i> My Profile
                    </a>
                    <a href="settings" class="dropdown-item-custom">
                        <i class="fas fa-cog"></i> Settings
                    </a>
                    <div class="dropdown-divider"></div>
                    <a href="logout" class="dropdown-item-custom logout">
                        <i class="fas fa-sign-out-alt"></i> Logout
                    </a>
                </div>
            </div>
        </div>
    </div>
</header>

<!-- Main Content -->
<main class="main-content">
    
    <!-- Welcome Banner -->
    <div class="welcome-banner" data-aos="fade-down" data-aos-duration="800">
        <div class="banner-content">
            <div class="banner-icon">
                <i class="fas fa-user-graduate"></i>
            </div>
            <h2>Complete Your Profile</h2>
            <p>Tell us about your academic background to unlock internship opportunities</p>
        </div>
    </div>
    
    <!-- Form Card -->
    <div class="form-card" data-aos="fade-up" data-aos-duration="800" data-aos-delay="100">
        <div class="form-header">
            <h3>Academic Information</h3>
            <p>Please fill in your educational details accurately</p>
        </div>
        
        <form action="saveStudentProfile" method="post">
            <div class="form-row">
                <!-- College Name -->
                <div class="form-group">
                    <label class="form-label">
                        <i class="fas fa-university"></i>
                        College Name <span style="color: var(--danger);">*</span>
                    </label>
                    <input type="text" name="collegeName" class="form-control" placeholder="Enter your college name" required>
                </div>
                
                <!-- Degree -->
                <div class="form-group">
                    <label class="form-label">
                        <i class="fas fa-graduation-cap"></i>
                        Degree <span style="color: var(--danger);">*</span>
                    </label>
                    <input type="text" name="degree" class="form-control" placeholder="e.g., B.Tech, B.Sc, B.Com" required>
                </div>
                
                <!-- City -->
                <div class="form-group">
                    <label class="form-label">
                        <i class="fas fa-city"></i>
                        City <span style="color: var(--danger);">*</span>
                    </label>
                    <input type="text" name="city" class="form-control" placeholder="Enter your city" required>
                </div>
                
                <!-- State -->
                <div class="form-group">
                    <label class="form-label">
                        <i class="fas fa-map-marker-alt"></i>
                        State <span style="color: var(--danger);">*</span>
                    </label>
                    <input type="text" name="state" class="form-control" placeholder="Enter your state" required>
                </div>
                
                <!-- Semester -->
                <div class="form-group">
                    <label class="form-label">
                        <i class="fas fa-book-open"></i>
                        Current Semester
                    </label>
                    <input type="number" name="semester" class="form-control" placeholder="e.g., 1, 2, 3..." min="1" max="12">
                </div>
                
                <!-- Graduation Year -->
                <div class="form-group">
                    <label class="form-label">
                        <i class="fas fa-calendar-alt"></i>
                        Graduation Year
                    </label>
                    <input type="number" name="graduationYear" class="form-control" placeholder="e.g., 2025, 2026" min="2024" max="2030">
                </div>
            </div>
            
            <button type="submit" class="btn-submit">
                <i class="fas fa-save"></i> Save Profile
            </button>
        </form>
    </div>
    
    <!-- Back Button -->
    <div data-aos="fade-up" data-aos-duration="600" data-aos-delay="200">
        <a href="studentDashboard" class="btn-back">
            <i class="fas fa-arrow-left"></i> Back to Dashboard
        </a>
    </div>
    
</main>

<!-- Modern Footer -->
<footer class="modern-footer">
    <div class="footer-container">
        <div class="footer-logo">
            <i class="bi bi-briefcase-fill"></i>
            <span>SmartIntern</span>
        </div>
        <div class="footer-links">
            <a href="#">About</a>
            <a href="#">Contact</a>
            <a href="#">Privacy</a>
            <a href="#">Terms</a>
            <a href="#">Help</a>
        </div>
        <div class="footer-copyright">
            © 2026 · Made with <i class="fas fa-heart"></i> by <strong>Darshan</strong>
        </div>
    </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<script>
AOS.init({
    duration: 800,
    once: true,
    offset: 50
});

document.querySelector('.notification-badge')?.addEventListener('click', function() {
    alert('You have 3 new notifications');
});

// Input validation for numbers
document.querySelectorAll('input[type="number"]').forEach(input => {
    input.addEventListener('change', function() {
        let value = parseInt(this.value);
        let min = parseInt(this.min);
        let max = parseInt(this.max);
        
        if (this.min && value < min) {
            this.value = min;
        }
        if (this.max && value > max) {
            this.value = max;
        }
    });
});
</script>
</body>
</html>