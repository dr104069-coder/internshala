<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
<title>Employer Profile | Internship Manager</title>

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

.profile-container {
    background: rgba(10, 10, 20, 0.85);
    backdrop-filter: blur(20px);
    border: 1px solid rgba(139, 92, 246, 0.3);
    border-radius: 2rem;
    box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.5);
    transition: all 0.3s ease;
}

.profile-container:hover {
    border-color: rgba(139, 92, 246, 0.6);
    box-shadow: 0 25px 50px -12px rgba(139, 92, 246, 0.3);
}

.profile-img {
    width: 120px;
    height: 120px;
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

.profile-img:hover {
    transform: scale(1.05) rotate(5deg);
    animation: none;
    box-shadow: 0 0 50px rgba(139, 92, 246, 0.8);
}

.profile-label {
    color: #c4b5fd;
    font-weight: 600;
    font-size: 0.85rem;
    letter-spacing: 0.5px;
    min-width: 120px;
}

.profile-value {
    color: #e0e0e0;
    font-weight: 500;
}

.info-row {
    display: flex;
    padding: 0.75rem 0;
    border-bottom: 1px solid rgba(139, 92, 246, 0.15);
}

.info-row:hover {
    background: rgba(139, 92, 246, 0.05);
}

.status-verified {
    background: linear-gradient(135deg, #10b981, #059669);
    color: white;
    padding: 0.25rem 0.75rem;
    border-radius: 9999px;
    font-size: 0.75rem;
    font-weight: 600;
    display: inline-flex;
    align-items: center;
    gap: 0.5rem;
}

.status-pending {
    background: linear-gradient(135deg, #f59e0b, #d97706);
    color: white;
    padding: 0.25rem 0.75rem;
    border-radius: 9999px;
    font-size: 0.75rem;
    font-weight: 600;
    display: inline-flex;
    align-items: center;
    gap: 0.5rem;
}

.btn-edit {
    background: linear-gradient(135deg, #8b5cf6, #ec4899);
    color: white;
    padding: 0.75rem 1.5rem;
    border-radius: 1rem;
    font-weight: 600;
    transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
    display: inline-flex;
    align-items: center;
    gap: 0.5rem;
    text-decoration: none;
}

.btn-edit:hover {
    transform: translateY(-3px);
    box-shadow: 0 10px 30px rgba(139, 92, 246, 0.5);
}

.btn-complete {
    background: linear-gradient(135deg, #3b82f6, #2563eb);
    color: white;
    padding: 0.75rem 1.5rem;
    border-radius: 1rem;
    font-weight: 600;
    transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
    display: inline-flex;
    align-items: center;
    gap: 0.5rem;
    text-decoration: none;
}

.btn-complete:hover {
    transform: translateY(-3px);
    box-shadow: 0 10px 30px rgba(59, 130, 246, 0.4);
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

.text-gradient {
    background: linear-gradient(135deg, #a78bfa, #ec4899);
    -webkit-background-clip: text;
    background-clip: text;
    color: transparent;
}

.warning-box {
    background: rgba(245, 158, 11, 0.15);
    border: 1px solid rgba(245, 158, 11, 0.3);
    border-radius: 1rem;
    padding: 1rem;
    display: inline-flex;
    align-items: center;
    gap: 0.75rem;
    margin-bottom: 1.5rem;
}

.warning-text {
    color: #fbbf24;
    font-size: 0.9rem;
}

.divider {
    border-top: 1px solid rgba(139, 92, 246, 0.2);
    margin: 1.5rem 0;
}

.online-indicator {
    position: absolute;
    bottom: 5px;
    right: 5px;
    width: 18px;
    height: 18px;
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

.profile-wrapper {
    position: relative;
    display: inline-block;
}

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
</style>

</head>
<body>

<div class="max-w-4xl mx-auto">
    
    <!-- Back Button -->
    <a href="${pageContext.request.contextPath}/employerdashboard" class="back-button">
        <i class="fas fa-arrow-left"></i>
        <span>Back to Dashboard</span>
        <i class="fas fa-chalkboard-user ml-1 text-purple-400"></i>
    </a>
    
    <!-- Profile Container -->
    <div class="profile-container p-8">
        
        <!-- Header with Profile Photo -->
        <div class="text-center mb-8">
            <!-- Profile Photo -->
            <div class="profile-wrapper">
                <img 
                    src="${user.profilePicURL != null ? user.profilePicURL : pageContext.request.contextPath.concat('/images/default-profile.png')}" 
                    class="profile-img"
                    alt="Profile Photo">
                <div class="online-indicator"></div>
            </div>
            
            <h2 class="text-3xl md:text-4xl font-bold mt-4 mb-2">
                <span class="text-gradient">Employer Profile</span>
            </h2>
            <p class="text-white/50 text-sm flex items-center justify-center gap-2">
                <i class="fas fa-sparkle text-purple-400"></i>
                Manage your company information
                <i class="fas fa-sparkle text-pink-400"></i>
            </p>
        </div>

        <!-- Profile Info -->
        <div class="bg-black/20 rounded-xl p-6">
            
            <!-- Name -->
            <div class="info-row">
                <div class="profile-label">
                    <i class="fas fa-user mr-2 text-purple-400"></i> Full Name:
                </div>
                <div class="profile-value">
                    ${user.firstName} ${user.lastName}
                </div>
            </div>
            
            <!-- Email -->
            <div class="info-row">
                <div class="profile-label">
                    <i class="fas fa-envelope mr-2 text-purple-400"></i> Email:
                </div>
                <div class="profile-value">
                    ${user.email}
                </div>
            </div>
            
            <!-- Phone (if available) -->
            <c:if test="${not empty user.phone}">
                <div class="info-row">
                    <div class="profile-label">
                        <i class="fas fa-phone-alt mr-2 text-purple-400"></i> Phone:
                    </div>
                    <div class="profile-value">
                        ${user.phone}
                    </div>
                </div>
            </c:if>

            <div class="divider"></div>

            <c:choose>
                <c:when test="${isProfileComplete}">
                    <!-- Company Name -->
                    <div class="info-row">
                        <div class="profile-label">
                            <i class="fas fa-building mr-2 text-purple-400"></i> Company:
                        </div>
                        <div class="profile-value">
                            ${employer.companyName}
                        </div>
                    </div>
                    
                    <!-- Company Type -->
                    <div class="info-row">
                        <div class="profile-label">
                            <i class="fas fa-tag mr-2 text-purple-400"></i> Company Type:
                        </div>
                        <div class="profile-value">
                            ${employer.companyType}
                        </div>
                    </div>
                    
                    <!-- Website -->
                    <div class="info-row">
                        <div class="profile-label">
                            <i class="fas fa-globe mr-2 text-purple-400"></i> Website:
                        </div>
                        <div class="profile-value">
                            <a href="${employer.website}" target="_blank" class="text-purple-400 hover:text-purple-300 transition">
                                ${employer.website} <i class="fas fa-external-link-alt text-xs ml-1"></i>
                            </a>
                        </div>
                    </div>
                    
                    <!-- Address -->
                    <div class="info-row">
                        <div class="profile-label">
                            <i class="fas fa-map-marker-alt mr-2 text-purple-400"></i> Address:
                        </div>
                        <div class="profile-value">
                            ${employer.companyAddress}
                        </div>
                    </div>
                    
                    <!-- HR Name -->
                    <div class="info-row">
                        <div class="profile-label">
                            <i class="fas fa-user-tie mr-2 text-purple-400"></i> HR Name:
                        </div>
                        <div class="profile-value">
                            ${employer.hrName}
                        </div>
                    </div>
                    
                    <!-- HR Mobile -->
                    <div class="info-row">
                        <div class="profile-label">
                            <i class="fas fa-phone-alt mr-2 text-purple-400"></i> HR Mobile:
                        </div>
                        <div class="profile-value">
                            ${employer.hrMobile}
                        </div>
                    </div>
                    
                    <!-- Status -->
                    <div class="info-row">
                        <div class="profile-label">
                            <i class="fas fa-shield-alt mr-2 text-purple-400"></i> Status:
                        </div>
                        <div class="profile-value">
                            <c:choose>
                                <c:when test="${employer.companyVerified}">
                                    <span class="status-verified">
                                        <i class="fas fa-check-circle"></i> Verified
                                    </span>
                                </c:when>
                                <c:otherwise>
                                    <span class="status-pending">
                                        <i class="fas fa-clock"></i> Pending Verification
                                    </span>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>

                    <!-- Edit Button -->
                    <div class="mt-8 text-center">
                        <a href="/profileemployer" class="btn-edit">
                            <i class="fas fa-edit"></i>
                            Edit Profile
                            <i class="fas fa-arrow-right"></i>
                        </a>
                    </div>

                </c:when>

                <c:otherwise>
                    <!-- Warning Message -->
                    <div class="warning-box">
                        <i class="fas fa-exclamation-triangle text-yellow-500 text-xl"></i>
                        <span class="warning-text">⚠ Please complete your profile first to start posting internships</span>
                    </div>

                    <!-- Complete Profile Button -->
                    <div class="text-center">
                        <a href="/profileemployer" class="btn-complete">
                            <i class="fas fa-user-plus"></i>
                            Complete Profile
                            <i class="fas fa-arrow-right"></i>
                        </a>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
        
    </div>
</div>

</body>
</html>