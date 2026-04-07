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
    width: 100px;
    height: 100px;
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

.profile-wrapper {
    position: relative;
    display: inline-block;
}

.online-indicator {
    position: absolute;
    bottom: 5px;
    right: 5px;
    width: 16px;
    height: 16px;
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

.text-gradient {
    background: linear-gradient(135deg, #a78bfa, #ec4899);
    -webkit-background-clip: text;
    background-clip: text;
    color: transparent;
}

.form-label-custom {
    color: #c4b5fd;
    font-weight: 600;
    font-size: 0.85rem;
    letter-spacing: 0.5px;
    margin-bottom: 0.5rem;
    display: flex;
    align-items: center;
    gap: 0.5rem;
}

.form-input-custom {
    background: rgba(20, 20, 40, 0.8);
    border: 2px solid rgba(139, 92, 246, 0.3);
    border-radius: 1rem;
    color: white;
    transition: all 0.3s ease;
    width: 100%;
    padding: 0.75rem 1rem;
    font-size: 0.95rem;
}

.form-input-custom:focus {
    outline: none;
    border-color: #a78bfa;
    box-shadow: 0 0 0 3px rgba(139, 92, 246, 0.2);
    transform: translateY(-2px);
    background: rgba(20, 20, 40, 1);
}

.form-input-custom::placeholder {
    color: rgba(255, 255, 255, 0.4);
}

.form-select-custom {
    background: rgba(20, 20, 40, 0.8);
    border: 2px solid rgba(139, 92, 246, 0.3);
    border-radius: 1rem;
    color: white;
    transition: all 0.3s ease;
    width: 100%;
    padding: 0.75rem 1rem;
    font-size: 0.95rem;
    appearance: none;
    background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' fill='none' viewBox='0 0 24 24' stroke='%238b5cf6'%3E%3Cpath stroke-linecap='round' stroke-linejoin='round' stroke-width='2' d='M19 9l-7 7-7-7'%3E%3C/path%3E%3C/svg%3E");
    background-repeat: no-repeat;
    background-position: right 1rem center;
    background-size: 1.25rem;
}

.form-select-custom:focus {
    outline: none;
    border-color: #a78bfa;
    box-shadow: 0 0 0 3px rgba(139, 92, 246, 0.2);
    transform: translateY(-2px);
}

.btn-update {
    background: linear-gradient(135deg, #8b5cf6, #ec4899);
    color: white;
    padding: 0.75rem 1.5rem;
    border-radius: 1rem;
    font-weight: 600;
    transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
    border: none;
    cursor: pointer;
    display: inline-flex;
    align-items: center;
    gap: 0.5rem;
}

.btn-update:hover {
    transform: translateY(-3px);
    box-shadow: 0 10px 30px rgba(139, 92, 246, 0.5);
}

.btn-create {
    background: linear-gradient(135deg, #3b82f6, #2563eb);
    color: white;
    padding: 0.75rem 1.5rem;
    border-radius: 1rem;
    font-weight: 600;
    transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
    text-decoration: none;
    display: inline-flex;
    align-items: center;
    gap: 0.5rem;
}

.btn-create:hover {
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

.info-row {
    display: flex;
    align-items: center;
    padding: 0.5rem 0;
}

.info-label {
    color: #c4b5fd;
    font-weight: 600;
    width: 100px;
}

.info-value {
    color: #e0e0e0;
}

.divider {
    border-top: 1px solid rgba(139, 92, 246, 0.2);
    margin: 1.5rem 0;
}

.status-verified {
    color: #10b981;
    font-weight: 600;
}

.status-pending {
    color: #f59e0b;
    font-weight: 600;
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

.required-star {
    color: #ec4899;
    font-size: 1rem;
    margin-left: 0.25rem;
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

        <!-- USER INFO -->
        <div class="bg-black/20 rounded-xl p-6 mb-6">
            <div class="info-row">
                <div class="info-label">
                    <i class="fas fa-user mr-2 text-purple-400"></i> Name:
                </div>
                <div class="info-value">${user.firstName} ${user.lastName}</div>
            </div>
            <div class="info-row">
                <div class="info-label">
                    <i class="fas fa-envelope mr-2 text-purple-400"></i> Email:
                </div>
                <div class="info-value">${user.email}</div>
            </div>
        </div>

        <div class="divider"></div>

        <c:choose>
       
            <c:when test="${employer != null}">

                <!-- Status -->
                <div class="bg-black/20 rounded-xl p-6 mb-6">
                    <div class="info-row">
                        <div class="info-label">
                            <i class="fas fa-shield-alt mr-2 text-purple-400"></i> Status:
                        </div>
                        <div class="info-value">
                            <c:choose>
                                <c:when test="${employer.companyVerified}">
                                    <span class="status-verified">
                                        <i class="fas fa-check-circle"></i> Verified
                                    </span>
                                </c:when>
                                <c:otherwise>
                                    <span class="status-pending">
                                        <i class="fas fa-clock"></i> Pending
                                    </span>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </div>

                <!-- Update Form -->
                <form action="saveEmployer" method="post" class="space-y-4">

                    <!-- Company Name -->
                    <div>
                        <label class="form-label-custom">
                            <i class="fas fa-building"></i> Company Name <span class="required-star">*</span>
                        </label>
                        <input type="text" name="companyName"
                               value="${employer.companyName}"
                               placeholder="Company Name"
                               class="form-input-custom" required>
                    </div>

                    <!-- Company Type -->
                    <div>
                        <label class="form-label-custom">
                            <i class="fas fa-tags"></i> Company Type <span class="required-star">*</span>
                        </label>
                        <select name="companyType" class="form-select-custom" required>
                            <option value="" disabled 
                                <c:if test="${employer.companyType == null}">selected</c:if>>
                                -- Select Company Type --
                            </option>
                            <option value="Startup"
                                <c:if test="${employer.companyType == 'Startup'}">selected</c:if>>
                                🚀 Startup
                            </option>
                            <option value="MNC"
                                <c:if test="${employer.companyType == 'MNC'}">selected</c:if>>
                                🌍 MNC
                            </option>
                            <option value="Private Ltd"
                                <c:if test="${employer.companyType == 'Private Ltd'}">selected</c:if>>
                                🏢 Private Ltd
                            </option>
                            <option value="Government"
                                <c:if test="${employer.companyType == 'Government'}">selected</c:if>>
                                🏛️ Government
                            </option>
                            <option value="NGO"
                                <c:if test="${employer.companyType == 'NGO'}">selected</c:if>>
                                ❤️ NGO
                            </option>
                            <option value="Other"
                                <c:if test="${employer.companyType == 'Other'}">selected</c:if>>
                                📌 Other
                            </option>
                        </select>
                    </div>

                    <!-- Website -->
                    <div>
                        <label class="form-label-custom">
                            <i class="fas fa-globe"></i> Website
                        </label>
                        <input type="text" name="website"
                               value="${employer.website}"
                               placeholder="Website"
                               class="form-input-custom">
                    </div>

                    <!-- Company Address -->
                    <div>
                        <label class="form-label-custom">
                            <i class="fas fa-map-marker-alt"></i> Company Address
                        </label>
                        <input type="text" name="companyAddress"
                               value="${employer.companyAddress}"
                               placeholder="Company Address"
                               class="form-input-custom">
                    </div>

                    <!-- HR Name -->
                    <div>
                        <label class="form-label-custom">
                            <i class="fas fa-user-tie"></i> HR Name <span class="required-star">*</span>
                        </label>
                        <input type="text" name="hrName"
                               value="${employer.hrName}"
                               placeholder="HR Name"
                               class="form-input-custom" required>
                    </div>

                    <!-- HR Mobile -->
                    <div>
                        <label class="form-label-custom">
                            <i class="fas fa-phone-alt"></i> HR Mobile <span class="required-star">*</span>
                        </label>
                        <input type="text" name="hrMobile"
                               value="${employer.hrMobile}"
                               placeholder="HR Mobile"
                               class="form-input-custom" required>
                    </div>

                    <!-- Submit Button -->
                    <div class="text-center pt-4">
                        <button type="submit" class="btn-update">
                            <i class="fas fa-save"></i>
                            Update Profile
                            <i class="fas fa-arrow-right"></i>
                        </button>
                    </div>

                </form>

            </c:when>

            <c:otherwise>

                <!-- Warning Message -->
                <div class="text-center">
                    <div class="warning-box">
                        <i class="fas fa-exclamation-triangle text-yellow-500 text-xl"></i>
                        <span class="warning-text">⚠ You have not created your employer profile yet.</span>
                    </div>

                    <!-- Create Profile Button -->
                    <div class="text-center mt-6">
                        <a href="employer" class="btn-create">
                            <i class="fas fa-user-plus"></i>
                            Create Profile
                            <i class="fas fa-arrow-right"></i>
                        </a>
                    </div>
                </div>

            </c:otherwise>

        </c:choose>

    </div>
</div>

</body>
</html>