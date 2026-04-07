<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Edit Internship | SmartIntern Admin</title>

<!-- Bootstrap & Icons -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">
<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">

<style>
:root {
    --deep-blue: #2C3E50;
    --bright-blue: #4B8BBE;
    --soft-blue: #B3CDE0;
    --pure-white: #FFFFFF;
    --medium-grey: #A8A8A8;
    --deep-blue-dark: #1e2b38;
    --deep-blue-light: #3a4f64;
    --bright-blue-dark: #3a6f99;
    --bright-blue-light: #6ba5d1;
    --soft-blue-dark: #8faec9;
    --glass-deep: rgba(44, 62, 80, 0.7);
    --glass-deep-darker: rgba(44, 62, 80, 0.85);
    --glass-bright: rgba(75, 139, 190, 0.15);
    --border-blue: rgba(75, 139, 190, 0.3);
    --text-secondary: #B3CDE0;
    --text-muted: #A8A8A8;
    --shadow-md: 0 4px 16px rgba(44, 62, 80, 0.3);
    --shadow-lg: 0 8px 24px rgba(44, 62, 80, 0.4);
    --shadow-blue: 0 4px 20px rgba(75, 139, 190, 0.3);
    --transition-smooth: 350ms cubic-bezier(0.23, 1, 0.32, 1);
    --transition-soft: 300ms ease-out;
}

* {
    font-family: 'Inter', sans-serif;
}

body {
    background: linear-gradient(145deg, #2C3E50 0%, #1e2b38 100%);
    min-height: 100vh;
    position: relative;
}

body::before {
    content: '';
    position: fixed;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background-image: linear-gradient(rgba(75, 139, 190, 0.03) 1px, transparent 1px),
                      linear-gradient(90deg, rgba(75, 139, 190, 0.03) 1px, transparent 1px);
    background-size: 50px 50px;
    pointer-events: none;
    z-index: -1;
}

/* Header Styles */
.admin-header {
    background: var(--glass-deep-darker);
    backdrop-filter: blur(12px);
    border-bottom: 1px solid var(--border-blue);
    padding: 0 2rem;
    display: flex;
    justify-content: space-between;
    align-items: center;
    position: sticky;
    top: 0;
    z-index: 1000;
    height: 70px;
}

.logo-container {
    display: flex;
    align-items: center;
    gap: 1rem;
}

.logo-icon {
    width: 45px;
    height: 45px;
    background: linear-gradient(135deg, var(--deep-blue), var(--bright-blue));
    border-radius: 12px;
    display: flex;
    align-items: center;
    justify-content: center;
    border: 2px solid var(--bright-blue);
}

.logo-icon i {
    font-size: 24px;
    color: white;
}

.logo-text {
    font-size: 1.4rem;
    font-weight: 700;
    color: var(--pure-white);
}

.header-actions {
    display: flex;
    align-items: center;
    gap: 1rem;
}

.btn-header {
    background: rgba(255, 255, 255, 0.05);
    border: 1px solid var(--border-blue);
    color: var(--soft-blue);
    border-radius: 40px;
    padding: 0.5rem 1.2rem;
    font-weight: 500;
    transition: all 0.3s ease;
    text-decoration: none;
    display: flex;
    align-items: center;
    gap: 0.5rem;
}

.btn-header:hover {
    background: var(--bright-blue);
    color: white;
    transform: translateY(-2px);
}

.logout-btn {
    background: rgba(239, 68, 68, 0.1);
    border: 1px solid rgba(239, 68, 68, 0.3);
    color: #f87171;
}

.logout-btn:hover {
    background: #ef4444;
    color: white;
}

/* Form Container */
.form-container {
    background: var(--glass-deep);
    backdrop-filter: blur(12px);
    border-radius: 30px;
    border: 1px solid var(--border-blue);
    transition: all 0.3s ease;
}

.form-container:hover {
    border-color: var(--bright-blue);
    box-shadow: var(--shadow-md), var(--shadow-blue);
}

.form-input, .form-select, .form-textarea {
    background: rgba(10, 10, 20, 0.9);
    border: 2px solid var(--border-blue);
    border-radius: 16px;
    color: white;
    transition: all 0.3s ease;
}

.form-input:focus, .form-select:focus, .form-textarea:focus {
    outline: none;
    border-color: var(--bright-blue);
    box-shadow: 0 0 20px rgba(75, 139, 190, 0.3);
}

.form-label {
    color: var(--soft-blue);
    font-weight: 600;
    margin-bottom: 0.5rem;
    display: block;
    font-size: 0.9rem;
}

/* Type Cards */
.type-cards {
    display: flex;
    gap: 1rem;
    flex-wrap: wrap;
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
    border: 2px solid var(--border-blue);
    border-radius: 1.25rem;
    cursor: pointer;
    transition: all 0.3s ease;
    text-align: center;
}

.type-card label i {
    font-size: 2rem;
}

.type-card label span {
    font-weight: 600;
    font-size: 0.9rem;
    color: var(--soft-blue);
}

.type-card input:checked + label {
    background: rgba(75, 139, 190, 0.2);
    border-color: var(--bright-blue);
    box-shadow: 0 0 20px rgba(75, 139, 190, 0.3);
}

/* Buttons */
.btn-primary {
    background: linear-gradient(135deg, var(--bright-blue), var(--bright-blue-dark));
    transition: all 0.3s ease;
    border: none;
}

.btn-primary:hover {
    transform: translateY(-2px);
    box-shadow: var(--shadow-blue);
}

.btn-secondary {
    background: rgba(107, 114, 128, 0.3);
    border: 1px solid var(--border-blue);
    transition: all 0.3s ease;
}

.btn-secondary:hover {
    background: rgba(75, 139, 190, 0.2);
    transform: translateY(-2px);
}

/* Poster Preview */
.poster-preview img {
    border-radius: 1rem;
    border: 2px solid var(--border-blue);
    transition: all 0.3s ease;
}

.poster-preview img:hover {
    transform: scale(1.05);
    box-shadow: var(--shadow-blue);
}

.checkbox-custom {
    width: 20px;
    height: 20px;
    accent-color: var(--bright-blue);
}

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
    background: linear-gradient(90deg, transparent, var(--border-blue), transparent);
}

