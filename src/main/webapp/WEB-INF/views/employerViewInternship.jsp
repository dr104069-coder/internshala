<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html>
<head>
<title>Internship Details | Employer Dashboard</title>

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

.status-badge {
    display: inline-flex;
    align-items: center;
    gap: 0.5rem;
    padding: 0.5rem 1.25rem;
    border-radius: 9999px;
    font-size: 0.8rem;
    font-weight: 600;
}

.status-active {
    background: linear-gradient(135deg, #10b981, #059669);
    color: white;
    box-shadow: 0 0 15px rgba(16, 185, 129, 0.3);
}

.status-completed {
    background: linear-gradient(135deg, #6b7280, #4b5563);
    color: white;
}

.status-closing {
    background: linear-gradient(135deg, #f59e0b, #d97706);
    color: white;
    box-shadow: 0 0 15px rgba(245, 158, 11, 0.3);
}

.info-card {
    background: rgba(20, 20, 40, 0.5);
    border: 1px solid rgba(139, 92, 246, 0.15);
    border-radius: 1rem;
    padding: 0.875rem 1rem;
    transition: all 0.3s ease;
}

.info-card:hover {
    border-color: rgba(139, 92, 246, 0.4);
    background: rgba(20, 20, 40, 0.7);
}

.info-label {
    color: #9ca3af;
    font-size: 0.7rem;
    text-transform: uppercase;
    letter-spacing: 0.5px;
    font-weight: 600;
    margin-bottom: 0.25rem;
}

.info-value {
    color: white;
    font-size: 0.95rem;
    font-weight: 500;
    word-break: break-word;
}

.skill-tag {
    display: inline-block;
    background: linear-gradient(135deg, rgba(139, 92, 246, 0.2), rgba(236, 72, 153, 0.2));
    border: 1px solid rgba(139, 92, 246, 0.4);
    border-radius: 9999px;
    padding: 0.35rem 1rem;
    font-size: 0.75rem;
    font-weight: 500;
    color: #c4b5fd;
    margin: 0.25rem;
    transition: all 0.3s ease;
}

.skill-tag:hover {
    background: linear-gradient(135deg, rgba(139, 92, 246, 0.4), rgba(236, 72, 153, 0.4));
    transform: translateY(-2px);
    border-color: rgba(139, 92, 246, 0.7);
}

.btn-edit, .btn-applications, .btn-delete {
    padding: 0.7rem 1.5rem;
    border-radius: 0.75rem;
    font-weight: 600;
    font-size: 0.85rem;
    transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
    text-decoration: none;
    display: inline-flex;
    align-items: center;
    gap: 0.5rem;
    border: none;
    cursor: pointer;
}

.btn-edit {
    background: linear-gradient(135deg, #8b5cf6, #7c3aed);
    color: white;
}

.btn-edit:hover {
    transform: translateY(-2px);
    box-shadow: 0 10px 25px rgba(139, 92, 246, 0.4);
}

.btn-applications {
    background: linear-gradient(135deg, #3b82f6, #2563eb);
    color: white;
}

.btn-applications:hover {
    transform: translateY(-2px);
    box-shadow: 0 10px 25px rgba(59, 130, 246, 0.4);
}

.btn-delete {
    background: linear-gradient(135deg, #ef4444, #dc2626);
    color: white;
}

.btn-delete:hover {
    transform: translateY(-2px);
    box-shadow: 0 10px 25px rgba(239, 68, 68, 0.4);
}

.poster-container {
    background: rgba(0, 0, 0, 0.3);
    border-radius: 1rem;
    padding: 1rem;
    border: 1px solid rgba(139, 92, 246, 0.2);
}

.poster-image {
    width: 100%;
    max-height: 280px;
    object-fit: contain;
    border-radius: 0.75rem;
    transition: all 0.3s ease;
}

.poster-image:hover {
    transform: scale(1.02);
}

.divider {
    border-top: 1px solid rgba(139, 92, 246, 0.15);
    margin: 1.5rem 0;
}

.section-title {
    font-size: 1rem;
    font-weight: 700;
    color: #c4b5fd;
    text-transform: uppercase;
    letter-spacing: 1px;
    margin-bottom: 1rem;
    display: flex;
    align-items: center;
    gap: 0.5rem;
}

.section-title i {
    color: #8b5cf6;
}

.company-badge {
    background: linear-gradient(135deg, rgba(139, 92, 246, 0.3), rgba(236, 72, 153, 0.3));
    border-radius: 0.75rem;
    padding: 1rem;
    border-left: 4px solid #8b5cf6;
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
    .info-card { padding: 0.7rem; }
    .info-value { font-size: 0.85rem; }
    .btn-edit, .btn-applications, .btn-delete { padding: 0.5rem 1rem; font-size: 0.75rem; }
}
</style>

</head>
<body>

<div class="max-w-6xl mx-auto">
    
    <!-- Back Button -->
    <a href="${pageContext.request.contextPath}/employerdashboard" class="back-button">
        <i class="fas fa-arrow-left"></i>
        <span>Back to Dashboard</span>
        <i class="fas fa-chalkboard-user ml-1 text-purple-400"></i>
    </a>
    
    <!-- Main Container -->
    <div class="container-glass p-6 md:p-8">
        
        <!-- Header with Title and Status -->
        <div class="flex flex-col md:flex-row justify-between items-start md:items-center gap-4 mb-6">
            <div>
                <div class="flex items-center gap-2 mb-2">
                    <i class="fas fa-briefcase text-purple-400 text-xl"></i>
                    <span class="text-purple-300 text-sm font-medium">Internship Details</span>
                </div>
                <h1 class="text-2xl md:text-3xl font-bold">
                    <span class="text-gradient">${internship.title}</span>
                </h1>
            </div>
            <div>
                <c:choose>
                    <c:when test="${internship.status eq 'ACTIVE'}">
                        <span class="status-badge status-active">
                            <i class="fas fa-play-circle"></i> Active
                        </span>
                    </c:when>
                    <c:when test="${internship.status eq 'COMPLETED'}">
                        <span class="status-badge status-completed">
                            <i class="fas fa-check-circle"></i> Completed
                        </span>
                    </c:when>
                    <c:otherwise>
                        <span class="status-badge status-closing">
                            <i class="fas fa-hourglass-half"></i> Closing Soon
                        </span>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
        
        <div class="divider"></div>
        
        <!-- Two Column Layout: Left Content + Right Poster -->
        <div class="grid grid-cols-1 lg:grid-cols-3 gap-8">
            
            <!-- Left Column - Main Content -->
            <div class="lg:col-span-2 space-y-6">
                
                <!-- Company Info -->
                <div>
                    <div class="section-title">
                        <i class="fas fa-building"></i>
                        Company Information
                    </div>
                    <div class="company-badge">
                        <div class="flex items-center gap-3">
                            <div class="w-10 h-10 rounded-full bg-gradient-to-r from-purple-500/20 to-pink-500/20 flex items-center justify-center">
                                <i class="fas fa-building text-purple-400"></i>
                            </div>
                            <div>
                                <p class="text-white font-semibold text-lg">${internship.employer.companyName}</p>
                                <p class="text-purple-300 text-xs">Verified Employer</p>
                            </div>
                        </div>
                    </div>
                </div>
                
                <!-- Description -->
                <div>
                    <div class="section-title">
                        <i class="fas fa-align-left"></i>
                        Description
                    </div>
                    <div class="info-card">
                        <p class="text-white/80 leading-relaxed">${internship.description}</p>
                    </div>
                </div>
                
                <!-- Key Details Grid -->
                <div>
                    <div class="section-title">
                        <i class="fas fa-info-circle"></i>
                        Key Information
                    </div>
                    <div class="grid grid-cols-1 sm:grid-cols-2 gap-3">
                        
                        <div class="info-card">
                            <div class="info-label">
                                <i class="fas fa-laptop-code mr-1"></i> Work Type
                            </div>
                            <div class="info-value">
                                <c:choose>
                                    <c:when test="${internship.internshipType eq 'REMOTE'}">
                                        <i class="fas fa-globe mr-1 text-purple-400"></i> Remote
                                    </c:when>
                                    <c:when test="${internship.internshipType eq 'ONSITE'}">
                                        <i class="fas fa-building mr-1 text-purple-400"></i> Onsite
                                    </c:when>
                                    <c:otherwise>
                                        <i class="fas fa-exchange-alt mr-1 text-purple-400"></i> Hybrid
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                        
                        <div class="info-card">
                            <div class="info-label">
                                <i class="fas fa-map-marker-alt mr-1"></i> Location
                            </div>
                            <div class="info-value">
                                <i class="fas fa-location-dot mr-1 text-purple-400"></i> 
                                ${internship.location != null ? internship.location : 'Not specified'}
                            </div>
                        </div>
                        
                        <div class="info-card">
                            <div class="info-label">
                                <i class="fas fa-calendar-week mr-1"></i> Duration
                            </div>
                            <div class="info-value">
                                <i class="fas fa-hourglass-half mr-1 text-purple-400"></i> 
                                ${internship.durationMonths} month(s)
                            </div>
                        </div>
                        
                        <div class="info-card">
                            <div class="info-label">
                                <i class="fas fa-rupee-sign mr-1"></i> Stipend
                            </div>
                            <div class="info-value">
                                <c:choose>
                                    <c:when test="${internship.isPaid && internship.stipend > 0}">
                                        <i class="fas fa-coins mr-1 text-purple-400"></i> ₹ ${internship.stipend}/month
                                    </c:when>
                                    <c:otherwise>
                                        <i class="fas fa-gift mr-1 text-purple-400"></i> Unpaid
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                        
                        <div class="info-card">
                            <div class="info-label">
                                <i class="fas fa-users mr-1"></i> Openings
                            </div>
                            <div class="info-value">
                                <i class="fas fa-user-plus mr-1 text-purple-400"></i> 
                                ${internship.openings != null ? internship.openings : 'Not specified'}
                            </div>
                        </div>
                        
                        <div class="info-card">
                            <div class="info-label">
                                <i class="fas fa-calendar-alt mr-1"></i> Start Date
                            </div>
                            <div class="info-value">
                                <i class="fas fa-play-circle mr-1 text-purple-400"></i> 
                                ${internship.startDate != null ? internship.startDate : 'Flexible'}
                            </div>
                        </div>
                    </div>
                </div>
                
                <!-- Important Dates -->
                <div>
                    <div class="section-title">
                        <i class="fas fa-calendar"></i>
                        Important Dates
                    </div>
                    <div class="grid grid-cols-1 sm:grid-cols-3 gap-3">
                        <div class="info-card">
                            <div class="info-label">Applications Open</div>
                            <div class="info-value">
                                <i class="fas fa-hourglass-start mr-1 text-purple-400"></i>
                                ${internship.startApplyDate != null ? internship.startApplyDate : 'Open now'}
                            </div>
                        </div>
                        <div class="info-card">
                            <div class="info-label">Last Apply Date</div>
                            <div class="info-value">
                                <i class="fas fa-hourglass-end mr-1 text-purple-400"></i>
                                ${internship.lastApplyDate != null ? internship.lastApplyDate : 'Rolling basis'}
                            </div>
                        </div>
                        <div class="info-card">
                            <div class="info-label">Posted On</div>
                            <div class="info-value">
                                <i class="fas fa-calendar-plus mr-1 text-purple-400"></i>
                                ${internship.createdAt != null ? internship.createdAt.toLocalDate() : 'Recently'}
                            </div>
                        </div>
                    </div>
                </div>
                
                <!-- Skills -->
                <div>
                    <div class="section-title">
                        <i class="fas fa-microchip"></i>
                        Required Skills
                    </div>
                    <div class="info-card">
                        <div class="flex flex-wrap gap-2">
                            <c:if test="${not empty internship.skillsRequired}">
                                <c:set var="skills" value="${internship.skillsRequired.split(',')}" />
                                <c:forEach var="skill" items="${skills}">
                                    <span class="skill-tag">
                                        <i class="fas fa-code mr-1"></i> ${skill.trim()}
                                    </span>
                                </c:forEach>
                            </c:if>
                            <c:if test="${empty internship.skillsRequired}">
                                <span class="text-white/50">No specific skills listed</span>
                            </c:if>
                        </div>
                    </div>
                </div>
                
            </div>
            
            <!-- Right Column - Poster Image -->
            <div class="lg:col-span-1">
                <div class="sticky top-8">
                    <div class="section-title">
                        <i class="fas fa-image"></i>
                        Internship Poster
                    </div>
                    <div class="poster-container">
                        <c:if test="${not empty internship.posterUrl}">
                            <img src="${internship.posterUrl}" alt="${internship.title}" class="poster-image">
                            <p class="text-center text-white/40 text-xs mt-3">
                                <i class="fas fa-download mr-1"></i> Click image to enlarge
                            </p>
                        </c:if>
                        <c:if test="${empty internship.posterUrl}">
                            <div class="flex flex-col items-center justify-center py-12 text-center">
                                <div class="w-24 h-24 rounded-full bg-gradient-to-r from-purple-500/20 to-pink-500/20 flex items-center justify-center mb-4">
                                    <i class="fas fa-image text-4xl text-purple-400"></i>
                                </div>
                                <p class="text-white/50 text-sm">No poster uploaded</p>
                                <p class="text-white/30 text-xs mt-1">Upload a poster to attract more applicants</p>
                            </div>
                        </c:if>
                    </div>
                </div>
            </div>
            
        </div>
        
        <div class="divider"></div>
        
        <!-- Action Buttons -->
        <div class="flex flex-wrap justify-center gap-4 mt-4">
            <a href="${pageContext.request.contextPath}/editInternship?internshipId=${internship.internshipId}" 
               class="btn-edit">
                <i class="fas fa-edit"></i>
                Edit Internship
            </a>
            <a href="${pageContext.request.contextPath}/internshipApplications?internshipId=${internship.internshipId}" 
               class="btn-applications">
                <i class="fas fa-file-alt"></i>
                View Applications
            </a>
            <button onclick="deleteInternship(${internship.internshipId})" 
                    class="btn-delete">
                <i class="fas fa-trash-alt"></i>
                Delete Internship
            </button>
        </div>
        
        <!-- Footer Stats -->
        <div class="mt-8 pt-4 border-t border-white/10">
            <div class="flex justify-center gap-8 text-center">
               
            </div>
        </div>
        
    </div>
</div>

<script>
function deleteInternship(id) {
    if(confirm('⚠️ Are you sure you want to delete this internship?\n\nThis action cannot be undone.\nAll applications for this internship will also be deleted.')) {
        window.location.href = '${pageContext.request.contextPath}/deleteInternship?internshipId=' + id;
    }
}

// Click to enlarge poster
document.querySelectorAll('.poster-image').forEach(img => {
    img.addEventListener('click', function() {
        window.open(this.src, '_blank');
    });
});
</script>

</body>
</html>