<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SmartIntern · Application Details</title>

    <!-- Bootstrap & Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">
    
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">

    <style>
        /* ========================================================
           PROFESSIONAL BLUE COLOR SYSTEM
           ======================================================== */
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
            
            --glass-deep: rgba(44, 62, 80, 0.7);
            --glass-deep-darker: rgba(44, 62, 80, 0.85);
            --glass-bright: rgba(75, 139, 190, 0.15);
            
            --border-blue: rgba(75, 139, 190, 0.3);
            
            --text-primary: #FFFFFF;
            --text-secondary: #B3CDE0;
            --text-muted: #A8A8A8;
            
            --shadow-md: 0 4px 16px rgba(44, 62, 80, 0.3);
            --shadow-lg: 0 8px 24px rgba(44, 62, 80, 0.4);
            --shadow-blue: 0 4px 20px rgba(75, 139, 190, 0.3);
            
            --sidebar-width: 280px;
            --sidebar-collapsed: 85px;
            --header-height: 80px;
            
            --transition-soft: 300ms ease-out;
            --transition-elegant: 450ms cubic-bezier(0.165, 0.84, 0.44, 1);
        }

        /* ========================================================
           GLOBAL STYLES
           ======================================================== */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', sans-serif;
            background: linear-gradient(145deg, #2C3E50 0%, #1e2b38 100%);
            min-height: 100vh;
            position: relative;
            color: var(--text-secondary);
        }

        body::before {
            content: '';
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-image: 
                linear-gradient(rgba(75, 139, 190, 0.03) 1px, transparent 1px),
                linear-gradient(90deg, rgba(75, 139, 190, 0.03) 1px, transparent 1px);
            background-size: 50px 50px;
            pointer-events: none;
            z-index: -1;
        }

        body::after {
            content: '';
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: radial-gradient(circle at 30% 50%, rgba(75, 139, 190, 0.08) 0%, transparent 50%);
            pointer-events: none;
            z-index: -1;
        }

        /* ========================================================
           LOGO
           ======================================================== */
        .smartintern-logo {
            position: relative;
            width: 60px;
            height: 60px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .logo-blue {
            width: 52px;
            height: 52px;
            background: linear-gradient(135deg, #2C3E50, #4B8BBE);
            border: 2px solid var(--bright-blue);
            border-radius: 16px;
            display: flex;
            align-items: center;
            justify-content: center;
            box-shadow: 0 0 20px rgba(75, 139, 190, 0.3);
        }

        .logo-blue i {
            font-size: 28px;
            color: var(--pure-white);
        }

        .logo-text {
            font-size: 1.6rem;
            font-weight: 700;
            color: var(--pure-white);
        }

        /* ========================================================
           HEADER
           ======================================================== */
        .admin-header {
            height: var(--header-height);
            background: var(--glass-deep-darker);
            backdrop-filter: blur(12px);
            border-bottom: 1px solid var(--border-blue);
            padding: 0 2.5rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
            position: sticky;
            top: 0;
            z-index: 1000;
            box-shadow: var(--shadow-md);
        }

        .logo-container {
            display: flex;
            align-items: center;
            gap: 1.2rem;
        }

        .header-actions {
            display: flex;
            align-items: center;
            gap: 1rem;
        }

        .dark-btn {
            background: rgba(255, 255, 255, 0.05);
            border: 1px solid var(--border-blue);
            color: var(--soft-blue);
            border-radius: 40px;
            padding: 0.6rem 1.4rem;
            font-weight: 500;
            font-size: 0.95rem;
            display: flex;
            align-items: center;
            gap: 0.6rem;
            transition: all var(--transition-soft);
            cursor: pointer;
        }

        .dark-btn:hover {
            background: var(--bright-blue);
            border-color: var(--bright-blue);
            color: var(--pure-white);
            transform: translateY(-2px);
            box-shadow: var(--shadow-blue);
        }

        .logout-btn {
            background: var(--deep-blue);
            border: 1px solid var(--border-blue);
            color: var(--pure-white);
            border-radius: 40px;
            padding: 0.6rem 1.6rem;
            font-weight: 500;
            transition: all var(--transition-soft);
            text-decoration: none;
        }

        .logout-btn:hover {
            background: var(--bright-blue);
            color: var(--pure-white);
            transform: translateY(-2px);
            box-shadow: var(--shadow-blue);
        }

        /* ========================================================
           MAIN CONTAINER
           ======================================================== */
        .main-container {
            max-width: 1200px;
            margin: 2rem auto;
            padding: 0 2rem;
        }

        /* ========================================================
           PAGE HEADER
           ======================================================== */
        .page-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 2rem;
            flex-wrap: wrap;
            gap: 1rem;
        }

        .page-title {
            font-size: 1.8rem;
            font-weight: 700;
            color: var(--pure-white);
            display: flex;
            align-items: center;
            gap: 0.7rem;
        }

        .page-title i {
            background: rgba(75, 139, 190, 0.1);
            padding: 12px;
            border-radius: 14px;
            color: var(--bright-blue);
        }

        .btn-back {
            background: rgba(255, 255, 255, 0.05);
            border: 1px solid var(--border-blue);
            color: var(--soft-blue);
            border-radius: 40px;
            padding: 0.6rem 1.4rem;
            font-weight: 500;
            font-size: 0.95rem;
            display: flex;
            align-items: center;
            gap: 0.6rem;
            transition: all var(--transition-soft);
            text-decoration: none;
        }

        .btn-back:hover {
            background: var(--bright-blue);
            border-color: var(--bright-blue);
            color: var(--pure-white);
            transform: translateY(-2px);
            box-shadow: var(--shadow-blue);
        }

        /* ========================================================
           DETAIL CARD
           ======================================================== */
        .detail-card {
            background: var(--glass-deep);
            backdrop-filter: blur(12px);
            border-radius: 24px;
            border: 1px solid var(--border-blue);
            box-shadow: var(--shadow-md);
            overflow: hidden;
            margin-bottom: 2rem;
        }

        .card-header-custom {
            background: var(--glass-deep-darker);
            padding: 1.5rem 2rem;
            border-bottom: 1px solid var(--border-blue);
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 1rem;
        }

        .card-header-custom h4 {
            color: var(--pure-white);
            font-weight: 700;
            margin: 0;
            font-size: 1.3rem;
            display: flex;
            align-items: center;
            gap: 0.8rem;
        }

        .card-header-custom h4 i {
            color: var(--bright-blue);
            font-size: 1.5rem;
        }

        .card-body-custom {
            padding: 2rem;
        }

        .card-footer-custom {
            background: var(--glass-deep-darker);
            padding: 1.5rem 2rem;
            border-top: 1px solid var(--border-blue);
            display: flex;
            gap: 1rem;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
        }

        /* ========================================================
           INFO SECTIONS
           ======================================================== */
        .info-section {
            margin-bottom: 2.5rem;
        }

        .section-title {
            color: var(--pure-white);
            font-size: 1.1rem;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            margin-bottom: 1.2rem;
            display: flex;
            align-items: center;
            gap: 0.6rem;
            border-bottom: 1px solid var(--border-blue);
            padding-bottom: 0.8rem;
        }

        .section-title i {
            color: var(--bright-blue);
            font-size: 1.2rem;
        }

        .info-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 1.2rem;
        }

        .info-item {
            background: rgba(44, 62, 80, 0.3);
            border-radius: 16px;
            padding: 1.2rem 1.5rem;
            border: 1px solid var(--border-blue);
            transition: all var(--transition-soft);
            display: flex;
            align-items: flex-start;
            gap: 1rem;
        }

        .info-item:hover {
            background: rgba(75, 139, 190, 0.1);
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
        }

        .info-icon {
            width: 40px;
            height: 40px;
            background: rgba(75, 139, 190, 0.15);
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: var(--bright-blue);
            font-size: 1.2rem;
            flex-shrink: 0;
        }

        .info-content {
            flex: 1;
        }

        .info-label {
            color: var(--text-muted);
            font-size: 0.8rem;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            margin-bottom: 0.3rem;
        }

        .info-value {
            color: var(--pure-white);
            font-size: 1rem;
            font-weight: 500;
            word-break: break-word;
        }

        .info-value small {
            color: var(--text-secondary);
            font-size: 0.85rem;
            font-weight: 400;
            display: block;
            margin-top: 0.2rem;
        }

        .info-value.id-value {
            color: var(--bright-blue);
            font-family: monospace;
            font-size: 1.1rem;
        }

        /* Status Badges */
        .badge-custom {
            padding: 0.6rem 1.2rem;
            border-radius: 40px;
            font-weight: 600;
            font-size: 0.9rem;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            border: 1px solid transparent;
        }

        .badge-applied {
            background: rgba(75, 139, 190, 0.2);
            color: var(--soft-blue);
            border: 1px solid rgba(75, 139, 190, 0.4);
        }

        .badge-shortlisted {
            background: rgba(6, 182, 212, 0.2);
            color: #67e8f9;
            border: 1px solid rgba(6, 182, 212, 0.4);
        }

        .badge-selected {
            background: rgba(16, 185, 129, 0.2);
            color: #34d399;
            border: 1px solid rgba(16, 185, 129, 0.4);
        }

        .badge-rejected {
            background: rgba(239, 68, 68, 0.2);
            color: #f87171;
            border: 1px solid rgba(239, 68, 68, 0.4);
        }

        /* Cover Letter Box */
        .cover-letter-box {
            background: rgba(44, 62, 80, 0.3);
            border: 1px solid var(--border-blue);
            border-radius: 16px;
            padding: 1.5rem;
            color: var(--text-secondary);
            font-size: 1rem;
            line-height: 1.6;
            white-space: pre-wrap;
            max-height: 300px;
            overflow-y: auto;
            margin-top: 1rem;
        }

        .cover-letter-box::-webkit-scrollbar {
            width: 8px;
        }

        .cover-letter-box::-webkit-scrollbar-track {
            background: rgba(44, 62, 80, 0.3);
            border-radius: 10px;
        }

        .cover-letter-box::-webkit-scrollbar-thumb {
            background: var(--bright-blue);
            border-radius: 10px;
        }

        /* Action Buttons */
        .action-btns {
            display: flex;
            gap: 1rem;
            flex-wrap: wrap;
        }

        .btn-custom {
            padding: 0.7rem 1.5rem;
            border-radius: 40px;
            font-weight: 600;
            font-size: 0.95rem;
            transition: all var(--transition-soft);
            border: 1px solid transparent;
            display: inline-flex;
            align-items: center;
            gap: 0.6rem;
            text-decoration: none;
            white-space: nowrap;
        }

        .btn-download {
            background: rgba(75, 139, 190, 0.15);
            color: var(--soft-blue);
            border: 1px solid rgba(75, 139, 190, 0.3);
        }

        .btn-download:hover {
            background: var(--bright-blue);
            color: white;
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(75, 139, 190, 0.3);
        }

        .btn-edit {
            background: rgba(245, 158, 11, 0.15);
            color: #fbbf24;
            border: 1px solid rgba(245, 158, 11, 0.3);
        }

        .btn-edit:hover {
            background: #f59e0b;
            color: white;
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(245, 158, 11, 0.3);
        }

        .btn-delete {
            background: rgba(239, 68, 68, 0.15);
            color: #f87171;
            border: 1px solid rgba(239, 68, 68, 0.3);
        }

        .btn-delete:hover {
            background: #ef4444;
            color: white;
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(239, 68, 68, 0.3);
        }

        .btn-secondary-custom {
            background: rgba(255, 255, 255, 0.05);
            border: 1px solid var(--border-blue);
            color: var(--soft-blue);
        }

        .btn-secondary-custom:hover {
            background: var(--bright-blue);
            border-color: var(--bright-blue);
            color: var(--pure-white);
        }

        /* Alert Messages */
        .alert-custom {
            background: var(--glass-deep);
            backdrop-filter: blur(12px);
            border: 1px solid var(--border-blue);
            border-radius: 16px;
            padding: 1.5rem 2rem;
            margin-bottom: 2rem;
            display: flex;
            align-items: center;
            gap: 1rem;
            color: var(--text-secondary);
        }

        .alert-custom i {
            font-size: 1.5rem;
            color: #f87171;
        }

        /* ========================================================
           RESPONSIVE
           ======================================================== */
        @media (max-width: 768px) {
            .main-container {
                padding: 0 1rem;
            }
            
            .page-title {
                font-size: 1.5rem;
            }
            
            .card-header-custom {
                padding: 1.2rem;
            }
            
            .card-body-custom {
                padding: 1.2rem;
            }
            
            .card-footer-custom {
                padding: 1.2rem;
            }
            
            .info-grid {
                grid-template-columns: 1fr;
            }
            
            .action-btns {
                flex-direction: column;
                width: 100%;
            }
            
            .btn-custom {
                width: 100%;
                justify-content: center;
            }
        }
    </style>
