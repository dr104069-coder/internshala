<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.grownited.entity.UserEntity" %>

<%
    UserEntity user = (UserEntity) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect(request.getContextPath() + "/login");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>My Certificates | SmartIntern</title>

<!-- Bootstrap 5 & Icons -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">
<!-- Font Awesome 6 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
<!-- AOS Animation -->
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">

<style>
:root {
    /* Ocean Sunset Color Palette - Matches Student Dashboard */
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
    --soft-blue: #d4eaff;
    
    --primary: #4361ee;
    --success: #10b981;
    --warning: #f59e0b;
    --danger: #ef4444;
    --dark: #0f172a;
    --gray: #475569;
    --card-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.1);
    --hover-shadow: 0 30px 60px -15px rgba(0, 0, 0, 0.15);
    --glass-bg: rgba(210, 235, 255, 0.95);
    --transition-smooth: 350ms cubic-bezier(0.23, 1, 0.32, 1);
    
    --bg-primary: #d9efff;
    --bg-secondary: #c6e6ff;
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
    min-height: 100vh;
    padding: 2rem;
}

/* Custom Scrollbar */
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

/* Main container */
.main-certificates-container {
    max-width: 1400px;
    margin: 0 auto;
    width: 100%;
    animation: fadeInUp 0.8s ease-out;
}

