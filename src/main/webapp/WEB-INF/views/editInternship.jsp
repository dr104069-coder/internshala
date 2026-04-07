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
<title>Edit Internship | Internship Manager</title>

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
    min-height: 100vh;
}

@keyframes gradientFlow {
    0% { background-position: 0% 50%; }
    50% { background-position: 100% 50%; }
    100% { background-position: 0% 50%; }
}

/* Form Container */
.form-container {
    background: rgba(20, 20, 40, 0.85);
    backdrop-filter: blur(20px);
    border-radius: 2rem;
    border: 1px solid rgba(139, 92, 246, 0.3);
    transition: all 0.3s ease;
    animation: fadeInUp 0.6s ease-out;
}

@keyframes fadeInUp {
    from {
        opacity: 0;
        transform: translateY(30px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

.form-container:hover {
    border-color: rgba(139, 92, 246, 0.6);
    box-shadow: 0 25px 40px -15px rgba(139, 92, 246, 0.3);
}

/* Form Input Styles */
.form-input, .form-select, .form-textarea {
    background: rgba(10, 10, 20, 0.9);
    border: 2px solid rgba(139, 92, 246, 0.3);
    border-radius: 1rem;
    color: white;
    transition: all 0.3s ease;
}

.form-input:focus, .form-select:focus, .form-textarea:focus {
    outline: none;
    border-color: #8b5cf6;
    box-shadow: 0 0 20px rgba(139, 92, 246, 0.3);
    transform: translateY(-2px);
}

.form-label {
    color: #c4b5fd;
    font-weight: 600;
    margin-bottom: 0.5rem;
    display: block;
    font-size: 0.9rem;
    letter-spacing: 0.3px;
}

/* Type Selector Cards */
.type-cards {
    display: flex;
    gap: 1rem;
    flex-wrap: wrap;
    margin-top: 0.5rem;
}

.type-card {
    flex: 1;
    min-width: 120px;
    cursor: pointer;
}

.type-card input {
    display: none;
}

.type-card label {
    display: flex;
    flex-direction: column;
    align-items: center;
    gap: 0.75rem;
    padding: 1.25rem 1rem;
    background: rgba(10, 10, 20, 0.7);
    border: 2px solid rgba(139, 92, 246, 0.3);
    border-radius: 1.25rem;
    cursor: pointer;
    transition: all 0.3s ease;
    text-align: center;
}

.type-card label i {
    font-size: 2rem;
    transition: all 0.3s ease;
}

.type-card label span {
    font-weight: 600;
    font-size: 0.9rem;
    color: #c4b5fd;
}

.type-card label small {
    font-size: 0.7rem;
    color: rgba(255, 255, 255, 0.4);
}

.type-card input:checked + label {
    background: linear-gradient(135deg, rgba(139, 92, 246, 0.3), rgba(236, 72, 153, 0.2));
    border-color: #8b5cf6;
    box-shadow: 0 0 20px rgba(139, 92, 246, 0.3);
    transform: translateY(-3px);
}

.type-card input:checked + label i {
    transform: scale(1.1);
}

.type-card:hover label {
    border-color: #a78bfa;
    transform: translateY(-2px);
}

/* Button Styles */
.btn-primary {
    background: linear-gradient(135deg, #8b5cf6, #ec4899);
    transition: all 0.3s ease;
    border: none;
    position: relative;
    overflow: hidden;
}

.btn-primary:hover {
    transform: translateY(-2px);
    box-shadow: 0 10px 30px rgba(139, 92, 246, 0.5);
}

.btn-secondary {
    background: rgba(107, 114, 128, 0.3);
    border: 1px solid rgba(139, 92, 246, 0.4);
    transition: all 0.3s ease;
}

.btn-secondary:hover {
    background: rgba(139, 92, 246, 0.2);
    transform: translateY(-2px);
}

/* Current Poster Preview */
.poster-preview {
    position: relative;
    display: inline-block;
}

.poster-preview img {
    border-radius: 1rem;
    border: 2px solid rgba(139, 92, 246, 0.5);
    transition: all 0.3s ease;
}

.poster-preview img:hover {
    transform: scale(1.05);
    box-shadow: 0 10px 30px rgba(139, 92, 246, 0.4);
}

/* Custom Scrollbar */
::-webkit-scrollbar {
    width: 10px;
}

::-webkit-scrollbar-track {
    background: rgba(20, 20, 40, 0.5);
    border-radius: 10px;
}

::-webkit-scrollbar-thumb {
    background: linear-gradient(135deg, #8b5cf6, #ec4899);
    border-radius: 10px;
}

/* Checkbox Styling */
.checkbox-custom {
    width: 20px;
    height: 20px;
    background: rgba(10, 10, 20, 0.9);
    border: 2px solid rgba(139, 92, 246, 0.5);
    border-radius: 6px;
    cursor: pointer;
    transition: all 0.3s ease;
    accent-color: #8b5cf6;
}

/* Section Divider */
.section-divider {
    display: flex;
    align-items: center;
    gap: 1rem;
    margin: 1.5rem 0 1rem;
}

.section-divider hr {
    flex: 1;
    border: none;
    height: 1px;
    background: linear-gradient(90deg, transparent, rgba(139, 92, 246, 0.5), transparent);
}

.section-divider span {
    color: #a78bfa;
    font-size: 0.85rem;
    font-weight: 600;
    letter-spacing: 1px;
}

/* Text Gradient */
.text-gradient {
    background: linear-gradient(135deg, #a78bfa, #ec4899);
    -webkit-background-clip: text;
    background-clip: text;
    color: transparent;
}

/* Status Badge in Form */
.status-badge-option {
    display: inline-flex;
    align-items: center;
    gap: 0.5rem;
    padding: 0.5rem 1rem;
    border-radius: 2rem;
    font-size: 0.85rem;
    font-weight: 500;
}
</style>

</head>
<body>

<div class="min-h-screen p-6 md:p-8">
    <div class="max-w-5xl mx-auto">
        
        <!-- Header -->
        <div class="mb-8">
            <a href="${pageContext.request.contextPath}/employerViewInternship?internshipId=${internship.internshipId}" 
               class="inline-flex items-center gap-2 text-purple-400 hover:text-purple-300 transition-colors mb-4 group">
                <i class="fas fa-arrow-left group-hover:-translate-x-1 transition-transform"></i> Back to Details
            </a>
            <h1 class="text-4xl font-bold">
                <span class="text-gradient">✏️ Edit Internship</span>
            </h1>
            <p class="text-white/50 mt-2">Update your internship opportunity details</p>
        </div>
        
        <!-- Form Container -->
        <div class="form-container p-6 md:p-8">
            <form action="${pageContext.request.contextPath}/updateInternship" method="post" enctype="multipart/form-data" id="internshipForm">
                
                <!-- Internship ID (hidden) -->
                <input type="hidden" name="internshipId" value="${internship.internshipId}">
                
                <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                    
                    <!-- Title - Full Width -->
                    <div class="md:col-span-2">
                        <label class="form-label">
                            <i class="fas fa-heading mr-2 text-purple-400"></i>Internship Title <span class="text-red-400">*</span>
                        </label>
                        <input type="text" name="title" value="${internship.title}" required
                               class="form-input w-full px-4 py-3" placeholder="e.g., Frontend Developer Intern">
                    </div>
                    
                    <!-- Description - Full Width -->
                    <div class="md:col-span-2">
                        <label class="form-label">
                            <i class="fas fa-align-left mr-2 text-purple-400"></i>Description <span class="text-red-400">*</span>
                        </label>
                        <textarea name="description" rows="5" required
                                  class="form-textarea w-full px-4 py-3" 
                                  placeholder="Describe the internship role, responsibilities, requirements...">${internship.description}</textarea>
                    </div>
                    
                    <!-- Internship Type - Modern Card Selector -->
                    <div class="md:col-span-2">
                        <label class="form-label">
                            <i class="fas fa-briefcase mr-2 text-purple-400"></i>Internship Type <span class="text-red-400">*</span>
                        </label>
                        <div class="type-cards">
                            <!-- Onsite -->
                            <div class="type-card">
                                <input type="radio" name="internshipType" value="Onsite" id="typeOnsite" 
                                       ${internship.internshipType == 'Onsite' ? 'checked' : ''}>
                                <label for="typeOnsite">
                                    <i class="fas fa-building text-emerald-400"></i>
                                    <span>Onsite</span>
                                    <small>Work from office</small>
                                </label>
                            </div>
                            <!-- Remote -->
                            <div class="type-card">
                                <input type="radio" name="internshipType" value="Remote" id="typeRemote"
                                       ${internship.internshipType == 'Remote' ? 'checked' : ''}>
                                <label for="typeRemote">
                                    <i class="fas fa-home text-blue-400"></i>
                                    <span>Remote</span>
                                    <small>Work from home</small>
                                </label>
                            </div>
                            <!-- Hybrid -->
                            <div class="type-card">
                                <input type="radio" name="internshipType" value="Hybrid" id="typeHybrid"
                                       ${internship.internshipType == 'Hybrid' ? 'checked' : ''}>
                                <label for="typeHybrid">
                                    <i class="fas fa-cloud-sun text-amber-400"></i>
                                    <span>Hybrid</span>
                                    <small>Mix of both</small>
                                </label>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Location -->
                    <div>
                        <label class="form-label">
                            <i class="fas fa-map-marker-alt mr-2 text-purple-400"></i>Location
                        </label>
                        <input type="text" name="location" value="${internship.location}" id="locationInput"
                               class="form-input w-full px-4 py-3" placeholder="e.g., Mumbai, Bangalore">
                        <p class="text-white/30 text-xs mt-1"><i class="fas fa-info-circle"></i> For Remote, you can write "Remote" or leave empty</p>
                    </div>
                    
                    <!-- Duration -->
                    <div>
                        <label class="form-label">
                            <i class="fas fa-clock mr-2 text-purple-400"></i>Duration (Months) <span class="text-red-400">*</span>
                        </label>
                        <div class="relative">
                            <input type="number" name="durationMonths" value="${internship.durationMonths}" required min="1" max="24"
                                   class="form-input w-full px-4 py-3" placeholder="e.g., 3">
                            <span class="absolute right-4 top-1/2 -translate-y-1/2 text-white/40 text-sm">months</span>
                        </div>
                    </div>
                    
                    <!-- Stipend -->
                    <div>
                        <label class="form-label">
                            <i class="fas fa-rupee-sign mr-2 text-purple-400"></i>Stipend (per month)
                        </label>
                        <div class="relative">
                            <span class="absolute left-4 top-1/2 -translate-y-1/2 text-white/40">₹</span>
                            <input type="number" name="stipend" value="${internship.stipend}" step="0.01"
                                   class="form-input w-full px-8 py-3" placeholder="15000">
                        </div>
                    </div>
                    
                    <!-- Paid Checkbox -->
                    <div class="flex items-center gap-3 pt-2">
                        <input type="checkbox" name="isPaid" value="true" ${internship.isPaid ? 'checked' : ''} 
                               class="checkbox-custom w-5 h-5" id="isPaid">
                        <label for="isPaid" class="text-white/70 cursor-pointer flex items-center gap-2">
                            <i class="fas fa-money-bill-wave text-green-400"></i> This is a paid internship
                        </label>
                    </div>
                    
                    <!-- Openings -->
                    <div>
                        <label class="form-label">
                            <i class="fas fa-users mr-2 text-purple-400"></i>Number of Openings <span class="text-red-400">*</span>
                        </label>
                        <input type="number" name="openings" value="${internship.openings}" required min="1"
                               class="form-input w-full px-4 py-3" placeholder="e.g., 5">
                    </div>
                    
                    <!-- Skills Required - Full Width -->
                    <div class="md:col-span-2">
                        <label class="form-label">
                            <i class="fas fa-code mr-2 text-purple-400"></i>Skills Required
                        </label>
                        <input type="text" name="skillsRequired" value="${internship.skillsRequired}"
                               class="form-input w-full px-4 py-3" placeholder="Java, Spring Boot, React, MySQL">
                        <p class="text-white/30 text-xs mt-1"><i class="fas fa-tags"></i> Separate skills with commas</p>
                    </div>
                    
                    <!-- Section Divider - Dates -->
                    <div class="md:col-span-2">
                        <div class="section-divider">
                            <hr><span><i class="fas fa-calendar-alt mr-2"></i>Important Dates</span><hr>
                        </div>
                    </div>
                    
                    <!-- Start Apply Date -->
                    <div>
                        <label class="form-label">
                            <i class="fas fa-calendar-plus mr-2 text-purple-400"></i>Applications Start Date
                        </label>
                        <input type="date" name="startApplyDate" value="${internship.startApplyDate}"
                               class="form-input w-full px-4 py-3">
                    </div>
                    
                    <!-- Last Apply Date -->
                    <div>
                        <label class="form-label">
                            <i class="fas fa-calendar-times mr-2 text-red-400"></i>Last Apply Date <span class="text-red-400">*</span>
                        </label>
                        <input type="date" name="lastApplyDate" value="${internship.lastApplyDate}" required
                               class="form-input w-full px-4 py-3">
                    </div>
                    
                    <!-- Start Date -->
                    <div>
                        <label class="form-label">
                            <i class="fas fa-play-circle mr-2 text-green-400"></i>Internship Start Date
                        </label>
                        <input type="date" name="startDate" value="${internship.startDate}"
                               class="form-input w-full px-4 py-3">
                    </div>
                    
                    <!-- End Date -->
                    <div>
                        <label class="form-label">
                            <i class="fas fa-stop-circle mr-2 text-orange-400"></i>Internship End Date
                        </label>
                        <input type="date" name="endDate" value="${internship.endDate}"
                               class="form-input w-full px-4 py-3">
                    </div>
                    
                    <!-- Section Divider - Status & Media -->
                    <div class="md:col-span-2">
                        <div class="section-divider">
                            <hr><span><i class="fas fa-sliders-h mr-2"></i>Status & Media</span><hr>
                        </div>
                    </div>
                    
                    <!-- Status -->
                    <div>
                        <label class="form-label">
                            <i class="fas fa-toggle-on mr-2 text-purple-400"></i>Status
                        </label>
                        <div class="flex gap-4">
                            <label class="flex items-center gap-2 cursor-pointer">
                                <input type="radio" name="status" value="ACTIVE" ${internship.status == 'ACTIVE' ? 'checked' : ''} class="checkbox-custom">
                                <span class="status-badge-option bg-green-500/20 text-green-400 border border-green-500/30">
                                    <i class="fas fa-play"></i> ACTIVE
                                </span>
                            </label>
                            <label class="flex items-center gap-2 cursor-pointer">
                                <input type="radio" name="status" value="COMPLETED" ${internship.status == 'COMPLETED' ? 'checked' : ''} class="checkbox-custom">
                                <span class="status-badge-option bg-gray-500/20 text-gray-400 border border-gray-500/30">
                                    <i class="fas fa-check-double"></i> COMPLETED
                                </span>
                            </label>
                        </div>
                    </div>
                    
                    <!-- Poster Upload -->
                    <div class="md:col-span-2">
                        <label class="form-label">
                            <i class="fas fa-image mr-2 text-purple-400"></i>Internship Poster
                        </label>
                        
                        <!-- Current Poster Preview -->
                        <c:if test="${not empty internship.posterUrl}">
                            <div class="poster-preview mb-4">
                                <div class="flex items-start gap-4 flex-wrap">
                                    <div>
                                        <p class="text-white/50 text-sm mb-2">
                                            <i class="fas fa-palette"></i> Current Poster:
                                        </p>
                                        <img src="${internship.posterUrl}" class="w-32 h-32 object-cover rounded-xl shadow-lg" alt="Current Poster">
                                    </div>
                                    <div class="text-white/40 text-sm">
                                        <i class="fas fa-info-circle"></i> Upload a new image to replace<br>the current poster
                                    </div>
                                </div>
                            </div>
                        </c:if>
                        
                        <input type="file" name="posterFile" accept="image/*" id="posterFile"
                               class="form-input w-full px-4 py-3">
                        <div class="flex items-center gap-2 text-white/30 text-xs mt-2">
                            <i class="fas fa-cloud-upload-alt"></i>
                            <span>Supported formats: JPG, PNG, GIF, WEBP. Max size: 5MB</span>
                        </div>
                    </div>
                    
                </div>
                
                <!-- Form Actions -->
                <div class="flex flex-wrap gap-4 mt-8 pt-6 border-t border-white/10">
                    <button type="submit" class="btn-primary px-8 py-3 rounded-xl font-semibold flex items-center gap-2 shadow-lg">
                        <i class="fas fa-save"></i> Update Internship
                    </button>
                    <a href="${pageContext.request.contextPath}/employerViewInternship?internshipId=${internship.internshipId}" 
                       class="btn-secondary px-6 py-3 rounded-xl font-semibold flex items-center gap-2 text-white hover:text-white">
                        <i class="fas fa-times"></i> Cancel
                    </a>
                </div>
                
            </form>
        </div>
        
        <!-- Info Note -->
        <div class="mt-6 p-5 bg-gradient-to-r from-purple-900/30 to-pink-900/30 rounded-2xl border border-purple-500/30 backdrop-blur-sm">
            <div class="flex items-start gap-3">
                <div class="w-8 h-8 rounded-full bg-purple-500/20 flex items-center justify-center flex-shrink-0">
                    <i class="fas fa-info-circle text-purple-400 text-sm"></i>
                </div>
                <div class="text-white/60 text-sm">
                    <p><strong class="text-purple-400">Note:</strong> Changes to internship details will be reflected immediately on all platforms.</p>
                    <p class="mt-1">⚠️ If applications are already submitted, changing dates or status may affect student applications. Please review carefully.</p>
                </div>
            </div>
        </div>
        
    </div>
</div>

<script>
// Date validation
document.getElementById('internshipForm').addEventListener('submit', function(e) {
    var lastApplyDate = document.querySelector('input[name="lastApplyDate"]').value;
    var startDate = document.querySelector('input[name="startDate"]').value;
    var endDate = document.querySelector('input[name="endDate"]').value;
    var startApplyDate = document.querySelector('input[name="startApplyDate"]').value;
    
    if (lastApplyDate && startDate && lastApplyDate > startDate) {
        e.preventDefault();
        showAlert('Last Apply Date should be before Internship Start Date', 'error');
        return false;
    }
    
    if (startDate && endDate && startDate > endDate) {
        e.preventDefault();
        showAlert('Start Date cannot be after End Date', 'error');
        return false;
    }
    
    if (startApplyDate && lastApplyDate && startApplyDate > lastApplyDate) {
        e.preventDefault();
        showAlert('Applications Start Date should be before Last Apply Date', 'error');
        return false;
    }
    
    return true;
});

// Dynamic location placeholder based on type selection
var typeRadios = document.querySelectorAll('input[name="internshipType"]');
for (var i = 0; i < typeRadios.length; i++) {
    typeRadios[i].addEventListener('change', function() {
        var locationInput = document.getElementById('locationInput');
        if (this.value === 'Remote') {
            if (!locationInput.value || locationInput.value === '') {
                locationInput.placeholder = 'Remote (work from anywhere)';
            }
        } else if (this.value === 'Onsite') {
            locationInput.placeholder = 'e.g., Mumbai, Bangalore, Delhi';
        } else if (this.value === 'Hybrid') {
            locationInput.placeholder = 'e.g., Mumbai (3 days office / 2 days home)';
        }
    });
}

// Alert function
function showAlert(message, type) {
    var alertDiv = document.createElement('div');
    var bgColor = (type === 'error') ? 'bg-red-500/90 text-white' : 'bg-green-500/90 text-white';
    var iconClass = (type === 'error') ? 'fa-exclamation-triangle' : 'fa-check-circle';
    alertDiv.className = 'fixed top-20 right-4 z-50 p-4 rounded-xl shadow-2xl animate-bounce-in ' + bgColor;
    alertDiv.innerHTML = '<div class="flex items-center gap-3">' +
        '<i class="fas ' + iconClass + ' text-xl"></i>' +
        '<span>' + message + '</span>' +
        '<button onclick="this.parentElement.parentElement.remove()" class="ml-4">' +
        '<i class="fas fa-times"></i>' +
        '</button>' +
        '</div>';
    document.body.appendChild(alertDiv);
    setTimeout(function() { alertDiv.remove(); }, 4000);
}

// Add animation style
var style = document.createElement('style');
style.textContent = `
    @keyframes bounce-in {
        0% { transform: translateX(100%); opacity: 0; }
        60% { transform: translateX(-10px); }
        100% { transform: translateX(0); opacity: 1; }
    }
    .animate-bounce-in {
        animation: bounce-in 0.5s ease-out;
    }
`;
document.head.appendChild(style);
</script>

</body>
</html>