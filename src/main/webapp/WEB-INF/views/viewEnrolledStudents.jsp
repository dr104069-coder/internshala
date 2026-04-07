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
<title>Enrolled Students | ${internship.title}</title>

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

/* Status Badges */
.status-badge {
    padding: 4px 12px;
    border-radius: 9999px;
    font-size: 12px;
    font-weight: 600;
    display: inline-flex;
    align-items: center;
    gap: 6px;
}

.status-ongoing {
    background: linear-gradient(135deg, #8b5cf6, #a78bfa);
    color: white;
}

.status-completed {
    background: linear-gradient(135deg, #10b981, #34d399);
    color: white;
}

.status-dropped {
    background: linear-gradient(135deg, #ef4444, #f87171);
    color: white;
}

/* Student Card */
.student-card {
    background: rgba(20, 20, 40, 0.6);
    backdrop-filter: blur(10px);
    border: 1px solid rgba(139, 92, 246, 0.3);
    transition: all 0.3s ease;
    border-radius: 1rem;
}

.student-card:hover {
    transform: translateY(-5px);
    border-color: rgba(139, 92, 246, 0.8);
    box-shadow: 0 10px 30px -10px rgba(139, 92, 246, 0.4);
    background: rgba(20, 20, 40, 0.8);
}

/* Stat Cards */
.stat-card {
    background: rgba(20, 20, 40, 0.6);
    backdrop-filter: blur(15px);
    border: 1px solid rgba(139, 92, 246, 0.3);
    transition: all 0.4s ease;
    border-radius: 1rem;
}

.stat-card:hover {
    transform: translateY(-3px);
    border-color: rgba(139, 92, 246, 0.8);
    box-shadow: 0 10px 25px -10px rgba(139, 92, 246, 0.4);
}

/* Profile Image */
.profile-img {
    width: 50px;
    height: 50px;
    border-radius: 50%;
    object-fit: cover;
    border: 2px solid #8b5cf6;
}

/* Rating Stars */
.star-rated {
    color: #fbbf24;
}

.star-unrated {
    color: #4b5563;
}

/* Button */
.btn-back {
    background: linear-gradient(135deg, #6b7280, #4b5563);
    transition: all 0.3s ease;
}

.btn-back:hover {
    transform: translateY(-2px);
    box-shadow: 0 5px 15px rgba(107, 114, 128, 0.4);
}

/* Custom Scrollbar */
::-webkit-scrollbar {
    width: 8px;
}

::-webkit-scrollbar-track {
    background: rgba(20, 20, 40, 0.5);
    border-radius: 10px;
}

::-webkit-scrollbar-thumb {
    background: linear-gradient(135deg, #8b5cf6, #ec4899);
    border-radius: 10px;
}
</style>

</head>
<body>

<div class="h-screen overflow-y-auto p-8">

    <!-- Back Button -->
    <div class="mb-6">
        <a href="${pageContext.request.contextPath}/employerdashboard" 
           class="btn-back inline-flex items-center gap-2 px-4 py-2 rounded-lg text-white">
            <i class="fas fa-arrow-left"></i> Back to Dashboard
        </a>
    </div>

    <!-- Internship Header -->
    <div class="mb-8">
        <h1 class="text-3xl font-bold text-white mb-2">
            <span class="text-gradient">${internship.title}</span>
        </h1>
        <div class="flex flex-wrap gap-4 text-white/60">
            <span><i class="fas fa-calendar-alt mr-1"></i> Posted: ${internship.createdAt != null ? internship.createdAt.toString().substring(0,10) : 'N/A'}</span>
            <span><i class="fas fa-hourglass-end mr-1"></i> End Date: ${internship.endDate != null ? internship.endDate : 'Not set'}</span>
            <span><i class="fas fa-map-marker-alt mr-1"></i> ${internship.location != null ? internship.location : 'Remote'}</span>
            <span><i class="fas fa-rupee-sign mr-1"></i> ${internship.stipend != null ? internship.stipend : 'Unpaid'}</span>
        </div>
    </div>

    <!-- Statistics Cards -->
    <div class="grid grid-cols-1 md:grid-cols-4 gap-6 mb-8">
        <div class="stat-card rounded-xl p-5">
            <div class="flex items-center justify-between">
                <div>
                    <p class="text-purple-300/80 text-sm">Total Enrolled</p>
                    <p class="text-2xl font-bold text-white mt-1">${totalStudents}</p>
                </div>
                <i class="fas fa-users text-3xl text-purple-500 opacity-50"></i>
            </div>
        </div>
        
        <div class="stat-card rounded-xl p-5">
            <div class="flex items-center justify-between">
                <div>
                    <p class="text-purple-300/80 text-sm">Ongoing</p>
                    <p class="text-2xl font-bold text-white mt-1">${ongoingCount}</p>
                </div>
                <i class="fas fa-play-circle text-3xl text-purple-400 opacity-50"></i>
            </div>
        </div>
        
        <div class="stat-card rounded-xl p-5">
            <div class="flex items-center justify-between">
                <div>
                    <p class="text-purple-300/80 text-sm">Completed</p>
                    <p class="text-2xl font-bold text-white mt-1">${completedCount}</p>
                </div>
                <i class="fas fa-check-circle text-3xl text-green-500 opacity-50"></i>
            </div>
        </div>
        
        <div class="stat-card rounded-xl p-5">
            <div class="flex items-center justify-between">
                <div>
                    <p class="text-purple-300/80 text-sm">Dropped</p>
                    <p class="text-2xl font-bold text-white mt-1">${droppedCount}</p>
                </div>
                <i class="fas fa-times-circle text-3xl text-red-500 opacity-50"></i>
            </div>
        </div>
    </div>

    <!-- Students List -->
    <div class="rounded-2xl shadow-2xl overflow-hidden">
        <div class="bg-gradient-to-r from-purple-900/30 via-pink-900/30 to-purple-900/30 backdrop-blur-sm px-8 py-6 border-b border-white/10">
            <h3 class="text-2xl font-bold text-gradient flex items-center gap-3">
                <i class="fas fa-user-graduate text-purple-400"></i>
                Enrolled Students
            </h3>
            <p class="text-white/50 mt-1">List of all students enrolled in this internship</p>
        </div>

        <div class="p-8 bg-black/20">
            <c:choose>
                <c:when test="${not empty enrollments}">
                    <div class="space-y-4">
                        <c:forEach items="${enrollments}" var="enrollment">
                            <div class="student-card p-5 rounded-xl">
                                <div class="flex flex-wrap justify-between items-start gap-4">
                                    <!-- Student Info -->
                                    <div class="flex items-start gap-4 flex-1">
                                        <img src="${enrollment.student.profilePicURL != null ? enrollment.student.profilePicURL : pageContext.request.contextPath.concat('/images/default-profile.png')}" 
                                             class="profile-img" alt="Student">
                                        <div>
                                            <h4 class="text-lg font-semibold text-white">
                                                ${enrollment.student.firstName} ${enrollment.student.lastName}
                                            </h4>
                                            <p class="text-sm text-purple-300/70">${enrollment.student.email}</p>
                                            <div class="flex flex-wrap gap-4 mt-2 text-sm text-white/50">
                                                <span><i class="fas fa-calendar-check mr-1"></i> Joined: ${enrollment.joiningDate != null ? enrollment.joiningDate : 'N/A'}</span>
                                                <c:if test="${enrollment.completionDate != null}">
                                                    <span><i class="fas fa-calendar-check mr-1 text-green-400"></i> Completed: ${enrollment.completionDate}</span>
                                                </c:if>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <!-- Status Badge -->
                                    <div class="flex flex-col items-end gap-2">
                                        <span class="status-badge 
                                            <c:choose>
                                                <c:when test="${enrollment.status eq 'ON_GOING'}">status-ongoing</c:when>
                                                <c:when test="${enrollment.status eq 'COMPLETED'}">status-completed</c:when>
                                                <c:when test="${enrollment.status eq 'DROPPED'}">status-dropped</c:when>
                                            </c:choose>">
                                            <i class="fas 
                                                <c:choose>
                                                    <c:when test="${enrollment.status eq 'ON_GOING'}">fa-spinner fa-pulse</c:when>
                                                    <c:when test="${enrollment.status eq 'COMPLETED'}">fa-check-circle</c:when>
                                                    <c:when test="${enrollment.status eq 'DROPPED'}">fa-times-circle</c:when>
                                                </c:choose>"></i>
                                            ${enrollment.status}
                                        </span>
                                        
                                        <!-- Performance Rating -->
                                        <c:if test="${enrollment.performanceRating != null}">
                                            <div class="flex items-center gap-1">
                                                <c:forEach begin="1" end="5" var="star">
                                                    <i class="fas fa-star ${star <= enrollment.performanceRating ? 'star-rated' : 'star-unrated'} text-sm"></i>
                                                </c:forEach>
                                                <span class="text-xs text-white/50 ml-1">(${enrollment.performanceRating}/5)</span>
                                            </div>
                                        </c:if>
                                        
                                        <!-- Action Buttons -->
                                        <div class="flex gap-2 mt-2">
                                            <!-- View/Edit Button -->
                                            <a href="${pageContext.request.contextPath}/editEnrollment?enrollmentId=${enrollment.internshipEnrollmentId}" 
                                               class="px-3 py-1 bg-blue-600/50 hover:bg-blue-600 text-white rounded-lg text-sm transition-all duration-300">
                                                <i class="fas fa-edit"></i> Edit Progress
                                            </a>
                                            
                                            <!-- Certificate Button (only for completed internships) -->
                                            <c:if test="${enrollment.status eq 'COMPLETED'}">
                                                <a href="${pageContext.request.contextPath}/generateCertificate?enrollmentId=${enrollment.internshipEnrollmentId}" 
                                                   class="px-3 py-1 bg-green-600/50 hover:bg-green-600 text-white rounded-lg text-sm transition-all duration-300">
                                                    <i class="fas fa-certificate"></i> Certificate
                                                </a>
                                            </c:if>
                                            
                                            <!-- Drop Button -->
                                            <button onclick="dropStudent(${enrollment.internshipEnrollmentId}, ${internship.internshipId})" 
                                                    class="px-3 py-1 bg-red-600/50 hover:bg-red-600 text-white rounded-lg text-sm transition-all duration-300">
                                                <i class="fas fa-trash-alt"></i> Drop
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </c:when>
                
                <c:otherwise>
                    <!-- No Students State -->
                    <div class="text-center py-16">
                        <div class="bg-gradient-to-r from-purple-900/20 via-pink-900/20 to-purple-900/20 rounded-2xl p-12 backdrop-blur-sm border border-white/10">
                            <i class="fas fa-user-slash text-7xl text-purple-400 mb-6 animate-pulse"></i>
                            <h3 class="text-2xl font-bold text-white mb-3">No Students Enrolled Yet</h3>
                            <p class="text-white/50 mb-6">Students who enroll for this internship will appear here</p>
                            <a href="${pageContext.request.contextPath}/employerdashboard"
                               class="inline-flex items-center gap-2 bg-gradient-to-r from-purple-600 to-pink-600 text-white px-6 py-3 rounded-xl hover:from-pink-600 hover:to-purple-700 transition-all duration-300">
                               <i class="fas fa-arrow-left"></i> Back to Dashboard
                            </a>
                        </div>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</div>

<script>
function updateStatus(enrollmentId, status) {
    if(confirm('Are you sure you want to mark this student as ' + status + '?')) {
        window.location.href = '${pageContext.request.contextPath}/updateEnrollmentStatus?enrollmentId=' + enrollmentId + '&status=' + status;
    }
}

function dropStudent(enrollmentId, internshipId) {
    if(confirm('⚠️ WARNING: This will permanently remove the student from this internship.\n\nAre you sure you want to continue?')) {
        window.location.href = '${pageContext.request.contextPath}/dropStudent?enrollmentId=' + enrollmentId + '&internshipId=' + internshipId;
    }
}
</script>

<style>
.text-gradient {
    background: linear-gradient(135deg, #a78bfa, #ec4899);
    -webkit-background-clip: text;
    background-clip: text;
    color: transparent;
}
</style>

</body>
</html>