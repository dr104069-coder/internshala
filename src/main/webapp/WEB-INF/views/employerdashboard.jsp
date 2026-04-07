<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.format.DateTimeFormatter" %>

<%
    com.grownited.entity.UserEntity user = (com.grownited.entity.UserEntity) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect(request.getContextPath() + "/login");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Employer Dashboard | Internship Manager</title>

<script src="https://cdn.tailwindcss.com"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<link href="https://fonts.googleapis.com/css2?family=Inter:opsz,wght@14..32,300;400;500;600;700;800&display=swap" rel="stylesheet">

<style>
* {
    font-family: 'Inter', sans-serif;
}

body {
    background: linear-gradient(-45deg, #0f0c29, #302b63, #24243e, #1a1a2e);
    background-size: 400% 400%;
    animation: gradientFlow 15s ease infinite;
}

@keyframes gradientFlow {
    0% { background-position: 0% 50%; }
    50% { background-position: 100% 50%; }
    100% { background-position: 0% 50%; }
}

/* Sidebar - Dark Neon */
.sidebar {
    background: rgba(10, 10, 20, 0.95);
    backdrop-filter: blur(20px);
    border-right: 1px solid rgba(138, 92, 246, 0.3);
    position: relative;
}

.sidebar::before {
    content: '';
    position: absolute;
    top: 0;
    right: 0;
    width: 2px;
    height: 100%;
    background: linear-gradient(to bottom, #8b5cf6, #ec4899, #8b5cf6);
    animation: borderPulse 3s ease infinite;
}

@keyframes borderPulse {
    0%, 100% { opacity: 0.3; }
    50% { opacity: 1; }
}

.sidebar-item {
    transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
    position: relative;
    overflow: hidden;
}

.sidebar-item::before {
    content: '';
    position: absolute;
    top: 50%;
    left: 50%;
    width: 0;
    height: 0;
    border-radius: 50%;
    background: rgba(139, 92, 246, 0.1);
    transform: translate(-50%, -50%);
    transition: width 0.6s, height 0.6s;
}

.sidebar-item:hover::before {
    width: 100%;
    height: 100%;
}

.sidebar-item:hover {
    background: linear-gradient(90deg, rgba(139, 92, 246, 0.1) 0%, rgba(236, 72, 153, 0.1) 100%);
    border-left: 4px solid #8b5cf6;
    padding-left: 20px;
    transform: translateX(5px);
    text-shadow: 0 0 10px rgba(139, 92, 246, 0.5);
}

/* Profile Section */
.profile-container {
    position: relative;
    display: inline-block;
}

.profile-img-large {
    width: 100px;
    height: 100px;
    border-radius: 50%;
    object-fit: cover;
    border: 3px solid transparent;
    background: linear-gradient(135deg, #8b5cf6, #ec4899, #8b5cf6) padding-box, 
                linear-gradient(135deg, #8b5cf6, #ec4899, #8b5cf6) border-box;
    transition: all 0.3s ease;
    box-shadow: 0 0 30px rgba(139, 92, 246, 0.4);
    animation: profileGlow 3s ease infinite;
}

@keyframes profileGlow {
    0%, 100% { box-shadow: 0 0 20px rgba(139, 92, 246, 0.4); }
    50% { box-shadow: 0 0 40px rgba(236, 72, 153, 0.6); }
}

.profile-img-large:hover {
    transform: scale(1.05) rotate(5deg);
    animation: none;
    box-shadow: 0 0 50px rgba(139, 92, 246, 0.8);
}

.online-indicator {
    position: absolute;
    bottom: 5px;
    right: 5px;
    width: 16px;
    height: 16px;
    background: #10b981;
    border: 2px solid #0a0a14;
    border-radius: 50%;
    animation: pulse 2s infinite;
}

@keyframes pulse {
    0% { transform: scale(0.95); box-shadow: 0 0 0 0 rgba(16, 185, 129, 0.7); }
    70% { transform: scale(1); box-shadow: 0 0 0 10px rgba(16, 185, 129, 0); }
    100% { transform: scale(0.95); box-shadow: 0 0 0 0 rgba(16, 185, 129, 0); }
}

/* Status Badges - Neon Purple/Pink */
.status-badge {
    padding: 6px 14px;
    border-radius: 9999px;
    font-size: 12px;
    font-weight: 600;
    letter-spacing: 0.3px;
    display: inline-flex;
    align-items: center;
    gap: 6px;
    transition: all 0.3s ease;
}

.status-active { 
    background: linear-gradient(135deg, #8b5cf6 0%, #a78bfa 100%);
    color: white;
    box-shadow: 0 0 15px rgba(139, 92, 246, 0.5);
}

.status-completed { 
    background: linear-gradient(135deg, #6b7280 0%, #9ca3af 100%);
    color: white;
    box-shadow: 0 0 15px rgba(107, 114, 128, 0.5);
}

.status-applications-closed { 
    background: linear-gradient(135deg, #f59e0b 0%, #fbbf24 100%);
    color: white;
    box-shadow: 0 0 15px rgba(245, 158, 11, 0.5);
}

/* Timeline indicator */
.timeline-indicator {
    display: flex;
    align-items: center;
    gap: 8px;
    margin-top: 12px;
    padding: 8px 12px;
    background: rgba(0, 0, 0, 0.3);
    border-radius: 12px;
    font-size: 12px;
}

.timeline-dot {
    width: 8px;
    height: 8px;
    border-radius: 50%;
    display: inline-block;
}

.timeline-dot-green { background: #10b981; box-shadow: 0 0 8px #10b981; }
.timeline-dot-orange { background: #f59e0b; box-shadow: 0 0 8px #f59e0b; }
.timeline-dot-gray { background: #6b7280; box-shadow: 0 0 8px #6b7280; }

/* Internship Card */
.internship-card {
    position: relative;
    transition: all 0.5s cubic-bezier(0.4, 0, 0.2, 1);
    animation: cardFloat 0.6s ease-out forwards;
    opacity: 0;
    border-radius: 1.5rem;
    overflow: hidden;
    cursor: pointer;
}

/* Different gradient backgrounds for each card based on status */
.internship-card[data-status="active"] {
    background: linear-gradient(135deg, rgba(139, 92, 246, 0.25), rgba(139, 92, 246, 0.15));
    border: 1px solid rgba(139, 92, 246, 0.5);
}

.internship-card[data-status="completed"] {
    background: linear-gradient(135deg, rgba(107, 114, 128, 0.25), rgba(107, 114, 128, 0.15));
    border: 1px solid rgba(107, 114, 128, 0.5);
}

.internship-card[data-status="applications closed"] {
    background: linear-gradient(135deg, rgba(245, 158, 11, 0.25), rgba(245, 158, 11, 0.15));
    border: 1px solid rgba(245, 158, 11, 0.5);
}

.internship-card::before {
    content: '';
    position: absolute;
    top: 0;
    left: -100%;
    width: 100%;
    height: 100%;
    background: linear-gradient(90deg, transparent, rgba(139, 92, 246, 0.2), transparent);
    transition: left 0.6s ease;
}

.internship-card:hover::before {
    left: 100%;
}

.internship-card:hover {
    transform: translateY(-10px) scale(1.02);
    box-shadow: 0 25px 40px -15px rgba(0, 0, 0, 0.5);
}

.internship-card[data-status="active"]:hover {
    box-shadow: 0 25px 40px -15px rgba(139, 92, 246, 0.5);
    border-color: rgba(139, 92, 246, 0.8);
}

.internship-card[data-status="completed"]:hover {
    box-shadow: 0 25px 40px -15px rgba(107, 114, 128, 0.5);
    border-color: rgba(107, 114, 128, 0.8);
}

.internship-card[data-status="applications closed"]:hover {
    box-shadow: 0 25px 40px -15px rgba(245, 158, 11, 0.5);
    border-color: rgba(245, 158, 11, 0.8);
}

@keyframes cardFloat {
    0% {
        opacity: 0;
        transform: translateY(50px) rotateX(-10deg);
    }
    100% {
        opacity: 1;
        transform: translateY(0) rotateX(0);
    }
}

/* Stats Cards - Glass Gradient */
.stat-card {
    background: rgba(20, 20, 40, 0.6);
    backdrop-filter: blur(15px);
    border: 1px solid rgba(139, 92, 246, 0.3);
    transition: all 0.4s ease;
    border-radius: 1.5rem;
    animation: statSlide 0.5s ease-out backwards;
}

@keyframes statSlide {
    from {
        opacity: 0;
        transform: translateX(-30px);
    }
    to {
        opacity: 1;
        transform: translateX(0);
    }
}

.stat-card:hover {
    transform: translateY(-5px) scale(1.02);
    border-color: rgba(139, 92, 246, 0.8);
    box-shadow: 0 20px 35px -10px rgba(139, 92, 246, 0.4);
    background: rgba(20, 20, 40, 0.8);
}

.stat-card:nth-child(1) { animation-delay: 0s; }
.stat-card:nth-child(2) { animation-delay: 0.1s; }
.stat-card:nth-child(3) { animation-delay: 0.2s; }
.stat-card:nth-child(4) { animation-delay: 0.3s; }

/* Button Styles */
.btn-primary {
    background: linear-gradient(135deg, #8b5cf6, #ec4899);
    transition: all 0.3s ease;
    border: none;
    position: relative;
    overflow: hidden;
}

.btn-primary::before {
    content: '';
    position: absolute;
    top: 50%;
    left: 50%;
    width: 0;
    height: 0;
    border-radius: 50%;
    background: rgba(255, 255, 255, 0.3);
    transform: translate(-50%, -50%);
    transition: width 0.6s, height 0.6s;
}

.btn-primary:hover::before {
    width: 300px;
    height: 300px;
}

.btn-primary:hover {
    transform: translateY(-2px);
    box-shadow: 0 10px 30px rgba(139, 92, 246, 0.5);
}

/* Pagination - Neon */
.pagination-btn {
    transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
    font-weight: 500;
    background: rgba(20, 20, 40, 0.8);
    backdrop-filter: blur(10px);
    border: 1px solid rgba(139, 92, 246, 0.4);
    color: #a78bfa;
}

.pagination-btn:hover:not(:disabled) {
    transform: translateY(-3px);
    background: linear-gradient(135deg, #8b5cf6, #ec4899);
    color: white;
    border-color: transparent;
    box-shadow: 0 5px 20px rgba(139, 92, 246, 0.5);
}

.pagination-btn.active {
    background: linear-gradient(135deg, #8b5cf6, #ec4899);
    color: white;
    border-color: transparent;
    box-shadow: 0 5px 15px rgba(139, 92, 246, 0.4);
}

/* Search Input */
.search-input {
    transition: all 0.3s ease;
    background: rgba(20, 20, 40, 0.8);
    border: 2px solid rgba(139, 92, 246, 0.4);
    border-radius: 1rem;
    color: white;
}

.search-input:focus {
    transform: translateY(-2px);
    box-shadow: 0 10px 25px -5px rgba(139, 92, 246, 0.4);
    border-color: #a78bfa;
    outline: none;
    background: rgba(20, 20, 40, 1);
}

.search-input::placeholder {
    color: rgba(255, 255, 255, 0.5);
}

/* Custom Scrollbar */
::-webkit-scrollbar {
    width: 10px;
    height: 10px;
}

::-webkit-scrollbar-track {
    background: rgba(20, 20, 40, 0.5);
    border-radius: 10px;
}

::-webkit-scrollbar-thumb {
    background: linear-gradient(135deg, #8b5cf6, #ec4899);
    border-radius: 10px;
}

::-webkit-scrollbar-thumb:hover {
    background: linear-gradient(135deg, #a78bfa, #f43f5e);
}

/* Page Size Selector */
.page-size-select {
    background: rgba(20, 20, 40, 0.8);
    border: 1px solid rgba(139, 92, 246, 0.4);
    color: #a78bfa;
    transition: all 0.3s ease;
}

.page-size-select:hover {
    border-color: #a78bfa;
    transform: translateY(-1px);
}

/* Typography */
.text-gradient {
    background: linear-gradient(135deg, #a78bfa, #ec4899);
    -webkit-background-clip: text;
    background-clip: text;
    color: transparent;
}
</style>

</head>
<body>

<div class="flex h-screen">

    <!-- Sidebar -->
    <aside class="sidebar w-80 shadow-2xl flex flex-col">
        
        <div class="p-8 border-b border-white/10 flex flex-col items-center space-y-4">
            <div class="profile-container">
                <img 
                    src="${user.profilePicURL != null ? user.profilePicURL : pageContext.request.contextPath.concat('/images/default-profile.png')}" 
                    class="profile-img-large"
                    alt="Profile">
                <div class="online-indicator"></div>
            </div>
            <div class="text-center">
                <h3 class="text-xl font-bold text-white">${user.firstName} ${user.lastName}</h3>
                <p class="text-sm text-purple-300/60 mt-1">${user.email}</p>
                <span class="inline-block mt-2 px-3 py-1 bg-gradient-to-r from-purple-500/20 to-pink-500/20 text-purple-300 rounded-full text-xs backdrop-blur-sm border border-purple-500/30">
                    <i class="fas fa-building mr-1"></i> Employer
                </span>
            </div>
            <a href="${pageContext.request.contextPath}/viewemployerProfile"
               class="text-sm text-purple-400 hover:text-purple-300 transition-colors duration-200 inline-flex items-center gap-2 mt-2">
               <i class="fas fa-user-edit"></i> Edit Profile
               <i class="fas fa-arrow-right text-xs"></i>
            </a>
        </div>

        <nav class="flex-1 p-6 space-y-3">
            <a href="${pageContext.request.contextPath}/employerdashboard"
               class="sidebar-item block p-3 rounded-xl text-gray-300 transition-all duration-300">
                <i class="fas fa-chart-line mr-3 w-5"></i> Dashboard
            </a>
            <a href="${pageContext.request.contextPath}/createInternship"
               class="sidebar-item block p-3 rounded-xl text-gray-300 transition-all duration-300">
                <i class="fas fa-plus-circle mr-3 w-5"></i> Post Internship
            </a>
            <a href="${pageContext.request.contextPath}/employerApplications"
               class="sidebar-item block p-3 rounded-xl text-gray-300 transition-all duration-300">
                <i class="fas fa-file-alt mr-3 w-5"></i> Applications
                <span class="float-right bg-gradient-to-r from-pink-500 to-rose-500 text-white text-xs px-2 py-1 rounded-full animate-pulse">${applications.size()}</span>
            </a>
            <a href="${pageContext.request.contextPath}/listInternship"
               class="sidebar-item block p-3 rounded-xl text-gray-300 transition-all duration-300">
                <i class="fas fa-briefcase mr-3 w-5"></i> All Internships
            </a>
            <div class="pt-8 mt-8 border-t border-white/10">
                <a href="${pageContext.request.contextPath}/logout"
                   class="sidebar-item block p-3 rounded-xl text-red-400 transition-all duration-300">
                    <i class="fas fa-sign-out-alt mr-3 w-5"></i> Logout
                </a>
            </div>
        </nav>
        
        <div class="p-6 border-t border-white/10 text-center">
            <p class="text-xs text-white/40">© 2026 Internship Portal</p>
            <p class="text-xs text-purple-400/40 mt-1 animate-pulse">By ✨ Rathod Darshan</p>
        </div>
    </aside>

    <!-- Main Content -->
    <main class="flex-1 p-8 overflow-y-auto">

        <div class="mb-8">
            <h2 class="text-4xl font-bold mb-2">
                <span class="text-gradient">Welcome back, ${user.firstName}! ✨</span>
            </h2>
            <p class="text-white/60 text-lg">Manage your internships and track student applications</p>
        </div>

        <!-- Stats Cards -->
        <div class="grid grid-cols-1 md:grid-cols-4 gap-6 mb-8">
            <div class="stat-card rounded-2xl p-6">
                <div class="flex items-center justify-between">
                    <div>
                        <p class="text-purple-300/80 text-sm font-medium">Total Internships</p>
                        <p class="text-3xl font-bold text-white mt-2">${internships.size()}</p>
                    </div>
                    <i class="fas fa-briefcase text-4xl text-purple-500 opacity-50"></i>
                </div>
            </div>
            
            <div class="stat-card rounded-2xl p-6">
                <div class="flex items-center justify-between">
                    <div>
                        <p class="text-purple-300/80 text-sm font-medium">Active Internships</p>
                        <p class="text-3xl font-bold text-white mt-2">
                            <c:set var="activeCount" value="0" />
                            <c:forEach items="${internships}" var="i">
                                <c:if test="${i.status eq 'ACTIVE'}">
                                    <c:set var="activeCount" value="${activeCount + 1}" />
                                </c:if>
                            </c:forEach>
                            ${activeCount}
                        </p>
                    </div>
                    <i class="fas fa-play-circle text-4xl text-purple-400 opacity-50"></i>
                </div>
            </div>
            
            <div class="stat-card rounded-2xl p-6">
                <div class="flex items-center justify-between">
                    <div>
                        <p class="text-purple-300/80 text-sm font-medium">Completed</p>
                        <p class="text-3xl font-bold text-white mt-2">
                            <c:set var="completedCount" value="0" />
                            <c:forEach items="${internships}" var="i">
                                <c:if test="${i.status eq 'COMPLETED'}">
                                    <c:set var="completedCount" value="${completedCount + 1}" />
                                </c:if>
                            </c:forEach>
                            ${completedCount}
                        </p>
                    </div>
                    <i class="fas fa-check-double text-4xl text-gray-400 opacity-50"></i>
                </div>
            </div>
            
            <div class="stat-card rounded-2xl p-6">
                <div class="flex items-center justify-between">
                    <div>
                        <p class="text-purple-300/80 text-sm font-medium">Applications</p>
                        <p class="text-3xl font-bold text-white mt-2">${applications.size()}</p>
                    </div>
                    <i class="fas fa-users text-4xl text-pink-500 opacity-50"></i>
                </div>
            </div>
        </div>

        <!-- Internships Section -->
        <div class="rounded-2xl shadow-2xl overflow-hidden">
            <div class="bg-gradient-to-r from-purple-900/30 via-pink-900/30 to-purple-900/30 backdrop-blur-sm px-8 py-6 border-b border-white/10">
                <div class="flex justify-between items-center flex-wrap gap-4">
                    <div>
                        <h3 class="text-2xl font-bold text-gradient flex items-center gap-3">
                            <i class="fas fa-sparkle text-purple-400"></i>
                            Your Internships
                        </h3>
                        <p class="text-white/50 mt-1">Manage and monitor all your posted internship opportunities</p>
                    </div>
                    <a href="${pageContext.request.contextPath}/createInternship"
                       class="btn-primary text-white px-6 py-3 rounded-xl inline-flex items-center gap-2 font-semibold shadow-lg">
                        <i class="fas fa-plus-circle"></i>
                        Post New Internship
                    </a>
                </div>
                
                <!-- Search and Page Size -->
                <div class="mt-6 flex justify-between items-center gap-4 flex-wrap">
                    <div class="flex items-center gap-3">
                        <label class="text-sm font-medium text-purple-300">
                            <i class="fas fa-layer-group mr-1"></i> Show:
                        </label>
                        <select id="pageSizeSelect" class="page-size-select px-3 py-2 rounded-lg">
                            <option value="3">3 per page</option>
                            <option value="5">5 per page</option>
                            <option value="10">10 per page</option>
                            <option value="20">20 per page</option>
                        </select>
                    </div>
                    <div class="relative w-80">
                        <i class="fas fa-search absolute left-4 top-1/2 transform -translate-y-1/2 text-purple-400"></i>
                        <input type="text" id="searchInput" 
                               class="search-input w-full pl-11 pr-4 py-2.5 rounded-xl"
                               placeholder="🔍 Search by title, location, status...">
                    </div>
                </div>
            </div>

            <!-- Internship Cards Container -->
            <div id="internshipsContainer" class="p-8 bg-black/20">
                <c:if test="${not empty internships}">
                    <c:forEach items="${internships}" var="i" varStatus="loop">
                        <!-- Get current date and internship dates -->
                        <c:set var="currentDate" value="${today}" />
                        <c:set var="endDate" value="${i.endDate}" />
                        <c:set var="lastApplyDate" value="${i.lastApplyDate}" />
                        
                        <!-- Check if applications are closed (lastApplyDate has passed) -->
                        <c:set var="applicationsClosed" value="false" />
                        <c:if test="${lastApplyDate != null && lastApplyDate < currentDate}">
                            <c:set var="applicationsClosed" value="true" />
                        </c:if>
                        
                        <!-- Check if end date has passed -->
                        <c:set var="endDatePassed" value="false" />
                        <c:if test="${endDate != null && endDate < currentDate}">
                            <c:set var="endDatePassed" value="true" />
                        </c:if>
                        
                        <!-- Determine display status for card styling -->
                        <c:set var="displayStatus" value="" />
                        <c:if test="${i.status eq 'COMPLETED'}">
                            <c:set var="displayStatus" value="completed" />
                        </c:if>
                        <c:if test="${i.status eq 'ACTIVE' && applicationsClosed && !endDatePassed}">
                            <c:set var="displayStatus" value="applications closed" />
                        </c:if>
                        <c:if test="${i.status eq 'ACTIVE' && !applicationsClosed && !endDatePassed}">
                            <c:set var="displayStatus" value="active" />
                        </c:if>
                        <c:if test="${i.status eq 'ACTIVE' && endDatePassed}">
                            <c:set var="displayStatus" value="completed" />
                        </c:if>
                        
                        <!-- Determine if this is a new internship (created in last 7 days) -->
                        <c:set var="isNew" value="false" />
                        <c:if test="${i.createdAt != null}">
                            <c:set var="daysSinceCreated" value="${currentDate.toEpochDay() - i.createdAt.toLocalDate().toEpochDay()}" />
                            <c:if test="${daysSinceCreated <= 7}">
                                <c:set var="isNew" value="true" />
                            </c:if>
                        </c:if>
                        
                        <div class="internship-card rounded-2xl p-6 mb-4 shadow-lg" 
                             data-status="${displayStatus}"
                             data-title="${i.title.toLowerCase()}" 
                             data-location="${i.location != null ? i.location.toLowerCase() : ''}" 
                             data-description="${i.description != null ? i.description.toLowerCase() : ''}"
                             data-created="${i.createdAt}">
                            
                            <div class="flex justify-between items-start">
                                <div class="flex-1">
                                    <div class="flex items-center gap-3 mb-3 flex-wrap">
                                        <h4 class="text-xl font-bold text-white">${i.title}</h4>
                                        
                                        <!-- NEW Badge for recent internships -->
                                        <c:if test="${isNew}">
                                            <span class="text-xs bg-gradient-to-r from-green-500 to-emerald-500 text-white px-2 py-1 rounded-full animate-pulse">
                                                <i class="fas fa-star"></i> NEW
                                            </span>
                                        </c:if>
                                        
                                        <!-- Status Badge - UPDATED PRIORITY LOGIC -->
                                        <c:choose>
                                            <c:when test="${i.status eq 'COMPLETED' || endDatePassed}">
                                                <span class="status-badge status-completed">
                                                    <i class="fas fa-check-double"></i> COMPLETED
                                                </span>
                                            </c:when>
                                            <c:when test="${i.status eq 'ACTIVE'}">
                                                <c:choose>
                                                    <c:when test="${applicationsClosed}">
                                                        <span class="status-badge status-applications-closed">
                                                            <i class="fas fa-door-closed"></i> APPLICATIONS CLOSED
                                                        </span>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span class="status-badge status-active">
                                                            <i class="fas fa-play"></i> ACTIVE
                                                        </span>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:when>
                                        </c:choose>
                                    </div>
                                    
                                    <!-- Internship Details Grid -->
                                    <div class="grid grid-cols-2 md:grid-cols-4 gap-4 mb-4">
                                        <div class="flex items-center gap-2 text-purple-300">
                                            <i class="fas fa-calendar-plus w-4"></i>
                                            <span class="text-sm">Posted: ${i.createdAt != null ? i.createdAt.toString().substring(0,10) : 'N/A'}</span>
                                        </div>
                                        <div class="flex items-center gap-2 text-purple-300">
                                            <i class="fas fa-calendar-check w-4"></i>
                                            <span class="text-sm">Last Apply: ${i.lastApplyDate != null ? i.lastApplyDate : 'N/A'}</span>
                                            <c:if test="${lastApplyDate != null && lastApplyDate < currentDate && i.status eq 'ACTIVE'}">
                                                <span class="text-xs text-orange-400 ml-1">(Closed)</span>
                                            </c:if>
                                        </div>
                                        <div class="flex items-center gap-2 text-purple-300">
                                            <i class="fas fa-calendar-times w-4"></i>
                                            <span class="text-sm">End Date: ${i.endDate != null ? i.endDate : 'Not set'}</span>
                                            <c:if test="${endDate != null && endDate < currentDate}">
                                                <c:choose>
                                                    <c:when test="${i.status eq 'COMPLETED'}">
                                                        <span class="text-xs text-green-400 ml-1">(Completed)</span>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span class="text-xs text-red-400 ml-1">(Passed)</span>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:if>
                                        </div>
                                        <div class="flex items-center gap-2 text-purple-300">
                                            <i class="fas fa-map-marker-alt w-4"></i>
                                            <span class="text-sm">${i.location != null ? i.location : 'Remote'}</span>
                                        </div>
                                        <div class="flex items-center gap-2 text-purple-300">
                                            <i class="fas fa-rupee-sign w-4"></i>
                                            <span class="text-sm">${i.stipend != null ? i.stipend : 'Unpaid'}</span>
                                        </div>
                                        <div class="flex items-center gap-2 text-purple-300">
                                            <i class="fas fa-users w-4"></i>
                                            <span class="text-sm">Openings: ${i.openings}</span>
                                        </div>
                                    </div>
                                    
                                    <p class="text-white/70 mb-4 line-clamp-2">${i.description != null ? i.description : 'No description provided'}</p>
                                    
                                    <!-- Timeline Indicator -->
                                    <div class="timeline-indicator">
                                        <c:choose>
                                            <c:when test="${i.status eq 'COMPLETED' || endDatePassed}">
                                                <span class="timeline-dot timeline-dot-gray"></span>
                                                <span class="text-gray-400 text-xs">Internship Completed</span>
                                            </c:when>
                                            <c:when test="${applicationsClosed}">
                                                <span class="timeline-dot timeline-dot-orange"></span>
                                                <span class="text-orange-400 text-xs">Applications Closed • Internship in Progress</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="timeline-dot timeline-dot-green"></span>
                                                <span class="text-green-400 text-xs">Applications Open • Apply by: ${i.lastApplyDate}</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                    
                                    <!-- Action Buttons -->
                                    <div class="flex gap-3 flex-wrap mt-4">
                                        <!-- View Details Button -->
                                        <a href="${pageContext.request.contextPath}/employerViewInternship?internshipId=${i.internshipId}" 
                                           class="px-4 py-2 bg-gradient-to-r from-purple-600 to-pink-600 text-white rounded-lg hover:from-pink-600 hover:to-purple-700 transition-all duration-300 inline-flex items-center gap-2 shadow-md transform hover:scale-105">
                                            <i class="fas fa-eye"></i> View Details
                                        </a>
                                        
                                        <!-- View Students Button -->
                                        <a href="${pageContext.request.contextPath}/viewEnrolledStudents?internshipId=${i.internshipId}" 
                                           class="px-4 py-2 bg-gradient-to-r from-purple-500 to-indigo-600 text-white rounded-lg hover:from-indigo-600 hover:to-purple-600 transition-all duration-300 inline-flex items-center gap-2 shadow-md transform hover:scale-105">
                                            <i class="fas fa-users"></i> View Students 
                                            <c:if test="${i.status eq 'COMPLETED'}">
                                                <span class="ml-1 text-xs bg-green-500/40 px-2 py-0.5 rounded-full">
                                                    <i class="fas fa-check-circle"></i> Completed
                                                </span>
                                            </c:if>
                                            <c:if test="${i.status eq 'ACTIVE'}">
                                                <span class="ml-1 text-xs bg-yellow-500/40 px-2 py-0.5 rounded-full">
                                                    <i class="fas fa-clock"></i> Ongoing
                                                </span>
                                            </c:if>
                                        </a>
                                        
                                        
                                        
                                        <!-- Delete Button -->
                                        <button onclick="deleteInternship(${i.internshipId})" 
                                                class="px-4 py-2 bg-gradient-to-r from-red-500 to-pink-500 text-white rounded-lg hover:from-pink-500 hover:to-red-600 transition-all duration-300 inline-flex items-center gap-2 shadow-md transform hover:scale-105">
                                            <i class="fas fa-trash-alt"></i> Delete
                                        </button>
                                    </div>
                                </div>
                                
                                <!-- Poster Image -->
                                <c:if test="${i.posterUrl != null}">
                                    <img src="${i.posterUrl}" class="w-28 h-28 object-cover rounded-xl ml-4 shadow-lg" alt="Poster">
                                </c:if>
                            </div>
                        </div>
                    </c:forEach>
                </c:if>

                <!-- Empty State -->
                <c:if test="${empty internships}">
                    <div class="empty-state text-center py-16">
                        <div class="bg-gradient-to-r from-purple-900/20 via-pink-900/20 to-purple-900/20 rounded-2xl p-12 backdrop-blur-sm border border-white/10">
                            <i class="fas fa-sparkle text-7xl text-purple-400 mb-6 animate-bounce"></i>
                            <h3 class="text-2xl font-bold text-white mb-3">No Internships Posted Yet</h3>
                            <p class="text-white/50 mb-6">Start your journey by posting your first internship opportunity</p>
                            <a href="${pageContext.request.contextPath}/createInternship"
                               class="inline-flex items-center gap-2 bg-gradient-to-r from-purple-600 to-pink-600 text-white px-6 py-3 rounded-xl hover:from-pink-600 hover:to-purple-700 transition-all duration-300 font-semibold shadow-lg transform hover:scale-105">
                               <i class="fas fa-plus-circle"></i>
                               Create Your First Internship
                               <i class="fas fa-arrow-right"></i>
                            </a>
                        </div>
                    </div>
                </c:if>
            </div>
            
            <!-- Enhanced Pagination Controls -->
            <div id="paginationControls" class="px-8 py-4 border-t border-white/10 bg-black/30 flex justify-between items-center flex-wrap gap-4">
                <div id="paginationInfo" class="text-sm text-purple-300 font-medium">
                    <i class="fas fa-chart-simple mr-1"></i> Loading...
                </div>
                <div class="flex gap-2 items-center flex-wrap">
                    <button id="firstPageBtn" class="pagination-btn px-3 py-2 rounded-lg transition-all duration-300">
                        <i class="fas fa-angle-double-left"></i>
                    </button>
                    <button id="prevPageBtn" class="pagination-btn px-4 py-2 rounded-lg transition-all duration-300">
                        <i class="fas fa-chevron-left mr-1"></i> Prev
                    </button>
                    <div id="pageNumbers" class="flex gap-2"></div>
                    <button id="nextPageBtn" class="pagination-btn px-4 py-2 rounded-lg transition-all duration-300">
                        Next <i class="fas fa-chevron-right ml-1"></i>
                    </button>
                    <button id="lastPageBtn" class="pagination-btn px-3 py-2 rounded-lg transition-all duration-300">
                        <i class="fas fa-angle-double-right"></i>
                    </button>
                </div>
            </div>
        </div>

    </main>

</div>

<script>
// Enhanced Pagination and Search Logic
let allCards = [];
let currentPage = 1;
let itemsPerPage = 3;
let filteredCards = [];

function initializeCards() {
    const container = document.getElementById('internshipsContainer');
    const cards = container.querySelectorAll('.internship-card');
    allCards = Array.from(cards);
    updateFilteredCards();
}

function updateFilteredCards() {
    const searchTerm = document.getElementById('searchInput').value.toLowerCase().trim();
    
    if (searchTerm === '') {
        filteredCards = [...allCards];
    } else {
        filteredCards = allCards.filter(card => {
            const title = card.getAttribute('data-title') || '';
            const location = card.getAttribute('data-location') || '';
            const description = card.getAttribute('data-description') || '';
            return title.includes(searchTerm) || 
                   location.includes(searchTerm) || 
                   description.includes(searchTerm);
        });
    }
    
    currentPage = 1;
    renderCurrentPage();
    renderPagination();
}

function renderCurrentPage() {
    const start = (currentPage - 1) * itemsPerPage;
    const end = start + itemsPerPage;
    const pageCards = filteredCards.slice(start, end);
    
    allCards.forEach(card => {
        card.style.display = 'none';
    });
    
    pageCards.forEach(card => {
        card.style.display = 'block';
        card.style.animation = 'cardFloat 0.6s ease-out forwards';
    });
    
    const totalItems = filteredCards.length;
    const startItem = totalItems === 0 ? 0 : start + 1;
    const endItem = Math.min(end, totalItems);
    const paginationInfo = document.getElementById('paginationInfo');
    if (paginationInfo) {
        if (totalItems === 0) {
            paginationInfo.innerHTML = '<i class="fas fa-inbox mr-1"></i> No internships found';
        } else {
            paginationInfo.innerHTML = `<i class="fas fa-chart-simple mr-1"></i> Showing ${startItem} to ${endItem} of ${totalItems} internships |`;
        }
    }
    
    const emptyState = document.querySelector('.empty-state');
    if (filteredCards.length === 0 && allCards.length === 0) {
        if (emptyState) emptyState.style.display = 'block';
    } else if (filteredCards.length === 0 && allCards.length > 0) {
        let noResultMsg = document.getElementById('noResultMsg');
        if (!noResultMsg) {
            noResultMsg = document.createElement('div');
            noResultMsg.id = 'noResultMsg';
            noResultMsg.className = 'text-center py-12 bg-gradient-to-r from-purple-900/20 via-pink-900/20 to-purple-900/20 rounded-xl backdrop-blur-sm';
            noResultMsg.innerHTML = `
                <i class="fas fa-search-slash text-5xl text-purple-400 mb-4 animate-pulse"></i>
                <h3 class="text-xl font-semibold text-white mb-2">No matching internships found</h3>
                <p class="text-white/50">Try adjusting your search term ✨</p>
            `;
            document.getElementById('internshipsContainer').appendChild(noResultMsg);
        }
        noResultMsg.style.display = 'block';
        if (emptyState) emptyState.style.display = 'none';
    } else {
        const noResultMsg = document.getElementById('noResultMsg');
        if (noResultMsg) noResultMsg.style.display = 'none';
        if (emptyState && allCards.length === 0) {
            emptyState.style.display = 'block';
        } else if (emptyState) {
            emptyState.style.display = 'none';
        }
    }
}

function renderPagination() {
    const totalPages = Math.ceil(filteredCards.length / itemsPerPage);
    const pageNumbersDiv = document.getElementById('pageNumbers');
    const firstBtn = document.getElementById('firstPageBtn');
    const lastBtn = document.getElementById('lastPageBtn');
    const prevBtn = document.getElementById('prevPageBtn');
    const nextBtn = document.getElementById('nextPageBtn');
    
    if (!pageNumbersDiv) return;
    
    if (firstBtn) firstBtn.disabled = currentPage === 1;
    if (prevBtn) prevBtn.disabled = currentPage === 1;
    if (nextBtn) nextBtn.disabled = currentPage === totalPages || totalPages === 0;
    if (lastBtn) lastBtn.disabled = currentPage === totalPages || totalPages === 0;
    
    pageNumbersDiv.innerHTML = '';
    
    if (totalPages === 0) return;
    
    let startPage = Math.max(1, currentPage - 2);
    let endPage = Math.min(totalPages, currentPage + 2);
    
    if (currentPage <= 3) endPage = Math.min(totalPages, 5);
    if (currentPage >= totalPages - 2) startPage = Math.max(1, totalPages - 4);
    
    if (startPage > 1) {
        addPageButton(1, pageNumbersDiv);
        if (startPage > 2) addEllipsis(pageNumbersDiv);
    }
    
    for (let i = startPage; i <= endPage; i++) addPageButton(i, pageNumbersDiv);
    
    if (endPage < totalPages) {
        if (endPage < totalPages - 1) addEllipsis(pageNumbersDiv);
        addPageButton(totalPages, pageNumbersDiv);
    }
}

function addPageButton(pageNum, container) {
    const btn = document.createElement('button');
    btn.textContent = pageNum;
    btn.className = 'pagination-btn w-10 h-10 rounded-lg transition-all duration-300 ' + 
                    (currentPage === pageNum ? 'active' : '');
    btn.onclick = (function(p) {
        return function() { 
            currentPage = p; 
            renderCurrentPage(); 
            renderPagination();
            document.querySelector('#internshipsContainer').scrollIntoView({ behavior: 'smooth', block: 'start' });
        };
    })(pageNum);
    container.appendChild(btn);
}

function addEllipsis(container) {
    const span = document.createElement('span');
    span.innerHTML = '<i class="fas fa-ellipsis-h text-purple-400"></i>';
    span.className = 'px-2';
    container.appendChild(span);
}

// Event Listeners
document.addEventListener('DOMContentLoaded', () => {
    initializeCards();
    
    const searchInput = document.getElementById('searchInput');
    if (searchInput) {
        searchInput.addEventListener('input', () => updateFilteredCards());
    }
    
    const pageSizeSelect = document.getElementById('pageSizeSelect');
    if (pageSizeSelect) {
        pageSizeSelect.addEventListener('change', (e) => {
            itemsPerPage = parseInt(e.target.value);
            currentPage = 1;
            renderCurrentPage();
            renderPagination();
        });
    }
    
    const firstBtn = document.getElementById('firstPageBtn');
    const lastBtn = document.getElementById('lastPageBtn');
    const prevBtn = document.getElementById('prevPageBtn');
    const nextBtn = document.getElementById('nextPageBtn');
    
    if (firstBtn) {
        firstBtn.addEventListener('click', () => {
            if (currentPage > 1) {
                currentPage = 1;
                renderCurrentPage();
                renderPagination();
                document.querySelector('#internshipsContainer').scrollIntoView({ behavior: 'smooth', block: 'start' });
            }
        });
    }
    
    if (lastBtn) {
        lastBtn.addEventListener('click', () => {
            const totalPages = Math.ceil(filteredCards.length / itemsPerPage);
            if (currentPage < totalPages) {
                currentPage = totalPages;
                renderCurrentPage();
                renderPagination();
                document.querySelector('#internshipsContainer').scrollIntoView({ behavior: 'smooth', block: 'start' });
            }
        });
    }
    
    if (prevBtn) {
        prevBtn.addEventListener('click', () => {
            if (currentPage > 1) {
                currentPage--;
                renderCurrentPage();
                renderPagination();
                document.querySelector('#internshipsContainer').scrollIntoView({ behavior: 'smooth', block: 'start' });
            }
        });
    }
    
    if (nextBtn) {
        nextBtn.addEventListener('click', () => {
            const totalPages = Math.ceil(filteredCards.length / itemsPerPage);
            if (currentPage < totalPages) {
                currentPage++;
                renderCurrentPage();
                renderPagination();
                document.querySelector('#internshipsContainer').scrollIntoView({ behavior: 'smooth', block: 'start' });
            }
        });
    }
});

function deleteInternship(id) {
    if(confirm('⚠️ Are you sure you want to delete this internship? This action cannot be undone.')) {
        window.location.href = '${pageContext.request.contextPath}/deleteInternship?internshipId=' + id + '&t=' + new Date().getTime();
    }
}
</script>

</body>
</html>