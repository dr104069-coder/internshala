<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SmartIntern · Review List</title>

    <!-- Bootstrap & Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">

    <style>
        /* ------------------------------------------------------------
           GLOBAL – MODERN, PROFESSIONAL, RICH COLOR PALETTE
           ------------------------------------------------------------ */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Inter', system-ui, -apple-system, 'Segoe UI', Roboto, sans-serif;
        }

        body {
            background: linear-gradient(145deg, #f1f5fa 0%, #e9eff5 100%);
            color: #0e2e42;
            line-height: 1.5;
            transition: background 0.2s;
        }

        /* ----------  PROFESSIONAL COLOR TOKENS  ---------- */
        :root {
            --primary-deep: #0d3880;
            --primary-bright: #2a6df4;
            --primary-soft: #628ef8;
            --accent-teal: #0f9d8e;
            --accent-coral: #f5655c;
            --accent-amber: #f6b83e;
            --gray-light: #f8fcff;
            --gray-mist: #eef3f9;
            --slate: #2c3f58;
            --sidebar-width: 280px;
            --sidebar-collapsed: 80px;
            --transition-ease: cubic-bezier(0.23, 1, 0.32, 1);
        }

        /* ==========  HEADER : START  ========== */
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
            transition: all 0.25s;
        }

        .admin-header h5 {
            margin: 0;
            font-weight: 620;
            color: white;
            font-size: 1.45rem;
            display: flex;
            align-items: center;
            gap: 0.7rem;
            letter-spacing: -0.3px;
        }

        .admin-header h5 i {
            color: #ffe08c;
            background: rgba(255, 255, 255, 0.15);
            padding: 8px;
            border-radius: 14px;
            font-size: 1.35rem;
            box-shadow: 0 4px 12px rgba(0,0,0,0.05);
        }

        .header-actions {
            display: flex;
            align-items: center;
            gap: 1rem;
        }

        .toggle-sidebar-btn {
            background: rgba(255,255,255,0.12);
            border: 1px solid rgba(255,255,255,0.25);
            color: white;
            border-radius: 40px;
            padding: 0.5rem 1.1rem;
            font-weight: 500;
            font-size: 0.9rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
            transition: all 0.18s var(--transition-ease);
            cursor: pointer;
        }

        .toggle-sidebar-btn:hover {
            background: rgba(255,255,255,0.25);
            border-color: rgba(255,255,255,0.5);
            transform: scale(0.96);
        }

        .fullscreen-trigger {
            background: rgba(255,255,255,0.1);
            padding: 0.45rem 1rem;
            border-radius: 30px;
            color: white;
            border: 1px solid rgba(255,255,255,0.3);
            display: flex;
            align-items: center;
            gap: 0.5rem;
            transition: 0.18s;
            cursor: pointer;
        }

        .fullscreen-trigger:hover {
            background: rgba(255,255,255,0.2);
        }

        .logout-btn {
            background: rgba(255,255,255,0.05);
            border: 1px solid rgba(255,255,255,0.2);
            color: white;
            border-radius: 40px;
            padding: 0.5rem 1.3rem;
            font-weight: 500;
            transition: all 0.18s var(--transition-ease);
            text-decoration: none;
        }

        .logout-btn:hover {
            background: #f43f5e;
            border-color: #f43f5e;
            color: white;
            box-shadow: 0 6px 14px rgba(244, 63, 94, 0.3);
        }
        /* ==========  HEADER : END  ========== */

        /* ==========  LAYOUT: SIDEBAR + MAIN ========== */
        .dashboard-layout {
            display: flex;
            min-height: calc(100vh - 72px);
            transition: all 0.35s var(--transition-ease);
            position: relative;
        }

        /* ==========  SIDEBAR : START ========== */
        .nav-sidebar {
            width: var(--sidebar-width);
            background: linear-gradient(180deg, #ffffff 0%, #fbfdff 100%);
            border-right: 1px solid rgba(42, 109, 244, 0.12);
            padding: 2rem 1.2rem;
            box-shadow: 8px 0 28px -10px rgba(13, 56, 128, 0.08);
            transition: width 0.3s var(--transition-ease), padding 0.25s, transform 0.3s, box-shadow 0.3s;
            display: flex;
            flex-direction: column;
            overflow: hidden;
            white-space: nowrap;
            position: relative;
            z-index: 500;
            border-radius: 0 20px 20px 0;
        }

        /* collapsed state */
        .nav-sidebar.collapsed {
            width: var(--sidebar-collapsed);
            padding: 2rem 0.5rem;
        }

        .nav-sidebar.collapsed .nav-category,
        .nav-sidebar.collapsed .dropdown-toggle span,
        .nav-sidebar.collapsed .dropdown-item span {
            display: none;
        }

        .nav-sidebar.collapsed .dropdown-toggle i {
            margin: 0 auto;
            width: auto;
            font-size: 1.4rem;
        }

        .nav-sidebar.collapsed .dropdown-toggle {
            justify-content: center;
            padding: 0.7rem 0;
        }

        .nav-sidebar.collapsed .dropdown-menu {
            display: none;
        }

        /* fullscreen mode */
        .dashboard-layout.fullscreen .nav-sidebar {
            transform: translateX(-100%);
            width: 0;
            padding: 0;
            margin: 0;
            border-right: none;
        }

        .dashboard-layout.fullscreen .main-panel {
            width: 100%;
            margin-left: 0;
        }

        /* sidebar categories */
        .nav-category {
            color: #5e7fa3;
            font-size: 0.7rem;
            text-transform: uppercase;
            letter-spacing: 2px;
            font-weight: 800;
            margin: 1.8rem 0 0.8rem 0.5rem;
            transition: opacity 0.2s;
        }

        /* dropdown / link base styles */
        .nav-sidebar .dropdown {
            width: 100%;
        }

        .nav-sidebar .dropdown-toggle {
            display: flex;
            align-items: center;
            gap: 1rem;
            padding: 0.8rem 1.2rem;
            border-radius: 18px;
            color: #1d405c;
            text-decoration: none;
            margin-bottom: 0.4rem;
            font-size: 0.98rem;
            font-weight: 490;
            border: 1px solid transparent;
            transition: all 0.22s var(--transition-ease);
            position: relative;
            overflow: hidden;
            width: 100%;
            background: transparent;
            border: none;
            text-align: left;
            cursor: pointer;
        }

        .nav-sidebar .dropdown-toggle i {
            font-size: 1.25rem;
            width: 1.6rem;
            color: #3773a8;
            transition: all 0.2s;
            z-index: 2;
        }

        .nav-sidebar .dropdown-toggle::before {
            content: '';
            position: absolute;
            top: 0;
            left: -10%;
            width: 0;
            height: 100%;
            background: linear-gradient(90deg, rgba(42,109,244,0.08) 0%, rgba(98,142,248,0.02) 100%);
            transition: width 0.3s var(--transition-ease);
            z-index: 0;
            border-radius: 18px;
        }

        .nav-sidebar .dropdown-toggle:hover::before {
            width: 120%;
        }

        .nav-sidebar .dropdown-toggle:hover {
            background: #f0f7ff;
            border-color: #c2dcff;
            transform: translateX(6px);
        }

        .nav-sidebar .dropdown-toggle:hover i {
            color: var(--primary-bright);
            transform: scale(1.08);
        }

        /* active state */
        .nav-sidebar .dropdown-toggle.active {
            background: linear-gradient(95deg, #0d3880, #1f54b0);
            color: white;
            border: none;
            box-shadow: 0 12px 18px -8px rgba(13,56,128,0.25);
        }

        .nav-sidebar .dropdown-toggle.active i {
            color: white;
            text-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }

        /* dropdown menu custom */
        .nav-sidebar .dropdown-menu {
            background: #ffffff;
            border: 1px solid rgba(42,109,244,0.15);
            border-radius: 24px;
            padding: 0.6rem 0.2rem;
            margin-top: 0.25rem;
            margin-bottom: 0.5rem;
            box-shadow: 0 12px 28px -8px rgba(13,56,128,0.15);
            backdrop-filter: blur(8px);
            width: 100%;
            position: static !important;
            transform: none !important;
            transition: all 0.2s;
            border: 1px solid #e2edff;
        }

        .nav-sidebar .dropdown-item {
            border-radius: 40px;
            padding: 0.55rem 1.5rem;
            color: #1d405c;
            font-size: 0.92rem;
            font-weight: 470;
            display: flex;
            align-items: center;
            gap: 0.8rem;
            transition: all 0.18s;
            margin: 0.2rem 0.3rem;
        }

        .nav-sidebar .dropdown-item i {
            color: #3773a8;
            font-size: 1.1rem;
            width: 1.4rem;
        }

        .nav-sidebar .dropdown-item:hover {
            background: #e6f0fe;
            transform: translateX(6px);
        }

        /* MAIN PANEL */
        .main-panel {
            flex: 1;
            padding: 2.2rem 2.2rem;
            background: transparent;
            transition: width 0.3s var(--transition-ease), margin 0.3s, padding 0.2s;
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
            margin: 0;
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

        .btn-primary-custom {
            background: linear-gradient(95deg, #0d3880, #1f54b0);
            color: white;
            border: none;
            padding: 0.7rem 1.8rem;
            border-radius: 40px;
            font-weight: 500;
            display: flex;
            align-items: center;
            gap: 0.6rem;
            transition: all 0.22s;
            text-decoration: none;
        }

        .btn-primary-custom:hover {
            transform: translateY(-3px);
            box-shadow: 0 12px 20px -8px rgba(13,56,128,0.3);
            color: white;
        }

        /* Table Card */
        .table-card {
            background: rgba(255,255,255,0.9);
            backdrop-filter: blur(10px);
            border-radius: 36px;
            padding: 2rem;
            box-shadow: 0 20px 40px -12px rgba(13,56,128,0.12);
            border: 1px solid rgba(255,255,255,0.6);
        }

        .table {
            margin-bottom: 0;
        }

        .table thead th {
            border-bottom: 2px solid #e2edff;
            color: #0d3880;
            font-weight: 600;
            font-size: 0.85rem;
            text-transform: uppercase;
            letter-spacing: 1px;
            padding: 1rem 0.75rem;
            background: transparent;
        }

        .table tbody td {
            padding: 1rem 0.75rem;
            color: #1d405c;
            font-weight: 450;
            border-bottom: 1px solid #e9f0f6;
            vertical-align: middle;
        }

        .table tbody tr:hover td {
            background: #f3fcff;
        }

        /* Rating Stars */
        .rating-stars {
            color: #f6b83e;
            font-size: 1.1rem;
        }

        .rating-stars i {
            margin-right: 2px;
        }

        /* Action Buttons */
        .action-btn {
            padding: 0.4rem 1rem;
            border-radius: 30px;
            font-size: 0.8rem;
            font-weight: 500;
            transition: all 0.18s;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 0.4rem;
        }

        .action-btn.view {
            background: #e6f0fe;
            color: #0d3880;
        }

        .action-btn.view:hover {
            background: #0d3880;
            color: white;
        }

        .action-btn.delete {
            background: #ffe6e5;
            color: #b33b3b;
        }

        .action-btn.delete:hover {
            background: #b33b3b;
            color: white;
        }

        .action-btn.edit {
            background: #fff0db;
            color: #b45a1c;
        }

        .action-btn.edit:hover {
            background: #b45a1c;
            color: white;
        }

        /* Footer */
        .dashboard-footer {
            background: linear-gradient(95deg, #0a2c4e, #123a60);
            color: #cde1f0;
            text-align: center;
            padding: 1.2rem;
            font-size: 0.85rem;
            letter-spacing: 0.8px;
            font-weight: 450;
            border-top: 1px solid rgba(255,255,255,0.08);
        }

        /* Empty State */
        .empty-state {
            text-align: center;
            padding: 3rem;
            color: #7b99c0;
        }

        .empty-state i {
            font-size: 4rem;
            margin-bottom: 1rem;
        }

        /* Badges */
        .badge-rating {
            background: #e3f2fd;
            color: #0d5e9c;
            padding: 0.25rem 0.9rem;
            border-radius: 40px;
            font-weight: 600;
            font-size: 0.8rem;
        }

        /* Search Bar */
        .search-bar {
            background: white;
            border-radius: 40px;
            padding: 0.3rem 0.3rem 0.3rem 1.5rem;
            border: 1px solid #e2edff;
            display: flex;
            align-items: center;
            margin-bottom: 1.5rem;
        }

        .search-bar input {
            border: none;
            background: transparent;
            padding: 0.5rem 0;
            flex: 1;
            outline: none;
        }

        .search-bar button {
            background: linear-gradient(95deg, #0d3880, #1f54b0);
            color: white;
            border: none;
            border-radius: 40px;
            padding: 0.5rem 1.5rem;
        }

        /* Pagination */
        .pagination .page-link {
            border: none;
            background: white;
            color: #0d3880;
            margin: 0 3px;
            border-radius: 30px;
            padding: 0.5rem 1rem;
        }

        .pagination .page-item.active .page-link {
            background: linear-gradient(95deg, #0d3880, #1f54b0);
            color: white;
        }
    </style>
</head>
<body>

    <!-- ==================== HEADER : START ==================== -->
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
    <!-- ==================== HEADER : END ====================== -->

    <!-- ==================== LAYOUT : START =================== -->
     <!-- LAYOUT -->
  <div class="dashboard-layout" id="dashboardLayout">

    <!-- SIDEBAR - EXACTLY AS IN CODE A (USER LIST) -->
    <aside class="nav-sidebar" id="mainSidebar">
      <div class="nav-category">Core</div>
     <a href="/dashboard" class="dropdown-toggle active" style="text-decoration: none;">
 		 <i class="bi bi-speedometer2"></i> <span>Dashboard</span>
	</a>

      <div class="nav-category">Identity</div>
      <div class="dropdown">
        <button class="dropdown-toggle" type="button" data-bs-toggle="dropdown">
          <i class="bi bi-people-fill"></i> <span>Manage Users</span>
        </button>
        <ul class="dropdown-menu">
          <li><a class="dropdown-item" href="/listUser"><i class="bi bi-person-plus"></i> <span>Users</span></a></li>
         
        </ul>
      </div>

      <div class="dropdown">
        <button class="dropdown-toggle" type="button" data-bs-toggle="dropdown">
          <i class="bi bi-patch-check-fill"></i> <span>Verify Student</span>
        </button>
        <ul class="dropdown-menu">
          <li><a class="dropdown-item" href="listStudent"><i class="bi bi-check-circle"></i> <span>Students</span></a></li>
          <li><a class="dropdown-item" href="addStudentInfo"><i class="bi bi-x-circle"></i> <span>Add Student</span></a></li>
        </ul>
      </div>

      <div class="dropdown">
        <button class="dropdown-toggle" type="button" data-bs-toggle="dropdown">
          <i class="bi bi-building"></i> <span>Verify Employers</span>
        </button>
        <ul class="dropdown-menu">
          <li><a class="dropdown-item" href="listEmployer"><i class="bi bi-shield-check"></i> <span>Employers</span></a></li>
          <li><a class="dropdown-item" href="employer"><i class="bi bi-shield-exclamation"></i> <span>Add Employer</span></a></li>
        </ul>
      </div>

      <div class="nav-category">Opportunities</div>
      <div class="dropdown">
        <button class="dropdown-toggle" type="button" data-bs-toggle="dropdown">
          <i class="bi bi-briefcase-fill"></i> <span>Internship</span>
        </button>
        <ul class="dropdown-menu">
          <li><a class="dropdown-item" href="listInternship"><i class="bi bi-send"></i> <span>List Internship</span></a></li>
          <li><a class="dropdown-item" href="addInternship"><i class="bi bi-file-text"></i> <span>Add Internship</span></a></li>
        </ul>
      </div>

      <div class="dropdown">
        <button class="dropdown-toggle" type="button" data-bs-toggle="dropdown">
          <i class="bi bi-journal-bookmark-fill"></i> <span>Enrollments</span>
        </button>
        <ul class="dropdown-menu">
          <li><a class="dropdown-item" href="listEnrollment"><i class="bi bi-list-check"></i> <span>List Enrollments</span></a></li>
          <li><a class="dropdown-item" href="addInternshipEnrollment"><i class="bi bi-clock-history"></i> <span>New Enroll</span></a></li>
        </ul>
      </div>

      <div class="dropdown">
        <button class="dropdown-toggle" type="button" data-bs-toggle="dropdown">
          <i class="bi bi-send-fill"></i> <span>Applications</span>
        </button>
        <ul class="dropdown-menu">
          <li><a class="dropdown-item" href="/listapplications"><i class="bi bi-envelope-open"></i> <span>All Applications</span></a></li>
         
        </ul>
      </div>

    

      <div class="dropdown">
        <button class="dropdown-toggle" type="button" data-bs-toggle="dropdown">
          <i class="bi bi-award-fill"></i> <span>Certificates</span>
        </button>
        <ul class="dropdown-menu">
          <li><a class="dropdown-item" href="listCertificate"><i class="bi bi-file-pdf"></i> <span>List Certificates</span></a></li>
          <li><a class="dropdown-item" href="certificate"><i class="bi bi-download"></i> <span>Add Certificate</span></a></li>
        </ul>
      </div>
    </aside>
        <!-- ========== SIDEBAR : END ========== -->

        <!-- ========== MAIN PANEL : START ========== -->
        <main class="main-panel" id="mainPanel">

            <!-- Page Header -->
            <div class="page-header">
                <h2>
                    <i class="bi bi-star-fill"></i> 
                    Review Management
                </h2>
                <a href="/review" class="btn-primary-custom">
                    <i class="bi bi-plus-lg"></i> Add New Review
                </a>
            </div>

            <!-- Search Bar -->
            <div class="search-bar">
                <i class="bi bi-search text-muted me-2"></i>
                <input type="text" id="searchInput" placeholder="Search by student, internship or comment..." class="form-control-sm border-0">
                <button class="btn" onclick="searchTable()">Search</button>
            </div>

            <!-- Reviews Table Card -->
            <div class="table-card">
                <div class="table-responsive">
                    <table class="table" id="reviewTable">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Internship ID</th>
                                <th>Student ID</th>
                                <th>Rating</th>
                                <th>Comment</th>
                                <th>Created At</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:choose>
                                <c:when test="${empty reviews}">
                                    <tr>
                                        <td colspan="7">
                                            <div class="empty-state">
                                                <i class="bi bi-star"></i>
                                                <h4>No Reviews Found</h4>
                                                <p>Click "Add New Review" to create your first review</p>
                                            </div>
                                        </td>
                                    </tr>
                                </c:when>
                                <c:otherwise>
                                    <c:forEach var="review" items="${reviews}">
                                        <tr>
                                            <td><span class="badge-rating">#${review.reviewId}</span></td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${not empty review.internshipId}">
                                                        <span class="badge bg-info">${review.internshipId}</span>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span class="badge bg-secondary">N/A</span>
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${not empty review.studentId}">
                                                        <span class="badge bg-primary">${review.studentId}</span>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span class="badge bg-secondary">N/A</span>
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td>
                                                <span class="rating-stars">
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
                                                </span>
                                                <span class="ms-2">${review.rating}.0</span>
                                            </td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${not empty review.comment}">
                                                        ${review.comment.length() > 30 ? review.comment.substring(0,30).concat('...') : review.comment}
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span class="text-muted">No comment</span>
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td>
                                                <fmt:formatDate value="${review.createdAt}" pattern="yyyy-MM-dd" var="formattedDate"/>
                                                <c:out value="${formattedDate}" default="N/A"/>
                                            </td>
                                            <td>
                                                <a href="/viewReview/${review.reviewId}" class="action-btn view">
                                                    <i class="bi bi-eye"></i> View
                                                </a>
                                                <a href="/editReview/${review.reviewId}" class="action-btn edit ms-2">
                                                    <i class="bi bi-pencil"></i>
                                                </a>
                                                <a href="/deleteReview/${review.reviewId}" class="action-btn delete ms-2" onclick="return confirm('Are you sure you want to delete this review?')">
                                                    <i class="bi bi-trash"></i>
                                                </a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </c:otherwise>
                            </c:choose>
                        </tbody>
                    </table>
                </div>

                <!-- Pagination (if needed) -->
                <c:if test="${totalPages > 1}">
                    <nav class="mt-4">
                        <ul class="pagination justify-content-center">
                            <li class="page-item ${currentPage == 0 ? 'disabled' : ''}">
                                <a class="page-link" href="?page=${currentPage - 1}&size=${pageSize}"><i class="bi bi-chevron-left"></i></a>
                            </li>
                            <c:forEach begin="0" end="${totalPages - 1}" var="i">
                                <li class="page-item ${currentPage == i ? 'active' : ''}">
                                    <a class="page-link" href="?page=${i}&size=${pageSize}">${i + 1}</a>
                                </li>
                            </c:forEach>
                            <li class="page-item ${currentPage == totalPages - 1 ? 'disabled' : ''}">
                                <a class="page-link" href="?page=${currentPage + 1}&size=${pageSize}"><i class="bi bi-chevron-right"></i></a>
                            </li>
                        </ul>
                    </nav>
                </c:if>
            </div>
        </main>
        <!-- ========== MAIN PANEL : END ========== -->
    </div>
    <!-- ==================== LAYOUT : END ====================== -->

    <!-- ==================== FOOTER : START ==================== -->
    <footer class="dashboard-footer">
        © 2026 SmartIntern — dynamic admin environment · full control
    </footer>
    <!-- ==================== FOOTER : END ====================== -->

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

    <script>
        (function() {
            "use strict";

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
                
                if (sidebar.classList.contains('collapsed')) {
                    collapseText.innerText = 'Expand';
                } else {
                    collapseText.innerText = 'Collapse';
                }
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

            // Initial states
            fullscreenBtn.innerHTML = '<i class="bi bi-arrows-fullscreen"></i> Fullscreen';
            collapseText.innerText = 'Collapse';
        })();

        // Search function
        function searchTable() {
            var input, filter, table, tr, td, i, txtValue;
            input = document.getElementById("searchInput");
            filter = input.value.toUpperCase();
            table = document.getElementById("reviewTable");
            tr = table.getElementsByTagName("tr");

            for (i = 0; i < tr.length; i++) {
                td = tr[i].getElementsByTagName("td");
                for (var j = 0; j < td.length - 1; j++) { // Skip actions column
                    if (td[j]) {
                        txtValue = td[j].textContent || td[j].innerText;
                        if (txtValue.toUpperCase().indexOf(filter) > -1) {
                            tr[i].style.display = "";
                            break;
                        } else {
                            tr[i].style.display = "none";
                        }
                    }
                }
            }
        }
    </script>

</body>
</html>