</head>
<body>

    <!-- HEADER -->
    <header class="admin-header">
        <div class="logo-container">
            <div class="smartintern-logo">
                <div class="logo-blue">
                    <i class="bi bi-briefcase-fill"></i>
                </div>
            </div>
            <span class="logo-text">SmartIntern</span>
        </div>
        <div class="header-actions">
            <span class="dark-btn" id="toggleCollapseBtn">
                <i class="bi bi-layout-sidebar"></i> <span>Menu</span>
            </span>
            <a href="/logout" class="logout-btn">
                <i class="bi bi-box-arrow-right"></i> <span>Exit</span>
            </a>
        </div>
    </header>

    <!-- MAIN CONTENT -->
    <div class="main-container">
        
        <!-- Page Header -->
        <div class="page-header">
            <div class="page-title">
                <i class="bi bi-send-fill"></i>
                Application Details
            </div>
            <a href="/listapplications" class="btn-back">
                <i class="bi bi-arrow-left"></i> Back to List
            </a>
        </div>

        <c:choose>
            <c:when test="${empty application}">
                <!-- Application Not Found -->
                <div class="alert-custom">
                    <i class="bi bi-exclamation-triangle-fill"></i>
                    <div>
                        <strong>Application not found!</strong><br>
                        <span class="text-muted">The application you're looking for doesn't exist or has been deleted.</span>
                    </div>
                </div>
                <div style="text-align: center;">
                    <a href="/listapplications" class="btn-custom btn-secondary-custom">
                        <i class="bi bi-arrow-left"></i> Return to Applications List
                    </a>
                </div>
            </c:when>
            
            <c:when test="${not empty application}">
                <!-- Application Details Card -->
                <div class="detail-card">
                    
                    <!-- Card Header -->
                    <div class="card-header-custom">
                        <h4>
                            <i class="bi bi-file-text"></i>
                            Application #${application.applicationId}
                        </h4>
                        
                        <!-- Status Badge -->
                        <c:choose>
                            <c:when test="${application.applicationStatus == 'APPLIED'}">
                                <span class="badge-custom badge-applied">
                                    <i class="bi bi-clock"></i> Applied
                                </span>
                            </c:when>
                            <c:when test="${application.applicationStatus == 'SHORTLISTED'}">
                                <span class="badge-custom badge-shortlisted">
                                    <i class="bi bi-star"></i> Shortlisted
                                </span>
                            </c:when>
                            <c:when test="${application.applicationStatus == 'SELECTED'}">
                                <span class="badge-custom badge-selected">
                                    <i class="bi bi-check-circle"></i> Selected
                                </span>
                            </c:when>
                            <c:when test="${application.applicationStatus == 'REJECTED'}">
                                <span class="badge-custom badge-rejected">
                                    <i class="bi bi-x-circle"></i> Rejected
                                </span>
                            </c:when>
                            <c:otherwise>
                                <span class="badge-custom badge-default">${application.applicationStatus}</span>
                            </c:otherwise>
                        </c:choose>
                    </div>
                    
                    <!-- Card Body -->
                    <div class="card-body-custom">
                        
                        <!-- Application Information Section -->
                        <div class="info-section">
                            <div class="section-title">
                                <i class="bi bi-info-circle"></i>
                                Application Information
                            </div>
                            <div class="info-grid">
                                <div class="info-item">
                                    <div class="info-icon">
                                        <i class="bi bi-hash"></i>
                                    </div>
                                    <div class="info-content">
                                        <div class="info-label">Application ID</div>
                                        <div class="info-value id-value">#${application.applicationId}</div>
                                    </div>
                                </div>
                                
                                <div class="info-item">
                                    <div class="info-icon">
                                        <i class="bi bi-calendar"></i>
                                    </div>
                                    <div class="info-content">
                                        <div class="info-label">Applied Date</div>
                                        <div class="info-value">
                                            <c:choose>
                                                <c:when test="${not empty application.appliedAt}">
                                                    <c:set var="dateStr" value="${application.appliedAt.toString().replace('T', ' ')}" />
                                                    ${dateStr.substring(0, 16)}
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="text-muted">Not available</span>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <!-- Internship Details Section -->
                        <div class="info-section">
                            <div class="section-title">
                                <i class="bi bi-briefcase"></i>
                                Internship Details
                            </div>
                            <div class="info-grid">
                                <div class="info-item">
                                    <div class="info-icon">
                                        <i class="bi bi-hash"></i>
                                    </div>
                                    <div class="info-content">
                                        <div class="info-label">Internship ID</div>
                                        <div class="info-value id-value">#${application.internship.internshipId}</div>
                                    </div>
                                </div>
                                
                                <div class="info-item">
                                    <div class="info-icon">
                                        <i class="bi bi-briefcase"></i>
                                    </div>
                                    <div class="info-content">
                                        <div class="info-label">Internship Title</div>
                                        <div class="info-value">${application.internship.title}</div>
                                    </div>
                                </div>
                                
                                <div class="info-item">
                                    <div class="info-icon">
                                        <i class="bi bi-building"></i>
                                    </div>
                                    <div class="info-content">
                                        <div class="info-label">Company</div>
                                        <div class="info-value">
                                            <c:choose>
                                                <c:when test="${not empty application.internship.employer}">
                                                    ${application.internship.employer.companyName}
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="text-muted">Not specified</span>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="info-item">
                                    <div class="info-icon">
                                        <i class="bi bi-geo-alt"></i>
                                    </div>
                                    <div class="info-content">
                                        <div class="info-label">Location</div>
                                        <div class="info-value">${application.internship.location}</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <!-- Student Details Section -->
                        <div class="info-section">
                            <div class="section-title">
                                <i class="bi bi-person"></i>
                                Student Details
                            </div>
                            <div class="info-grid">
                                <div class="info-item">
                                    <div class="info-icon">
                                        <i class="bi bi-hash"></i>
                                    </div>
                                    <div class="info-content">
                                        <div class="info-label">Student ID</div>
                                        <div class="info-value id-value">#${application.student.userId}</div>
                                    </div>
                                </div>
                                
                                <div class="info-item">
                                    <div class="info-icon">
                                        <i class="bi bi-person"></i>
                                    </div>
                                    <div class="info-content">
                                        <div class="info-label">Full Name</div>
                                        <div class="info-value">${application.student.firstName} ${application.student.lastName}</div>
                                    </div>
                                </div>
                                
                                <div class="info-item">
                                    <div class="info-icon">
                                        <i class="bi bi-envelope"></i>
                                    </div>
                                    <div class="info-content">
                                        <div class="info-label">Email Address</div>
                                        <div class="info-value">${application.student.email}</div>
                                    </div>
                                </div>
                                
                                <div class="info-item">
                                    <div class="info-icon">
                                        <i class="bi bi-telephone"></i>
                                    </div>
                                    <div class="info-content">
                                        <div class="info-label">Phone</div>
                                        <div class="info-value">${application.student.phone}</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <!-- Application Materials Section -->
                        <div class="info-section">
                            <div class="section-title">
                                <i class="bi bi-file-text"></i>
                                Application Materials
                            </div>
                            
                            <div class="info-item" style="margin-bottom: 1rem;">
                                <div class="info-icon">
                                    <i class="bi bi-file-pdf"></i>
                                </div>
                                <div class="info-content">
                                    <div class="info-label">Resume</div>
                                    <div class="info-value">
                                        <c:choose>
                                            <c:when test="${not empty application.resumeUrl}">
                                                <a href="/downloadResume?fileName=${application.resumeUrl}" 
                                                   class="btn-custom btn-download" style="padding: 0.4rem 1rem; font-size: 0.85rem;">
                                                   <i class="bi bi-download"></i> Download Resume (${application.resumeUrl})
                                                </a>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="text-muted">No resume uploaded</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="info-item">
                                <div class="info-icon">
                                    <i class="bi bi-chat-text"></i>
                                </div>
                                <div class="info-content">
                                    <div class="info-label">Cover Letter</div>
                                    <div class="info-value">
                                        <c:if test="${not empty application.coverLetter}">
                                            <div class="cover-letter-box">
                                                ${application.coverLetter}
                                            </div>
                                        </c:if>
                                        <c:if test="${empty application.coverLetter}">
                                            <span class="text-muted">No cover letter provided</span>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                    </div>
                    
                    <!-- Card Footer -->
                    <div class="card-footer-custom">
                        <div class="action-btns">
                            <a href="/listapplications" class="btn-custom btn-secondary-custom">
                                <i class="bi bi-list-ul"></i> All Applications
                            </a>
                            <a href="/editApplication?applicationId=${application.applicationId}" 
                               class="btn-custom btn-edit">
                               <i class="bi bi-pencil-square"></i> Edit Application
                            </a>
                        </div>
                        
                        <a href="/deleteApplication?applicationId=${application.applicationId}" 
                           class="btn-custom btn-delete"
                           onclick="return confirm('Are you sure you want to delete this application? This action cannot be undone.')">
                           <i class="bi bi-trash-fill"></i> Delete Application
                        </a>
                    </div>
                </div>
            </c:when>
        </c:choose>
    </div>

    <!-- Scripts -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    
    <script>
        (function() {
            "use strict";

            const toggleBtn = document.getElementById('toggleCollapseBtn');
            
            // Simple menu toggle (can be expanded if needed)
            if (toggleBtn) {
                toggleBtn.addEventListener('click', function(e) {
                    e.preventDefault();
                    // Add any menu toggle functionality if needed
                    console.log('Menu toggled');
                });
            }
        })();
    </script>

</body>
</html>