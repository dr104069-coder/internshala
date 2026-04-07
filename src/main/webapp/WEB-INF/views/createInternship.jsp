<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Internship | Employer</title>

<!-- Tailwind CSS + Fonts -->
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

/* Form Container Glass Effect */
.form-container {
    background: rgba(10, 10, 20, 0.85);
    backdrop-filter: blur(20px);
    border: 1px solid rgba(139, 92, 246, 0.3);
    border-radius: 2rem;
    box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.5);
    transition: all 0.3s ease;
}

.form-container:hover {
    border-color: rgba(139, 92, 246, 0.6);
    box-shadow: 0 25px 50px -12px rgba(139, 92, 246, 0.3);
}

/* Form Inputs */
.form-input, .form-textarea, .form-select {
    background: rgba(20, 20, 40, 0.8);
    border: 2px solid rgba(139, 92, 246, 0.3);
    border-radius: 1rem;
    color: white;
    transition: all 0.3s ease;
    width: 100%;
    padding: 0.75rem 1rem;
    font-size: 0.95rem;
}

.form-input:focus, .form-textarea:focus, .form-select:focus {
    outline: none;
    border-color: #a78bfa;
    box-shadow: 0 0 0 3px rgba(139, 92, 246, 0.2);
    transform: translateY(-2px);
    background: rgba(20, 20, 40, 1);
}

.form-input::placeholder, .form-textarea::placeholder {
    color: rgba(255, 255, 255, 0.4);
}

.form-label {
    color: #c4b5fd;
    font-weight: 600;
    font-size: 0.85rem;
    letter-spacing: 0.5px;
    margin-bottom: 0.5rem;
    display: flex;
    align-items: center;
    gap: 0.5rem;
}

.form-label i {
    color: #8b5cf6;
    font-size: 0.9rem;
    width: 1.25rem;
}