.section-divider span {
    color: var(--soft-blue);
    font-size: 0.85rem;
    font-weight: 600;
}

.text-gradient {
    background: linear-gradient(135deg, var(--pure-white), var(--soft-blue));
    -webkit-background-clip: text;
    background-clip: text;
    color: transparent;
}

.status-badge-option {
    display: inline-flex;
    align-items: center;
    gap: 0.5rem;
    padding: 0.5rem 1rem;
    border-radius: 2rem;
    font-size: 0.85rem;
    font-weight: 500;
}

.dashboard-footer {
    background: var(--glass-deep-darker);
    backdrop-filter: blur(12px);
    color: var(--medium-grey);
    text-align: center;
    padding: 1rem;
    font-size: 0.85rem;
    border-top: 1px solid var(--border-blue);
}

/* Alert Messages */
.alert-success {
    background: rgba(16, 185, 129, 0.1);
    border: 1px solid rgba(16, 185, 129, 0.3);
    color: #34d399;
    border-radius: 16px;
}

.alert-danger {
    background: rgba(239, 68, 68, 0.1);
    border: 1px solid rgba(239, 68, 68, 0.3);
    color: #f87171;
    border-radius: 16px;
}

/* Slide Animation */
@keyframes slideIn {
    from { transform: translateX(100%); opacity: 0; }
    to { transform: translateX(0); opacity: 1; }
}
.animate-slide-in {
    animation: slideIn 0.3s ease-out;
}
</style>

</head>
<body>

