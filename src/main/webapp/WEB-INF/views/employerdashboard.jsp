<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

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
<title>Employer Dashboard</title>

<script src="https://cdn.tailwindcss.com"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

<style>
body { font-family: 'Inter', sans-serif; background: #f9fafb; }
.sidebar-item:hover, .sidebar-item.active {
    background: linear-gradient(90deg, #eff6ff 0%, #ffffff 100%);
    border-left: 4px solid #3b82f6;
    padding-left: 20px;
    color: #2563eb;
    font-weight: 500;
}
.status-badge { padding: 4px 12px; border-radius: 9999px; font-size: 12px; }
.status-active { background: #dcfce7; color: #166534; }
.status-closing { background: #fed7aa; color: #9b2c1d; }
.status-expired { background: #fee2e2; color: #991b1b; }
</style>

</head>
<body>

<div class="flex h-screen">

    <!-- Sidebar -->
    <aside class="w-72 bg-white shadow-xl flex flex-col">
        
        <!-- Profile Section -->
        <div class="p-6 border-b flex items-center space-x-4">

            <!-- Profile Image -->
            <img 
                src="${user.profilePicURL != null ? user.profilePicURL : pageContext.request.contextPath.concat('/images/default-profile.png')}" 
                class="w-12 h-12 rounded-full border object-cover"
                alt="Profile">

            <!-- Name + Profile Link -->
            <div>
                <h3 class="text-sm font-semibold">${user.firstName}</h3>
                <a href="${pageContext.request.contextPath}/viewemployerProfile"
                   class="text-xs text-blue-600 hover:underline">
                   My Profile
                </a>
            </div>
        </div>

        <nav class="flex-1 p-4 space-y-2">

            <a href="${pageContext.request.contextPath}/employerdashboard"
               class="sidebar-item block p-3 rounded-xl">
                <i class="fas fa-chart-pie mr-2"></i> Dashboard
            </a>

            <a href="${pageContext.request.contextPath}/createInternship"
               class="sidebar-item block p-3 rounded-xl">
                <i class="fas fa-plus-circle mr-2"></i> Post Internship
            </a>

            <a href="${pageContext.request.contextPath}/applications"
               class="sidebar-item block p-3 rounded-xl">
                <i class="fas fa-users mr-2"></i> Applications
            </a>

            <a href="${pageContext.request.contextPath}/logout"
               class="sidebar-item block p-3 rounded-xl text-red-600">
                <i class="fas fa-sign-out-alt mr-2"></i> Logout
            </a>

        </nav>
    </aside>

    <!-- Main -->
    <main class="flex-1 p-8 overflow-y-auto">

        <!-- Header -->
        <div class="flex justify-between items-center mb-8">
            <h2 class="text-2xl font-bold">Welcome, ${user.firstName}</h2>

            <a href="${pageContext.request.contextPath}/createInternship"
               class="bg-blue-600 text-white px-5 py-2 rounded-lg shadow">
                + Post Internship
            </a>
        </div>

        <!-- Internship Table -->
        <div class="bg-white shadow rounded-xl p-5">
            <h3 class="text-lg font-semibold mb-4">Your Internships</h3>

            <table class="w-full">
                <thead class="bg-gray-100 text-gray-600 text-sm">
                    <tr>
                        <th class="p-3 text-left">Title</th>
                        <th class="p-3 text-left">Created</th>
                        <th class="p-3 text-left">Last Date</th>
                        <th class="p-3 text-left">Status</th>
                    </tr>
                </thead>

                <tbody>
                    <c:forEach items="${internships}" var="i">
                        <tr class="border-b hover:bg-gray-50">
                            <td class="p-3 font-medium">${i.title}</td>
                            <td class="p-3">
                                <fmt:formatDate value="${i.createdAt}" pattern="dd MMM yyyy"/>
                            </td>
                            <td class="p-3">
                                <fmt:formatDate value="${i.lastApplyDate}" pattern="dd MMM yyyy"/>
                            </td>
                            <td class="p-3">
                                <span class="status-badge 
                                    <c:choose>
                                        <c:when test="${i.status eq 'ACTIVE'}">status-active</c:when>
                                        <c:when test="${i.status eq 'CLOSING_SOON'}">status-closing</c:when>
                                        <c:otherwise>status-expired</c:otherwise>
                                    </c:choose>">
                                    ${i.status}
                                </span>
                            </td>
                        </tr>
                    </c:forEach>

                    <c:if test="${empty internships}">
                        <tr>
                            <td colspan="4" class="text-center p-6 text-gray-500">
                                No internships yet<br>
                                <a href="${pageContext.request.contextPath}/createInternship"
                                   class="text-blue-600 underline">
                                   Post your first internship
                                </a>
                            </td>
                        </tr>
                    </c:if>

                </tbody>
            </table>
        </div>

    </main>

</div>

</body>
</html>