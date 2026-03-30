<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SmartIntern | My Profile</title>

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

/* Modern Header - Same as Dashboard */
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

/* Navigation Links */
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

/* Profile Dropdown */
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
    max-width: 1200px;
    margin: 2rem auto;
    padding: 0 1.5rem;
    flex: 1;
    width: 100%;
}

/* Stats Grid */
.stats-grid {
    display: grid;
    grid-template-columns: repeat(4, 1fr);
    gap: 1.2rem;
    margin-bottom: 2rem;
}

.stat-card {
    background: white;
    border-radius: 20px;
    padding: 1.2rem;
    text-align: center;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.04);
    border: 1px solid #e2e8f0;
    transition: all 0.3s ease;
}

.stat-card:hover {
    transform: translateY(-3px);
    box-shadow: 0 8px 20px rgba(0, 0, 0, 0.08);
    border-color: var(--tropical-teal);
}

.stat-icon {
    width: 45px;
    height: 45px;
    background: linear-gradient(135deg, var(--cerulean), var(--tropical-teal));
    border-radius: 14px;
    display: flex;
    align-items: center;
    justify-content: center;
    margin: 0 auto 0.8rem;
    color: white;
    font-size: 1.3rem;
}

.stat-value {
    font-size: 1.4rem;
    font-weight: 800;
    color: var(--dark);
    margin-bottom: 0.2rem;
}

.stat-label {
    font-size: 0.75rem;
    color: var(--gray);
    font-weight: 500;
}

/* Alert */
.alert-incomplete {
    background: #fffbeb;
    border: 1px solid #fde68a;
    border-radius: 16px;
    padding: 1rem 1.2rem;
    margin-bottom: 2rem;
    display: flex;
    justify-content: space-between;
    align-items: center;
    flex-wrap: wrap;
    gap: 1rem;
}

.alert-incomplete i {
    font-size: 1rem;
    color: #f59e0b;
    margin-right: 0.5rem;
}

.alert-incomplete span {
    color: #92400e;
    font-weight: 500;
    font-size: 0.85rem;
}

.btn-complete {
    background: linear-gradient(135deg, #f59e0b, #d97706);
    color: white;
    padding: 0.45rem 1.2rem;
    border-radius: 30px;
    text-decoration: none;
    font-weight: 600;
    font-size: 0.8rem;
    transition: all 0.3s;
    display: inline-flex;
    align-items: center;
    gap: 0.4rem;
    border: none;
}

.btn-complete:hover {
    transform: translateY(-2px);
    box-shadow: 0 4px 12px rgba(245, 158, 11, 0.3);
    color: white;
}

/* Profile Card - Larger Photo */
.profile-card {
    background: white;
    border-radius: 24px;
    overflow: hidden;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
    border: 1px solid #e2e8f0;
    margin-bottom: 2rem;
}

.profile-cover {
    background: linear-gradient(135deg, var(--cerulean), var(--tropical-teal));
    height: 100px;
}

.profile-avatar-wrapper {
    position: relative;
    text-align: center;
    margin-top: -55px;
    margin-bottom: 1rem;
}

.profile-avatar-large {
    width: 110px;
    height: 110px;
    background: white;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    margin: 0 auto;
    padding: 4px;
    box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
    transition: all 0.3s ease;
}

.profile-avatar-large img {
    width: 100%;
    height: 100%;
    object-fit: cover;
    border-radius: 50%;
}

.profile-avatar-large span {
    width: 100%;
    height: 100%;
    background: linear-gradient(135deg, var(--cerulean), var(--tropical-teal));
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 2.5rem;
    font-weight: 700;
    color: white;
}

.profile-avatar-large:hover {
    transform: scale(1.02);
    box-shadow: 0 12px 25px rgba(0, 0, 0, 0.2);
}

.profile-info {
    text-align: center;
    padding: 0 1.5rem 1.5rem;
}

.profile-info h3 {
    font-size: 1.4rem;
    font-weight: 700;
    color: var(--dark);
    margin-bottom: 0.3rem;
}

.profile-info p {
    color: var(--gray);
    font-size: 0.85rem;
    margin-bottom: 0.2rem;
}

.profile-info p i {
    width: 20px;
    color: var(--cerulean);
    margin-right: 0.3rem;
}

/* Info Sections */
.info-section {
    background: white;
    border-radius: 20px;
    padding: 1.5rem;
    margin-bottom: 1.5rem;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.04);
    border: 1px solid #e2e8f0;
}

