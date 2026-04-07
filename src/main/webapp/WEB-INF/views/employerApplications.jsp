<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="redirectTo" value="/employerApplications" />
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
    transition: all 0.3s ease;
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

/* Clean Table Design */
.table-wrapper {
    background: rgba(15, 15, 30, 0.6);
    border-radius: 1.25rem;
    overflow-x: auto;
    border: 1px solid rgba(139, 92, 246, 0.2);
}

.applications-table {
    width: 100%;
    border-collapse: collapse;
    min-width: 1000px;
}

.applications-table thead {
    background: linear-gradient(135deg, rgba(139, 92, 246, 0.2), rgba(236, 72, 153, 0.1));
}

.applications-table thead th {
    padding: 1rem 1rem;
    text-align: left;
    color: #e0d4ff;
    font-weight: 600;
    font-size: 0.75rem;
    text-transform: uppercase;
    letter-spacing: 0.05em;
    border-bottom: 1px solid rgba(139, 92, 246, 0.3);
}

.applications-table tbody td {
    padding: 1rem 1rem;
    color: #e0e0e0;
    font-size: 0.875rem;
    border-bottom: 1px solid rgba(139, 92, 246, 0.1);
    vertical-align: middle;
}

.applications-table tbody tr {
    transition: all 0.2s ease;
}

.applications-table tbody tr:hover {
    background: rgba(139, 92, 246, 0.08);
}

.applications-table tbody tr:last-child td {
    border-bottom: none;
}

/* Status Badges */
.status-badge {
    display: inline-flex;
    align-items: center;
    gap: 0.375rem;
    padding: 0.25rem 0.75rem;
    border-radius: 9999px;
    font-size: 0.7rem;
    font-weight: 600;
}

.status-applied {
    background: rgba(245, 158, 11, 0.2);
    color: #fbbf24;
    border: 1px solid rgba(245, 158, 11, 0.3);
}

.status-accepted {
    background: rgba(16, 185, 129, 0.2);
    color: #34d399;
    border: 1px solid rgba(16, 185, 129, 0.3);
}

.status-rejected {
    background: rgba(239, 68, 68, 0.2);
    color: #f87171;
    border: 1px solid rgba(239, 68, 68, 0.3);
}

/* Buttons */
.btn-icon {
    display: inline-flex;
    align-items: center;
    gap: 0.375rem;
    padding: 0.375rem 0.75rem;
    border-radius: 0.5rem;
    font-size: 0.7rem;
    font-weight: 500;
    transition: all 0.2s ease;
    cursor: pointer;
    text-decoration: none;
    border: none;
}

.btn-view {
    background: rgba(59, 130, 246, 0.85);
    color: white;
}

.btn-view:hover {
    background: #3b82f6;
    transform: translateY(-1px);
}

.btn-accept {
    background: rgba(16, 185, 129, 0.85);
    color: white;
}

.btn-accept:hover {
    background: #10b981;
    transform: translateY(-1px);
}

.btn-reject {
    background: rgba(239, 68, 68, 0.85);
    color: white;
}

.btn-reject:hover {
    background: #ef4444;
    transform: translateY(-1px);
}

.btn-download {
    background: rgba(139, 92, 246, 0.85);
    color: white;
}

.btn-download:hover {
    background: #8b5cf6;
    transform: translateY(-1px);
}

/* Stats Cards */
.stats-card {
    background: rgba(20, 20, 40, 0.5);
    border: 1px solid rgba(139, 92, 246, 0.2);
    border-radius: 1rem;
    padding: 1.25rem;
    text-align: center;
    transition: all 0.3s ease;
}

.stats-card:hover {
    border-color: rgba(139, 92, 246, 0.5);
    transform: translateY(-3px);
}

