<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Dashboard | SmartIntern</title>

<!-- Bootstrap & Icons -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">

<!-- Chart.js -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<style>
:root {
    --primary-gradient: linear-gradient(135deg, #6a11cb 0%, #2575fc 100%);
    --secondary-gradient: linear-gradient(135deg, #ff6b6b 0%, #ffd166 100%);
    --success-gradient: linear-gradient(135deg, #43e97b 0%, #38f9d7 100%);
    --warning-gradient: linear-gradient(135deg, #fa709a 0%, #fee140 100%);
    --sidebar-gradient: linear-gradient(180deg, #1a237e 0%, #311b92 100%);
    --sidebar-width: 280px;
    --card-shadow: 0 20px 40px rgba(0, 0, 0, 0.08), 0 8px 24px rgba(0, 0, 0, 0.05);
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

/* Top Bar */
.top-bar {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 40px;
    padding: 25px 30px;
    background: #fff;
    border-radius: 20px;
    box-shadow: 0 8px 30px rgba(0, 0, 0, 0.06);
    border: 1px solid rgba(0, 0, 0, 0.05);
}

.welcome-section h4 {
    margin: 0;
    font-weight: 700;
    color: #1e293b;
    font-size: 1.8rem;
}

.welcome-section p {
    margin: 8px 0 0;
    color: #64748b;
    font-size: 1rem;
}

.stats-bar {
    display: flex;
    gap: 20px;
}

.stat-badge {
    display: flex;
    align-items: center;
    padding: 10px 20px;
    background: #f1f5f9;
    border-radius: 12px;
    font-size: 0.95rem;
    color: #475569;
    font-weight: 500;
    transition: all 0.3s;
}

.stat-badge:hover {
    background: #e2e8f0;
    transform: translateY(-2px);
}

.stat-badge i {
    margin-right: 10px;
    color: #6a11cb;
    font-size: 1.1rem;
}

/* Cards Grid */
.cards-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(320px, 1fr));
    gap: 30px;
    margin-bottom: 40px;
}

/* Profile Card */
.profile-card {
    background: #fff;
    border-radius: 20px;
    overflow: hidden;
    box-shadow: var(--card-shadow);
    transition: transform 0.3s ease;
    border: 1px solid rgba(0, 0, 0, 0.05);
}

.profile-card:hover {
    transform: translateY(-8px);
    box-shadow: 0 25px 50px rgba(0, 0, 0, 0.12);
}

.profile-header {
    background: var(--primary-gradient);
    padding: 30px;
    color: white;
    text-align: center;
    position: relative;
}

.profile-avatar {
    width: 90px;
    height: 90px;
    background: rgba(255, 255, 255, 0.2);
    border-radius: 50%;
    margin: 0 auto 20px;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 2.5rem;
    border: 4px solid rgba(255, 255, 255, 0.3);
    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
}

.profile-body {
    padding: 30px;
}

.progress-section {
    margin: 25px 0;
}

.progress-label {
    display: flex;
    justify-content: space-between;
    margin-bottom: 12px;
    font-size: 0.95rem;
    color: #64748b;
    font-weight: 500;
}

.progress-bar {
    height: 10px;
    background: #e2e8f0;
    border-radius: 6px;
    overflow: hidden;
}

.progress-fill {
    height: 100%;
    background: var(--primary-gradient);
    border-radius: 6px;
    transition: width 1.5s cubic-bezier(0.34, 1.56, 0.64, 1);
    width: 0;
}

.d-grid .btn {
    padding: 12px;
    font-weight: 600;
    border-radius: 12px;
    transition: all 0.3s;
}

.d-grid .btn-primary {
    background: var(--primary-gradient);
    border: none;
}

.d-grid .btn-primary:hover {
    transform: translateY(-2px);
    box-shadow: 0 10px 25px rgba(106, 17, 203, 0.3);
}

/* Stats Card */
.stats-card {
    background: #fff;
    border-radius: 20px;
    padding: 30px;
    box-shadow: var(--card-shadow);
    border: 1px solid rgba(0, 0, 0, 0.05);
}

.stats-card h5 {
    font-weight: 700;
    margin-bottom: 25px;
    color: #1e293b;
    font-size: 1.3rem;
}

.stats-grid {
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    gap: 20px;
}

.stat-item {
    text-align: center;
    padding: 25px 15px;
    background: #f8fafc;
    border-radius: 16px;
    transition: all 0.4s ease;
}

.stat-item:hover {
    transform: translateY(-8px);
    box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
    background: #fff;
}

.stat-icon {
    width: 60px;
    height: 60px;
    border-radius: 16px;
    display: flex;
    align-items: center;
    justify-content: center;
    margin: 0 auto 20px;
    font-size: 1.8rem;
    box-shadow: 0 8px 20px rgba(0, 0, 0, 0.08);
}

.stat-icon.applied {
    background: rgba(59, 130, 246, 0.15);
    color: #3b82f6;
}

.stat-icon.selected {
    background: rgba(34, 197, 94, 0.15);
    color: #22c55e;
}

.stat-icon.completed {
    background: rgba(168, 85, 247, 0.15);
    color: #a855f7;
}

.stat-icon.rejected {
    background: rgba(239, 68, 68, 0.15);
    color: #ef4444;
}

.stat-value {
    font-size: 2.2rem;
    font-weight: 800;
    margin: 10px 0;
    color: #1e293b;
    line-height: 1;
}

.stat-label {
    font-size: 0.9rem;
    color: #64748b;
    font-weight: 500;
}

/* Quick Actions */
.quick-actions {
    background: #fff;
    border-radius: 20px;
    padding: 30px;
    box-shadow: var(--card-shadow);
    border: 1px solid rgba(0, 0, 0, 0.05);
}

.quick-actions h5 {
    font-weight: 700;
    margin-bottom: 25px;
    color: #1e293b;
    font-size: 1.3rem;
}

.actions-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(160px, 1fr));
    gap: 20px;
}

.action-btn {
    display: flex;
    flex-direction: column;
    align-items: center;
    padding: 25px 15px;
    background: #f8fafc;
    border: 2px dashed #cbd5e1;
    border-radius: 16px;
    color: #64748b;
    text-decoration: none;
    transition: all 0.4s ease;
}

.action-btn:hover {
    background: #f1f5f9;
    border-color: #6a11cb;
    color: #6a11cb;
    transform: translateY(-5px);
    box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
}

.action-btn i {
    font-size: 2rem;
    margin-bottom: 15px;
    transition: transform 0.3s;
}

.action-btn:hover i {
    transform: scale(1.2);
}

.action-btn.completed {
    border-style: solid;
    border-color: #e2e8f0;
    background: #fff;
}

/* Recent Activity */
.recent-activity {
    background: #fff;
    border-radius: 20px;
    padding: 30px;
    box-shadow: var(--card-shadow);
    border: 1px solid rgba(0, 0, 0, 0.05);
}

.recent-activity h5 {
    font-weight: 700;
    margin-bottom: 25px;
    color: #1e293b;
    font-size: 1.3rem;
}

.activity-list {
    margin-top: 20px;
}

.activity-item {
    display: flex;
    align-items: center;
    padding: 20px;
    border-bottom: 1px solid #f1f5f9;
    transition: all 0.3s ease;
}

.activity-item:last-child {
    border-bottom: none;
}

.activity-item:hover {
    background: #f8fafc;
    border-radius: 12px;
    transform: translateX(5px);
}

.activity-icon {
    width: 50px;
    height: 50px;
    border-radius: 12px;
    display: flex;
    align-items: center;
    justify-content: center;
    margin-right: 20px;
    color: white;
    font-size: 1.2rem;
    flex-shrink: 0;
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
}

.activity-icon.success {
    background: var(--success-gradient);
}

.activity-icon.warning {
    background: var(--warning-gradient);
}

.activity-icon.info {
    background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);
}

.activity-content {
    flex: 1;
}

.activity-title {
    font-weight: 600;
    margin-bottom: 5px;
    color: #1e293b;
    font-size: 1.05rem;
}

.activity-time {
    font-size: 0.9rem;
    color: #94a3b8;
}

.activity-status {
    padding: 6px 16px;
    border-radius: 20px;
    font-size: 0.8rem;
    font-weight: 700;
    text-transform: uppercase;
    letter-spacing: 0.5px;
    flex-shrink: 0;
}

.status-success {
    background: rgba(34, 197, 94, 0.15);
    color: #22c55e;
}

.status-pending {
    background: rgba(245, 158, 11, 0.15);
    color: #f59e0b;
}

/* Responsive Design */
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
    
    .cards-grid {
        grid-template-columns: 1fr;
    }
}