@keyframes fadeInUp {
    from {
        opacity: 0;
        transform: translateY(20px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

/* Page Header */
.page-header {
    margin-bottom: 2rem;
}
.page-header h1 {
    font-size: 2rem;
    font-weight: 700;
    background: linear-gradient(135deg, var(--cerulean), var(--tropical-teal));
    -webkit-background-clip: text;
    background-clip: text;
    color: transparent;
    margin-bottom: 0.5rem;
    display: inline-block;
}
.page-header p {
    color: var(--gray);
    font-weight: 500;
}

/* Certificate Card - Glassmorphism */
.certificate-card-modern {
    background: rgba(255, 255, 255, 0.85);
    backdrop-filter: blur(8px);
    border-radius: 24px;
    padding: 1.5rem;
    box-shadow: 0 10px 25px -5px rgba(0, 0, 0, 0.05);
    transition: all 0.4s cubic-bezier(0.165, 0.84, 0.44, 1);
    border: 1px solid var(--tropical-teal);
    height: 100%;
    display: flex;
    flex-direction: column;
    animation: cardGlide 0.5s ease-out backwards;
}

.certificate-card-modern:hover {
    transform: translateY(-6px);
    border-color: var(--cerulean);
    box-shadow: var(--hover-shadow);
    background: rgba(255, 255, 255, 0.95);
}

@keyframes cardGlide {
    from {
        opacity: 0;
        transform: translateY(15px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

/* Verified Badge */
.verified-badge {
    background: linear-gradient(135deg, var(--tropical-teal), var(--cerulean));
    color: white;
    padding: 0.3rem 1rem;
    border-radius: 40px;
    font-size: 0.7rem;
    font-weight: 700;
    display: inline-flex;
    align-items: center;
    gap: 0.4rem;
    letter-spacing: 0.3px;
}

/* Certificate Icon */
.cert-icon {
    width: 52px;
    height: 52px;
    background: linear-gradient(135deg, var(--cerulean), var(--tropical-teal));
    border-radius: 18px;
    display: flex;
    align-items: center;
    justify-content: center;
    color: white;
    font-size: 1.4rem;
    transition: all 0.3s;
}

.certificate-card-modern:hover .cert-icon {
    transform: rotate(5deg) scale(1.05);
}

/* Detail Rows */
.detail-row {
    display: flex;
    align-items: center;
    gap: 0.6rem;
    font-size: 0.8rem;
    color: var(--gray);
    margin-bottom: 0.6rem;
}

.detail-row i {
    width: 18px;
    color: var(--cerulean);
    font-size: 0.8rem;
}

.rating-stars i {
    color: #fbbf24;
    font-size: 0.7rem;
}
.rating-stars .grey-star {
    color: #cbd5e1;
}

.verification-code {
    font-family: monospace;
    background: rgba(36, 123, 160, 0.1);
    padding: 0.2rem 0.5rem;
    border-radius: 12px;
    font-size: 0.75rem;
    font-weight: 600;
    color: var(--cerulean);
}

/* Buttons */
.btn-outline-cert {
    padding: 0.5rem 1rem;
    border: 1px solid rgba(36, 123, 160, 0.4);
    border-radius: 40px;
    background: transparent;
    color: var(--cerulean);
    font-size: 0.75rem;
    font-weight: 600;
    transition: all 0.3s;
    text-decoration: none;
    display: inline-flex;
    align-items: center;
    gap: 0.5rem;
    cursor: pointer;
}
.btn-outline-cert:hover {
    background: rgba(36, 123, 160, 0.1);
    border-color: var(--cerulean);
    transform: translateY(-2px);
}

.btn-primary-cert {
    background: linear-gradient(135deg, var(--cerulean), var(--tropical-teal));
    border: none;
    border-radius: 40px;
    color: white;
    font-size: 0.75rem;
    font-weight: 600;
    padding: 0.5rem 1.2rem;
    transition: all 0.3s;
    text-decoration: none;
    display: inline-flex;
    align-items: center;
    gap: 0.5rem;
    cursor: pointer;
}
.btn-primary-cert:hover {
    transform: translateY(-2px);
    box-shadow: 0 5px 12px rgba(36, 123, 160, 0.3);
}

/* Stats Cards */
.stats-card-glass {
    background: rgba(255, 255, 255, 0.75);
    backdrop-filter: blur(8px);
    border-radius: 24px;
    padding: 1.2rem;
    text-align: center;
    border: 1px solid var(--tropical-teal);
    transition: all 0.3s;
}
.stats-card-glass:hover {
    transform: translateY(-3px);
    background: rgba(255, 255, 255, 0.85);
    border-color: var(--cerulean);
}
.stats-icon {
    font-size: 2rem;
    color: var(--cerulean);
    margin-bottom: 0.5rem;
}
.stats-number {
    font-size: 1.8rem;
    font-weight: 800;
    color: var(--cerulean-dark);
    line-height: 1.2;
}
.stats-label {
    font-size: 0.7rem;
    font-weight: 600;
    color: var(--gray);
    text-transform: uppercase;
    letter-spacing: 0.5px;
}

/* Empty State */
.no-results-modern {
    text-align: center;
    padding: 3rem;
    background: rgba(255, 255, 255, 0.7);
    backdrop-filter: blur(8px);
    border-radius: 32px;
    border: 1px solid var(--tropical-teal);
}
.no-results-modern i {
    font-size: 3.5rem;
    color: var(--cerulean);
    margin-bottom: 1rem;
    opacity: 0.7;
}
.no-results-modern h3 {
    color: var(--dark);
    font-weight: 700;
}

/* Grid Layout */
.cert-grid {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(380px, 1fr));
    gap: 1.8rem;
}

/* Section Container */
.section-glass {
    background: rgba(210, 235, 255, 0.6);
    backdrop-filter: blur(5px);
    border-radius: 32px;
    padding: 1.8rem;
    margin-bottom: 2rem;
    border: 1px solid rgba(112, 193, 179, 0.4);
    box-shadow: 0 6px 16px rgba(0, 0, 0, 0.03);
}

.section-header {
    margin-bottom: 1.5rem;
    display: flex;
    align-items: baseline;
    justify-content: space-between;
    flex-wrap: wrap;
}
.section-header h2 {
    font-size: 1.5rem;
    font-weight: 700;
    color: var(--cerulean);
    margin: 0;
}
.section-header p {
    color: var(--gray);
    font-size: 0.8rem;
}

/* Responsive */
@media (max-width: 768px) {
    body {
        padding: 1rem;
    }
    .cert-grid {
        grid-template-columns: 1fr;
    }
    .section-glass {
        padding: 1.2rem;
    }
}

/* Dynamic Back Button */
.btn-back-dynamic {
    display: inline-flex;
    align-items: center;
    gap: 0.5rem;
    background: rgba(255, 255, 255, 0.9);
    backdrop-filter: blur(4px);
    color: var(--cerulean);
    padding: 0.6rem 1.2rem;
    border-radius: 40px;
    text-decoration: none;
    font-weight: 600;
    font-size: 0.85rem;
    transition: all 0.3s ease;
    border: 1px solid var(--tropical-teal);
    box-shadow: 0 2px 6px rgba(0, 0, 0, 0.05);
}

.btn-back-dynamic:hover {
    background: var(--cerulean);
    border-color: var(--cerulean);
    color: white;
    transform: translateX(-4px);
    box-shadow: 0 6px 12px rgba(36, 123, 160, 0.2);
}

.btn-back-dynamic i {
    font-size: 0.8rem;
    transition: transform 0.2s;
}

.btn-back-dynamic:hover i {
    transform: translateX(-2px);
}
</style>
</head>
<body>

<div class="main-certificates-container" data-aos="fade-up">

<!-- Back Button with dynamic navigation -->
<div class="mb-4" data-aos="fade-right">
    <a href="${not empty previousPage ? previousPage : '/studentDashboard'}" 
       class="btn-back-dynamic">
        <i class="fas fa-arrow-left"></i> Back
    </a>
</div>
    
    <!-- Page Header -->
    <div class="page-header">
        <h1><i class="fas fa-certificate me-2" style="color: var(--cerulean);"></i> My Certificates</h1>
        <p>View all your earned certificates and achievements</p>
    </div>

    <!-- Certificates List Section -->
    <div class="section-glass">
        <div class="section-header">
            <h2><i class="fas fa-award me-2"></i> Earned Certificates</h2>
            <p><i class="fas fa-shield-alt"></i> Verified & blockchain secured</p>
        </div>

        <c:choose>
            <c:when test="${not empty certificates}">
                <div class="cert-grid">
                    <c:forEach items="${certificates}" var="certificate">
                        <div class="certificate-card-modern" data-aos="zoom-in" data-aos-delay="100">
                            <div class="d-flex justify-content-between align-items-start mb-3">
                                <div class="d-flex gap-3">
                                    <div class="cert-icon">
                                        <i class="fas fa-certificate"></i>
                                    </div>
                                    <div>
                                        <h4 class="fw-bold mb-1" style="color: var(--cerulean-dark);">${certificate.enrollment.internship.title}</h4>
                                        <p class="text-muted small mb-0">
                                            <i class="fas fa-hashtag"></i> Internship ID: #${certificate.enrollment.internship.internshipId}
                                        </p>
                                    </div>
                                </div>
                                <span class="verified-badge">
                                    <i class="fas fa-check-circle"></i> VERIFIED
                                </span>
                            </div>
                            
                            <div class="mt-2 mb-4">
                                <div class="detail-row">
                                    <i class="fas fa-calendar-check"></i>
                                    <span>Completed: ${certificate.enrollment.completionDate}</span>
                                </div>
                                <div class="detail-row">
                                    <i class="fas fa-calendar-alt"></i>
                                    <span>Issued: ${certificate.issuedDate}</span>
                                </div>
                                <div class="detail-row">
                                    <i class="fas fa-star"></i>
                                    <span>Performance Rating: 
                                        <span class="rating-stars">
                                            <c:forEach begin="1" end="5" var="star">
                                                <i class="fas fa-star ${star <= certificate.enrollment.performanceRating ? 'text-warning' : 'grey-star'}" style="color: ${star <= certificate.enrollment.performanceRating ? '#fbbf24' : '#cbd5e1'}"></i>
                                            </c:forEach>
                                            (${certificate.enrollment.performanceRating}/5)
                                        </span>
                                    </span>
                                </div>
                                <div class="detail-row">
                                    <i class="fas fa-qrcode"></i>
                                    <span>Verification Code: 
                                        <span class="verification-code">${certificate.verificationCode}</span>
                                    </span>
                                </div>
                            </div>
                            
                            <div class="d-flex gap-3 mt-auto">
                                <a href="${pageContext.request.contextPath}/viewCertificate1?certificateId=${certificate.certificateId}" 
                                   class="btn-primary-cert flex-grow-1 text-center">
                                    <i class="fas fa-eye"></i> View Certificate
                                </a>
                                <button onclick="copyVerificationCode('${certificate.verificationCode}')" 
                                        class="btn-outline-cert">
                                    <i class="fas fa-copy"></i> Copy
                                </button>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </c:when>
            
            <c:otherwise>
                <div class="no-results-modern text-center py-5">
                    <i class="fas fa-certificate fa-4x mb-3" style="color: var(--cerulean); opacity: 0.6;"></i>
                    <h3 class="fw-bold mb-2">No Certificates Yet</h3>
                    <p class="text-muted mb-4">Complete internships to earn certificates and showcase your achievements.</p>
                    <a href="${pageContext.request.contextPath}/internships"
                       class="btn-primary-cert px-4 py-2">
                       <i class="fas fa-search"></i> Browse Internships
                    </a>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
    
    <!-- Stats Summary -->
    <c:if test="${not empty certificates}">
        <div class="row g-4 mt-2" data-aos="fade-up" data-aos-delay="200">
            <div class="col-md-4">
                <div class="stats-card-glass">
                    <div class="stats-icon"><i class="fas fa-certificate"></i></div>
                    <div class="stats-number">${certificates.size()}</div>
                    <div class="stats-label">Total Certificates</div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="stats-card-glass">
                    <div class="stats-icon"><i class="fas fa-star"></i></div>
                    <div class="stats-number">
                        <c:set var="total" value="0"/>
                        <c:forEach items="${certificates}" var="cert">
                            <c:set var="total" value="${total + cert.enrollment.performanceRating}"/>
                        </c:forEach>
                        <c:if test="${certificates.size() > 0}">
                            ${Math.round((total / certificates.size()) * 10) / 10}
                        </c:if>
                        <c:if test="${certificates.size() == 0}">0</c:if>
                    </div>
                    <div class="stats-label">Average Rating</div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="stats-card-glass">
                    <div class="stats-icon"><i class="fas fa-trophy"></i></div>
                    <div class="stats-number">${certificates.size()}</div>
                    <div class="stats-label">Internships Completed</div>
                </div>
            </div>
        </div>
    </c:if>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<script>
    AOS.init({
        duration: 800,
        once: true,
        offset: 30
    });
    
    function copyVerificationCode(code) {
        navigator.clipboard.writeText(code).then(() => {
            const notification = document.createElement('div');
            notification.textContent = '✓ Verification code copied!';
            notification.style.position = 'fixed';
            notification.style.bottom = '20px';
            notification.style.right = '20px';
            notification.style.backgroundColor = 'var(--tropical-teal)';
            notification.style.color = 'white';
            notification.style.padding = '10px 20px';
            notification.style.borderRadius = '40px';
            notification.style.fontWeight = '600';
            notification.style.fontSize = '0.85rem';
            notification.style.boxShadow = '0 10px 20px rgba(0,0,0,0.1)';
            notification.style.zIndex = '9999';
            notification.style.backdropFilter = 'blur(4px)';
            notification.style.fontFamily = "'Inter', sans-serif";
            document.body.appendChild(notification);
            setTimeout(() => notification.remove(), 2000);
        }).catch(() => {
            alert('Unable to copy. Manual copy: ' + code);
        });
    }
</script>

</body>
</html>