.stats-number {
    font-size: 2rem;
    font-weight: 800;
    background: linear-gradient(135deg, #a78bfa, #ec4899);
    -webkit-background-clip: text;
    background-clip: text;
    color: transparent;
}

/* Modals */
.modal {
    display: none;
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(0, 0, 0, 0.95);
    backdrop-filter: blur(12px);
    z-index: 1000;
    justify-content: center;
    align-items: center;
}

.modal-content {
    background: rgba(15, 15, 30, 0.98);
    backdrop-filter: blur(20px);
    border: 1px solid rgba(139, 92, 246, 0.5);
    border-radius: 1.5rem;
    max-width: 750px;
    width: 90%;
    max-height: 85vh;
    overflow-y: auto;
    animation: modalSlideIn 0.3s ease;
}

.resume-modal-content {
    max-width: 950px;
    width: 92%;
}

@keyframes modalSlideIn {
    from { opacity: 0; transform: translateY(-30px); }
    to { opacity: 1; transform: translateY(0); }
}

.modal-header {
    padding: 1.25rem 1.5rem;
    border-bottom: 1px solid rgba(139, 92, 246, 0.3);
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.modal-body {
    padding: 1.5rem;
}

.modal-close {
    background: none;
    border: none;
    color: #c4b5fd;
    font-size: 1.25rem;
    cursor: pointer;
    transition: all 0.2s ease;
    width: 32px;
    height: 32px;
    display: flex;
    align-items: center;
    justify-content: center;
    border-radius: 50%;
}

.modal-close:hover {
    color: #ec4899;
    background: rgba(236, 72, 153, 0.1);
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

.resume-image-wrapper {
    background: rgba(0, 0, 0, 0.4);
    border-radius: 1rem;
    padding: 1rem;
    display: flex;
    justify-content: center;
    align-items: center;
    max-height: 65vh;
    overflow: auto;
}

.resume-image-wrapper img {
    max-width: 100%;
    max-height: 60vh;
    width: auto;
    height: auto;
    object-fit: contain;
    border-radius: 0.5rem;
    cursor: pointer;
    transition: transform 0.2s ease;
}

.empty-state {
    text-align: center;
    padding: 3rem;
}

.internship-badge {
    background: linear-gradient(135deg, rgba(139, 92, 246, 0.2), rgba(236, 72, 153, 0.15));
    border-radius: 2rem;
    padding: 0.5rem 1.25rem;
    display: inline-flex;
    align-items: center;
    gap: 0.5rem;
    font-size: 0.85rem;
    color: #c4b5fd;
    border: 1px solid rgba(139, 92, 246, 0.3);
}

::-webkit-scrollbar {
    width: 6px;
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
    .stats-number { font-size: 1.5rem; }
}
</style>

</head>
<body>

<div class="max-w-7xl mx-auto">
    
    <!-- Back Button -->
    <a href="${pageContext.request.contextPath}/employerdashboard" class="back-button">
        <i class="fas fa-arrow-left"></i>
        <span>Back to Internship</span>
    </a>
    
    <!-- Main Container -->
    <div class="container-glass p-6 md:p-8">
        
        <!-- Header -->
        <div class="text-center mb-8">
            <div class="inline-flex items-center justify-center w-16 h-16 rounded-full bg-gradient-to-r from-purple-500/20 to-pink-500/20 border-2 border-purple-500/30 mb-4">
                <i class="fas fa-users text-2xl text-purple-400"></i>
            </div>
            <h2 class="text-2xl md:text-3xl font-bold mb-2">
                <span class="text-gradient">Applications</span>
            </h2>
            <div class="inline-flex items-center gap-2 mt-2">
                <div class="internship-badge">
                    <i class="fas fa-briefcase text-purple-400"></i>
                    <span>${internship.title}</span>
                </div>
            </div>
        </div>
        
        <!-- Stats Cards -->
        <div class="grid grid-cols-1 md:grid-cols-3 gap-4 mb-8">
            <div class="stats-card">
                <i class="fas fa-file-alt text-xl text-purple-400 mb-2"></i>
                <p class="text-white/50 text-xs uppercase tracking-wide mb-1">Total</p>
                <p class="stats-number">${applications.size()}</p>
            </div>
            <div class="stats-card">
                <i class="fas fa-hourglass-half text-xl text-yellow-400 mb-2"></i>
                <p class="text-white/50 text-xs uppercase tracking-wide mb-1">Pending</p>
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
                <i class="fas fa-check-circle text-xl text-green-400 mb-2"></i>
                <p class="text-white/50 text-xs uppercase tracking-wide mb-1">Accepted</p>
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
        
        <!-- Applications Table with Internship Name Column -->
        <div class="table-wrapper">
            <table class="applications-table">
                <thead>
                    <tr>
                        <th>SR</th>
                        <th>Student</th>
                        <th>Email</th>
                        <th>Internship</th>
                        <th>Applied On</th>
                        <th>Cover Letter</th>
                        <th>Resume</th>
                        <th>Status</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="app" items="${applications}" varStatus="s">
                        <tr>
                            <td class="text-white/50">${s.index + 1}</td>
                            <td class="font-medium text-white">
                                <div class="flex items-center gap-2">
                                    <div class="w-7 h-7 rounded-full bg-purple-500/20 flex items-center justify-center">
                                        <i class="fas fa-user-graduate text-purple-400 text-xs"></i>
                                    </div>
                                    ${app.student.firstName} ${app.student.lastName}
                                </div>
                            </td>
                            <td class="text-white/60 text-sm">${app.student.email}</td>
                            <td class="text-white/80 text-sm">
                                <i class="fas fa-briefcase text-purple-400 mr-1"></i>
                                ${app.internship.title}
                            </td>
                            <td class="text-white/60 text-sm">${app.appliedAt}</td>
                            <td>
                                <button onclick='viewCoverLetter(${app.applicationId}, "${app.student.firstName} ${app.student.lastName}")' 
                                        class="btn-icon btn-view">
                                    <i class="fas fa-envelope"></i> View
                                </button>
                            </td>
                            <td>
                                <button onclick='viewResumeEnhanced("${app.resumeUrl}", "${app.student.firstName} ${app.student.lastName}")'
                                        class="btn-icon btn-view">
                                    <i class="fas fa-file-pdf"></i> View
                                </button>
                            </td>
                            <td>
                                <span class="status-badge status-${app.applicationStatus.toLowerCase()}">
                                    <c:choose>
                                        <c:when test="${app.applicationStatus eq 'APPLIED'}">
                                            <i class="fas fa-clock"></i> Pending
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
                            <td>
                                <div class="flex gap-1.5">
                                    <c:if test="${app.applicationStatus eq 'APPLIED'}">
                                        <a href="updateApplicationStatus?appId=${app.applicationId}&status=ACCEPTED&redirectUrl=${redirectTo}" 
                                           class="btn-icon btn-accept"
                                           onclick="return confirm('Accept ${app.student.firstName} ${app.student.lastName} for ${app.internship.title}?')">
                                           <i class="fas fa-check"></i> Accept
                                        </a>
                                        <a href="updateApplicationStatus?appId=${app.applicationId}&status=REJECTED&redirectUrl=${redirectTo}" 
                                           class="btn-icon btn-reject"
                                           onclick="return confirm('Reject ${app.student.firstName} ${app.student.lastName} for ${app.internship.title}?')">
                                           <i class="fas fa-times"></i> Reject
                                        </a>
                                    </c:if>
                                    <c:if test="${app.applicationStatus ne 'APPLIED'}">
                                        <span class="text-white/30 text-xs">Processed</span>
                                    </c:if>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                    
                    <c:if test="${empty applications}">
                        <tr>
                            <td colspan="9" class="empty-state">
                                <div class="text-center py-12">
                                    <i class="fas fa-inbox text-5xl text-purple-400/50 mb-3"></i>
                                    <p class="text-white/50">No applications yet for ${internship.title}</p>
                                </div>
                            </td>
                        </tr>
                    </c:if>
                </tbody>
            </table>
        </div>
        
        <!-- Footer -->
        <div class="mt-6 text-center">
            <p class="text-white/25 text-xs">
                <i class="fas fa-shield-alt"></i> Review applications before making a decision
            </p>
        </div>
        
    </div>
</div>

<!-- Cover Letter Modal -->
<div id="coverLetterModal" class="modal">
    <div class="modal-content">
        <div class="modal-header">
            <h3 class="text-lg font-bold text-gradient">
                <i class="fas fa-envelope mr-2"></i> Cover Letter
            </h3>
            <button class="modal-close" onclick="closeModal()">
                <i class="fas fa-times"></i>
            </button>
        </div>
        <div class="modal-body" id="coverLetterBody">
            <div class="text-center py-8">
                <i class="fas fa-spinner fa-spin text-2xl text-purple-400"></i>
                <p class="text-white/60 mt-2">Loading...</p>
            </div>
        </div>
    </div>
</div>

<!-- Resume Modal -->
<div id="resumeModalEnhanced" class="modal">
    <div class="modal-content resume-modal-content">
        <div class="modal-header">
            <div>
                <h3 class="text-lg font-bold text-gradient">
                    <i class="fas fa-file-image mr-2"></i> Resume
                </h3>
                <p id="resumeStudentName" class="text-white/40 text-xs mt-1">Student Document</p>
            </div>
            <button class="modal-close" onclick="closeResumeModalEnhanced()">
                <i class="fas fa-times"></i>
            </button>
        </div>
        <div class="modal-body">
            <div class="resume-image-wrapper">
                <img id="resumeImageEnhanced" src="" alt="Resume">
            </div>
            <div class="flex justify-center gap-3 mt-4">
                <button onclick="downloadResumeEnhanced()" class="btn-icon btn-download">
                    <i class="fas fa-download"></i> Download
                </button>
                <button onclick="closeResumeModalEnhanced()" class="btn-icon" style="background: rgba(100, 100, 140, 0.5); color: white;">
                    <i class="fas fa-times"></i> Close
                </button>
            </div>
        </div>
    </div>
</div>

<script>
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
    modalBody.innerHTML = '<div class="text-center py-8"><i class="fas fa-spinner fa-spin text-2xl text-purple-400"></i><p class="text-white/60 mt-2">Loading...</p></div>';
    
    fetch('${pageContext.request.contextPath}/viewCoverLetter?applicationId=' + applicationId)
        .then(function(response) { return response.json(); })
        .then(function(data) {
            if (data.success && data.content) {
                modalBody.innerHTML = '<div class="cover-letter-content">' +
                    '<i class="fas fa-quote-left text-purple-400 mb-2 block"></i>' +
                    escapeHtml(data.content) +
                    '</div>' +
                    '<div class="text-center text-white/40 text-xs mt-3">— ' + escapeHtml(studentName) + '</div>';
            } else {
                modalBody.innerHTML = '<div class="text-center py-8"><i class="fas fa-inbox text-3xl text-yellow-500/50"></i><p class="text-white/50 mt-2">No cover letter provided</p></div>';
            }
        })
        .catch(function() {
            modalBody.innerHTML = '<div class="text-center py-8"><i class="fas fa-exclamation-circle text-3xl text-red-500/50"></i><p class="text-white/50 mt-2">Failed to load</p></div>';
        });
}

function closeModal() {
    document.getElementById('coverLetterModal').style.display = 'none';
}

let currentResumeUrl = '';

function viewResumeEnhanced(url, studentName) {
    if (!url) {
        alert("Resume not available");
        return;
    }
    currentResumeUrl = url;
    document.getElementById('resumeStudentName').innerHTML = '<i class="fas fa-user-graduate mr-1"></i> ' + escapeHtml(studentName);
    document.getElementById('resumeImageEnhanced').src = url;
    document.getElementById('resumeModalEnhanced').style.display = 'flex';
}

function closeResumeModalEnhanced() {
    document.getElementById('resumeModalEnhanced').style.display = 'none';
    document.getElementById('resumeImageEnhanced').src = '';
}

function downloadResumeEnhanced() {
    if (currentResumeUrl) {
        var link = document.createElement('a');
        link.href = currentResumeUrl;
        link.download = currentResumeUrl.split('/').pop() || 'resume';
        document.body.appendChild(link);
        link.click();
        document.body.removeChild(link);
    }
}

document.addEventListener('keydown', function(e) {
    if (e.key === 'Escape') {
        closeModal();
        closeResumeModalEnhanced();
    }
});

document.getElementById('coverLetterModal').addEventListener('click', function(e) {
    if (e.target === this) closeModal();
});
document.getElementById('resumeModalEnhanced').addEventListener('click', function(e) {
    if (e.target === this) closeResumeModalEnhanced();
});
</script>

</body>
</html>