.section-header {
    display: flex;
    align-items: center;
    gap: 0.7rem;
    margin-bottom: 1.2rem;
    padding-bottom: 0.8rem;
    border-bottom: 2px solid #f1f5f9;
}

.section-icon {
    width: 36px;
    height: 36px;
    background: linear-gradient(135deg, var(--cerulean), var(--tropical-teal));
    border-radius: 10px;
    display: flex;
    align-items: center;
    justify-content: center;
    color: white;
    font-size: 1rem;
}

.section-header h4 {
    font-size: 1.1rem;
    font-weight: 700;
    color: var(--dark);
    margin: 0;
}

/* Info Grid */
.info-grid {
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    gap: 0.8rem;
}

.info-item {
    display: flex;
    align-items: center;
    padding: 0.7rem 0.9rem;
    background: #f8fafc;
    border-radius: 12px;
    transition: all 0.2s;
}

.info-item:hover {
    background: #f1f5f9;
}

.info-label {
    width: 100px;
    font-weight: 600;
    color: var(--cerulean);
    font-size: 0.8rem;
    display: flex;
    align-items: center;
    gap: 0.4rem;
}

.info-label i {
    width: 18px;
    font-size: 0.8rem;
}

.info-value {
    flex: 1;
    color: var(--dark);
    font-weight: 500;
    font-size: 0.85rem;
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
    margin-top: 0.5rem;
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

@media (max-width: 992px) {
    .stats-grid {
        grid-template-columns: repeat(2, 1fr);
        gap: 1rem;
    }
    
    .info-grid {
        grid-template-columns: 1fr;
    }
}

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
    
    .stats-grid {
        grid-template-columns: 1fr;
    }
    
    .profile-avatar-large {
        width: 90px;
        height: 90px;
    }
    
    .info-item {
        flex-direction: column;
        align-items: flex-start;
        gap: 0.3rem;
    }
    
    .info-label {
        width: auto;
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
                            <img src="${user.profilePicURL}" alt="${user.firstName}">
                        </c:when>
                        <c:otherwise>
                            <span>${fn:substring(user.firstName, 0, 1)}${fn:substring(user.lastName, 0, 1)}</span>
                        </c:otherwise>
                    </c:choose>
                </div>
                <div class="profile-name">${user.firstName}</div>
                <i class="fas fa-chevron-down profile-arrow"></i>
                <div class="dropdown-menu-custom">
                    <a href="profile" class="dropdown-item-custom">
                        <i class="fas fa-user-circle"></i> My Profile
                    </a>
                    <a href="settings" class="dropdown-item-custom">
                        <i class="fas fa-cog"></i> Settings
                    </a>
                    <a href="certificates" class="dropdown-item-custom">
                        <i class="fas fa-certificate"></i> My Certificates
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
    
    <!-- Stats Cards -->
    <div class="stats-grid">
        <div class="stat-card">
            <div class="stat-icon"><i class="fas fa-user-check"></i></div>
            <div class="stat-value">${profileCompletion}%</div>
            <div class="stat-label">Profile Complete</div>
        </div>
        <div class="stat-card">
            <div class="stat-icon"><i class="fas fa-briefcase"></i></div>
            <div class="stat-value">0</div>
            <div class="stat-label">Applications Sent</div>
        </div>
        <div class="stat-card">
            <div class="stat-icon"><i class="fas fa-certificate"></i></div>
            <div class="stat-value">0</div>
            <div class="stat-label">Certificates</div>
        </div>
        <div class="stat-card">
            <div class="stat-icon"><i class="fas fa-calendar-week"></i></div>
            <div class="stat-value">0</div>
            <div class="stat-label">Interviews</div>
        </div>
    </div>
    
    <!-- Profile Incomplete Alert -->
    <c:if test="${!isProfileComplete}">
        <div class="alert-incomplete">
            <div>
                <i class="fas fa-info-circle"></i>
                <span>Complete your profile to unlock internship opportunities</span>
            </div>
            <a href="completeProfile" class="btn-complete">
                <i class="fas fa-edit"></i> Complete Profile
            </a>
        </div>
    </c:if>
    
    <!-- Profile Card -->
    <div class="profile-card">
        <div class="profile-cover"></div>
        <div class="profile-avatar-wrapper">
            <div class="profile-avatar-large">
                <c:choose>
                    <c:when test="${not empty user.profilePicURL}">
                        <img src="${user.profilePicURL}" alt="${user.firstName}">
                    </c:when>
                    <c:otherwise>
                        <span>${fn:substring(user.firstName, 0, 1)}${fn:substring(user.lastName, 0, 1)}</span>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
        <div class="profile-info">
            <h3>${user.firstName} ${user.lastName}</h3>
            <p><i class="fas fa-envelope"></i> ${user.email}</p>
            <p><i class="fas fa-phone-alt"></i> ${user.phone}</p>
        </div>
    </div>
    
    <!-- Basic Information Section -->
    <div class="info-section">
        <div class="section-header">
            <div class="section-icon"><i class="fas fa-id-card"></i></div>
            <h4>Basic Information</h4>
        </div>
        <div class="info-grid">
            <div class="info-item">
                <div class="info-label"><i class="fas fa-user"></i> Full Name</div>
                <div class="info-value">${user.firstName} ${user.lastName}</div>
            </div>
            <div class="info-item">
                <div class="info-label"><i class="fas fa-envelope"></i> Email Address</div>
                <div class="info-value">${user.email}</div>
            </div>
            <div class="info-item">
                <div class="info-label"><i class="fas fa-phone-alt"></i> Phone Number</div>
                <div class="info-value">${user.phone}</div>
            </div>
            <div class="info-item">
                <div class="info-label"><i class="fas fa-venus-mars"></i> Gender</div>
                <div class="info-value">
                    <c:choose>
                        <c:when test="${user.gender eq 'MALE'}">
                            <i class="fas fa-mars"></i> Male
                        </c:when>
                        <c:when test="${user.gender eq 'FEMALE'}">
                            <i class="fas fa-venus"></i> Female
                        </c:when>
                        <c:otherwise>
                            ${user.gender}
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Student Details Section (Only if profile complete) -->
    <c:if test="${isProfileComplete}">
        <div class="info-section">
            <div class="section-header">
                <div class="section-icon"><i class="fas fa-graduation-cap"></i></div>
                <h4>Academic Details</h4>
            </div>
            <div class="info-grid">
                <div class="info-item">
                    <div class="info-label"><i class="fas fa-university"></i> College</div>
                    <div class="info-value">${studentDetail.collegeName}</div>
                </div>
                <div class="info-item">
                    <div class="info-label"><i class="fas fa-map-marker-alt"></i> City</div>
                    <div class="info-value">${studentDetail.city}</div>
                </div>
                <div class="info-item">
                    <div class="info-label"><i class="fas fa-map"></i> State</div>
                    <div class="info-value">${studentDetail.state}</div>
                </div>
                <div class="info-item">
                    <div class="info-label"><i class="fas fa-graduation-cap"></i> Degree</div>
                    <div class="info-value">${studentDetail.degree}</div>
                </div>
                <div class="info-item">
                    <div class="info-label"><i class="fas fa-book-open"></i> Semester</div>
                    <div class="info-value">${studentDetail.semester}</div>
                </div>
                <div class="info-item">
                    <div class="info-label"><i class="fas fa-calendar-alt"></i> Graduation Year</div>
                    <div class="info-value">${studentDetail.graduationYear}</div>
                </div>
            </div>
        </div>
    </c:if>
    
    <!-- Back Button -->
    <a href="studentDashboard" class="btn-back">
        <i class="fas fa-arrow-left"></i> Back to Dashboard
    </a>
    
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
    duration: 600,
    once: true,
    offset: 50
});

document.querySelector('.notification-badge')?.addEventListener('click', function() {
    alert('You have 3 new notifications');
});
</script>
</body>
</html>