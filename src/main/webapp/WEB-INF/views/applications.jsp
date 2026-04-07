<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>SmartIntern | My Applications</title>

    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">
    <!-- Font Awesome 6 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    <!-- AOS Animation -->
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">

    <style>
        :root {
            --cerulean: #247ba0;
            --cerulean-dark: #1a5f7e;
            --cerulean-light: #4098c0;
            --tropical-teal: #70c1b3;
            --tropical-teal-dark: #5aa394;
            --celadon: #b2dbbf;
            --celadon-dark: #8fc0a0;
            --cream: #f3ffbd;
            --cream-dark: #e0ecaa;
            --hot-fuchsia: #ff1654;
            --hot-fuchsia-dark: #e0104a;
            --light-skyblue: #e6f3ff;
            --skyblue: #b8e1fc;
            --soft-blue: #d4eaff;
            
            --primary: #4361ee;
            --primary-dark: #3a56d4;
            --secondary: #06b6d4;
            --success: #10b981;
            --warning: #f59e0b;
            --danger: #ef4444;
            --dark: #0f172a;
            --gray: #475569;
            --light: #f8fafc;
            --card-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.1);
            --hover-shadow: 0 30px 60px -15px rgba(0, 0, 0, 0.15);
            --transition-bounce: 500ms cubic-bezier(0.34, 1.56, 0.64, 1);
            --transition-smooth: 350ms cubic-bezier(0.23, 1, 0.32, 1);
            
            --bg-primary: #d9efff;
            --bg-secondary: #c6e6ff;
            --bg-tertiary: var(--celadon-dark);
            --footer-bg: linear-gradient(135deg, var(--cerulean) 0%, var(--tropical-teal) 100%);
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
            display: flex;
            flex-direction: column;
            min-height: 100vh;
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

        /* Animations */
        @keyframes logoMove {
            0%, 100% { transform: translateY(0) rotate(0deg) scale(1); box-shadow: 0 0 20px rgba(67, 97, 238, 0.3); }
            25% { transform: translateY(-8px) rotate(5deg) scale(1.05); box-shadow: 0 10px 30px rgba(67, 97, 238, 0.5); }
            50% { transform: translateY(5px) rotate(-3deg) scale(0.98); box-shadow: 0 5px 25px rgba(67, 97, 238, 0.4); }
            75% { transform: translateY(-3px) rotate(2deg) scale(1.02); box-shadow: 0 8px 28px rgba(67, 97, 238, 0.45); }
        }

        @keyframes iconMove {
            0%, 100% { transform: scale(1) rotate(0deg); color: white; }
            33% { transform: scale(1.15) rotate(10deg); color: var(--primary-light); }
            66% { transform: scale(0.95) rotate(-10deg); color: var(--secondary); }
        }

        @keyframes headerFade {
            from { opacity: 0; transform: translateY(-30px); }
            to { opacity: 1; transform: translateY(0); }
        }

        @keyframes mainFade {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        @keyframes pulse {
            0% { transform: scale(1); }
            50% { transform: scale(1.1); }
            100% { transform: scale(1); }
        }

        /* Header Styles */
        .modern-header {
            background: linear-gradient(135deg, var(--cerulean) 0%, var(--tropical-teal) 100%);
            padding: 1rem 0;
            position: sticky;
            top: 0;
            z-index: 1000;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.15);
            animation: headerFade 0.8s ease-out;
            border-bottom: 2px solid rgba(255, 255, 255, 0.2);
        }

        .header-container {
            max-width: 1600px;
            margin: 0 auto;
            padding: 0 2rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 1rem;
        }

        .logo-area {
            display: flex;
            align-items: center;
            gap: 0.8rem;
        }

        .smartintern-logo {
            position: relative;
            width: 50px;
            height: 50px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .logo-blue {
            width: 40px;
            height: 40px;
            background: linear-gradient(135deg, var(--primary), var(--secondary));
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            position: relative;
            animation: logoMove 4s var(--transition-bounce) infinite;
            box-shadow: 0 0 20px rgba(67, 97, 238, 0.3);
        }

        .logo-blue i {
            font-size: 20px;
            color: white;
            filter: drop-shadow(0 0 10px rgba(67, 97, 238, 0.5));
            animation: iconMove 3s var(--transition-bounce) infinite;
        }

        .logo-text h1 {
            color: white;
            font-size: 1.3rem;
            font-weight: 700;
            margin: 0;
        }

        .logo-text p {
            color: rgba(255, 255, 255, 0.85);
            margin: 0;
            font-size: 0.7rem;
            font-weight: 500;
        }

        .header-nav {
            display: flex;
            align-items: center;
            gap: 0.5rem;
            background: rgba(255, 255, 255, 0.2);
            backdrop-filter: blur(10px);
            padding: 0.3rem 0.8rem;
            border-radius: 50px;
            border: 1px solid rgba(255, 255, 255, 0.25);
        }

        .nav-link-header {
            display: flex;
            align-items: center;
            gap: 0.5rem;
            padding: 0.4rem 0.8rem;
            border-radius: 40px;
            color: white;
            text-decoration: none;
            font-weight: 600;
            font-size: 0.85rem;
            transition: all 0.3s;
        }

        .nav-link-header i {
            font-size: 0.9rem;
        }

        .nav-link-header:hover {
            background: rgba(255, 255, 255, 0.25);
            color: var(--cream);
            transform: translateY(-2px);
        }

        .nav-badge-header {
            background: var(--hot-fuchsia);
            color: white;
            padding: 0.15rem 0.5rem;
            border-radius: 20px;
            font-size: 0.65rem;
            font-weight: 600;
            margin-left: 0.3rem;
        }

        .header-actions {
            display: flex;
            align-items: center;
            gap: 1rem;
        }

        .notification-badge {
            position: relative;
            cursor: pointer;
            transition: all 0.3s;
            padding: 0.3rem;
        }

        .notification-badge:hover {
            transform: scale(1.1);
        }

        .notification-badge i {
            font-size: 1.2rem;
            color: white;
            opacity: 0.9;
        }

        .notification-count {
            position: absolute;
            top: -5px;
            right: -5px;
            background: var(--danger);
            color: white;
            font-size: 0.6rem;
            font-weight: 600;
            width: 16px;
            height: 16px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            border: 2px solid white;
            animation: pulse 2s infinite;
        }

        /* Profile Dropdown */
        .profile-dropdown {
            position: relative;
            display: flex;
            align-items: center;
            gap: 0.5rem;
            cursor: pointer;
            padding: 0.4rem 1rem;
            border-radius: 50px;
            background: rgba(255, 255, 255, 0.2);
            transition: all 0.3s;
        }

        .profile-dropdown:hover {
            background: rgba(255, 255, 255, 0.3);
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
        }

        .profile-avatar {
            width: 32px;
            height: 32px;
            background: linear-gradient(135deg, var(--success), var(--secondary));
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-weight: 600;
            font-size: 0.9rem;
            overflow: hidden;
            transition: all 0.3s;
            border: 2px solid rgba(255, 255, 255, 0.5);
        }

        .profile-dropdown:hover .profile-avatar {
            transform: rotate(360deg);
            transition: transform 0.6s;
            border-color: white;
        }

        .profile-avatar img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .profile-name {
            color: white;
            font-weight: 600;
            font-size: 0.85rem;
        }

        .profile-arrow {
            color: white;
            font-size: 0.75rem;
            transition: transform 0.3s;
        }

        .profile-dropdown:hover .profile-arrow {
            transform: rotate(180deg);
        }

        .dropdown-menu-custom {
            position: absolute;
            top: calc(100% + 8px);
            right: 0;
            margin-top: 0;
            background: white;
            border-radius: 12px;
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.2);
            min-width: 200px;
            display: none;
            z-index: 1000;
            overflow: hidden;
            animation: dropdownFade 0.3s ease-out;
            border: 1px solid rgba(0, 0, 0, 0.05);
        }

        @keyframes dropdownFade {
            from { opacity: 0; transform: translateY(-10px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .profile-dropdown:hover .dropdown-menu-custom,
        .dropdown-menu-custom:hover {
            display: block;
        }

        .dropdown-item-custom {
            display: flex;
            align-items: center;
            gap: 0.7rem;
            padding: 0.7rem 1rem;
            color: var(--dark);
            text-decoration: none;
            transition: all 0.3s;
            font-size: 0.8rem;
            font-weight: 500;
            border-left: 3px solid transparent;
        }

        .dropdown-item-custom i {
            width: 18px;
            font-size: 0.85rem;
            color: var(--cerulean);
        }

        .dropdown-item-custom:hover {
            background: var(--light-skyblue);
            color: var(--cerulean);
            border-left-color: var(--cerulean);
            padding-left: 1.2rem;
        }

        .dropdown-divider {
            height: 1px;
            background: #e2e8f0;
            margin: 0.3rem 0;
        }

        .dropdown-item-custom.logout {
            color: var(--danger);
        }

        .dropdown-item-custom.logout i {
            color: var(--danger);
        }

        .dropdown-item-custom.logout:hover {
            background: #fee2e2;
            color: var(--danger);
            border-left-color: var(--danger);
        }

        /* Main Content */
        .main-content {
            max-width: 1400px;
            margin: 2rem auto;
            padding: 0 2rem;
            flex: 1;
            width: 100%;
            animation: mainFade 1s ease-out;
        }

        /* Stats Cards */
        .stats-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 1.5rem;
            margin-bottom: 2rem;
        }

        .stat-card {
            background: rgba(255, 255, 255, 0.9);
            backdrop-filter: blur(10px);
            border-radius: 20px;
            padding: 1.2rem;
            text-align: center;
            border: 1px solid var(--tropical-teal);
            transition: all 0.3s;
            cursor: pointer;
        }

        .stat-card:hover {
            transform: translateY(-5px);
            box-shadow: var(--card-shadow);
            border-color: var(--cerulean);
        }

        .stat-card.active {
            border: 2px solid var(--cerulean);
            background: linear-gradient(135deg, rgba(36, 123, 160, 0.1), rgba(112, 193, 179, 0.1));
        }

        .stat-icon {
            width: 50px;
            height: 50px;
            background: linear-gradient(135deg, var(--cerulean), var(--tropical-teal));
            border-radius: 15px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 0.8rem;
        }

        .stat-icon i {
            font-size: 1.5rem;
            color: white;
        }

        .stat-value {
            font-size: 1.8rem;
            font-weight: 800;
            color: var(--cerulean);
            line-height: 1;
        }

        .stat-label {
            font-size: 0.8rem;
            color: var(--gray);
            font-weight: 500;
            margin-top: 0.3rem;
        }

        /* Filter Buttons */
        .filter-buttons-container {
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 1rem;
            margin-bottom: 1.5rem;
        }

        .filter-buttons {
            display: flex;
            gap: 0.5rem;
            flex-wrap: wrap;
        }

        .filter-btn {
            padding: 0.5rem 1.2rem;
            border-radius: 50px;
            font-size: 0.8rem;
            font-weight: 600;
            transition: all 0.3s;
            border: 1px solid var(--tropical-teal);
            background: white;
            color: var(--dark);
            cursor: pointer;
        }

        .filter-btn:hover {
            background: linear-gradient(135deg, var(--cerulean), var(--tropical-teal));
            color: white;
            transform: translateY(-2px);
        }

        .filter-btn.active {
            background: linear-gradient(135deg, var(--cerulean), var(--tropical-teal));
            color: white;
            border-color: transparent;
        }

        /* Search Box */
        .search-box {
            position: relative;
        }

        .search-box input {
            width: 100%;
            min-width: 250px;
            padding: 0.6rem 1rem 0.6rem 2.5rem;
            border: 1px solid var(--tropical-teal);
            border-radius: 50px;
            font-size: 0.85rem;
            transition: all 0.3s;
        }

        .search-box input:focus {
            outline: none;
            border-color: var(--cerulean);
            box-shadow: 0 0 0 3px rgba(36, 123, 160, 0.1);
        }

        .search-box i {
            position: absolute;
            left: 1rem;
            top: 50%;
            transform: translateY(-50%);
            color: var(--cerulean);
            font-size: 0.8rem;
        }

        /* Card Styles */
        .card-custom {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border-radius: 24px;
            border: 1px solid var(--tropical-teal);
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
            overflow: hidden;
        }

        .card-header-custom {
            background: linear-gradient(135deg, var(--cerulean), var(--tropical-teal));
            padding: 1.2rem 1.5rem;
            border-bottom: none;
        }

        .card-header-custom h2 {
            color: white;
            font-size: 1.5rem;
            font-weight: 700;
            margin: 0;
        }

        .card-body-custom {
            padding: 1.5rem;
        }

        .back-btn {
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            padding: 0.5rem 1rem;
            background: rgba(255, 255, 255, 0.2);
            border: 1px solid rgba(255, 255, 255, 0.3);
            border-radius: 40px;
            color: white;
            text-decoration: none;
            font-size: 0.85rem;
            font-weight: 500;
            transition: all 0.3s;
            margin-bottom: 1rem;
        }

        .back-btn:hover {
            background: rgba(255, 255, 255, 0.3);
            transform: translateX(-5px);
            color: white;
        }

        /* Professional Table Styles */
        .applications-table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
        }

        .applications-table thead th {
            background: linear-gradient(135deg, var(--cerulean), var(--tropical-teal));
            color: white;
            padding: 1rem 1rem;
            font-weight: 600;
            font-size: 0.85rem;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            border: none;
        }

        .applications-table thead th:first-child {
            border-radius: 12px 0 0 12px;
        }

        .applications-table thead th:last-child {
            border-radius: 0 12px 12px 0;
        }

        .applications-table tbody tr {
            transition: all 0.3s;
            cursor: pointer;
            border-bottom: 1px solid rgba(0, 0, 0, 0.05);
        }

        .applications-table tbody tr:hover {
            background: linear-gradient(90deg, rgba(36, 123, 160, 0.05), rgba(112, 193, 179, 0.05));
            transform: translateX(5px);
        }

        .applications-table tbody td {
            padding: 1rem;
            vertical-align: middle;
            color: var(--dark);
            font-size: 0.9rem;
            border-bottom: 1px solid rgba(0, 0, 0, 0.05);
        }

        /* Internship Info */
        .internship-title {
            font-weight: 700;
            color: var(--cerulean);
            margin-bottom: 0.2rem;
        }

        .company-name {
            font-size: 0.75rem;
            color: var(--gray);
            display: flex;
            align-items: center;
            gap: 0.3rem;
        }

        .company-name i {
            font-size: 0.7rem;
            color: var(--tropical-teal);
        }

        /* Status Badges */
        .status-badge {
            display: inline-flex;
            align-items: center;
            gap: 0.4rem;
            padding: 0.3rem 0.8rem;
            border-radius: 50px;
            font-size: 0.7rem;
            font-weight: 600;
            white-space: nowrap;
        }

        .status-accepted {
            background: linear-gradient(135deg, #10b981, #059669);
            color: white;
            box-shadow: 0 2px 8px rgba(16, 185, 129, 0.3);
        }

        .status-rejected {
            background: linear-gradient(135deg, #ef4444, #dc2626);
            color: white;
            box-shadow: 0 2px 8px rgba(239, 68, 68, 0.3);
        }

        .status-pending {
            background: linear-gradient(135deg, #f59e0b, #d97706);
            color: white;
            box-shadow: 0 2px 8px rgba(245, 158, 11, 0.3);
        }

        /* Date Cell */
        .date-cell {
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .date-cell i {
            color: var(--tropical-teal);
            font-size: 0.8rem;
        }

        .date-text {
            font-size: 0.85rem;
            color: var(--dark);
        }

        /* Action Buttons */
        .action-btn {
            padding: 0.3rem 0.8rem;
            border-radius: 40px;
            font-size: 0.7rem;
            font-weight: 600;
            text-decoration: none;
            transition: all 0.3s;
            display: inline-flex;
            align-items: center;
            gap: 0.3rem;
            background: linear-gradient(135deg, var(--cerulean), var(--tropical-teal));
            color: white;
            border: none;
            cursor: pointer;
        }

        .action-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(36, 123, 160, 0.3);
        }

        /* Pagination */
        .pagination-container {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 0.5rem;
            margin-top: 2rem;
            padding-top: 1rem;
            border-top: 1px solid rgba(0, 0, 0, 0.1);
        }

        .page-btn {
            padding: 0.5rem 1rem;
            border: 1px solid var(--tropical-teal);
            background: white;
            color: var(--cerulean);
            border-radius: 10px;
            cursor: pointer;
            transition: all 0.3s;
            font-weight: 600;
            font-size: 0.85rem;
        }

        .page-btn:hover:not(:disabled) {
            background: var(--cerulean);
            color: white;
            transform: translateY(-2px);
        }

        .page-btn.active {
            background: linear-gradient(135deg, var(--cerulean), var(--tropical-teal));
            color: white;
            border-color: transparent;
        }

        .page-btn:disabled {
            opacity: 0.5;
            cursor: not-allowed;
        }

        .page-info {
            font-weight: 600;
            color: var(--cerulean);
            padding: 0 1rem;
        }

        /* Results Count */
        .results-count {
            font-size: 0.85rem;
            color: var(--gray);
            margin-bottom: 1rem;
        }

        .results-count span {
            font-weight: 700;
            color: var(--cerulean);
        }

        /* No Results */
        .no-results {
            text-align: center;
            padding: 3rem;
            background: rgba(255, 255, 255, 0.7);
            border-radius: 16px;
        }

        .no-results i {
            font-size: 3rem;
            color: var(--gray);
            margin-bottom: 1rem;
        }

        /* Footer */
        .modern-footer {
            background: var(--footer-bg);
            color: rgba(255, 255, 255, 0.85);
            padding: 1rem 0;
            margin-top: 2rem;
            border-top: 1px solid rgba(255, 255, 255, 0.15);
        }

        .footer-container {
            max-width: 1400px;
            margin: 0 auto;
            padding: 0 2rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 1rem;
        }

        .footer-logo {
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .footer-logo i {
            font-size: 1.2rem;
            color: var(--cream);
        }

        .footer-logo span {
            font-size: 0.9rem;
            font-weight: 700;
            color: white;
        }

        .footer-links {
            display: flex;
            gap: 1.5rem;
        }

        .footer-links a {
            color: rgba(255, 255, 255, 0.8);
            text-decoration: none;
            font-size: 0.8rem;
            font-weight: 500;
            transition: all 0.3s;
        }

        .footer-links a:hover {
            color: var(--cream);
        }

        .footer-copyright {
            font-size: 0.75rem;
        }

        /* Responsive */
        @media (max-width: 1200px) {
            .stats-grid {
                grid-template-columns: repeat(2, 1fr);
            }
        }

        @media (max-width: 768px) {
            .header-container { flex-direction: column; }
            .header-nav { width: 100%; justify-content: center; flex-wrap: wrap; }
            .header-actions { width: 100%; justify-content: center; }
            .main-content { padding: 0 1rem; }
            .stats-grid { grid-template-columns: repeat(2, 1fr); gap: 1rem; }
            .filter-buttons-container { flex-direction: column; }
            .search-box { width: 100%; }
            .search-box input { width: 100%; }
            .applications-table thead th { font-size: 0.7rem; padding: 0.5rem; }
            .applications-table tbody td { padding: 0.5rem; font-size: 0.75rem; }
            .status-badge { padding: 0.2rem 0.5rem; font-size: 0.6rem; }
            .footer-container { flex-direction: column; text-align: center; }
        }
    </style>
</head>
<body>

<!-- Modern Header -->
<header class="modern-header">
    <div class="header-container">
        <div class="logo-area">
            <div class="smartintern-logo">
                <div class="logo-blue">
                    <i class="bi bi-briefcase-fill"></i>
                </div>
            </div>
            <div class="logo-text">
                <h1>SmartIntern</h1>
                <p>AI-Powered Internship Platform</p>
            </div>
        </div>
        
        <div class="header-nav">
            <a href="studentDashboard" class="nav-link-header">
                <i class="fas fa-home"></i>
                <span>Dashboard</span>
            </a>
            <a href="myinternships" class="nav-link-header">
                <i class="fas fa-briefcase"></i>
                <span>My Internships</span>
            </a>
            <a href="myApplications" class="nav-link-header">
                <i class="fas fa-file-alt"></i>
                <span>Applications</span>
            </a>
            <a href="internships" class="nav-link-header">
                <i class="fas fa-search"></i>
                <span>Internships</span>
            </a>
        </div>
        
        <div class="header-actions">
            <div class="notification-badge">
                <i class="far fa-bell"></i>
                <span class="notification-count">3</span>
            </div>
            
            <div class="profile-dropdown">
                <div class="profile-avatar">
                    <c:choose>
                        <c:when test="${not empty user.profilePicURL}">
                            <img src="${user.profilePicURL}" alt="${user.firstName}">
                        </c:when>
                        <c:otherwise>
                            <span>${fn:substring(user.firstName, 0, 1)}${fn:substring(user.lastName, 0, 1)}</span>
                        </c:otherwise>
                    </c:choose>
                </div>
                <div class="profile-name">${user.firstName} ${user.lastName}</div>
                <i class="fas fa-chevron-down profile-arrow"></i>
                <div class="dropdown-menu-custom">
                    <a href="/viewProfile" class="dropdown-item-custom">
                        <i class="fas fa-user-circle"></i> My Profile
                    </a>
                    <a href="settings" class="dropdown-item-custom">
                        <i class="fas fa-cog"></i> Settings
                    </a>
                    <a href="/myCertificates" class="dropdown-item-custom">
                        <i class="fas fa-file-alt"></i> My Certificates
                    </a>
                    <div class="dropdown-divider"></div>
                    <a href="logout" class="dropdown-item-custom logout">
                        <i class="fas fa-sign-out-alt"></i> Logout
                    </a>
                </div>
            </div>
        </div>
    </div>
</header>

<!-- Main Content -->
<main class="main-content">
    <!-- Stats Cards -->
    <div class="stats-grid" data-aos="fade-up">
        <div class="stat-card" data-filter="ALL">
            <div class="stat-icon">
                <i class="fas fa-list"></i>
            </div>
            <div class="stat-value">${fn:length(applications)}</div>
            <div class="stat-label">Total Applications</div>
        </div>
        <div class="stat-card" data-filter="APPLIED">
            <div class="stat-icon">
                <i class="fas fa-hourglass-half"></i>
            </div>
            <div class="stat-value">
                <c:set var="pendingCount" value="0" />
                <c:forEach items="${applications}" var="app">
                    <c:if test="${app.applicationStatus == 'APPLIED'}">
                        <c:set var="pendingCount" value="${pendingCount + 1}" />
                    </c:if>
                </c:forEach>
                ${pendingCount}
            </div>
            <div class="stat-label">Pending</div>
        </div>
        <div class="stat-card" data-filter="ACCEPTED">
            <div class="stat-icon">
                <i class="fas fa-check-circle"></i>
            </div>
            <div class="stat-value">
                <c:set var="acceptedCount" value="0" />
                <c:forEach items="${applications}" var="app">
                    <c:if test="${app.applicationStatus == 'ACCEPTED'}">
                        <c:set var="acceptedCount" value="${acceptedCount + 1}" />
                    </c:if>
                </c:forEach>
                ${acceptedCount}
            </div>
            <div class="stat-label">Accepted</div>
        </div>
        <div class="stat-card" data-filter="REJECTED">
            <div class="stat-icon">
                <i class="fas fa-times-circle"></i>
            </div>
            <div class="stat-value">
                <c:set var="rejectedCount" value="0" />
                <c:forEach items="${applications}" var="app">
                    <c:if test="${app.applicationStatus == 'REJECTED'}">
                        <c:set var="rejectedCount" value="${rejectedCount + 1}" />
                    </c:if>
                </c:forEach>
                ${rejectedCount}
            </div>
            <div class="stat-label">Rejected</div>
        </div>
    </div>

    <div class="card-custom" data-aos="fade-up" data-aos-delay="100">
        <div class="card-header-custom">
            <a href="javascript:history.back()" class="back-btn">
                <i class="fas fa-arrow-left"></i> Back
            </a>
            <h2 class="text-center"><i class="fas fa-file-alt me-2"></i>My Applications</h2>
        </div>
        
        <div class="card-body-custom">
            <!-- Filter and Search Row -->
            <div class="filter-buttons-container">
                <div class="filter-buttons">
                    <button class="filter-btn active" data-filter="ALL" onclick="filterByStatus('ALL')">All Applications</button>
                    <button class="filter-btn" data-filter="APPLIED" onclick="filterByStatus('APPLIED')">Pending</button>
                    <button class="filter-btn" data-filter="ACCEPTED" onclick="filterByStatus('ACCEPTED')">Accepted</button>
                    <button class="filter-btn" data-filter="REJECTED" onclick="filterByStatus('REJECTED')">Rejected</button>
                </div>
                
                <div class="search-box">
                    <i class="fas fa-search"></i>
                    <input type="text" id="searchInput" placeholder="Search by internship or company...">
                </div>
            </div>

            <!-- Results Count -->
            <div class="results-count">
                Showing <span id="visibleCount">0</span> of <span id="totalCount">${fn:length(applications)}</span> applications
            </div>

            <div class="table-responsive">
                <table class="applications-table" id="applicationsTable">
                    <thead>
                        <tr>
                            <th style="width: 60px;">SR</th>
                            <th>Internship Details</th>
                            <th style="width: 130px;">Status</th>
                            <th style="width: 170px;">Applied Date</th>
                            <th style="width: 100px;">Action</th>
                        </tr>
                    </thead>
                    <tbody id="tableBody">
                        <c:choose>
                            <c:when test="${not empty applications}">
                                <c:forEach items="${applications}" var="app" varStatus="status">
                                    <tr data-status="${app.applicationStatus}" data-title="${fn:toLowerCase(app.internship.title)}" data-company="${fn:toLowerCase(app.internship.employer.companyName)}">
                                        <td>
                                            <div style="width: 32px; height: 32px; background: linear-gradient(135deg, var(--cerulean), var(--tropical-teal)); border-radius: 10px; display: flex; align-items: center; justify-content: center; color: white; font-weight: 700;">${status.count}</div>
                                        </td>
                                        <td>
                                            <div class="internship-title">${app.internship.title}</div>
                                            <div class="company-name">
                                                <i class="fas fa-building"></i> ${app.internship.employer.companyName}
                                            </div>
                                           
                                         </td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${app.applicationStatus == 'ACCEPTED'}">
                                                    <span class="status-badge status-accepted">
                                                        <i class="fas fa-check-circle"></i> Accepted
                                                    </span>
                                                </c:when>
                                                <c:when test="${app.applicationStatus == 'REJECTED'}">
                                                    <span class="status-badge status-rejected">
                                                        <i class="fas fa-times-circle"></i> Rejected
                                                    </span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="status-badge status-pending">
                                                        <i class="fas fa-hourglass-half"></i> Pending
                                                    </span>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td>
                                            <div class="date-cell">
                                                <i class="far fa-calendar-alt"></i>
                                                <span class="date-text">
                                                    <c:set var="appliedDateTime" value="${app.appliedAt}" />
                                                    <c:if test="${not empty appliedDateTime}">
                                                        ${fn:substring(appliedDateTime.toString().replace('T', ' '), 0, 19)}
                                                    </c:if>
                                                </span>
                                            </div>
                                        </td>
                                        <td>
                                            <button class="action-btn" onclick="event.stopPropagation(); window.location.href='viewInternshipDetails?internshipId=${app.internship.internshipId}'">
                                                <i class="fas fa-eye"></i> View
                                            </button>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <tr>
                                    <td colspan="5">
                                        <div class="no-results">
                                            <i class="fas fa-inbox"></i>
                                            <h3>No Applications Found</h3>
                                            <p>You haven't applied to any internships yet.</p>
                                            <a href="internships" class="action-btn" style="display: inline-block; margin-top: 1rem; text-decoration: none;">
                                                <i class="fas fa-search"></i> Browse Internships
                                            </a>
                                        </div>
                                    </td>
                                </tr>
                            </c:otherwise>
                        </c:choose>
                    </tbody>
                </table>
            </div>

            <!-- Pagination -->
            <div class="pagination-container" id="paginationContainer">
                <button class="page-btn" id="prevBtn" onclick="prevPage()">← Prev</button>
                <div id="paginationNumbers" style="display: flex; gap: 0.5rem;"></div>
                <button class="page-btn" id="nextBtn" onclick="nextPage()">Next →</button>
            </div>
        </div>
    </div>
</main>

<!-- Modern Footer -->
<footer class="modern-footer">
    <div class="footer-container">
        <div class="footer-logo">
            <i class="bi bi-briefcase-fill"></i>
            <span>SmartIntern</span>
        </div>
        <div class="footer-links">
            <a href="#">About</a>
            <a href="#">Contact</a>
            <a href="#">Privacy</a>
            <a href="#">Terms</a>
        </div>
        <div class="footer-copyright">
            © 2026 SmartIntern · Made with <i class="fas fa-heart"></i> by <strong>Darshan</strong>
        </div>
    </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<script>
AOS.init({ duration: 800, once: true, offset: 50 });

// Pagination variables
let currentPage = 1;
let rowsPerPage = 5;
let currentFilter = 'ALL';
let currentSearchTerm = '';
let allRows = [];
let filteredRows = [];

// Initialize on page load
document.addEventListener('DOMContentLoaded', function() {
    // Get all rows except the "no results" row
    allRows = Array.from(document.querySelectorAll('#tableBody tr')).filter(row => {
        return !row.querySelector('.no-results');
    });
    filteredRows = [...allRows];
    updateFiltersAndPagination();
    
    // Add active class to stat cards
    document.querySelectorAll('.stat-card').forEach(card => {
        card.addEventListener('click', function() {
            const filter = this.getAttribute('data-filter');
            filterByStatus(filter);
        });
    });
});

// Filter by status function
function filterByStatus(status) {
    currentFilter = status;
    currentPage = 1;
    
    // Update active state on filter buttons
    document.querySelectorAll('.filter-btn').forEach(btn => {
        btn.classList.remove('active');
        if (btn.getAttribute('data-filter') === status) {
            btn.classList.add('active');
        }
    });
    
    // Update active state on stat cards
    document.querySelectorAll('.stat-card').forEach(card => {
        card.classList.remove('active');
        if (card.getAttribute('data-filter') === status) {
            card.classList.add('active');
        }
    });
    
    updateFiltersAndPagination();
}

// Search functionality
document.getElementById('searchInput')?.addEventListener('keyup', function() {
    currentSearchTerm = this.value.toLowerCase().trim();
    currentPage = 1;
    updateFiltersAndPagination();
});

// Update filters and pagination
function updateFiltersAndPagination() {
    // Apply filters
    filteredRows = allRows.filter(row => {
        const rowStatus = row.getAttribute('data-status');
        const rowTitle = row.getAttribute('data-title') || '';
        const rowCompany = row.getAttribute('data-company') || '';
        
        const matchesStatus = currentFilter === 'ALL' || rowStatus === currentFilter;
        const matchesSearch = currentSearchTerm === '' || 
                              rowTitle.includes(currentSearchTerm) || 
                              rowCompany.includes(currentSearchTerm);
        
        return matchesStatus && matchesSearch;
    });
    
    // Update results count
    const visibleCount = filteredRows.length;
    const totalCount = allRows.length;
    document.getElementById('visibleCount').textContent = visibleCount;
    document.getElementById('totalCount').textContent = totalCount;
    
    // Show/hide no results message
    const noResultsRow = document.getElementById('noFilterResults');
    if (visibleCount === 0 && allRows.length > 0) {
        if (!noResultsRow) {
            const tbody = document.getElementById('tableBody');
            const newRow = document.createElement('tr');
            newRow.id = 'noFilterResults';
            newRow.innerHTML = `<td colspan="5"><div class="no-results"><i class="fas fa-filter"></i><h3>No matching applications</h3><p>Try changing your filter or search criteria.</p></div></td>`;
            tbody.appendChild(newRow);
        }
    } else if (noResultsRow) {
        noResultsRow.remove();
    }
    
    // Setup pagination
    setupPagination();
}

// Setup pagination
function setupPagination() {
    const totalPages = Math.ceil(filteredRows.length / rowsPerPage);
    const paginationNumbers = document.getElementById('paginationNumbers');
    
    if (totalPages <= 1) {
        document.getElementById('paginationContainer').style.display = 'none';
        showPage(1);
        return;
    }
    
    document.getElementById('paginationContainer').style.display = 'flex';
    paginationNumbers.innerHTML = '';
    
    // Calculate visible page range
    let startPage = Math.max(1, currentPage - 2);
    let endPage = Math.min(totalPages, startPage + 4);
    
    if (endPage - startPage < 4) {
        startPage = Math.max(1, endPage - 4);
    }
    
    // First page button
    if (startPage > 1) {
        const firstBtn = document.createElement('button');
        firstBtn.className = 'page-btn';
        firstBtn.textContent = '1';
        firstBtn.onclick = () => goToPage(1);
        paginationNumbers.appendChild(firstBtn);
        
        if (startPage > 2) {
            const dots = document.createElement('span');
            dots.textContent = '...';
            dots.style.padding = '0 0.5rem';
            paginationNumbers.appendChild(dots);
        }
    }
    
    // Page number buttons
    for (let i = startPage; i <= endPage; i++) {
        const pageBtn = document.createElement('button');
        pageBtn.className = 'page-btn' + (i === currentPage ? ' active' : '');
        pageBtn.textContent = i;
        pageBtn.onclick = () => goToPage(i);
        paginationNumbers.appendChild(pageBtn);
    }
    
    // Last page button
    if (endPage < totalPages) {
        if (endPage < totalPages - 1) {
            const dots = document.createElement('span');
            dots.textContent = '...';
            dots.style.padding = '0 0.5rem';
            paginationNumbers.appendChild(dots);
        }
        
        const lastBtn = document.createElement('button');
        lastBtn.className = 'page-btn';
        lastBtn.textContent = totalPages;
        lastBtn.onclick = () => goToPage(totalPages);
        paginationNumbers.appendChild(lastBtn);
    }
    
    // Update prev/next buttons
    document.getElementById('prevBtn').disabled = currentPage === 1;
    document.getElementById('nextBtn').disabled = currentPage === totalPages;
    
    // Show current page
    showPage(currentPage);
}

// Go to specific page
function goToPage(page) {
    currentPage = page;
    setupPagination();
}

// Show page
function showPage(page) {
    // Hide all rows first
    allRows.forEach(row => row.style.display = 'none');
    
    // Calculate visible rows for current page
    const start = (page - 1) * rowsPerPage;
    const end = start + rowsPerPage;
    const visibleRows = filteredRows.slice(start, end);
    
    // Show only rows for current page
    visibleRows.forEach(row => row.style.display = '');
}

// Previous page
function prevPage() {
    if (currentPage > 1) {
        currentPage--;
        setupPagination();
    }
}

// Next page
function nextPage() {
    const totalPages = Math.ceil(filteredRows.length / rowsPerPage);
    if (currentPage < totalPages) {
        currentPage++;
        setupPagination();
    }
}

// Make rows clickable
document.querySelectorAll('#tableBody tr').forEach(row => {
    if (row.id !== 'noFilterResults' && !row.querySelector('.no-results')) {
        row.addEventListener('click', function(e) {
            if (!e.target.closest('.action-btn')) {
                const viewBtn = this.querySelector('.action-btn');
                if (viewBtn && viewBtn.getAttribute('onclick')) {
                    const match = viewBtn.getAttribute('onclick').match(/'(.*?)'/);
                    if (match) window.location.href = match[1];
                }
            }
        });
    }
});

// Notification bell click
document.querySelector('.notification-badge')?.addEventListener('click', function() {
    alert('You have 3 new notifications');
});
</script>
</body>
</html>