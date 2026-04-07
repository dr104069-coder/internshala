<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="redirectTo" value="/internshipApplications?internshipId=${internship.internshipId}" />
<html>
<head>
<title>Applications | ${internship.title} | Employer Dashboard</title>

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
    padding: 2rem;
}

@keyframes gradientFlow {
    0% { background-position: 0% 50%; }
    50% { background-position: 100% 50%; }
    100% { background-position: 0% 50%; }
}

.container-glass {
    background: rgba(10, 10, 20, 0.85);
    backdrop-filter: blur(20px);
    border: 1px solid rgba(139, 92, 246, 0.3);
    border-radius: 2rem;
    box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.5);
    transition: all 0.3s ease;
}

.container-glass:hover {
    border-color: rgba(139, 92, 246, 0.6);
    box-shadow: 0 25px 50px -12px rgba(139, 92, 246, 0.3);
}

.text-gradient {
    background: linear-gradient(135deg, #a78bfa, #ec4899);
    -webkit-background-clip: text;
    background-clip: text;
    color: transparent;
}

.back-button {
    display: inline-flex;
    align-items: center;
    gap: 0.75rem;
    background: rgba(20, 20, 40, 0.8);
    backdrop-filter: blur(10px);
    border: 1px solid rgba(139, 92, 246, 0.4);
    border-radius: 1rem;
    padding: 0.625rem 1.25rem;
    color: #c4b5fd;
    font-weight: 500;
    font-size: 0.9rem;
    transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
    text-decoration: none;
    margin-bottom: 1.5rem;
    display: inline-flex;
}

.back-button:hover {
    background: linear-gradient(135deg, rgba(139, 92, 246, 0.2), rgba(236, 72, 153, 0.2));
    border-color: rgba(139, 92, 246, 0.8);
    transform: translateX(-5px);
    color: white;
}

/* IMPROVED TABLE STYLES - Cleaner and better looking */
.table-wrapper {
    background: rgba(15, 15, 35, 0.4);
    border-radius: 1rem;
    overflow-x: auto;
    border: 1px solid rgba(139, 92, 246, 0.2);
}

.applications-table {
    width: 100%;
    border-collapse: collapse;
    min-width: 900px;
}

.applications-table thead tr {
    background: linear-gradient(135deg, rgba(139, 92, 246, 0.2), rgba(236, 72, 153, 0.1));
}

.applications-table thead th {
    color: #d8b4fe;
    font-weight: 600;
    font-size: 0.75rem;
    text-transform: uppercase;
    letter-spacing: 0.05em;
    padding: 1rem 0.75rem;
    border-bottom: 1px solid rgba(139, 92, 246, 0.3);
    text-align: left;
}

.applications-table tbody tr {
    border-bottom: 1px solid rgba(139, 92, 246, 0.08);
    transition: all 0.2s ease;
}

.applications-table tbody tr:hover {
    background: rgba(139, 92, 246, 0.08);
}

.applications-table tbody td {
    padding: 0.875rem 0.75rem;
    color: #e2e8f0;
    font-size: 0.85rem;
    vertical-align: middle;
}

/* Status Badges - Keep original colors */
.status-badge {
    display: inline-flex;
    align-items: center;
    gap: 0.5rem;
    padding: 0.35rem 0.85rem;
    border-radius: 9999px;
    font-size: 0.7rem;
    font-weight: 600;
}

.status-applied {
    background: linear-gradient(135deg, #f59e0b, #d97706);
    color: white;
}

.status-accepted {
    background: linear-gradient(135deg, #10b981, #059669);
    color: white;
}

.status-rejected {
    background: linear-gradient(135deg, #ef4444, #dc2626);
    color: white;
}

/* Buttons - Keep original */
.btn-icon {
    display: inline-flex;
    align-items: center;
    gap: 0.5rem;
    padding: 0.45rem 0.9rem;
    border-radius: 0.7rem;
    font-size: 0.75rem;
    font-weight: 600;
    transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
    cursor: pointer;
    text-decoration: none;
    border: none;
}

.btn-view {
    background: linear-gradient(135deg, #3b82f6, #2563eb);
    color: white;
}

.btn-view:hover {
    transform: translateY(-2px);
    box-shadow: 0 5px 15px rgba(59, 130, 246, 0.4);
}

.btn-download {
    background: linear-gradient(135deg, #8b5cf6, #7c3aed);
    color: white;
}

.btn-download:hover {
    transform: translateY(-2px);
    box-shadow: 0 5px 15px rgba(139, 92, 246, 0.4);
}

.btn-accept {
    background: linear-gradient(135deg, #10b981, #059669);
    color: white;
}

.btn-accept:hover {
    transform: translateY(-2px);
    box-shadow: 0 5px 15px rgba(16, 185, 129, 0.4);
}

.btn-reject {
    background: linear-gradient(135deg, #ef4444, #dc2626);
    color: white;
}

.btn-reject:hover {
    transform: translateY(-2px);
    box-shadow: 0 5px 15px rgba(239, 68, 68, 0.4);
}

/* Modals - Keep original */
.modal {
    display: none;
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(0, 0, 0, 0.9);
    backdrop-filter: blur(8px);
    z-index: 1000;
    justify-content: center;
    align-items: center;
}

.modal-content {
    background: rgba(10, 10, 20, 0.95);
    backdrop-filter: blur(20px);
    border: 1px solid rgba(139, 92, 246, 0.5);
    border-radius: 1.5rem;
    max-width: 800px;
    width: 90%;
    max-height: 85vh;
    overflow-y: auto;
    animation: modalSlideIn 0.3s ease;
}

@keyframes modalSlideIn {
    from { opacity: 0; transform: translateY(-50px); }
    to { opacity: 1; transform: translateY(0); }
}

.modal-header {
    padding: 1.25rem;
    border-bottom: 1px solid rgba(139, 92, 246, 0.3);
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.modal-body {
    padding: 1.25rem;
}

.modal-close {
    background: none;
    border: none;
    color: #c4b5fd;
    font-size: 1.5rem;
    cursor: pointer;
    transition: all 0.3s ease;
}

.modal-close:hover {
    color: #ec4899;
    transform: rotate(90deg);
}

.cover-letter-content {
    background: rgba(0, 0, 0, 0.4);
    border-radius: 1rem;
    padding: 1.5rem;
    white-space: pre-wrap;
    word-wrap: break-word;
    line-height: 1.6;
    color: #e0e0e0;
    font-size: 0.9rem;
}

.stats-card {
    background: rgba(20, 20, 40, 0.6);
    border: 1px solid rgba(139, 92, 246, 0.2);
    border-radius: 1rem;
    padding: 1rem;
    text-align: center;
}

.stats-number {
    font-size: 1.8rem;
    font-weight: 700;
    background: linear-gradient(135deg, #a78bfa, #ec4899);
    -webkit-background-clip: text;
    background-clip: text;
    color: transparent;
}

.empty-state {
    text-align: center;
    padding: 3rem;
}

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

@media (max-width: 768px) {
    body { padding: 1rem; }
    .applications-table { font-size: 0.7rem; }
    .btn-icon { padding: 0.3rem 0.6rem; font-size: 0.65rem; }
    .stats-number { font-size: 1.2rem; }
}
</style>

</head>
<body>

<div class="max-w-7xl mx-auto">
    
    <!-- Back Button -->
    <a href="${pageContext.request.contextPath}/employerViewInternship?internshipId=${internship.internshipId}" class="back-button">
        <i class="fas fa-arrow-left"></i>
        <span>Back to Internship Details</span>
        <i class="fas fa-briefcase ml-1 text-purple-400"></i>
    </a>
    
    <!-- Main Container -->
    <div class="container-glass p-6 md:p-8">
        
        <!-- Header -->
        <div class="text-center mb-8">
            <div class="inline-flex items-center justify-center w-20 h-20 rounded-full bg-gradient-to-r from-purple-500/20 to-pink-500/20 border-2 border-purple-500/30 mb-4">
                <i class="fas fa-users text-3xl text-purple-400"></i>
            </div>
            <h2 class="text-3xl md:text-4xl font-bold mb-2">
                <span class="text-gradient">Applications Received</span>
            </h2>
            <p class="text-white/50 text-sm flex items-center justify-center gap-2">
                <i class="fas fa-sparkle text-purple-400"></i>
                ${internship.title}
                <i class="fas fa-sparkle text-pink-400"></i>
            </p>
        </div>
        
        <!-- Stats Cards -->
        <div class="grid grid-cols-1 md:grid-cols-3 gap-4 mb-8">
            <div class="stats-card">
                <i class="fas fa-file-alt text-2xl text-purple-400 mb-2"></i>
                <p class="text-white/60 text-sm">Total Applications</p>
                <p class="stats-number">${applicationsCount}</p>
            </div>
            <div class="stats-card">
                <i class="fas fa-hourglass-half text-2xl text-yellow-400 mb-2"></i>
                <p class="text-white/60 text-sm">Pending Review</p>
                <p class="stats-number">
                    <c:set var="pendingCount" value="0" />
                    <c:forEach items="${applications}" var="app">
                        <c:if test="${app.applicationStatus eq 'APPLIED'}">
                            <c:set var="pendingCount" value="${pendingCount + 1}" />
                        </c:if>
                    </c:forEach>
                    ${pendingCount}
                </p>
            </div>
            <div class="stats-card">
                <i class="fas fa-check-circle text-2xl text-green-400 mb-2"></i>
                <p class="text-white/60 text-sm">Accepted</p>
                <p class="stats-number">
                    <c:set var="acceptedCount" value="0" />
                    <c:forEach items="${applications}" var="app">
                        <c:if test="${app.applicationStatus eq 'ACCEPTED'}">
                            <c:set var="acceptedCount" value="${acceptedCount + 1}" />
                        </c:if>
                    </c:forEach>
                    ${acceptedCount}
                </p>
            </div>
        </div>
        
        <!-- Applications Table - IMPROVED WRAPPER -->
        <div class="table-wrapper">
            <table class="applications-table">
                <thead>
                    <tr>
                        <th>SR</th>
                        <th>Student Name</th>
                        <th>Email</th>
                        <th>Applied Date</th>
                        <th>Cover Letter</th>
                        <th>Resume</th>
                        <th>Status</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="app" items="${applications}" varStatus="s">
                        <tr>
                            <td style="color: #94a3b8; font-weight: 500;">${s.index + 1}</td>
                            <td style="font-weight: 500; color: white;">
                                <i class="fas fa-user-graduate text-purple-400 mr-2"></i>
                                ${app.student.firstName} ${app.student.lastName}
                            </td>
                            <td style="color: #94a3b8;">
                                <i class="fas fa-envelope text-purple-400 mr-1"></i>
                                ${app.student.email}
                            </td>
                            <td style="color: #94a3b8;">
                                <i class="fas fa-calendar-alt text-purple-400 mr-1"></i>
                                ${app.appliedAt}
                            </td>
                            
                            <!-- Cover Letter -->
                            <td>
                               <button onclick='viewCoverLetter(${app.applicationId}, "${app.student.firstName} ${app.student.lastName}")' 
                                        class="btn-icon btn-view">
                                    <i class="fas fa-envelope"></i> View
                                </button>
                            </td>
                            
                            <!-- Resume -->
                            <td>
                                <button onclick='viewResume("${app.resumeUrl}", "${app.student.firstName} ${app.student.lastName}")'
                                    class="btn-icon btn-view">
                                    <i class="fas fa-file-pdf"></i> View
                                </button>
                            </td>
                            
                            <!-- Status -->
                            <td>
                                <span class="status-badge status-${app.applicationStatus.toLowerCase()}">
                                    <c:choose>
                                        <c:when test="${app.applicationStatus eq 'APPLIED'}">
                                            <i class="fas fa-hourglass-half"></i> Pending
                                        </c:when>
                                        <c:when test="${app.applicationStatus eq 'ACCEPTED'}">
                                            <i class="fas fa-check-circle"></i> Accepted
                                        </c:when>
                                        <c:when test="${app.applicationStatus eq 'REJECTED'}">
                                            <i class="fas fa-times-circle"></i> Rejected
                                        </c:when>
                                    </c:choose>
                                </span>
                            </td>
                            
                            <!-- Actions -->
                            <td>
                                <div class="flex gap-2 flex-wrap">
                                    <c:if test="${app.applicationStatus eq 'APPLIED'}">
                                        <a href="updateApplicationStatus?appId=${app.applicationId}&status=ACCEPTED&redirectUrl=${redirectTo}" 
                                           class="btn-icon btn-accept"
                                           onclick="return confirm('Accept ${app.student.firstName} ${app.student.lastName}?')">
                                           <i class="fas fa-check"></i> Accept
                                        </a>
                                        <a href="updateApplicationStatus?appId=${app.applicationId}&status=REJECTED&redirectUrl=${redirectTo}" 
                                           class="btn-icon btn-reject"
                                           onclick="return confirm('Reject ${app.student.firstName} ${app.student.lastName}?')">
                                           <i class="fas fa-times"></i> Reject
                                        </a>
                                    </c:if>
                                    <c:if test="${app.applicationStatus ne 'APPLIED'}">
                                        <span class="text-white/40 text-xs">Already ${app.applicationStatus}</span>
                                    </c:if>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                    
                    <c:if test="${empty applications}">
                        <tr>
                            <td colspan="8" class="empty-state">
                                <div class="text-center py-12">
                                    <i class="fas fa-inbox text-6xl text-purple-400 mb-4"></i>
                                    <h3 class="text-xl font-bold text-white mb-2">No Applications Yet</h3>
                                    <p class="text-white/50">No students have applied for this internship yet</p>
                                    <p class="text-white/40 text-sm mt-2">Share this internship to attract more applicants</p>
                                </div>
                            </td>
                        </tr>
                    </c:if>
                </tbody>
            </table>
        </div>
        
        <!-- Footer Note -->
        <div class="mt-6 text-center">
            <p class="text-white/30 text-xs">
                <i class="fas fa-shield-alt mr-1"></i> 
                Review applications carefully before accepting or rejecting
            </p>
        </div>
        
    </div>
</div>

<!-- Cover Letter Modal -->
<div id="coverLetterModal" class="modal">
    <div class="modal-content">
        <div class="modal-header">
            <h3 class="text-xl font-bold text-gradient">
                <i class="fas fa-envelope mr-2"></i> Cover Letter
            </h3>
            <button class="modal-close" onclick="closeModal()">
                <i class="fas fa-times"></i>
            </button>
        </div>
        <div class="modal-body" id="coverLetterBody">
            <div class="text-center">
                <i class="fas fa-spinner fa-spin text-3xl text-purple-400"></i>
                <p class="text-white mt-2">Loading cover letter...</p>
            </div>
        </div>
    </div>
</div>

<!-- Resume Image Modal -->
<div id="resumeModal" class="modal">
    <div class="modal-content" style="max-width: 900px;">
        <div class="modal-header">
            <h3 class="text-xl font-bold text-gradient">
                <i class="fas fa-image mr-2"></i> Resume Preview
            </h3>
            <button class="modal-close" onclick="closeResumeModal()">
                <i class="fas fa-times"></i>
            </button>
        </div>
        <div class="modal-body text-center">
            <img id="resumeImage" 
                 src="" 
                 style="max-width:100%; border-radius:10px;">
        </div>
    </div>
</div>

<script>
// Escape HTML to prevent XSS attacks
function escapeHtml(text) {
    if (!text) return '';
    var div = document.createElement('div');
    div.textContent = text;
    return div.innerHTML;
}

function viewCoverLetter(applicationId, studentName) {
    var modal = document.getElementById('coverLetterModal');
    var modalBody = document.getElementById('coverLetterBody');
    
    modal.style.display = 'flex';
    modalBody.innerHTML = '<div class="text-center">' +
        '<i class="fas fa-spinner fa-spin text-3xl text-purple-400"></i>' +
        '<p class="text-white mt-2">Loading cover letter for ' + escapeHtml(studentName) + '...</p>' +
        '</div>';
    
    fetch('${pageContext.request.contextPath}/viewCoverLetter?applicationId=' + applicationId)
        .then(function(response) { return response.json(); })
        .then(function(data) {
            if (data.success && data.content) {
                modalBody.innerHTML = '<div class="space-y-4">' +
                    '<div class="cover-letter-content">' +
                    '<i class="fas fa-quote-left text-purple-400 mb-2 block"></i>' +
                    escapeHtml(data.content) +
                    '</div>' +
                    '<div class="text-center">' +
                    '</div>' +
                    '</div>';
            } else {
                modalBody.innerHTML = '<div class="text-center">' +
                    '<i class="fas fa-exclamation-triangle text-5xl text-yellow-500 mb-4"></i>' +
                    '<p class="text-white">No cover letter provided by the student</p>' +
                    '</div>';
            }
        })
        .catch(function(error) {
            console.error('Error:', error);
            modalBody.innerHTML = '<div class="text-center">' +
                '<i class="fas fa-exclamation-circle text-5xl text-red-500 mb-4"></i>' +
                '<p class="text-white">Failed to load cover letter</p>' +
                '</div>';
        });
}

function closeModal() {
    document.getElementById('coverLetterModal').style.display = 'none';
}

document.addEventListener('keydown', function(e) {
    if (e.key === 'Escape') {
        closeModal();
    }
});

document.getElementById('coverLetterModal').addEventListener('click', function(e) {
    if (e.target === this) {
        closeModal();
    }
});

function viewResume(url, studentName) {
    var modal = document.getElementById('resumeModal');
    var img = document.getElementById('resumeImage');

    modal.style.display = 'flex';
    img.src = url;
}

function closeResumeModal() {
    document.getElementById('resumeModal').style.display = 'none';
    document.getElementById('resumeImage').src = "";
}
</script>

</body>
</html>