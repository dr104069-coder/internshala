<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Student Information | SmartIntern</title>

<!-- Bootstrap & Icons -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">

<style>
    :root {
        --primary-gradient: linear-gradient(135deg, #6a11cb 0%, #2575fc 100%);
        --secondary-gradient: linear-gradient(135deg, #ff6b6b 0%, #ffd166 100%);
        --sidebar-gradient: linear-gradient(180deg, #1a237e 0%, #311b92 100%);
        --card-shadow: 0 20px 40px rgba(0, 0, 0, 0.08), 0 8px 24px rgba(0, 0, 0, 0.05);
        --sidebar-width: 280px;
    }

    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    body {
        font-family: 'Inter', 'Segoe UI', sans-serif;
        background: linear-gradient(135deg, #f5f7fa 0%, #e4edf5 100%);
        color: #333;
        min-height: 100vh;
        overflow-x: hidden;
    }

    /* Animated Background Elements */
    .bg-shapes {
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        z-index: -1;
        overflow: hidden;
    }

    .bg-shape {
        position: absolute;
        border-radius: 50%;
        opacity: 0.1;
    }

    .shape-1 {
        width: 300px;
        height: 300px;
        background: var(--primary-gradient);
        top: -100px;
        left: -100px;
        animation: float 25s infinite linear;
    }

    .shape-2 {
        width: 200px;
        height: 200px;
        background: var(--secondary-gradient);
        bottom: -50px;
        right: 10%;
        animation: float 20s infinite linear reverse;
    }

    @keyframes float {
        0%, 100% { transform: translateY(0) rotate(0deg); }
        50% { transform: translateY(-20px) rotate(180deg); }
    }

    /* Sidebar - Enhanced Unified Design */
    .sidebar {
        width: var(--sidebar-width);
        height: 100vh;
        position: fixed;
        left: 0;
        top: 0;
        background: var(--sidebar-gradient);
        color: #fff;
        padding: 0;
        box-shadow: 10px 0 30px rgba(0, 0, 0, 0.15);
        z-index: 1000;
        transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.1);
    }

    .sidebar:hover {
        box-shadow: 15px 0 40px rgba(0, 0, 0, 0.2);
    }

    .sidebar-header {
        padding: 30px 25px;
        background: rgba(255, 255, 255, 0.05);
        border-bottom: 1px solid rgba(255, 255, 255, 0.1);
        text-align: center;
    }

    .sidebar-header h3 {
        margin: 0;
        font-weight: 700;
        font-size: 1.8rem;
        background: linear-gradient(135deg, #ff6b6b 0%, #ffd166 100%);
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
        background-clip: text;
        letter-spacing: 0.5px;
    }

    .sidebar-header .role-badge {
        display: inline-block;
        padding: 6px 16px;
        background: rgba(255, 255, 255, 0.15);
        border-radius: 20px;
        font-size: 0.8rem;
        color: rgba(255, 255, 255, 0.9);
        margin-top: 10px;
        font-weight: 500;
    }

    .sidebar-menu {
        padding: 20px 15px;
        height: calc(100vh - 140px);
        overflow-y: auto;
    }

    .sidebar-menu a {
        display: flex;
        align-items: center;
        padding: 14px 20px;
        color: rgba(255, 255, 255, 0.85);
        text-decoration: none;
        border-radius: 12px;
        margin-bottom: 10px;
        transition: all 0.3s ease;
        font-weight: 500;
        position: relative;
        overflow: hidden;
    }

    .sidebar-menu a i {
        margin-right: 14px;
        font-size: 1.2rem;
        width: 24px;
        text-align: center;
        transition: transform 0.3s;
    }

    .sidebar-menu a .badge {
        margin-left: auto;
        background: linear-gradient(135deg, #ff6b6b 0%, #ffd166 100%);
        font-size: 0.7rem;
        padding: 3px 8px;
        border-radius: 10px;
        min-width: 20px;
        text-align: center;
    }

    .sidebar-menu a:hover {
        background: rgba(255, 255, 255, 0.15);
        color: #fff;
        transform: translateX(8px);
    }

    .sidebar-menu a:hover i {
        transform: scale(1.1);
    }

    .sidebar-menu a.active {
        background: linear-gradient(90deg, rgba(106, 17, 203, 0.8) 0%, rgba(37, 117, 252, 0.8) 100%);
        color: #fff;
        box-shadow: 0 5px 20px rgba(106, 17, 203, 0.4);
    }

    .sidebar-menu a.active:before {
        content: '';
        position: absolute;
        left: 0;
        top: 0;
        height: 100%;
        width: 4px;
        background: linear-gradient(to bottom, #ff6b6b, #ffd166);
    }

    .sidebar-footer {
        position: absolute;
        bottom: 0;
        width: 100%;
        padding: 20px 25px;
        border-top: 1px solid rgba(255, 255, 255, 0.1);
        background: rgba(0, 0, 0, 0.1);
    }

    .sidebar-footer a {
        display: flex;
        align-items: center;
        color: rgba(255, 255, 255, 0.7);
        text-decoration: none;
        font-weight: 500;
        transition: color 0.3s;
    }

    .sidebar-footer a:hover {
        color: #fff;
    }

    .sidebar-footer i {
        margin-right: 10px;
        font-size: 1.2rem;
    }

    /* Main Content */
    .main-content {
        margin-left: var(--sidebar-width);
        padding: 40px;
        min-height: 100vh;
        position: relative;
        background: #f8fafc;
    }

    /* Form Card - Redesigned */
    .form-card {
        max-width: 1000px;
        margin: 0 auto;
        background: rgba(255, 255, 255, 0.98);
        backdrop-filter: blur(10px);
        padding: 50px;
        border-radius: 24px;
        box-shadow: var(--card-shadow);
        animation: fadeSlideUp 0.7s ease-out forwards;
        border: 1px solid rgba(255, 255, 255, 0.3);
        position: relative;
        overflow: hidden;
    }

    .form-card:before {
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 6px;
        background: linear-gradient(90deg, #6a11cb 0%, #2575fc 50%, #6a11cb 100%);
        background-size: 200% 100%;
        animation: gradientShift 3s infinite linear;
    }

    @keyframes fadeSlideUp {
        from { opacity: 0; transform: translateY(40px); }
        to { opacity: 1; transform: translateY(0); }
    }

    @keyframes gradientShift {
        0% { background-position: 0% 50%; }
        50% { background-position: 100% 50%; }
        100% { background-position: 0% 50%; }
    }

    /* Header Section */
    .form-header {
        text-align: center;
        margin-bottom: 40px;
        position: relative;
    }

    .form-icon {
        width: 90px;
        height: 90px;
        margin: 0 auto 25px;
        background: var(--primary-gradient);
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        color: white;
        font-size: 2.5rem;
        box-shadow: 0 15px 35px rgba(106, 17, 203, 0.3);
        border: 4px solid rgba(255, 255, 255, 0.2);
    }

    .section-title {
        font-weight: 800;
        margin-bottom: 12px;
        font-size: 2.5rem;
        background: linear-gradient(90deg, #1a237e, #6a11cb);
        -webkit-background-clip: text;
        background-clip: text;
        color: transparent;
        letter-spacing: -0.5px;
    }

    .section-sub {
        color: #64748b;
        margin-bottom: 40px;
        font-size: 1.2rem;
        max-width: 700px;
        margin-left: auto;
        margin-right: auto;
        line-height: 1.6;
    }

    /* Form Layout */
    .form-row {
        display: flex;
        flex-wrap: wrap;
        margin: 0 -15px;
    }

    /* Input Groups - Enhanced */
    .input-group-custom {
        margin-bottom: 32px;
        padding: 0 15px;
        flex: 1 0 100%;
    }

    @media (min-width: 768px) {
        .input-group-custom {
            flex: 0 0 50%;
            max-width: 50%;
        }
    }

    .input-group-custom label {
        font-weight: 700;
        margin-bottom: 12px;
        display: block;
        color: #1e293b;
        font-size: 1.05rem;
        transition: color 0.3s;
        display: flex;
        align-items: center;
    }

    .input-group-custom label i {
        margin-right: 12px;
        color: #6a11cb;
        font-size: 1.2rem;
        width: 24px;
        text-align: center;
    }

    .input-wrapper {
        position: relative;
    }

    .input-group-custom input,
    .input-group-custom select {
        width: 100%;
        padding: 18px 20px 18px 55px;
        border-radius: 16px;
        border: 2px solid #e2e8f0;
        background: #f8fafc;
        font-size: 1.05rem;
        color: #1e293b;
        transition: all 0.3s ease;
        font-family: 'Inter', sans-serif;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.03);
        appearance: none;
    }

    .input-group-custom input:focus,
    .input-group-custom select:focus {
        border-color: #6a11cb;
        background: white;
        box-shadow: 0 8px 25px rgba(106, 17, 203, 0.15);
        outline: none;
        transform: translateY(-3px);
    }

    .input-icon {
        position: absolute;
        left: 20px;
        top: 50%;
        transform: translateY(-50%);
        color: #94a3b8;
        font-size: 1.2rem;
        transition: color 0.3s;
        z-index: 2;
    }

    .input-group-custom input:focus + .input-icon,
    .input-group-custom select:focus + .input-icon {
        color: #6a11cb;
    }

    /* Optional Fields */
    .optional-label {
        display: inline-block;
        background: linear-gradient(to right, #ffd166, #ffb347);
        color: #333;
        padding: 4px 14px;
        border-radius: 20px;
        font-size: 0.8rem;
        font-weight: 700;
        margin-left: 10px;
        box-shadow: 0 3px 10px rgba(255, 209, 102, 0.2);
    }

    /* Submit Button - Enhanced */
    .btn-submit-container {
        text-align: center;
        margin-top: 50px;
        position: relative;
    }

    .btn-save {
        background: var(--primary-gradient);
        border: none;
        color: #fff;
        padding: 20px 60px;
        border-radius: 50px;
        font-weight: 800;
        font-size: 1.2rem;
        letter-spacing: 0.5px;
        transition: all 0.4s ease;
        box-shadow: 0 15px 35px rgba(106, 17, 203, 0.3);
        position: relative;
        overflow: hidden;
        display: inline-flex;
        align-items: center;
        justify-content: center;
        cursor: pointer;
    }

    .btn-save i {
        margin-right: 12px;
        font-size: 1.5rem;
        transition: transform 0.3s;
    }

    .btn-save:hover {
        transform: translateY(-8px);
        box-shadow: 0 20px 40px rgba(106, 17, 203, 0.4);
        background: linear-gradient(135deg, #5a0db9 0%, #1c68f0 100%);
    }

    .btn-save:hover i {
        transform: scale(1.2);
    }

    .btn-save:active {
        transform: translateY(-4px);
    }

    .btn-save:before {
        content: '';
        position: absolute;
        top: 0;
        left: -100%;
        width: 100%;
        height: 100%;
        background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.2), transparent);
        transition: left 0.7s;
    }

    .btn-save:hover:before {
        left: 100%;
    }

    /* Progress Indicator */
    .form-progress {
        display: flex;
        justify-content: center;
        margin-bottom: 50px;
        position: relative;
    }

    .progress-step {
        width: 50px;
        height: 50px;
        border-radius: 50%;
        background: #e2e8f0;
        display: flex;
        align-items: center;
        justify-content: center;
        font-weight: 700;
        color: #94a3b8;
        margin: 0 30px;
        position: relative;
        transition: all 0.3s;
        z-index: 1;
        border: 3px solid white;
        box-shadow: 0 5px 15px rgba(0, 0, 0, 0.08);
    }

    .progress-step.active {
        background: var(--primary-gradient);
        color: white;
        box-shadow: 0 8px 25px rgba(106, 17, 203, 0.3);
        transform: scale(1.1);
    }

    .progress-step:not(:last-child):after {
        content: '';
        position: absolute;
        width: 60px;
        height: 4px;
        background: #e2e8f0;
        right: -60px;
        top: 50%;
        transform: translateY(-50%);
        z-index: 0;
    }

    /* Footer Note */
    .form-footer {
        text-align: center;
        margin-top: 50px;
        color: #94a3b8;
        font-size: 0.95rem;
        padding-top: 25px;
        border-top: 1px solid #e2e8f0;
        font-weight: 500;
    }

    .form-footer i {
        margin-right: 10px;
        color: #6a11cb;
        font-size: 1.1rem;
    }

    /* Responsive Adjustments */
    @media (max-width: 1200px) {
        .sidebar {
            width: 90px;
        }
        
        .sidebar-header h3 span,
        .sidebar-header .role-badge,
        .sidebar-menu a span,
        .sidebar-menu a .badge,
        .sidebar-footer span {
            display: none;
        }
        
        .sidebar-header {
            padding: 25px 10px;
        }
        
        .sidebar-header h3 {
            font-size: 1.5rem;
        }
        
        .sidebar-menu a {
            justify-content: center;
            padding: 15px;
            margin: 0 10px 10px;
        }
        
        .sidebar-menu a i {
            margin-right: 0;
            font-size: 1.4rem;
        }
        
        .sidebar-footer {
            padding: 15px;
            text-align: center;
        }
        
        .sidebar-footer i {
            margin-right: 0;
            font-size: 1.4rem;
        }
        
        .main-content {
            margin-left: 90px;
            padding: 30px;
        }
        
        .form-card {
            padding: 40px 30px;
        }
    }

    @media (max-width: 992px) {
        .main-content {
            padding: 30px 20px;
        }
        
        .form-card {
            padding: 35px 25px;
        }
        
        .section-title {
            font-size: 2rem;
        }
        
        .form-icon {
            width: 75px;
            height: 75px;
            font-size: 2rem;
        }
    }

    @media (max-width: 768px) {
        .input-group-custom {
            flex: 0 0 100%;
            max-width: 100%;
        }
        
        .section-title {
            font-size: 1.8rem;
        }
        
        .section-sub {
            font-size: 1rem;
        }
        
        .form-progress {
            margin-bottom: 30px;
        }
        
        .progress-step {
            width: 40px;
            height: 40px;
            margin: 0 15px;
            font-size: 0.9rem;
        }
        
        .progress-step:not(:last-child):after {
            width: 30px;
            right: -30px;
        }
        
        .btn-save {
            padding: 16px 40px;
            font-size: 1.1rem;
        }
    }

    @media (max-width: 480px) {
        .main-content {
            padding: 20px 15px;
        }
        
        .form-card {
            padding: 25px 20px;
        }
        
        .form-icon {
            width: 65px;
            height: 65px;
            font-size: 1.8rem;
        }
        
        .progress-step {
            width: 35px;
            height: 35px;
            margin: 0 10px;
        }
        
        .progress-step:not(:last-child):after {
            width: 20px;
            right: -20px;
        }
    }

    /* Scrollbar Styling */
    .sidebar-menu::-webkit-scrollbar {
        width: 5px;
    }

    .sidebar-menu::-webkit-scrollbar-track {
        background: rgba(255, 255, 255, 0.05);
        border-radius: 10px;
    }

    .sidebar-menu::-webkit-scrollbar-thumb {
        background: rgba(255, 255, 255, 0.2);
        border-radius: 10px;
    }

    .sidebar-menu::-webkit-scrollbar-thumb:hover {
        background: rgba(255, 255, 255, 0.3);
    }
</style>
</head>

<body>
    <!-- Background Shapes -->
    <div class="bg-shapes">
        <div class="bg-shape shape-1"></div>
        <div class="bg-shape shape-2"></div>
    </div>

    <!-- SIDEBAR (Unified Design - Same as Dashboard) -->
    <div class="sidebar">
        <div class="sidebar-header">
            <h3><i class="fas fa-graduation-cap me-2"></i> SmartIntern</h3>
            <div class="role-badge">Student Portal</div>
        </div>
        
        <div class="sidebar-menu">
            <a href="studentDashboard">
                <i class="bi bi-speedometer2"></i>
                <span>Dashboard</span>
            </a>
            
            <a href="addStudentInfo" class="active">
                <i class="bi bi-person-lines-fill"></i>
                <span>Add Information</span>
                <span class="badge">!</span>
            </a>
            
            <a href="profile">
                <i class="bi bi-person-circle"></i>
                <span>Profile</span>
            </a>
            
            <a href="internships">
                <i class="bi bi-briefcase-fill"></i>
                <span>Internships</span>
                <span class="badge">3</span>
            </a>
            
            <a href="applications">
                <i class="bi bi-file-earmark-text-fill"></i>
                <span>Applications</span>
                <span class="badge">5</span>
            </a>
            
            <a href="tasks">
                <i class="bi bi-list-task"></i>
                <span>Tasks</span>
            </a>
            
            <a href="certificates">
                <i class="bi bi-award-fill"></i>
                <span>Certificates</span>
            </a>
            
            <a href="messages">
                <i class="bi bi-chat-dots-fill"></i>
                <span>Messages</span>
                <span class="badge">2</span>
            </a>
        </div>
        
        <div class="sidebar-footer">
            <a href="logout">
                <i class="bi bi-box-arrow-right"></i>
                <span>Logout</span>
            </a>
        </div>
    </div>

    <!-- MAIN CONTENT -->
    <div class="main-content">
        <div class="form-card">
            
            <!-- Form Header with Icon -->
            <div class="form-header">
                <div class="form-icon">
                    <i class="fas fa-user-graduate"></i>
                </div>
                <h3 class="section-title">Student Profile Details</h3>
                <p class="section-sub">Build a professional academic profile to unlock personalized internship opportunities with SmartIntern</p>
            </div>

            <!-- Progress Indicator -->
            <div class="form-progress">
                <div class="progress-step active">1</div>
                <div class="progress-step">2</div>
                <div class="progress-step">3</div>
            </div>

            <!-- Form -->
            <form action="/saveInformation" method="post" enctype="multipart/form-data">
                
                <div class="form-row">
                    <!-- LOCATION -->
                    <div class="input-group-custom">
                        <label><i class="fas fa-city"></i> City</label>
                        <div class="input-wrapper">
                            <input type="text" name="city" placeholder="Enter your city">
                            <span class="input-icon"><i class="fas fa-map-marker-alt"></i></span>
                        </div>
                    </div>
                    
                    <div class="input-group-custom">
                        <label><i class="fas fa-landmark"></i> State</label>
                        <div class="input-wrapper">
                            <input type="text" name="state" placeholder="Enter your state">
                            <span class="input-icon"><i class="fas fa-globe-americas"></i></span>
                        </div>
                    </div>

                    <!-- COLLEGE -->
                    <div class="input-group-custom">
                        <label><i class="fas fa-university"></i> College Name</label>
                        <div class="input-wrapper">
                            <input type="text" name="collegeName" placeholder="Enter your college name">
                            <span class="input-icon"><i class="fas fa-school"></i></span>
                        </div>
                    </div>

                    <!-- DEGREE & SEM -->
                    <div class="input-group-custom">
                        <label><i class="fas fa-graduation-cap"></i> Degree</label>
                        <div class="input-wrapper">
                            <select name="degree">
                                <option value="">Select Degree</option>
                                <option>B.E.</option>
                                <option>B.Tech</option>
                                <option>BCA</option>
                                <option>B.Sc IT</option>
                                <option>MCA</option>
                                <option>M.Tech</option>
                                <option>Diploma</option>
                            </select>
                            <span class="input-icon"><i class="fas fa-user-graduate"></i></span>
                        </div>
                    </div>

                    <div class="input-group-custom">
                        <label><i class="fas fa-calendar-alt"></i> Semester</label>
                        <div class="input-wrapper">
                            <select name="semester">
                                <option value="">Select Semester</option>
                                <option value="1">Semester 1</option>
                                <option value="2">Semester 2</option>
                                <option value="3">Semester 3</option>
                                <option value="4">Semester 4</option>
                                <option value="5">Semester 5</option>
                                <option value="6">Semester 6</option>
                                <option value="7">Semester 7</option>
                                <option value="8">Semester 8</option>
                            </select>
                            <span class="input-icon"><i class="fas fa-layer-group"></i></span>
                        </div>
                    </div>

                    <!-- TSHIRT & YEAR -->
                    <div class="input-group-custom">
                        <label><i class="fas fa-tshirt"></i> T-Shirt Size</label>
                        <div class="input-wrapper">
                            <select name="tshirtSize">
                                <option value="">Select Size</option>
                                <option>SMALL</option>
                                <option>M</option>
                                <option>L</option>
                                <option>XL</option>
                                <option>XXL</option>
                                <option>XXXL</option>
                            </select>
                            <span class="input-icon"><i class="fas fa-user"></i></span>
                        </div>
                    </div>

                    <div class="input-group-custom">
                        <label><i class="fas fa-calendar-check"></i> Graduation Year</label>
                        <div class="input-wrapper">
                            <input type="number" name="graduationYear" placeholder="e.g. 2024">
                            <span class="input-icon"><i class="fas fa-clock"></i></span>
                        </div>
                    </div>

                    <!-- OPTIONAL EXTRAS (NOT REQUIRED, NO LOGIC IMPACT) -->
                    <div class="input-group-custom">
                        <label><i class="fas fa-code"></i> Primary Skill <span class="optional-label">Optional</span></label>
                        <div class="input-wrapper">
                            <input type="text" placeholder="Java, Web Development, AI, etc.">
                            <span class="input-icon"><i class="fas fa-cogs"></i></span>
                        </div>
                    </div>

                    <div class="input-group-custom">
                        <label><i class="fas fa-briefcase"></i> Career Interest <span class="optional-label">Optional</span></label>
                        <div class="input-wrapper">
                            <input type="text" placeholder="Software Engineer, Data Analyst, etc.">
                            <span class="input-icon"><i class="fas fa-chart-line"></i></span>
                        </div>
                    </div>
                </div>

                <!-- SUBMIT -->
                <div class="btn-submit-container">
                    <button type="submit" class="btn-save">
                        <i class="fas fa-check-circle"></i> Save Profile & Continue
                    </button>
                </div>
                
                <div class="form-footer">
                    <p><i class="fas fa-shield-alt"></i> Your information is secure and will only be used for internship matching</p>
                </div>
            </form>
        </div>
    </div>

    <!-- Optional JavaScript for animations -->
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Add focus effects to form inputs
            const inputs = document.querySelectorAll('input, select');
            
            inputs.forEach(input => {
                input.addEventListener('focus', function() {
                    this.parentElement.classList.add('focused');
                });
                
                input.addEventListener('blur', function() {
                    this.parentElement.classList.remove('focused');
                });
                
                input.addEventListener('input', function() {
                    if (this.value.trim() !== '') {
                        this.parentElement.classList.add('filled');
                    } else {
                        this.parentElement.classList.remove('filled');
                    }
                });
            });
            
            // Animate progress steps
            const progressSteps = document.querySelectorAll('.progress-step');
            let currentStep = 0;
            
            function updateProgress() {
                progressSteps.forEach((step, index) => {
                    if (index <= currentStep) {
                        step.classList.add('active');
                    } else {
                        step.classList.remove('active');
                    }
                });
                
                currentStep = (currentStep + 1) % progressSteps.length;
            }
            
            setInterval(updateProgress, 3000);
            
            // Add ripple effect to sidebar links
            const sidebarLinks = document.querySelectorAll('.sidebar-menu a');
            sidebarLinks.forEach(link => {
                link.addEventListener('click', function(e) {
                    const ripple = document.createElement('span');
                    const rect = this.getBoundingClientRect();
                    const size = Math.max(rect.width, rect.height);
                    const x = e.clientX - rect.left - size / 2;
                    const y = e.clientY - rect.top - size / 2;
                    
                    ripple.style.cssText = `
                        position: absolute;
                        border-radius: 50%;
                        background: rgba(255, 255, 255, 0.3);
                        transform: scale(0);
                        animation: ripple 0.6s linear;
                        width: ${size}px;
                        height: ${size}px;
                        top: ${y}px;
                        left: ${x}px;
                    `;
                    
                    this.appendChild(ripple);
                    
                    setTimeout(() => {
                        ripple.remove();
                    }, 600);
                });
            });
            
            // Add CSS for ripple animation
            const style = document.createElement('style');
            style.textContent = `
                @keyframes ripple {
                    to {
                        transform: scale(4);
                        opacity: 0;
                    }
                }
            `;
            document.head.appendChild(style);
        });
    </script>
</body>
</html>