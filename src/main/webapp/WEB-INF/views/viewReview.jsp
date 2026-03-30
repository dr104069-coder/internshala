<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SmartIntern · View Review</title>

    <!-- Bootstrap & Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Inter', system-ui, -apple-system, 'Segoe UI', Roboto, sans-serif;
        }

        body {
            background: linear-gradient(145deg, #f1f5fa 0%, #e9eff5 100%);
            color: #0e2e42;
        }

        :root {
            --primary-deep: #0d3880;
            --primary-bright: #2a6df4;
            --primary-soft: #628ef8;
            --accent-teal: #0f9d8e;
            --accent-coral: #f5655c;
            --accent-amber: #f6b83e;
            --sidebar-width: 280px;
            --sidebar-collapsed: 80px;
            --transition-ease: cubic-bezier(0.23, 1, 0.32, 1);
        }

        /* Header - same as listReview */
        .admin-header {
            background: rgba(13, 56, 128, 0.92);
            backdrop-filter: blur(14px);
            -webkit-backdrop-filter: blur(14px);
            border-bottom: 1px solid rgba(255, 255, 255, 0.2);
            padding: 0 2rem;
            height: 72px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            position: sticky;
            top: 0;
            z-index: 1000;
            box-shadow: 0 6px 20px rgba(13, 56, 128, 0.15);
        }

        .admin-header h5 {
            margin: 0;
            font-weight: 620;
            color: white;
            font-size: 1.45rem;
            display: flex;
            align-items: center;
            gap: 0.7rem;
        }

        .admin-header h5 i {
            color: #ffe08c;
            background: rgba(255, 255, 255, 0.15);
            padding: 8px;
            border-radius: 14px;
        }

        .header-actions {
            display: flex;
            align-items: center;
            gap: 1rem;
        }

        .toggle-sidebar-btn, .fullscreen-trigger {
            background: rgba(255,255,255,0.1);
            border: 1px solid rgba(255,255,255,0.3);
            color: white;
            border-radius: 40px;
            padding: 0.5rem 1.1rem;
            font-weight: 500;
            display: flex;
            align-items: center;
            gap: 0.5rem;
            cursor: pointer;
            transition: all 0.18s;
        }

        .toggle-sidebar-btn:hover, .fullscreen-trigger:hover {
            background: rgba(255,255,255,0.25);
        }

        .logout-btn {
            background: rgba(255,255,255,0.05);
            border: 1px solid rgba(255,255,255,0.2);
            color: white;
            border-radius: 40px;
            padding: 0.5rem 1.3rem;
            text-decoration: none;
            transition: all 0.18s;
        }

        .logout-btn:hover {
            background: #f43f5e;
            border-color: #f43f5e;
        }

        /* Layout */
        .dashboard-layout {
            display: flex;
            min-height: calc(100vh - 72px);
            transition: all 0.35s var(--transition-ease);
        }

        /* Sidebar - same as listReview */
        .nav-sidebar {
            width: var(--sidebar-width);
            background: linear-gradient(180deg, #ffffff 0%, #fbfdff 100%);
            border-right: 1px solid rgba(42, 109, 244, 0.12);
            padding: 2rem 1.2rem;
            box-shadow: 8px 0 28px -10px rgba(13, 56, 128, 0.08);
            transition: width 0.3s var(--transition-ease);
            overflow: hidden;
            white-space: nowrap;
            border-radius: 0 20px 20px 0;
        }

        .nav-sidebar.collapsed {
            width: var(--sidebar-collapsed);
            padding: 2rem 0.5rem;
        }

        .nav-sidebar.collapsed .nav-category,
        .nav-sidebar.collapsed .dropdown-toggle span,
        .nav-sidebar.collapsed .dropdown-item span {
            display: none;
        }

        .dashboard-layout.fullscreen .nav-sidebar {
            transform: translateX(-100%);
            width: 0;
        }

        .dashboard-layout.fullscreen .main-panel {
            width: 100%;
        }

        .nav-category {
            color: #5e7fa3;
            font-size: 0.7rem;
            text-transform: uppercase;
            letter-spacing: 2px;
            font-weight: 800;
            margin: 1.8rem 0 0.8rem 0.5rem;
        }

        .nav-sidebar .dropdown-toggle {
            display: flex;
            align-items: center;
            gap: 1rem;
            padding: 0.8rem 1.2rem;
            border-radius: 18px;
            color: #1d405c;
            width: 100%;
            background: transparent;
            border: none;
            text-align: left;
        }

        .nav-sidebar .dropdown-toggle i {
            font-size: 1.25rem;
            width: 1.6rem;
            color: #3773a8;
        }

        .nav-sidebar .dropdown-toggle:hover {
            background: #f0f7ff;
            transform: translateX(6px);
        }

        .nav-sidebar .dropdown-toggle.active {
            background: linear-gradient(95deg, #0d3880, #1f54b0);
            color: white;
        }

        .nav-sidebar .dropdown-toggle.active i {
            color: white;
        }

        .nav-sidebar .dropdown-menu {
            background: #ffffff;
            border: 1px solid #e2edff;
            border-radius: 24px;
            padding: 0.6rem 0.2rem;
            width: 100%;
            position: static !important;
        }

        .nav-sidebar .dropdown-item {
            border-radius: 40px;
            padding: 0.55rem 1.5rem;
            color: #1d405c;
            display: flex;
            align-items: center;
            gap: 0.8rem;
        }

        .nav-sidebar .dropdown-item:hover {
            background: #e6f0fe;
            transform: translateX(6px);
        }

        /* Main Panel */
        .main-panel {
            flex: 1;
            padding: 2.2rem 2.2rem;
            width: calc(100% - var(--sidebar-width));
        }

        .dashboard-layout:not(.fullscreen) .nav-sidebar.collapsed + .main-panel {
            width: calc(100% - var(--sidebar-collapsed));
        }

        /* Page Header */
        .page-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 2rem;
        }

        .page-header h2 {
            font-size: 1.8rem;
            font-weight: 700;
            color: #0d3880;
            display: flex;
            align-items: center;
            gap: 0.8rem;
        }

        .page-header h2 i {
            background: white;
            padding: 12px;
            border-radius: 18px;
            color: #2a6df4;
            box-shadow: 0 8px 16px -8px rgba(13,56,128,0.12);
        }

        .btn-back {
            background: white;
            color: #0d3880;
            border: 1px solid #c2dcff;
            padding: 0.7rem 1.8rem;
            border-radius: 40px;
            font-weight: 500;
            display: flex;
            align-items: center;
            gap: 0.6rem;
            text-decoration: none;
            transition: all 0.22s;
        }

        .btn-back:hover {
            background: #f0f7ff;
            transform: translateX(-3px);
        }

        /* Detail Card */
        .detail-card {
            background: rgba(255,255,255,0.9);
            backdrop-filter: blur(10px);
            border-radius: 36px;
            padding: 2.5rem;
            box-shadow: 0 20px 40px -12px rgba(13,56,128,0.12);
            border: 1px solid rgba(255,255,255,0.6);
        }

        .review-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 2rem;
            padding-bottom: 1.5rem;
            border-bottom: 2px solid #e2edff;
        }

        .review-id {
            background: linear-gradient(145deg, #0d3880, #1f54b0);
            color: white;
            padding: 0.5rem 1.5rem;
            border-radius: 40px;
            font-weight: 600;
        }

        .rating-large {
            font-size: 2rem;
            color: #f6b83e;
        }

        .rating-large i {
            margin-right: 5px;
        }

        .rating-text {
            font-size: 1.2rem;
            font-weight: 600;
            color: #0d3880;
            margin-left: 10px;
        }

        .info-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 2rem;
            margin-bottom: 2rem;
        }

        .info-item {
            background: #f8fcff;
            padding: 1.5rem;
            border-radius: 24px;
            border: 1px solid #e2edff;
        }

        .info-label {
            font-size: 0.8rem;
            text-transform: uppercase;
            letter-spacing: 1px;
            color: #7b99c0;
            font-weight: 700;
            margin-bottom: 0.5rem;
        }

        .info-value {
            font-size: 1.2rem;
            font-weight: 600;
            color: #0d3880;
        }

        .info-value i {
            color: #2a6df4;
            margin-right: 8px;
        }

        .comment-section {
            background: #f8fcff;
            padding: 2rem;
            border-radius: 24px;
            border: 1px solid #e2edff;
            margin: 2rem 0;
        }

        .comment-label {
            font-size: 0.9rem;
            text-transform: uppercase;
            letter-spacing: 1px;
            color: #7b99c0;
            font-weight: 700;
            margin-bottom: 1rem;
        }

        .comment-text {
            font-size: 1.1rem;
            line-height: 1.6;
            color: #1d405c;
            font-style: italic;
            padding-left: 1rem;
            border-left: 4px solid #2a6df4;
        }

        .meta-info {
            display: flex;
            gap: 2rem;
            color: #7b99c0;
            font-size: 0.9rem;
            margin-top: 2rem;
            padding-top: 1rem;
            border-top: 1px solid #e2edff;
        }

        .action-buttons {
            display: flex;
            gap: 1rem;
            margin-top: 2rem;
        }

        .btn-edit {
            background: linear-gradient(95deg, #0d3880, #1f54b0);
            color: white;
            padding: 0.8rem 2rem;
            border-radius: 40px;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 0.6rem;
            transition: all 0.22s;
        }

        .btn-edit:hover {
            transform: translateY(-3px);
            box-shadow: 0 12px 20px -8px rgba(13,56,128,0.3);
            color: white;
        }

        .btn-delete {
            background: #ffe6e5;
            color: #b33b3b;
            padding: 0.8rem 2rem;
            border-radius: 40px;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 0.6rem;
            transition: all 0.22s;
            border: none;
        }

        .btn-delete:hover {
            background: #b33b3b;
            color: white;
        }

        .not-found {
            text-align: center;
            padding: 4rem;
            background: white;
            border-radius: 36px;
        }

        .dashboard-footer {
            background: linear-gradient(95deg, #0a2c4e, #123a60);
            color: #cde1f0;
            text-align: center;
            padding: 1.2rem;
            font-size: 0.85rem;
        }
    </style>
</head>
<body>

    <!-- Header (same as listReview) -->
    <header class="admin-header">
        <h5>
            <i class="bi bi-grid-1x2-fill"></i> 
            SmartIntern · control
        </h5>
        <div class="header-actions">
            <span class="toggle-sidebar-btn" id="toggleCollapseBtn">
                <i class="bi bi-layout-sidebar"></i> <span id="collapseText">Collapse</span>
            </span>
            <span class="fullscreen-trigger" id="fullscreenModeBtn">
                <i class="bi bi-arrows-fullscreen"></i> Fullscreen
            </span>
            <a href="/logout" class="logout-btn">
                <i class="bi bi-box-arrow-right"></i> Exit
            </a>
        </div>
    </header>

    <!-- Layout -->
    <div class="dashboard-layout" id="dashboardLayout">

        <!-- Sidebar (same as listReview) -->
        <aside class="nav-sidebar" id="mainSidebar">
            <div class="nav-category">Core</div>

            <!-- Dashboard dropdown -->
            <div class="dropdown">
                <button class="dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                    <i class="bi bi-speedometer2"></i> <span>Dashboard</span>
                </button>
                <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="/dashboard/overview"><i class="bi bi-graph-up"></i> <span>Overview</span></a></li>
                    <li><a class="dropdown-item" href="/dashboard/analytics"><i class="bi bi-pie-chart"></i> <span>Analytics</span></a></li>
                </ul>
            </div>

            <div class="nav-category">Identity</div>

            <!-- Manage Users dropdown -->
            <div class="dropdown">
                <button class="dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                    <i class="bi bi-people-fill"></i> <span>Manage Users</span>
                </button>
                <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="/listUser"><i class="bi bi-person-plus"></i> <span>Users</span></a></li>
                    <li><a class="dropdown-item" href="/addUser"><i class="bi bi-person-dash"></i> <span>Add User</span></a></li>
                </ul>
            </div>

            <!-- Verify Student dropdown -->
            <div class="dropdown">
                <button class="dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                    <i class="bi bi-patch-check-fill"></i> <span>Verify Student</span>
                </button>
                <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="/listStudent"><i class="bi bi-check-circle"></i> <span>Students</span></a></li>
                    <li><a class="dropdown-item" href="/addStudentInfo"><i class="bi bi-x-circle"></i> <span>Add Student</span></a></li>
                </ul>
            </div>

            <!-- Manage Student dropdown -->
            <div class="dropdown">
                <button class="dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                    <i class="bi bi-pencil-square"></i> <span>Manage Student</span>
                </button>
                <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="/manageStudent/list"><i class="bi bi-plus-circle"></i> <span>All Students</span></a></li>
                    <li><a class="dropdown-item" href="/manageStudent/edit"><i class="bi bi-gear"></i> <span>Edit Info</span></a></li>
                </ul>
            </div>

            <!-- Verify Employers dropdown -->
            <div class="dropdown">
                <button class="dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                    <i class="bi bi-building"></i> <span>Verify Employers</span>
                </button>
                <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="/listEmployer"><i class="bi bi-shield-check"></i> <span>Employers</span></a></li>
                    <li><a class="dropdown-item" href="/employer"><i class="bi bi-shield-exclamation"></i> <span>Add Employer</span></a></li>
                </ul>
            </div>

            <div class="nav-category">Opportunities</div>

            <!-- Post Internship dropdown -->
            <div class="dropdown">
                <button class="dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                    <i class="bi bi-briefcase-fill"></i> <span>Internship</span>
                </button>
                <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="/listInternship"><i class="bi bi-send"></i> <span>List Internship</span></a></li>
                    <li><a class="dropdown-item" href="/addInternship"><i class="bi bi-file-text"></i> <span>Add Internship</span></a></li>
                </ul>
            </div>

            <!-- Enrollments dropdown -->
            <div class="dropdown">
                <button class="dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                    <i class="bi bi-journal-bookmark-fill"></i> <span>Enrollments</span>
                </button>
                <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="/listEnrollment"><i class="bi bi-list-check"></i> <span>List Enrollments</span></a></li>
                    <li><a class="dropdown-item" href="/addInternshipEnrollment"><i class="bi bi-clock-history"></i> <span>New Enroll</span></a></li>
                </ul>
            </div>

            <!-- Applications dropdown -->
            <div class="dropdown">
                <button class="dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                    <i class="bi bi-send-fill"></i> <span>Applications</span>
                </button>
                <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="/listApplications"><i class="bi bi-envelope-open"></i> <span>All Applications</span></a></li>
                    <li><a class="dropdown-item" href="/applyInternship"><i class="bi bi-archive"></i> <span>Add New Internship</span></a></li>
                </ul>
            </div>

            <!-- Reviews dropdown (active) -->
            <div class="dropdown">
                <button class="dropdown-toggle active" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                    <i class="bi bi-star-fill"></i> <span>Reviews</span>
                </button>
                <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="/listReview"><i class="bi bi-star-half"></i> <span>List Reviews</span></a></li>
                    <li><a class="dropdown-item active" href="/review"><i class="bi bi-star"></i> <span>Add Review</span></a></li>
                </ul>
            </div>

            <!-- Certificates dropdown -->
            <div class="dropdown">
                <button class="dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                    <i class="bi bi-award-fill"></i> <span>Certificates</span>
                </button>
                <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="/listCertificate"><i class="bi bi-file-pdf"></i> <span>List Certificate</span></a></li>
                    <li><a class="dropdown-item" href="/certificate"><i class="bi bi-download"></i> <span>Add Certificate</span></a></li>
                </ul>
            </div>
        </aside>

        <!-- Main Panel -->
        <main class="main-panel" id="mainPanel">

            <!-- Page Header -->
            <div class="page-header">
                <h2>
                    <i class="bi bi-star-fill"></i> 
                    Review Details
                </h2>
                <a href="/listReview" class="btn-back">
                    <i class="bi bi-arrow-left"></i> Back to List
                </a>
            </div>

            <!-- Check if review exists -->
            <c:choose>
                <c:when test="${empty review}">
                    <div class="not-found">
                        <i class="bi bi-exclamation-circle" style="font-size: 4rem; color: #f5655c;"></i>
                        <h3 class="mt-3">Review Not Found</h3>
                        <p class="text-muted">The review you're looking for doesn't exist or has been deleted.</p>
                        <a href="/listReview" class="btn-primary-custom d-inline-flex mt-3">
                            <i class="bi bi-arrow-left"></i> Back to Reviews
                        </a>
                    </div>
                </c:when>
                <c:otherwise>
                    <!-- Review Detail Card -->
                    <div class="detail-card">
                        <!-- Header with ID and Rating -->
                        <div class="review-header">
                            <span class="review-id">
                                <i class="bi bi-hash"></i> Review #${review.reviewId}
                            </span>
                            <div class="rating-large">
                                <c:forEach begin="1" end="5" var="i">
                                    <c:choose>
                                        <c:when test="${i <= review.rating}">
                                            <i class="bi bi-star-fill"></i>
                                        </c:when>
                                        <c:otherwise>
                                            <i class="bi bi-star"></i>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                                <span class="rating-text">${review.rating}.0</span>
                            </div>
                        </div>

                        <!-- Info Grid -->
                        <div class="info-grid">
                            <div class="info-item">
                                <div class="info-label">
                                    <i class="bi bi-briefcase"></i> Internship ID
                                </div>
                                <div class="info-value">
                                    <c:choose>
                                        <c:when test="${not empty review.internshipId}">
                                            <i class="bi bi-code-square"></i> ${review.internshipId}
                                        </c:when>
                                        <c:otherwise>
                                            <span class="text-muted">Not assigned</span>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>

                            <div class="info-item">
                                <div class="info-label">
                                    <i class="bi bi-person"></i> Student ID
                                </div>
                                <div class="info-value">
                                    <c:choose>
                                        <c:when test="${not empty review.studentId}">
                                            <i class="bi bi-person-circle"></i> ${review.studentId}
                                        </c:when>
                                        <c:otherwise>
                                            <span class="text-muted">Not assigned</span>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>

                            <div class="info-item">
                                <div class="info-label">
                                    <i class="bi bi-calendar"></i> Created Date
                                </div>
                                <div class="info-value">
                                    <i class="bi bi-calendar-check"></i> 
                                    <fmt:formatDate value="${review.createdAt}" pattern="MMMM dd, yyyy"/>
                                </div>
                            </div>

                            <div class="info-item">
                                <div class="info-label">
                                    <i class="bi bi-star"></i> Rating
                                </div>
                                <div class="info-value">
                                    <i class="bi bi-star-fill" style="color: #f6b83e;"></i> 
                                    ${review.rating}/5
                                </div>
                            </div>
                        </div>

                        <!-- Comment Section -->
                        <div class="comment-section">
                            <div class="comment-label">
                                <i class="bi bi-chat-quote"></i> Review Comment
                            </div>
                            <div class="comment-text">
                                <c:choose>
                                    <c:when test="${not empty review.comment}">
                                        "${review.comment}"
                                    </c:when>
                                    <c:otherwise>
                                        <span class="text-muted">No comment provided</span>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>

                        <!-- Meta Information -->
                        <div class="meta-info">
                            <span><i class="bi bi-clock"></i> Review ID: ${review.reviewId}</span>
                            <c:if test="${not empty review.createdAt}">
                                <span><i class="bi bi-calendar"></i> Created: <fmt:formatDate value="${review.createdAt}" pattern="yyyy-MM-dd HH:mm"/></span>
                            </c:if>
                        </div>

                        <!-- Action Buttons -->
                        <div class="action-buttons">
                            <a href="/editReview/${review.reviewId}" class="btn-edit">
                                <i class="bi bi-pencil-square"></i> Edit Review
                            </a>
                            <a href="/deleteReview/${review.reviewId}" class="btn-delete" onclick="return confirm('Are you sure you want to delete this review?')">
                                <i class="bi bi-trash"></i> Delete Review
                            </a>
                        </div>
                    </div>
                </c:otherwise>
            </c:choose>
        </main>
    </div>

    <!-- Footer -->
    <footer class="dashboard-footer">
        © 2026 SmartIntern — dynamic admin environment · full control
    </footer>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

    <script>
        (function() {
            const layout = document.getElementById('dashboardLayout');
            const sidebar = document.getElementById('mainSidebar');
            const toggleBtn = document.getElementById('toggleCollapseBtn');
            const fullscreenBtn = document.getElementById('fullscreenModeBtn');
            const collapseText = document.getElementById('collapseText');

            // Sidebar Collapse
            toggleBtn.addEventListener('click', function(e) {
                e.preventDefault();
                if (layout.classList.contains('fullscreen')) {
                    layout.classList.remove('fullscreen');
                }
                sidebar.classList.toggle('collapsed');
                collapseText.innerText = sidebar.classList.contains('collapsed') ? 'Expand' : 'Collapse';
            });

            // Fullscreen Mode
            fullscreenBtn.addEventListener('click', function(e) {
                e.preventDefault();
                layout.classList.toggle('fullscreen');
                
                if (layout.classList.contains('fullscreen')) {
                    sidebar.classList.remove('collapsed');
                    collapseText.innerText = 'Collapse';
                    fullscreenBtn.innerHTML = '<i class="bi bi-fullscreen-exit"></i> Sidebar off';
                } else {
                    fullscreenBtn.innerHTML = '<i class="bi bi-arrows-fullscreen"></i> Fullscreen';
                }
            });
        })();
    </script>
</body>
</html>