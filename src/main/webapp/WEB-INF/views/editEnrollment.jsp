<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Edit Student Progress</title>
<script src="https://cdn.tailwindcss.com"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
</head>
<body class="bg-gradient-to-br from-gray-900 via-purple-900 to-gray-900 min-h-screen">

<div class="container mx-auto px-4 py-8">
    <div class="max-w-2xl mx-auto">
        <!-- Header -->
        <div class="bg-white/10 backdrop-blur-lg rounded-2xl p-8 shadow-2xl border border-white/20">
            <div class="text-center mb-8">
                <i class="fas fa-user-edit text-5xl text-purple-400 mb-4"></i>
                <h1 class="text-3xl font-bold text-white mb-2">Update Student Progress</h1>
                <p class="text-purple-200">${enrollment.student.firstName} ${enrollment.student.lastName}</p>
                <p class="text-white/60 text-sm">${enrollment.internship.title}</p>
            </div>
            
            <form action="${pageContext.request.contextPath}/updateEnrollment" method="post" class="space-y-6">
                <input type="hidden" name="enrollmentId" value="${enrollment.internshipEnrollmentId}">
                <input type="hidden" name="internshipId" value="${enrollment.internship.internshipId}">
                
                <!-- Current Status -->
                <div>
                    <label class="block text-white font-semibold mb-2">
                        <i class="fas fa-tag mr-2"></i>Current Status
                    </label>
                    <div class="bg-white/5 rounded-lg p-3">
                        <span class="inline-flex items-center gap-2 px-3 py-1 rounded-full text-sm
                            ${enrollment.status == 'ON_GOING' ? 'bg-yellow-500/20 text-yellow-300' : ''}
                            ${enrollment.status == 'COMPLETED' ? 'bg-green-500/20 text-green-300' : ''}
                            ${enrollment.status == 'DROPPED' ? 'bg-red-500/20 text-red-300' : ''}">
                            <i class="fas 
                                ${enrollment.status == 'ON_GOING' ? 'fa-spinner fa-pulse' : ''}
                                ${enrollment.status == 'COMPLETED' ? 'fa-check-circle' : ''}
                                ${enrollment.status == 'DROPPED' ? 'fa-times-circle' : ''}"></i>
                            ${enrollment.status}
                        </span>
                    </div>
                </div>
                
                <!-- Update Status -->
                <div>
                    <label class="block text-white font-semibold mb-2">
                        <i class="fas fa-sync-alt mr-2"></i>Update Status
                    </label>
                    <select name="status" class="w-full px-4 py-3 bg-white/10 border border-white/20 rounded-lg text-white focus:outline-none focus:border-purple-500 transition">
                        <option value="ON_GOING" ${enrollment.status == 'ON_GOING' ? 'selected' : ''}>🟡 On Going</option>
                        <option value="COMPLETED" ${enrollment.status == 'COMPLETED' ? 'selected' : ''}>✅ Completed</option>
                        <option value="DROPPED" ${enrollment.status == 'DROPPED' ? 'selected' : ''}>❌ Dropped</option>
                    </select>
                </div>
                
                <!-- Completion Date -->
                <div>
                    <label class="block text-white font-semibold mb-2">
                        <i class="fas fa-calendar-check mr-2"></i>Completion Date
                    </label>
                    <input type="date" name="completionDate" 
                           value="${enrollment.completionDate != null ? enrollment.completionDate : ''}"
                           class="w-full px-4 py-3 bg-white/10 border border-white/20 rounded-lg text-white focus:outline-none focus:border-purple-500 transition">
                    <p class="text-white/40 text-xs mt-1">Leave empty if not completed yet</p>
                </div>
                
                <!-- Performance Rating -->
                <div>
                    <label class="block text-white font-semibold mb-2">
                        <i class="fas fa-star mr-2"></i>Performance Rating (1-5)
                    </label>
                    <div class="flex gap-2">
                        <select name="performanceRating" class="w-full px-4 py-3 bg-white/10 border border-white/20 rounded-lg text-white focus:outline-none focus:border-purple-500 transition">
                            <option value="">Not rated</option>
                            <option value="1" ${enrollment.performanceRating == 1 ? 'selected' : ''}>⭐ 1 - Poor</option>
                            <option value="2" ${enrollment.performanceRating == 2 ? 'selected' : ''}>⭐⭐ 2 - Fair</option>
                            <option value="3" ${enrollment.performanceRating == 3 ? 'selected' : ''}>⭐⭐⭐ 3 - Good</option>
                            <option value="4" ${enrollment.performanceRating == 4 ? 'selected' : ''}>⭐⭐⭐⭐ 4 - Very Good</option>
                            <option value="5" ${enrollment.performanceRating == 5 ? 'selected' : ''}>⭐⭐⭐⭐⭐ 5 - Excellent</option>
                        </select>
                    </div>
                </div>
                
                <!-- Action Buttons -->
                <div class="flex gap-4 pt-4">
                    <button type="submit" class="flex-1 bg-gradient-to-r from-purple-600 to-pink-600 hover:from-pink-600 hover:to-purple-700 text-white font-semibold py-3 px-6 rounded-xl transition-all duration-300 transform hover:scale-105">
                        <i class="fas fa-save mr-2"></i>Update Progress
                    </button>
                    <a href="${pageContext.request.contextPath}/viewEnrolledStudents?internshipId=${enrollment.internship.internshipId}" 
                       class="flex-1 bg-gray-600/50 hover:bg-gray-600 text-white font-semibold py-3 px-6 rounded-xl transition-all duration-300 text-center">
                        <i class="fas fa-times mr-2"></i>Cancel
                    </a>
                </div>
            </form>
        </div>
    </div>
</div>

</body>
</html>