@media (max-width: 768px) {
    .main-content {
        padding: 20px;
    }
    
    .top-bar {
        flex-direction: column;
        gap: 20px;
        align-items: flex-start;
        padding: 20px;
    }
    
    .stats-bar {
        width: 100%;
        flex-wrap: wrap;
        justify-content: flex-start;
        gap: 10px;
    }
    
    .stat-badge {
        flex: 1;
        min-width: 150px;
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

    <!-- SIDEBAR (Unified Design) -->
    <div class="sidebar">
        <div class="sidebar-header">
            <h3><i class="fas fa-graduation-cap me-2"></i> SmartIntern</h3>
            <div class="role-badge">Student Portal</div>
        </div>
        
        <div class="sidebar-menu">
            <a href="studentDashboard" class="active">
                <i class="bi bi-speedometer2"></i>
                <span>Dashboard</span>
            </a>
            
            <a href="addStudentInfo">
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
        
        <!-- Top Bar -->
        <div class="top-bar">
            <div class="welcome-section">
                <h4>Welcome back, Darshan! 👋</h4>
                <p>Track your internship applications and progress here.</p>
            </div>
            <div class="stats-bar">
                <div class="stat-badge">
                    <i class="bi bi-calendar-check"></i>
                    <span>Semester: 8</span>
                </div>
                <div class="stat-badge">
                    <i class="bi bi-building"></i>
                    <span>GEC PATAN</span>
                </div>
                <div class="stat-badge">
                    <i class="bi bi-star-fill"></i>
                    <span>Rating: 4.5/5</span>
                </div>
            </div>
        </div>

        <!-- Cards Grid -->
        <div class="cards-grid">
            
            <!-- Profile Card -->
            <div class="profile-card">
                <div class="profile-header">
                    <div class="profile-avatar">
                        <i class="bi bi-person-fill"></i>
                    </div>
                    <h5>Darshan Rathod</h5>
                    <p>Computer Science Student</p>
                </div>
                <div class="profile-body">
                    <div class="progress-section">
                        <div class="progress-label">
                            <span>Profile Completion</span>
                            <span>65%</span>
                        </div>
                        <div class="progress-bar">
                            <div class="progress-fill" style="width: 65%"></div>
                        </div>
                    </div>
                    <div class="d-grid gap-2">
                        <a href="addStudentInfo" class="btn btn-primary">
                            <i class="bi bi-pencil-square me-2"></i>
                            Complete Profile
                        </a>
                        <a href="profile" class="btn btn-outline-primary">
                            <i class="bi bi-eye me-2"></i>
                            View Profile
                        </a>
                    </div>
                </div>
            </div>

            <!-- Stats Card -->
            <div class="stats-card">
                <h5>Application Statistics</h5>
                <div class="stats-grid">
                    <div class="stat-item">
                        <div class="stat-icon applied">
                            <i class="bi bi-send-fill"></i>
                        </div>
                        <div class="stat-value">8</div>
                        <div class="stat-label">Applied</div>
                    </div>
                    <div class="stat-item">
                        <div class="stat-icon selected">
                            <i class="bi bi-check-circle-fill"></i>
                        </div>
                        <div class="stat-value">3</div>
                        <div class="stat-label">Selected</div>
                    </div>
                    <div class="stat-item">
                        <div class="stat-icon completed">
                            <i class="bi bi-award-fill"></i>
                        </div>
                        <div class="stat-value">2</div>
                        <div class="stat-label">Completed</div>
                    </div>
                    <div class="stat-item">
                        <div class="stat-icon rejected">
                            <i class="bi bi-x-circle-fill"></i>
                        </div>
                        <div class="stat-value">1</div>
                        <div class="stat-label">Rejected</div>
                    </div>
                </div>
            </div>

            <!-- Quick Actions -->
            <div class="quick-actions">
                <h5>Quick Actions</h5>
                <div class="actions-grid">
                    <a href="internships" class="action-btn">
                        <i class="bi bi-search"></i>
                        <span>Search Internships</span>
                    </a>
                    <a href="addStudentInfo" class="action-btn">
                        <i class="bi bi-cloud-upload"></i>
                        <span>Upload Resume</span>
                    </a>
                    <a href="applications" class="action-btn">
                        <i class="bi bi-clock-history"></i>
                        <span>Track Applications</span>
                    </a>
                    <a href="#" class="action-btn completed">
                        <i class="bi bi-envelope-paper"></i>
                        <span>View Certificates</span>
                    </a>
                </div>
            </div>
        </div>

        <!-- Recent Activity -->
        <div class="recent-activity">
            <h5>Recent Activity</h5>
            <div class="activity-list">
                <div class="activity-item">
                    <div class="activity-icon success">
                        <i class="bi bi-check-lg"></i>
                    </div>
                    <div class="activity-content">
                        <div class="activity-title">Application Accepted</div>
                        <div class="activity-time">Web Developer Intern at TechCorp</div>
                    </div>
                    <div class="activity-status status-success">Selected</div>
                </div>
                
                <div class="activity-item">
                    <div class="activity-icon info">
                        <i class="bi bi-clock"></i>
                    </div>
                    <div class="activity-content">
                        <div class="activity-title">Task Submission</div>
                        <div class="activity-time">Project milestone due in 2 days</div>
                    </div>
                    <div class="activity-status status-pending">Pending</div>
                </div>
                
                <div class="activity-item">
                    <div class="activity-icon warning">
                        <i class="bi bi-exclamation-triangle"></i>
                    </div>
                    <div class="activity-content">
                        <div class="activity-title">Profile Incomplete</div>
                        <div class="activity-time">Add your skills and projects</div>
                    </div>
                    <div class="activity-status status-pending">Action Required</div>
                </div>
                
                <div class="activity-item">
                    <div class="activity-icon success">
                        <i class="bi bi-award"></i>
                    </div>
                    <div class="activity-content">
                        <div class="activity-title">Certificate Generated</div>
                        <div class="activity-time">Data Analytics Internship Completed</div>
                    </div>
                    <div class="activity-status status-success">Completed</div>
                </div>
            </div>
        </div>

    </div>

<script>
// Progress animation
document.addEventListener('DOMContentLoaded', function() {
    // Animate progress bar
    const progressFill = document.querySelector('.progress-fill');
    const originalWidth = progressFill.style.width;
    progressFill.style.width = '0%';
    
    setTimeout(() => {
        progressFill.style.width = originalWidth;
    }, 500);
    
    // Add hover effects to cards
    const cards = document.querySelectorAll('.stat-item, .action-btn, .activity-item');
    cards.forEach(card => {
        card.addEventListener('mouseenter', function() {
            this.style.transform = 'translateY(-8px)';
        });
        
        card.addEventListener('mouseleave', function() {
            this.style.transform = 'translateY(0)';
        });
    });
    
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