<div class="min-h-screen d-flex flex-column">
    
    <!-- Header -->
    <header class="admin-header py-3">
        <div class="logo-container">
            <div class="logo-icon">
                <i class="bi bi-briefcase-fill"></i>
            </div>
            <span class="logo-text">SmartIntern</span>
        </div>
        <div class="header-actions">
            <a href="listInternship" class="btn-header">
                <i class="bi bi-arrow-left"></i> Back to List
            </a>
            <a href="dashboard" class="btn-header">
                <i class="bi bi-speedometer2"></i> Dashboard
            </a>
            <a href="logout" class="btn-header logout-btn">
                <i class="bi bi-box-arrow-right"></i> Exit
            </a>
        </div>
    </header>
    
    <!-- Success/Error Messages -->
    <c:if test="${not empty success}">
        <div class="position-fixed top-0 end-0 m-4 z-3 animate-slide-in">
            <div class="alert-success px-4 py-3 rounded-3 shadow-lg d-flex align-items-center gap-3">
                <i class="bi bi-check-circle-fill fs-5"></i>
                <span>${success}</span>
                <button type="button" class="btn-close btn-close-white ms-3" onclick="this.parentElement.parentElement.remove()"></button>
            </div>
        </div>
    </c:if>
    
    <c:if test="${not empty error}">
        <div class="position-fixed top-0 end-0 m-4 z-3 animate-slide-in">
            <div class="alert-danger px-4 py-3 rounded-3 shadow-lg d-flex align-items-center gap-3">
                <i class="bi bi-exclamation-triangle-fill fs-5"></i>
                <span>${error}</span>
                <button type="button" class="btn-close btn-close-white ms-3" onclick="this.parentElement.parentElement.remove()"></button>
            </div>
        </div>
    </c:if>

    <!-- Main Content -->
    <div class="flex-grow-1 p-4 p-md-5">
        <div class="container">
            
            <!-- Header -->
            <div class="mb-4">
                <h1 class="display-5 fw-bold">
                    <span class="text-gradient">✏️ Edit Internship</span>
                </h1>
                <p class="text-white-50 mt-2">Update internship opportunity details</p>
            </div>
            
            <!-- Form Container -->
            <div class="form-container p-4 p-md-5">
                <form action="${pageContext.request.contextPath}/updateInternship" method="post" enctype="multipart/form-data" id="internshipForm">
                    
                    <input type="hidden" name="internshipId" value="${internship.internshipId}">
                    
                    <div class="row g-4">
                        
                        <!-- Title -->
                        <div class="col-12">
                            <label class="form-label">
                                <i class="bi bi-heading me-2 text-primary"></i>Internship Title <span class="text-danger">*</span>
                            </label>
                            <input type="text" name="title" value="${internship.title}" required
                                   class="form-input w-100 px-4 py-3 rounded-4" placeholder="e.g., Frontend Developer Intern">
                        </div>
                        
                        <!-- Description -->
                        <div class="col-12">
                            <label class="form-label">
                                <i class="bi bi-file-text me-2 text-primary"></i>Description <span class="text-danger">*</span>
                            </label>
                            <textarea name="description" rows="5" required
                                      class="form-textarea w-100 px-4 py-3 rounded-4" 
                                      placeholder="Describe the internship role...">${internship.description}</textarea>
                        </div>
                        
                        <!-- Internship Type -->
                        <div class="col-12">
                            <label class="form-label">
                                <i class="bi bi-briefcase me-2 text-primary"></i>Internship Type <span class="text-danger">*</span>
                            </label>
                            <div class="type-cards">
                                <div class="type-card">
                                    <input type="radio" name="internshipType" value="ONSITE" id="typeOnsite" 
                                           ${internship.internshipType == 'ONSITE' ? 'checked' : ''}>
                                    <label for="typeOnsite">
                                        <i class="bi bi-building text-success"></i>
                                        <span>Onsite</span>
                                        <small class="text-white-50">Work from office</small>
                                    </label>
                                </div>
                                <div class="type-card">
                                    <input type="radio" name="internshipType" value="REMOTE" id="typeRemote"
                                           ${internship.internshipType == 'REMOTE' ? 'checked' : ''}>
                                    <label for="typeRemote">
                                        <i class="bi bi-wifi text-info"></i>
                                        <span>Remote</span>
                                        <small class="text-white-50">Work from home</small>
                                    </label>
                                </div>
                                <div class="type-card">
                                    <input type="radio" name="internshipType" value="HYBRID" id="typeHybrid"
                                           ${internship.internshipType == 'HYBRID' ? 'checked' : ''}>
                                    <label for="typeHybrid">
                                        <i class="bi bi-cloud-sun text-warning"></i>
                                        <span>Hybrid</span>
                                        <small class="text-white-50">Mix of both</small>
                                    </label>
                                </div>
                            </div>
                        </div>
                        
                        <!-- Location -->
                        <div class="col-md-6">
                            <label class="form-label">
                                <i class="bi bi-geo-alt me-2 text-primary"></i>Location
                            </label>
                            <input type="text" name="location" value="${internship.location}" id="locationInput"
                                   class="form-input w-100 px-4 py-3 rounded-4" placeholder="e.g., Mumbai, Bangalore">
                        </div>
                        
                        <!-- Duration -->
                        <div class="col-md-6">
                            <label class="form-label">
                                <i class="bi bi-clock me-2 text-primary"></i>Duration (Months) <span class="text-danger">*</span>
                            </label>
                            <div class="position-relative">
                                <input type="number" name="durationMonths" value="${internship.durationMonths}" required min="1" max="24"
                                       class="form-input w-100 px-4 py-3 rounded-4" placeholder="e.g., 3">
                                <span class="position-absolute end-0 top-50 translate-middle-y me-3 text-white-50">months</span>
                            </div>
                        </div>
                        
                        <!-- Stipend -->
                        <div class="col-md-6">
                            <label class="form-label">
                                <i class="bi bi-cash me-2 text-primary"></i>Stipend (per month)
                            </label>
                            <div class="position-relative">
                                <span class="position-absolute start-0 top-50 translate-middle-y ms-3 text-white-50">₹</span>
                                <input type="number" name="stipend" value="${internship.stipend}" step="0.01"
                                       class="form-input w-100 px-5 py-3 rounded-4" placeholder="15000">
                            </div>
                        </div>
                        
                        <!-- Paid Checkbox -->
                        <div class="col-md-6 d-flex align-items-center">
                            <div class="form-check">
                                <input type="checkbox" name="isPaid" value="true" ${internship.isPaid ? 'checked' : ''} 
                                       class="checkbox-custom" id="isPaid">
                                <label for="isPaid" class="form-check-label text-white-70 ms-2">
                                    <i class="bi bi-cash-stack text-success"></i> This is a paid internship
                                </label>
                            </div>
                        </div>
                        
                        <!-- Openings -->
                        <div class="col-md-6">
                            <label class="form-label">
                                <i class="bi bi-people me-2 text-primary"></i>Number of Openings <span class="text-danger">*</span>
                            </label>
                            <input type="number" name="openings" value="${internship.openings}" required min="1"
                                   class="form-input w-100 px-4 py-3 rounded-4" placeholder="e.g., 5">
                        </div>
                        
                        <!-- Skills Required -->
                        <div class="col-12">
                            <label class="form-label">
                                <i class="bi bi-code-slash me-2 text-primary"></i>Skills Required
                            </label>
                            <input type="text" name="skillsRequired" value="${internship.skillsRequired}"
                                   class="form-input w-100 px-4 py-3 rounded-4" placeholder="Java, Spring Boot, React, MySQL">
                            <small class="text-white-30"><i class="bi bi-info-circle"></i> Separate skills with commas</small>
                        </div>
                        
                        <!-- Dates Section -->
                        <div class="col-12">
                            <div class="section-divider">
                                <hr><span><i class="bi bi-calendar me-2"></i>Important Dates</span><hr>
                            </div>
                        </div>
                        
                        <!-- Start Apply Date -->
                        <div class="col-md-6">
                            <label class="form-label">
                                <i class="bi bi-calendar-plus me-2 text-primary"></i>Applications Start Date
                            </label>
                            <input type="date" name="startApplyDate" value="${internship.startApplyDate}"
                                   class="form-input w-100 px-4 py-3 rounded-4">
                        </div>
                        
                        <!-- Last Apply Date -->
                        <div class="col-md-6">
                            <label class="form-label">
                                <i class="bi bi-calendar-x me-2 text-danger"></i>Last Apply Date <span class="text-danger">*</span>
                            </label>
                            <input type="date" name="lastApplyDate" value="${internship.lastApplyDate}" required
                                   class="form-input w-100 px-4 py-3 rounded-4">
                        </div>
                        
                        <!-- Start Date -->
                        <div class="col-md-6">
                            <label class="form-label">
                                <i class="bi bi-play-circle me-2 text-success"></i>Internship Start Date
                            </label>
                            <input type="date" name="startDate" value="${internship.startDate}"
                                   class="form-input w-100 px-4 py-3 rounded-4">
                        </div>
                        
                        <!-- End Date -->
                        <div class="col-md-6">
                            <label class="form-label">
                                <i class="bi bi-stop-circle me-2 text-warning"></i>Internship End Date
                            </label>
                            <input type="date" name="endDate" value="${internship.endDate}"
                                   class="form-input w-100 px-4 py-3 rounded-4">
                        </div>
                        
                        <!-- Status Section -->
                        <div class="col-12">
                            <div class="section-divider">
                                <hr><span><i class="bi bi-sliders2 me-2"></i>Status & Media</span><hr>
                            </div>
                        </div>
                        
                        <!-- Status -->
                        <div class="col-md-6">
                            <label class="form-label">
                                <i class="bi bi-toggle-on me-2 text-primary"></i>Status
                            </label>
                            <div class="d-flex gap-3 flex-wrap">
                                <label class="d-flex align-items-center gap-2 cursor-pointer">
                                    <input type="radio" name="status" value="OPEN" ${internship.status == 'OPEN' ? 'checked' : ''} class="checkbox-custom">
                                    <span class="status-badge-option bg-success bg-opacity-10 text-success border border-success border-opacity-25">
                                        <i class="bi bi-play-fill"></i> OPEN
                                    </span>
                                </label>
                                <label class="d-flex align-items-center gap-2 cursor-pointer">
                                    <input type="radio" name="status" value="UPCOMING" ${internship.status == 'UPCOMING' ? 'checked' : ''} class="checkbox-custom">
                                    <span class="status-badge-option bg-warning bg-opacity-10 text-warning border border-warning border-opacity-25">
                                        <i class="bi bi-clock"></i> UPCOMING
                                    </span>
                                </label>
                                <label class="d-flex align-items-center gap-2 cursor-pointer">
                                    <input type="radio" name="status" value="CLOSED" ${internship.status == 'CLOSED' ? 'checked' : ''} class="checkbox-custom">
                                    <span class="status-badge-option bg-secondary bg-opacity-10 text-secondary border border-secondary border-opacity-25">
                                        <i class="bi bi-ban"></i> CLOSED
                                    </span>
                                </label>
                            </div>
                        </div>
                        
                        <!-- Poster Upload -->
                        <div class="col-12">
                            <label class="form-label">
                                <i class="bi bi-image me-2 text-primary"></i>Internship Poster
                            </label>
                            
                            <c:if test="${not empty internship.posterUrl}">
                                <div class="poster-preview mb-3">
                                    <div class="d-flex gap-4 flex-wrap align-items-start">
                                        <div>
                                            <p class="text-white-50 small mb-2">
                                                <i class="bi bi-palette"></i> Current Poster:
                                            </p>
                                            <img src="${internship.posterUrl}" class="rounded-3 shadow-lg" style="width: 128px; height: 128px; object-fit: cover;" alt="Current Poster">
                                        </div>
                                        <div class="text-white-40 small">
                                            <i class="bi bi-info-circle"></i> Upload a new image to replace<br>the current poster
                                        </div>
                                    </div>
                                </div>
                            </c:if>
                            
                            <input type="file" name="posterFile" accept="image/*" id="posterFile"
                                   class="form-input w-100 px-4 py-3 rounded-4">
                            <small class="text-white-30 d-flex align-items-center gap-2 mt-2">
                                <i class="bi bi-cloud-upload"></i>
                                Supported formats: JPG, PNG, GIF, WEBP. Max size: 5MB
                            </small>
                        </div>
                        
                    </div>
                    
                    <!-- Form Actions -->
                    <div class="d-flex flex-wrap gap-3 mt-5 pt-3 border-top border-white-10">
                        <button type="submit" class="btn-primary px-5 py-3 rounded-5 fw-semibold d-flex align-items-center gap-2 shadow-lg">
                            <i class="bi bi-save2"></i> Update Internship
                        </button>
                        <a href="listInternship" class="btn-secondary px-4 py-3 rounded-5 fw-semibold text-decoration-none d-flex align-items-center gap-2">
                            <i class="bi bi-x-lg"></i> Cancel
                        </a>
                    </div>
                    
                </form>
            </div>
            
            <!-- Info Note -->
            <div class="mt-4 p-4 bg-primary bg-opacity-10 rounded-4 border border-primary border-opacity-25">
                <div class="d-flex gap-3 align-items-start">
                    <div class="bg-primary bg-opacity-25 rounded-circle p-2">
                        <i class="bi bi-info-circle text-primary"></i>
                    </div>
                    <div class="text-white-50 small">
                        <p><strong class="text-primary">Note:</strong> Changes to internship details will be reflected immediately on all platforms.</p>
                        <p class="mb-0">⚠️ If applications are already submitted, changing dates or status may affect student applications. Please review carefully.</p>
                    </div>
                </div>
            </div>
            
        </div>
    </div>

    <!-- Footer -->
    <footer class="dashboard-footer">
        2026 SmartIntern — Edit Internship · All Rights Reserved
    </footer>
    
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
        alert('Last Apply Date should be before Internship Start Date');
        return false;
    }
    
    if (startDate && endDate && startDate > endDate) {
        e.preventDefault();
        alert('Start Date cannot be after End Date');
        return false;
    }
    
    if (startApplyDate && lastApplyDate && startApplyDate > lastApplyDate) {
        e.preventDefault();
        alert('Applications Start Date should be before Last Apply Date');
        return false;
    }
    
    return true;
});

// Auto-hide messages after 4 seconds
setTimeout(function() {
    var messages = document.querySelectorAll('.position-fixed.top-0.end-0');
    messages.forEach(function(msg) {
        msg.style.opacity = '0';
        msg.style.transition = 'opacity 0.5s';
        setTimeout(function() {
            msg.remove();
        }, 500);
    });
}, 4000);
</script>

</body>
</html>