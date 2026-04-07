<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SmartIntern · Edit Enrollment</title>

    <!-- Bootstrap & Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">
    
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">

    <style>
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
            --border-blue: rgba(75, 139, 190, 0.3);
            --text-secondary: #B3CDE0;
            --text-muted: #A8A8A8;
            --shadow-md: 0 4px 16px rgba(44, 62, 80, 0.3);
            --shadow-blue: 0 4px 20px rgba(75, 139, 190, 0.3);
            --transition-soft: 300ms ease-out;
        }

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
        }

        /* Header Styles - No Sidebar */
        .admin-header {
            background: var(--glass-deep-darker);
            backdrop-filter: blur(12px);
            border-bottom: 1px solid var(--border-blue);
            padding: 0 2rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
            position: sticky;
            top: 0;
            z-index: 1000;
            height: 70px;
        }

        .logo-container {
            display: flex;
            align-items: center;
            gap: 1rem;
        }

        .logo-icon {
            width: 45px;
            height: 45px;
            background: linear-gradient(135deg, var(--deep-blue), var(--bright-blue));
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            border: 2px solid var(--bright-blue);
        }

        .logo-icon i {
            font-size: 24px;
            color: white;
        }

        .logo-text {
            font-size: 1.4rem;
            font-weight: 700;
            color: var(--pure-white);
        }

        .header-actions {
            display: flex;
            align-items: center;
            gap: 1rem;
        }

        .btn-header {
            background: rgba(255, 255, 255, 0.05);
            border: 1px solid var(--border-blue);
            color: var(--soft-blue);
            border-radius: 40px;
            padding: 0.5rem 1.2rem;
            font-weight: 500;
            transition: all 0.3s ease;
            text-decoration: none;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .btn-header:hover {
            background: var(--bright-blue);
            color: white;
            transform: translateY(-2px);
        }

        .logout-btn {
            background: rgba(239, 68, 68, 0.1);
            border: 1px solid rgba(239, 68, 68, 0.3);
            color: #f87171;
        }

        .logout-btn:hover {
            background: #ef4444;
            color: white;
        }

        /* Main Content */
        .main-content {
            padding: 2rem;
            max-width: 1200px;
            margin: 0 auto;
        }

        /* Page Header */
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

        /* Form Card */
        .form-card {
            background: var(--glass-deep);
            backdrop-filter: blur(12px);
            border-radius: 30px;
            border: 1px solid var(--border-blue);
            padding: 2rem;
            box-shadow: var(--shadow-md);
            transition: all var(--transition-soft);
        }

        .form-card:hover {
            border-color: var(--bright-blue);
            box-shadow: var(--shadow-md), var(--shadow-blue);
        }

        /* Info Card */
        .info-card {
            background: rgba(75, 139, 190, 0.1);
            border-radius: 20px;
            padding: 1.5rem;
            margin-bottom: 2rem;
            border: 1px solid var(--border-blue);
        }

        .info-row {
            display: flex;
            margin-bottom: 0.8rem;
            padding: 0.5rem 0;
            flex-wrap: wrap;
        }

        .info-label {
            width: 140px;
            font-weight: 600;
            color: var(--soft-blue);
            font-size: 0.85rem;
        }

        .info-value {
            flex: 1;
            color: var(--pure-white);
            font-weight: 500;
        }

        /* Form Elements */
        .form-label {
            font-weight: 600;
            color: var(--soft-blue);
            margin-bottom: 0.5rem;
            font-size: 0.9rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .form-label i {
            color: var(--bright-blue);
        }

        .required-field::after {
            content: "*";
            color: #ef4444;
            margin-left: 4px;
        }

        .form-control, .form-select {
            width: 100%;
            padding: 0.75rem 1rem;
            border-radius: 16px;
            border: 1px solid var(--border-blue);
            background: rgba(255, 255, 255, 0.05);
            color: var(--pure-white);
            font-size: 1rem;
            transition: all var(--transition-soft);
        }

        .form-control:focus, .form-select:focus {
            border-color: var(--bright-blue);
            background: rgba(255, 255, 255, 0.1);
            box-shadow: 0 0 0 3px rgba(75, 139, 190, 0.1);
            outline: none;
        }

        .form-select option {
            background: var(--deep-blue-dark);
            color: var(--pure-white);
        }

        .text-muted {
            color: var(--text-muted) !important;
            font-size: 0.85rem;
            margin-top: 0.25rem;
            display: block;
        }

        /* Status Badges */
        .status-badge {
            padding: 0.3rem 1rem;
            border-radius: 40px;
            font-size: 0.8rem;
            font-weight: 600;
            display: inline-block;
        }

        .status-ongoing {
            background: rgba(75, 139, 190, 0.15);
            color: var(--soft-blue);
            border: 1px solid rgba(75, 139, 190, 0.3);
        }

        .status-completed {
            background: rgba(16, 185, 129, 0.15);
            color: #34d399;
            border: 1px solid rgba(16, 185, 129, 0.3);
        }

        .status-dropped {
            background: rgba(239, 68, 68, 0.15);
            color: #f87171;
            border: 1px solid rgba(239, 68, 68, 0.3);
        }

        /* Buttons */
        .btn-primary-custom {
            background: rgba(75, 139, 190, 0.1);
            border: 1px solid rgba(75, 139, 190, 0.3);
            color: var(--soft-blue);
            border-radius: 40px;
            padding: 0.8rem 2rem;
            font-weight: 600;
            display: inline-flex;
            align-items: center;
            gap: 0.7rem;
            transition: all var(--transition-soft);
            cursor: pointer;
        }

        .btn-primary-custom:hover {
            background: var(--bright-blue);
            color: white;
            transform: translateY(-2px);
            border-color: var(--bright-blue);
            box-shadow: var(--shadow-blue);
        }

        .btn-secondary-custom {
            background: rgba(255, 255, 255, 0.05);
            border: 1px solid var(--border-blue);
            color: var(--soft-blue);
            border-radius: 40px;
            padding: 0.8rem 2rem;
            font-weight: 600;
            display: inline-flex;
            align-items: center;
            gap: 0.7rem;
            transition: all var(--transition-soft);
            text-decoration: none;
        }

        .btn-secondary-custom:hover {
            background: var(--bright-blue);
            color: white;
            transform: translateY(-2px);
            border-color: var(--bright-blue);
            box-shadow: var(--shadow-blue);
        }

        .btn-danger-custom {
            background: rgba(239, 68, 68, 0.1);
            border: 1px solid rgba(239, 68, 68, 0.3);
            color: #f87171;
            border-radius: 40px;
            padding: 0.8rem 2rem;
            font-weight: 600;
            display: inline-flex;
            align-items: center;
            gap: 0.7rem;
            transition: all var(--transition-soft);
            text-decoration: none;
            cursor: pointer;
        }

        .btn-danger-custom:hover {
            background: #ef4444;
            color: white;
            transform: translateY(-2px);
            border-color: #ef4444;
        }

        .form-actions {
            display: flex;
            gap: 1rem;
            justify-content: center;
            margin-top: 2rem;
            flex-wrap: wrap;
        }

        /* Alert */
        .alert-custom {
            background: var(--glass-deep);
            backdrop-filter: blur(12px);
            border: 1px solid var(--border-blue);
            border-radius: 30px;
            padding: 3rem;
            text-align: center;
        }

        .alert-custom i {
            color: #ef4444;
            font-size: 4rem;
        }

        .alert-custom h3 {
            color: var(--pure-white);
            margin-top: 1rem;
        }

        .alert-custom p {
            color: var(--text-secondary);
            margin-bottom: 1.5rem;
        }

        /* Footer */
        .dashboard-footer {
            background: var(--glass-deep-darker);
            backdrop-filter: blur(12px);
            color: var(--medium-grey);
            text-align: center;
            padding: 1rem;
            font-size: 0.85rem;
            border-top: 1px solid var(--border-blue);
            margin-top: 2rem;
        }

        /* Responsive */
        @media (max-width: 768px) {
            .main-content { padding: 1rem; }
            .form-card { padding: 1.2rem; }
            .info-row { flex-direction: column; }
            .info-label { width: 100%; margin-bottom: 0.3rem; }
            .page-header { flex-direction: column; align-items: flex-start; }
            .form-actions { flex-direction: column; }
            .btn-primary-custom, .btn-secondary-custom, .btn-danger-custom { width: 100%; justify-content: center; }
            .admin-header { padding: 0 1rem; }
            .logo-text { font-size: 1.1rem; }
            .btn-header span { display: none; }
        }
    </style>
</head>
<body>

    <!-- HEADER - NO SIDEBAR -->
    <header class="admin-header">
        <div class="logo-container">
            <div class="logo-icon">
                <i class="bi bi-briefcase-fill"></i>
            </div>
            <span class="logo-text">SmartIntern</span>
        </div>
        <div class="header-actions">
            <a href="listEnrollment" class="btn-header">
                <i class="bi bi-list-ul"></i> <span>Enrollments</span>
            </a>
            <a href="dashboard" class="btn-header">
                <i class="bi bi-speedometer2"></i> <span>Dashboard</span>
            </a>
            <a href="logout" class="btn-header logout-btn">
                <i class="bi bi-box-arrow-right"></i> <span>Exit</span>
            </a>
        </div>
    </header>

    <!-- MAIN CONTENT -->
    <div class="main-content">

        <div class="page-header">
            <h1 class="page-title">
                <i class="bi bi-pencil-square"></i>
                Edit Enrollment
            </h1>
            <a href="javascript:history.back()" class="btn-back">
                <i class="bi bi-arrow-left"></i> Back
            </a>
        </div>

        <!-- Check if enrollment exists -->
        <c:if test="${empty enrollment}">
            <div class="alert-custom">
                <i class="bi bi-exclamation-triangle-fill"></i>
                <h3 class="mt-4">Enrollment Not Found</h3>
                <p class="mb-4">The requested enrollment record does not exist or has been deleted.</p>
                <a href="listEnrollment" class="btn-primary-custom">
                    <i class="bi bi-arrow-left"></i> Back to Enrollments List
                </a>
            </div>
        </c:if>

        <!-- Edit Form -->
        <c:if test="${not empty enrollment}">
            <div class="form-card">
                
                <!-- Current Enrollment Info -->
                <div class="info-card">
                    <div class="info-row">
                        <div class="info-label">Enrollment ID:</div>
                        <div class="info-value">#${enrollment.internshipEnrollmentId}</div>
                    </div>
                    <div class="info-row">
                        <div class="info-label">Student:</div>
                        <div class="info-value">
                            <i class="bi bi-person-circle me-2"></i>
                            ${enrollment.student.firstName} ${enrollment.student.lastName}
                            <span class="text-muted ms-2">(${enrollment.student.email})</span>
                        </div>
                    </div>
                    <div class="info-row">
                        <div class="info-label">Internship:</div>
                        <div class="info-value">
                            <i class="bi bi-briefcase me-2"></i>
                            ${enrollment.internship.title}
                            <span class="text-muted ms-2">- ${enrollment.internship.employer.companyName}</span>
                        </div>
                    </div>
                    <div class="info-row">
                        <div class="info-label">Current Status:</div>
                        <div class="info-value">
                            <c:choose>
                                <c:when test="${enrollment.status == 'ON_GOING'}">
                                    <span class="status-badge status-ongoing">
                                        <i class="bi bi-hourglass-split me-1"></i> ON GOING
                                    </span>
                                </c:when>
                                <c:when test="${enrollment.status == 'COMPLETED'}">
                                    <span class="status-badge status-completed">
                                        <i class="bi bi-check-circle me-1"></i> COMPLETED
                                    </span>
                                </c:when>
                                <c:when test="${enrollment.status == 'DROPPED'}">
                                    <span class="status-badge status-dropped">
                                        <i class="bi bi-x-circle me-1"></i> DROPPED
                                    </span>
                                </c:when>
                                <c:otherwise>
                                    <span class="status-badge">${enrollment.status}</span>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </div>

                <!-- Edit Form -->
                <form action="editEnrollmentSubmit" method="post">
                    <input type="hidden" name="enrollmentId" value="${enrollment.internshipEnrollmentId}">
                    <input type="hidden" name="internshipId" value="${enrollment.internship.internshipId}">

                    <div class="row">
                        <!-- Joining Date -->
                        <div class="col-md-6 mb-4">
                            <label class="form-label">
                                <i class="bi bi-calendar-plus"></i> Joining Date
                            </label>
                            <input type="date" name="joiningDate" 
                                   class="form-control" 
                                   value="${enrollment.joiningDate}">
                        </div>

                        <!-- Completion Date -->
                        <div class="col-md-6 mb-4">
                            <label class="form-label">
                                <i class="bi bi-calendar-check"></i> Completion Date
                            </label>
                            <input type="date" name="completionDate" 
                                   class="form-control" 
                                   value="${enrollment.completionDate}">
                        </div>
                    </div>

                    <div class="row">
                        <!-- Performance Rating -->
                        <div class="col-md-6 mb-4">
                            <label class="form-label">
                                <i class="bi bi-star-fill"></i> Performance Rating
                            </label>
                            <select name="performanceRating" class="form-select">
                                <option value="">-- Select Rating --</option>
                                <option value="1" ${enrollment.performanceRating == 1 ? 'selected' : ''}>⭐ 1 - Poor</option>
                                <option value="2" ${enrollment.performanceRating == 2 ? 'selected' : ''}>⭐⭐ 2 - Fair</option>
                                <option value="3" ${enrollment.performanceRating == 3 ? 'selected' : ''}>⭐⭐⭐ 3 - Good</option>
                                <option value="4" ${enrollment.performanceRating == 4 ? 'selected' : ''}>⭐⭐⭐⭐ 4 - Very Good</option>
                                <option value="5" ${enrollment.performanceRating == 5 ? 'selected' : ''}>⭐⭐⭐⭐⭐ 5 - Excellent</option>
                            </select>
                        </div>

                        <!-- Status -->
                        <div class="col-md-6 mb-4">
                            <label class="form-label required-field">
                                <i class="bi bi-info-circle"></i> Status
                            </label>
                            <select name="status" class="form-select" required>
                                <option value="">-- Select Status --</option>
                                <option value="ON_GOING" ${enrollment.status == 'ON_GOING' ? 'selected' : ''}>
                                    🟢 ON GOING
                                </option>
                                <option value="COMPLETED" ${enrollment.status == 'COMPLETED' ? 'selected' : ''}>
                                    ✅ COMPLETED
                                </option>
                                <option value="DROPPED" ${enrollment.status == 'DROPPED' ? 'selected' : ''}>
                                    ❌ DROPPED
                                </option>
                            </select>
                        </div>
                    </div>

                    <!-- Form Actions -->
                    <div class="form-actions">
                        <button type="submit" class="btn-primary-custom">
                            <i class="bi bi-save2"></i> Update Enrollment
                        </button>
                        <a href="javascript:history.back()" class="btn-secondary-custom">
                            <i class="bi bi-x-lg"></i> Cancel
                        </a>
                        <button type="button" class="btn-danger-custom" onclick="confirmDelete(${enrollment.internshipEnrollmentId})">
                            <i class="bi bi-trash-fill"></i> Delete
                        </button>
                    </div>
                </form>
            </div>
        </c:if>
    </div>

    <!-- FOOTER -->
    <footer class="dashboard-footer">
        2026 SmartIntern - Edit Enrollment · All Rights Reserved
    </footer>

    <script>
        function confirmDelete(enrollmentId) {
            if (confirm('Are you sure you want to delete this enrollment? This action cannot be undone.')) {
                window.location.href = 'deleteEnrollment?enrollmentId=' + enrollmentId;
            }
        }

        document.querySelector('form')?.addEventListener('submit', function(e) {
            const joiningDate = document.querySelector('input[name="joiningDate"]').value;
            const completionDate = document.querySelector('input[name="completionDate"]').value;
            
            if (completionDate && joiningDate && joiningDate > completionDate) {
                e.preventDefault();
                alert('Completion date cannot be before joining date!');
            }
        });
    </script>

</body>
</html>