/* Submit Button */
.btn-submit {
    background: linear-gradient(135deg, #8b5cf6, #ec4899);
    color: white;
    border: none;
    border-radius: 1rem;
    padding: 0.875rem 2rem;
    font-weight: 700;
    font-size: 1rem;
    transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
    cursor: pointer;
    position: relative;
    overflow: hidden;
    width: 100%;
}

.btn-submit::before {
    content: '';
    position: absolute;
    top: 50%;
    left: 50%;
    width: 0;
    height: 0;
    border-radius: 50%;
    background: rgba(255, 255, 255, 0.3);
    transform: translate(-50%, -50%);
    transition: width 0.6s, height 0.6s;
}

.btn-submit:hover::before {
    width: 300px;
    height: 300px;
}

.btn-submit:hover {
    transform: translateY(-3px);
    box-shadow: 0 10px 30px rgba(139, 92, 246, 0.5);
}

.btn-submit:active {
    transform: translateY(0);
}

/* Custom file input styling */
.file-input input[type="file"] {
    background: rgba(20, 20, 40, 0.8);
    border: 2px solid rgba(139, 92, 246, 0.3);
    border-radius: 1rem;
    color: white;
    padding: 0.75rem 1rem;
    cursor: pointer;
    width: 100%;
}

.file-input input[type="file"]::-webkit-file-upload-button {
    background: linear-gradient(135deg, #8b5cf6, #ec4899);
    border: none;
    border-radius: 0.75rem;
    padding: 0.5rem 1.25rem;
    margin-right: 1rem;
    color: white;
    font-weight: 600;
    cursor: pointer;
    transition: all 0.3s ease;
}

.file-input input[type="file"]::-webkit-file-upload-button:hover {
    transform: scale(1.02);
    box-shadow: 0 5px 15px rgba(139, 92, 246, 0.4);
}

/* Custom select arrow */
.form-select {
    appearance: none;
    background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' fill='none' viewBox='0 0 24 24' stroke='%238b5cf6'%3E%3Cpath stroke-linecap='round' stroke-linejoin='round' stroke-width='2' d='M19 9l-7 7-7-7'%3E%3C/path%3E%3C/svg%3E");
    background-repeat: no-repeat;
    background-position: right 1rem center;
    background-size: 1.25rem;
}

/* Scrollbar */
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

::-webkit-scrollbar-thumb:hover {
    background: linear-gradient(135deg, #a78bfa, #f43f5e);
}

/* Back Button */
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
}

.back-button i {
    font-size: 1rem;
    transition: transform 0.3s ease;
}

.back-button:hover {
    background: linear-gradient(135deg, rgba(139, 92, 246, 0.2), rgba(236, 72, 153, 0.2));
    border-color: rgba(139, 92, 246, 0.8);
    transform: translateX(-5px);
    color: white;
}

.back-button:hover i {
    transform: translateX(-3px);
}

/* Header gradient text */
.text-gradient {
    background: linear-gradient(135deg, #a78bfa, #ec4899);
    -webkit-background-clip: text;
    background-clip: text;
    color: transparent;
}

/* Required field star */
.required-star {
    color: #ec4899;
    font-size: 1rem;
    margin-left: 0.25rem;
}

/* Hint text */
.hint-text {
    color: rgba(255, 255, 255, 0.4);
    font-size: 0.7rem;
    margin-top: 0.25rem;
    display: flex;
    align-items: center;
    gap: 0.25rem;
}

.hint-text i {
    font-size: 0.65rem;
    color: #8b5cf6;
}
</style>

</head>
<body>

<div class="max-w-4xl mx-auto">
    
    <!-- Back Button - Fixed positioning with better icon -->
    <a href="${pageContext.request.contextPath}/employerdashboard" class="back-button">
        <i class="fas fa-arrow-left"></i>
        <span>Back to Dashboard</span>
        <i class="fas fa-chalkboard-user ml-1 text-purple-400"></i>
    </a>
    
    <!-- Form Container -->
    <div class="form-container p-6 md:p-8">
        
        <!-- Header -->
        <div class="text-center mb-8">
            <div class="inline-flex items-center justify-center w-20 h-20 rounded-full bg-gradient-to-r from-purple-500/20 to-pink-500/20 border-2 border-purple-500/30 mb-4">
                <i class="fas fa-rocket text-3xl text-purple-400 animate-pulse"></i>
            </div>
            <h2 class="text-3xl md:text-4xl font-bold mb-2">
                <span class="text-gradient">Post New Internship</span>
            </h2>
            <p class="text-white/50 text-sm flex items-center justify-center gap-2">
                <i class="fas fa-sparkle text-purple-400"></i>
                Fill in the details below to create a new internship opportunity
                <i class="fas fa-sparkle text-pink-400"></i>
            </p>
        </div>

        <form action="${pageContext.request.contextPath}/saveInternshipEmployer" method="post" enctype="multipart/form-data">

            <!-- Title -->
            <div class="mb-5">
                <label class="form-label">
                    <i class="fas fa-tag"></i> Internship Title <span class="required-star">*</span>
                </label>
                <input type="text" name="title" class="form-input" placeholder="e.g., Full Stack Developer Intern" required>
            </div>

            <!-- Description -->
            <div class="mb-5">
                <label class="form-label">
                    <i class="fas fa-file-alt"></i> Description <span class="required-star">*</span>
                </label>
                <textarea name="description" class="form-textarea" rows="4" placeholder="Describe the internship role, responsibilities, and requirements..." required></textarea>
            </div>

            <!-- Type + Duration + Stipend Row -->
            <div class="grid grid-cols-1 md:grid-cols-3 gap-4 mb-5">
                <div>
                    <label class="form-label">
                        <i class="fas fa-laptop-code"></i> Internship Type <span class="required-star">*</span>
                    </label>
                    <select name="internshipType" class="form-select" required>
                        <option value="" disabled selected>Select Type</option>
                        <option value="REMOTE">🌍 Remote</option>
                        <option value="ONSITE">🏢 Onsite</option>
                        <option value="HYBRID">🔄 Hybrid</option>
                    </select>
                </div>

                <div>
                    <label class="form-label">
                        <i class="fas fa-calendar-week"></i> Duration <span class="required-star">*</span>
                    </label>
                    <input type="number" name="durationMonths" class="form-input" placeholder="Months (e.g., 3, 6)" required>
                </div>

                <div>
                    <label class="form-label">
                        <i class="fas fa-coins"></i> Stipend
                    </label>
                    <input type="number" name="stipend" class="form-input" placeholder="Amount in ₹">
                </div>
            </div>

            <!-- Paid + Location + Openings Row -->
            <div class="grid grid-cols-1 md:grid-cols-3 gap-4 mb-5">
                <div>
                    <label class="form-label">
                        <i class="fas fa-hand-holding-usd"></i> Payment Type
                    </label>
                    <select name="isPaid" class="form-select">
                        <option value="true">💰 Paid</option>
                        <option value="false">🎁 Unpaid</option>
                    </select>
                </div>

                <div>
                    <label class="form-label">
                        <i class="fas fa-location-dot"></i> Location
                    </label>
                    <input type="text" name="location" class="form-input" placeholder="e.g., Mumbai, Bangalore, Remote">
                </div>

                <div>
                    <label class="form-label">
                        <i class="fas fa-user-plus"></i> Openings
                    </label>
                    <input type="number" name="openings" class="form-input" placeholder="Number of positions">
                </div>
            </div>

            <!-- Skills -->
            <div class="mb-5">
                <label class="form-label">
                    <i class="fas fa-microchip"></i> Skills Required
                </label>
                <input type="text" name="skillsRequired" class="form-input" placeholder="Java, Spring Boot, React, SQL, Python">
                <div class="hint-text">
                    <i class="fas fa-lightbulb"></i> Separate skills with commas
                </div>
            </div>

            <!-- Dates Row -->
            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4 mb-5">
                <div>
                    <label class="form-label">
                        <i class="fas fa-play-circle"></i> Start Date
                    </label>
                    <input type="date" name="startDate" class="form-input">
                </div>

                <div>
                    <label class="form-label">
                        <i class="fas fa-stop-circle"></i> End Date
                    </label>
                    <input type="date" name="endDate" class="form-input">
                </div>

                <div>
                    <label class="form-label">
                        <i class="fas fa-hourglass-end"></i> Last Apply Date
                    </label>
                    <input type="date" name="lastApplyDate" class="form-input">
                </div>
                
                <div>
                    <label class="form-label">
                        <i class="fas fa-hourglass-start"></i> Start Apply Date
                    </label>
                    <input type="date" name="startApplyDate" class="form-input">
                </div>
            </div>

            <!-- Poster Upload -->
            <div class="mb-6">
                <label class="form-label">
                    <i class="fas fa-palette"></i> Internship Poster
                </label>
                <div class="file-input">
                    <input type="file" name="posterFile" class="form-input" accept="image/*">
                </div>
                <div class="hint-text">
                    <i class="fas fa-image"></i> Recommended: JPG, PNG (Max 5MB)
                </div>
            </div>

            <!-- Divider -->
            <div class="relative my-6">
                <div class="absolute inset-0 flex items-center">
                    <div class="w-full border-t border-purple-500/20"></div>
                </div>
                <div class="relative flex justify-center">
                    <span class="bg-[rgba(10,10,20,0.85)] px-4 text-xs text-purple-400">
                        <i class="fas fa-asterisk text-pink-500 mr-1"></i> Required fields are marked with <span class="text-pink-500">*</span>
                    </span>
                </div>
            </div>

            <!-- Submit Button -->
            <div class="text-center">
                <button type="submit" class="btn-submit">
                    <i class="fas fa-paper-plane mr-2"></i> 
                    Post Internship
                    <i class="fas fa-arrow-right ml-2"></i>
                </button>
            </div>

        </form>
    </div>
</div>

</body>
</html>