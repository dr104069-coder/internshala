<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View User · SmartIntern Admin</title>

    <!-- Bootstrap & Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    <!-- AOS Animation -->
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">

    <style>
        /* ========================================================
           PROFESSIONAL BLUE COLOR SYSTEM - EXACTLY LIKE DASHBOARD
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
            --soft-blue-dark: #8faec9;
            --soft-blue-light: #c5dbea;
            
            --glass-deep: rgba(44, 62, 80, 0.7);
            --glass-deep-darker: rgba(44, 62, 80, 0.85);
            --glass-bright: rgba(75, 139, 190, 0.15);
            --glass-soft: rgba(179, 205, 224, 0.15);
            
            --border-light: rgba(255, 255, 255, 0.08);
            --border-blue: rgba(75, 139, 190, 0.3);
            --border-soft: rgba(179, 205, 224, 0.3);
            
            --text-primary: #FFFFFF;
            --text-secondary: #B3CDE0;
            --text-muted: #A8A8A8;
            --text-dark: #2C3E50;
            
            --shadow-sm: 0 2px 8px rgba(44, 62, 80, 0.2);
            --shadow-md: 0 4px 16px rgba(44, 62, 80, 0.3);
            --shadow-lg: 0 8px 24px rgba(44, 62, 80, 0.4);
            --shadow-xl: 0 12px 32px rgba(44, 62, 80, 0.5);
            --shadow-blue: 0 4px 20px rgba(75, 139, 190, 0.3);
            
            --sidebar-width: 280px;
            --sidebar-collapsed: 85px;
            --header-height: 80px;
            
            --transition-smooth: 350ms cubic-bezier(0.23, 1, 0.32, 1);
            --transition-bounce: 500ms cubic-bezier(0.34, 1.56, 0.64, 1);
            --transition-elegant: 450ms cubic-bezier(0.165, 0.84, 0.44, 1);
            --transition-soft: 300ms ease-out;
        }

        /* ========================================================
           GLOBAL STYLES - EXACTLY LIKE DASHBOARD
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
           SMARTINTERN LOGO - EXACTLY LIKE DASHBOARD
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
            position: relative;
            animation: logoMove 4s var(--transition-bounce) infinite;
            box-shadow: 0 0 20px rgba(75, 139, 190, 0.3);
        }

        @keyframes logoMove {
            0%, 100% { transform: translateY(0) rotate(0deg) scale(1); box-shadow: 0 0 20px rgba(75, 139, 190, 0.3); }
            25% { transform: translateY(-8px) rotate(5deg) scale(1.05); box-shadow: 0 10px 30px rgba(75, 139, 190, 0.5); }
            50% { transform: translateY(5px) rotate(-3deg) scale(0.98); box-shadow: 0 5px 25px rgba(75, 139, 190, 0.4); }
            75% { transform: translateY(-3px) rotate(2deg) scale(1.02); box-shadow: 0 8px 28px rgba(75, 139, 190, 0.45); }
        }

        .logo-blue i {
            font-size: 28px;
            color: var(--pure-white);
            filter: drop-shadow(0 0 10px rgba(75, 139, 190, 0.5));
            animation: iconMove 3s var(--transition-bounce) infinite;
        }

        @keyframes iconMove {
            0%, 100% { transform: scale(1) rotate(0deg); color: var(--pure-white); }
            33% { transform: scale(1.15) rotate(10deg); color: var(--soft-blue); }
            66% { transform: scale(0.95) rotate(-10deg); color: var(--bright-blue-light); }
        }

        .logo-text {
            font-size: 1.6rem;
            font-weight: 700;
            color: var(--pure-white);
            letter-spacing: -0.5px;
            position: relative;
            animation: textMove 4s var(--transition-smooth) infinite;
        }

        @keyframes textMove {
            0%, 100% { transform: translateX(0); text-shadow: 0 0 10px rgba(75, 139, 190, 0.3); }
            25% { transform: translateX(3px); text-shadow: 2px 2px 15px rgba(75, 139, 190, 0.5); }
            50% { transform: translateX(-2px); text-shadow: -2px 2px 15px rgba(75, 139, 190, 0.5); }
            75% { transform: translateX(2px); text-shadow: 2px -2px 15px rgba(75, 139, 190, 0.5); }
        }

        .logo-text::after {
            content: '';
            position: absolute;
            bottom: -4px;
            left: 0;
            width: 100%;
            height: 2px;
            background: linear-gradient(90deg, transparent, var(--bright-blue), transparent);
            animation: lineMove 3s var(--transition-smooth) infinite;
        }

        @keyframes lineMove {
            0%, 100% { width: 0; opacity: 0; left: 50%; }
            25% { width: 30%; opacity: 0.5; left: 35%; }
            50% { width: 70%; opacity: 1; left: 15%; }
            75% { width: 100%; opacity: 0.8; left: 0; }
        }

        /* ========================================================
           HEADER - EXACTLY LIKE DASHBOARD
           ======================================================== */
        .admin-header {
            height: var(--header-height);
            background: var(--glass-deep-darker);
            backdrop-filter: blur(12px);
            -webkit-backdrop-filter: blur(12px);
            border-bottom: 1px solid var(--border-blue);
            padding: 0 2.5rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
            position: sticky;
            top: 0;
            z-index: 1000;
            box-shadow: var(--shadow-md);
            animation: headerFade 0.8s var(--transition-elegant);
        }

        @keyframes headerFade {
            from { opacity: 0; transform: translateY(-30px); }
            to { opacity: 1; transform: translateY(0); }
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

        .dark-btn i {
            transition: transform var(--transition-soft);
        }

        .dark-btn:hover i {
            transform: rotate(180deg);
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
           LAYOUT
           ======================================================== */
        .dashboard-layout {
            display: flex;
            min-height: calc(100vh - var(--header-height));
            transition: all var(--transition-smooth);
            position: relative;
        }

        /* ========================================================
           SIDEBAR - EXACTLY LIKE DASHBOARD
           ======================================================== */
        .nav-sidebar {
            width: var(--sidebar-width);
            background: var(--glass-deep-darker);
            backdrop-filter: blur(12px);
            -webkit-backdrop-filter: blur(12px);
            border-right: 1px solid var(--border-blue);
            padding: 2rem 1.2rem;
            box-shadow: var(--shadow-lg);
            transition: width 0.3s var(--transition-elegant), padding 0.3s ease;
            display: flex;
            flex-direction: column;
            overflow: hidden;
            white-space: nowrap;
            z-index: 500;
            border-radius: 0 30px 30px 0;
            animation: sidebarSlide 0.8s var(--transition-elegant);
        }

        @keyframes sidebarSlide {
            from { opacity: 0; transform: translateX(-30px); }
            to { opacity: 1; transform: translateX(0); }
        }

        .nav-sidebar::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 3px;
            height: 0;
            background: var(--bright-blue);
            animation: borderGrow 1s var(--transition-elegant) forwards;
            box-shadow: 0 0 20px var(--bright-blue);
        }

        @keyframes borderGrow {
            to { height: 100%; }
        }

        .nav-sidebar::after {
            content: '';
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: radial-gradient(circle, rgba(75, 139, 190, 0.05) 0%, transparent 70%);
            animation: glowFloat 8s ease-in-out infinite;
            pointer-events: none;
        }

        @keyframes glowFloat {
            0%, 100% { transform: translate(0, 0) scale(1); opacity: 0.3; }
            25% { transform: translate(5%, 5%) scale(1.1); opacity: 0.5; }
            50% { transform: translate(-5%, -5%) scale(0.9); opacity: 0.3; }
            75% { transform: translate(3%, -3%) scale(1.05); opacity: 0.4; }
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

        .nav-sidebar.collapsed .dropdown-toggle i {
            margin: 0 auto;
            font-size: 1.5rem;
            animation: iconPulse 2s ease-in-out infinite;
        }

        @keyframes iconPulse {
            0%, 100% { transform: scale(1); opacity: 1; }
            50% { transform: scale(1.1); opacity: 0.8; }
        }

        .nav-sidebar.collapsed .dropdown-toggle {
            justify-content: center;
            padding: 1rem 0;
        }

        .dashboard-layout.fullscreen .nav-sidebar {
            transform: translateX(-100%);
            width: 0;
            padding: 0;
        }

        .dashboard-layout.fullscreen .main-panel {
            width: 100%;
        }

        .nav-category {
            color: var(--medium-grey);
            font-size: 0.7rem;
            text-transform: uppercase;
            letter-spacing: 2px;
            font-weight: 600;
            margin: 2rem 0 1rem 0.8rem;
            opacity: 0.7;
        }

        .nav-sidebar .dropdown {
            width: 100%;
            margin-bottom: 0.3rem;
        }

        .nav-sidebar .dropdown-toggle {
            display: flex;
            align-items: center;
            gap: 1.2rem;
            padding: 0.9rem 1.2rem;
            border-radius: 12px;
            color: var(--soft-blue);
            text-decoration: none;
            font-size: 0.95rem;
            font-weight: 500;
            transition: all var(--transition-elegant);
            width: 100%;
            background: transparent;
            border: none;
            text-align: left;
            cursor: pointer;
        }

        .nav-sidebar .dropdown-toggle i {
            font-size: 1.3rem;
            width: 1.8rem;
            color: var(--bright-blue);
            transition: all var(--transition-bounce);
        }

        .nav-sidebar .dropdown-toggle:hover {
            color: var(--pure-white);
            transform: translateX(8px);
            background: rgba(75, 139, 190, 0.05);
        }

        .nav-sidebar .dropdown-toggle.active {
            background: rgba(75, 139, 190, 0.1);
            border-left: 3px solid var(--bright-blue);
            color: var(--pure-white);
        }

        .nav-sidebar .dropdown-menu {
            background: var(--glass-deep);
            backdrop-filter: blur(12px);
            border: 1px solid var(--border-blue);
            border-radius: 12px;
            padding: 0.5rem 0.2rem;
            margin: 0.3rem 0 0.8rem 0;
            box-shadow: var(--shadow-md);
            width: 100%;
            position: static !important;
            transform: none !important;
        }

        .nav-sidebar .dropdown-item {
            border-radius: 8px;
            padding: 0.7rem 1.6rem;
            color: var(--soft-blue);
            font-size: 0.9rem;
            font-weight: 500;
            display: flex;
            align-items: center;
            gap: 1rem;
            transition: all var(--transition-elegant);
        }

        .nav-sidebar .dropdown-item i {
            color: var(--bright-blue);
            font-size: 1.1rem;
            width: 1.4rem;
        }

        .nav-sidebar .dropdown-item:hover {
            background: rgba(75, 139, 190, 0.05);
            color: var(--pure-white);
            padding-left: 2rem;
            transform: translateX(5px);
        }

        /* ========================================================
           MAIN PANEL
           ======================================================== */
        .main-panel {
            flex: 1;
            padding: 2.5rem;
            background: transparent;
            transition: all var(--transition-smooth);
            width: calc(100% - var(--sidebar-width));
            animation: mainFade 1s var(--transition-elegant);
        }

        @keyframes mainFade {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        /* ========================================================
           VIEW USER SPECIFIC STYLES - MATCHING DASHBOARD COLORS
           ======================================================== */
        .profile-card {
            background: var(--glass-deep);
            backdrop-filter: blur(12px);
            -webkit-backdrop-filter: blur(12px);
            border-radius: 30px;
            border: 1px solid var(--border-blue);
            transition: all var(--transition-elegant);
            box-shadow: var(--shadow-md);
            overflow: hidden;
        }

        .profile-card:hover {
            border-color: var(--bright-blue);
            box-shadow: var(--shadow-lg), var(--shadow-blue);
        }

        .profile-header {
            background: linear-gradient(135deg, var(--deep-blue-dark), var(--deep-blue));
            padding: 1.2rem 1.8rem;
            display: flex;
            align-items: center;
            border-bottom: 1px solid var(--border-blue);
        }

        .profile-header h4 {
            margin: 0;
            color: var(--pure-white);
            font-weight: 650;
            font-size: 1.4rem;
            display: flex;
            align-items: center;
            gap: 0.7rem;
        }

        .profile-header h4 i {
            color: var(--bright-blue);
            background: rgba(255, 255, 255, 0.1);
            padding: 8px;
            border-radius: 14px;
        }

        .profile-body {
            padding: 2rem;
        }

        /* Profile Image Section */
        .profile-image-section {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: flex-start;
            text-align: center;
            margin-top: -20px;
            position: relative;
        }

        .profile-img {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            object-fit: cover;
            border: 4px solid var(--bright-blue);
            box-shadow: var(--shadow-lg), var(--shadow-blue);
            transition: all var(--transition-bounce);
            background: var(--deep-blue);
            display: block;
            margin-bottom: 0.8rem;
        }

        .profile-img:hover {
            transform: scale(1.05) rotate(2deg);
            border-color: var(--bright-blue-light);
            box-shadow: var(--shadow-xl), var(--shadow-blue);
        }

        .user-name-under {
            font-size: 1.8rem;
            font-weight: 700;
            color: var(--pure-white);
            margin-bottom: 0.25rem;
            line-height: 1.2;
        }

        /* Info Rows */
        .info-row {
            display: flex;
            align-items: baseline;
            margin-bottom: 0.8rem;
            padding: 0.5rem 0;
            border-bottom: 1px dashed var(--border-blue);
            transition: all var(--transition-soft);
        }

        .info-row:hover {
            background: rgba(75, 139, 190, 0.05);
            padding-left: 0.5rem;
            border-bottom-color: var(--bright-blue);
            transform: translateX(5px);
        }

        .info-label {
            font-weight: 600;
            color: var(--soft-blue);
            width: 130px;
            display: inline-block;
        }

        .info-label i {
            color: var(--bright-blue);
            margin-right: 8px;
        }

        .info-value {
            color: var(--pure-white);
            font-weight: 500;
        }

        /* Badges - Matching Dashboard */
        .badge {
            font-weight: 600;
            padding: 0.5rem 1.2rem;
            border-radius: 40px;
            font-size: 0.8rem;
            letter-spacing: 0.4px;
        }

        .badge.bg-primary {
            background: var(--bright-blue) !important;
            color: var(--pure-white) !important;
        }

        .badge.bg-info {
            background: var(--soft-blue) !important;
            color: var(--deep-blue) !important;
        }

        .badge.bg-success {
            background: #10b981 !important;
            color: var(--pure-white) !important;
        }

        .badge.bg-danger {
            background: #ef4444 !important;
            color: var(--pure-white) !important;
        }

        /* Details Section */
        .details-section {
            margin-top: 2rem;
            background: rgba(255, 255, 255, 0.03);
            border-radius: 24px;
            padding: 1.8rem;
            border: 1px solid var(--border-blue);
        }

        .details-section h5 {
            font-size: 1.2rem;
            font-weight: 650;
            color: var(--pure-white);
            display: flex;
            align-items: center;
            gap: 0.6rem;
            margin-bottom: 1.5rem;
        }

        .details-section h5 i {
            background: rgba(75, 139, 190, 0.1);
            padding: 8px;
            border-radius: 14px;
            color: var(--bright-blue);
        }

        .detail-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 1.2rem;
        }

        .detail-item {
            display: flex;
            flex-direction: column;
            padding: 0.8rem 1rem;
            background: rgba(255, 255, 255, 0.05);
            border-radius: 18px;
            border: 1px solid var(--border-blue);
            transition: all var(--transition-soft);
        }

        .detail-item:hover {
            background: rgba(75, 139, 190, 0.1);
            border-color: var(--bright-blue);
            transform: translateY(-2px);
            box-shadow: var(--shadow-sm);
        }

        .detail-label {
            font-size: 0.75rem;
            text-transform: uppercase;
            letter-spacing: 0.8px;
            color: var(--soft-blue);
            font-weight: 700;
            margin-bottom: 0.3rem;
        }

        .detail-value {
            font-size: 1.1rem;
            font-weight: 600;
            color: var(--pure-white);
        }

        /* Footer Actions - Matching Dashboard Button Styles */
        .profile-footer {
            background: rgba(255, 255, 255, 0.03);
            padding: 1.2rem 1.8rem;
            display: flex;
            justify-content: flex-end;
            gap: 0.8rem;
            border-top: 1px solid var(--border-blue);
        }

        .footer-btn {
            border-radius: 40px;
            padding: 0.6rem 1.6rem;
            font-weight: 600;
            font-size: 0.9rem;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            transition: all var(--transition-bounce);
            border: 1px solid transparent;
            text-decoration: none;
        }

        .btn-back {
            background: rgba(255, 255, 255, 0.05);
            color: var(--soft-blue);
            border: 1px solid var(--border-blue);
        }

        .btn-back:hover {
            background: var(--bright-blue);
            color: var(--pure-white);
            transform: translateY(-3px);
            box-shadow: var(--shadow-blue);
        }

        .btn-edit {
            background: rgba(245, 158, 11, 0.15);
            color: #fbbf24;
            border: 1px solid rgba(245, 158, 11, 0.3);
        }

        .btn-edit:hover {
            background: #f59e0b;
            color: var(--pure-white);
            transform: translateY(-3px);
            box-shadow: 0 4px 12px rgba(245, 158, 11, 0.3);
        }

        hr {
            border-color: var(--border-blue) !important;
            opacity: 0.3;
            margin: 1.5rem 0;
        }

        /* Empty State */
        .text-center.py-4 {
            color: var(--soft-blue) !important;
        }

        .text-center.py-4 i {
            color: var(--bright-blue);
        }

        /* ========================================================
           FOOTER - EXACTLY LIKE DASHBOARD
           ======================================================== */
        .dashboard-footer {
            background: var(--glass-deep-darker);
            backdrop-filter: blur(12px);
            color: var(--medium-grey);
            text-align: center;
            padding: 1.5rem;
            font-size: 0.9rem;
            border-top: 1px solid var(--border-blue);
            animation: footerFade 0.8s var(--transition-elegant);
        }

        @keyframes footerFade {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        /* ========================================================
           RESPONSIVE
           ======================================================== */
        @media (max-width: 1200px) {
            .main-panel { padding: 2rem; }
        }

        @media (max-width: 992px) {
            .nav-sidebar:not(.collapsed) { width: 240px; }
        }

        @media (max-width: 768px) {
            .admin-header { padding: 0 1.5rem; }
            .logo-text { font-size: 1.3rem; }
            .logo-blue { width: 44px; height: 44px; }
            .logo-blue i { font-size: 24px; }
            .header-actions { gap: 0.8rem; }
            .dark-btn span { display: none; }
            .dark-btn { padding: 0.6rem; }
            .main-panel { padding: 1.5rem; }
            .profile-body .row { flex-direction: column; }
            .detail-grid { grid-template-columns: 1fr; }
            .profile-img { width: 120px; height: 120px; }
            .user-name-under { font-size: 1.5rem; }
            .profile-image-section { margin-top: -10px; }
        }
    </style>
</head>
<body>

    <!-- ==================== HEADER (EXACTLY LIKE DASHBOARD) ==================== -->
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
                <i class="bi bi-layout-sidebar"></i> <span id="collapseText">Collapse</span>
            </span>
            <span class="dark-btn" id="fullscreenModeBtn">
                <i class="bi bi-arrows-fullscreen"></i> <span>Fullscreen</span>
            </span>
            <a href="logout" class="btn logout-btn">
                <i class="bi bi-box-arrow-right"></i> <span>Exit</span>
            </a>
        </div>
    </header>

    <!-- ==================== LAYOUT ==================== -->
    <div class="dashboard-layout" id="dashboardLayout">

        <!-- ========== SIDEBAR (EXACTLY LIKE DASHBOARD WITH ALL LINKS) ========= -->
        <aside class="nav-sidebar" id="mainSidebar">
            <div class="nav-category">Core</div>

            <!-- Dashboard dropdown -->
            <div class="dropdown">
                <button class="dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                    <i class="bi bi-speedometer2"></i> <span>Dashboard</span>
                </button>
            </div>

            <div class="nav-category">Identity</div>

            <!-- Manage Users dropdown - ACTIVE -->
            <div class="dropdown">
                <button class="dropdown-toggle active" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                    <i class="bi bi-people-fill"></i> <span>Manage Users</span>
                </button>
                <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="${pageContext.request.contextPath}/listUser"><i class="bi bi-person-plus"></i> <span>Users</span></a></li>
                    <li><a class="dropdown-item" href="${pageContext.request.contextPath}/addUser"><i class="bi bi-person-dash"></i> <span>Add User</span></a></li>
                </ul>
            </div>

            <!-- Verify Student dropdown -->
            <div class="dropdown">
                <button class="dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                    <i class="bi bi-patch-check-fill"></i> <span>Verify Student</span>
                </button>
                <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="${pageContext.request.contextPath}/listStudent"><i class="bi bi-check-circle"></i> <span>Students</span></a></li>
                    <li><a class="dropdown-item" href="${pageContext.request.contextPath}/addStudentInfo"><i class="bi bi-x-circle"></i> <span>Add Student</span></a></li>
                </ul>
            </div>

            <!-- Verify Employers dropdown -->
            <div class="dropdown">
                <button class="dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                    <i class="bi bi-building"></i> <span>Verify Employers</span>
                </button>
                <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="${pageContext.request.contextPath}/listEmployer"><i class="bi bi-shield-check"></i> <span>Employers</span></a></li>
                    <li><a class="dropdown-item" href="${pageContext.request.contextPath}/addEmployer"><i class="bi bi-shield-exclamation"></i> <span>Add Employer</span></a></li>
                </ul>
            </div>

            <div class="nav-category">Opportunities</div>

            <!-- Post Internship dropdown -->
            <div class="dropdown">
                <button class="dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                    <i class="bi bi-briefcase-fill"></i> <span>Internship</span>
                </button>
                <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="${pageContext.request.contextPath}/listInternship"><i class="bi bi-send"></i> <span>List Internship</span></a></li>
                    <li><a class="dropdown-item" href="${pageContext.request.contextPath}/addInternship"><i class="bi bi-file-text"></i> <span>Add Internship</span></a></li>
                </ul>
            </div>

            <!-- Enrollments dropdown -->
            <div class="dropdown">
                <button class="dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                    <i class="bi bi-journal-bookmark-fill"></i> <span>Enrollments</span>
                </button>
                <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="${pageContext.request.contextPath}/listEnrollment"><i class="bi bi-list-check"></i> <span>List Enrollments</span></a></li>
                    <li><a class="dropdown-item" href="${pageContext.request.contextPath}/addInternshipEnrollment"><i class="bi bi-clock-history"></i> <span>New Enroll</span></a></li>
                </ul>
            </div>

            <!-- Applications dropdown -->
            <div class="dropdown">
                <button class="dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                    <i class="bi bi-send-fill"></i> <span>Applications</span>
                </button>
                <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="#"><i class="bi bi-envelope-open"></i> <span>View Applications</span></a></li>
                    <li><a class="dropdown-item" href="${pageContext.request.contextPath}/applyInternship"><i class="bi bi-archive"></i> <span>Apply Internship</span></a></li>
                </ul>
            </div>

            <!-- Reviews dropdown -->
            <div class="dropdown">
                <button class="dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                    <i class="bi bi-star-fill"></i> <span>Reviews</span>
                </button>
                <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="${pageContext.request.contextPath}/listReview"><i class="bi bi-star-half"></i> <span>Reviews</span></a></li>
                    <li><a class="dropdown-item" href="${pageContext.request.contextPath}/addReview"><i class="bi bi-star"></i> <span>Add Review</span></a></li>
                </ul>
            </div>

            <!-- Certificates dropdown -->
            <div class="dropdown">
                <button class="dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                    <i class="bi bi-award-fill"></i> <span>Certificates</span>
                </button>
                <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="${pageContext.request.contextPath}/listCertificate"><i class="bi bi-file-pdf"></i> <span>Certificates</span></a></li>
                    <li><a class="dropdown-item" href="${pageContext.request.contextPath}/addCertificate"><i class="bi bi-download"></i> <span>Add Certificate</span></a></li>
                </ul>
            </div>
        </aside>

        <!-- ========== MAIN PANEL : VIEW USER CONTENT (UNTOUCHED LOGIC) ========= -->
        <main class="main-panel">

            <div class="profile-card">
                
                <!-- card header -->
                <div class="profile-header">
                    <h4>
                        <i class="bi bi-person-badge-fill"></i> 
                        User Profile
                    </h4>
                </div>

                <!-- card body - 100% ORIGINAL BUSINESS LOGIC - UNTOUCHED -->
                <div class="profile-body">

                    <div class="row">
                        <!-- Profile Image & User Name -->
                        <div class="col-md-3 profile-image-section">
                            <c:choose>
                                <c:when test="${not empty user.profilePicURL}">
                                    <img src="${user.profilePicURL}" class="profile-img" alt="Profile">
                                </c:when>
                                <c:otherwise>
                                    <img src="https://via.placeholder.com/150" 
                                         class="profile-img" alt="Default Profile">
                                </c:otherwise>
                            </c:choose>
                            <!-- USER NAME DIRECTLY UNDER THE CIRCLE -->
                            <div class="user-name-under">${user.firstName} ${user.lastName}</div>
                        </div>

                        <!-- Basic Info (all other details) -->
                        <div class="col-md-9">
                            <div class="info-row">
                                <span class="info-label"><i class="bi bi-envelope-fill"></i>Email:</span>
                                <span class="info-value">${user.email}</span>
                            </div>
                            <div class="info-row">
                                <span class="info-label"><i class="bi bi-telephone-fill"></i>Phone:</span>
                                <span class="info-value">${user.phone}</span>
                            </div>
                            <div class="info-row">
                                <span class="info-label"><i class="bi bi-gender-ambiguous"></i>Gender:</span>
                                <span class="info-value">${user.gender}</span>
                            </div>

                            <div class="info-row">
                                <span class="info-label"><i class="bi bi-shield-fill"></i>Role:</span>
                                <span class="info-value">
                                    <span class="badge bg-primary">${user.role}</span>
                                </span>
                            </div>

                            <div class="info-row">
                                <span class="info-label"><i class="bi bi-person-badge"></i>User Type:</span>
                                <span class="info-value">
                                    <span class="badge bg-info">${user.usertype}</span>
                                </span>
                            </div>

                            <div class="info-row">
                                <span class="info-label"><i class="bi bi-check-circle-fill"></i>Status:</span>
                                <span class="info-value">
                                    <c:choose>
                                        <c:when test="${user.active}">
                                            <span class="badge bg-success">Active</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="badge bg-danger">Inactive</span>
                                        </c:otherwise>
                                    </c:choose>
                                </span>
                            </div>

                            <div class="info-row">
                                <span class="info-label"><i class="bi bi-calendar-fill"></i>Created At:</span>
                                <span class="info-value">${user.createdAt}</span>
                            </div>
                        </div>
                    </div>

                    <hr>

                    <!-- Additional Details -->
                    <div class="details-section">
                        <h5>
                            <i class="bi bi-info-circle-fill"></i>
                            Additional Details
                        </h5>

                        <c:if test="${not empty userDetail}">
                            <div class="detail-grid">
                                <div class="detail-item">
                                    <span class="detail-label">Qualification</span>
                                    <span class="detail-value">${userDetail.qualification}</span>
                                </div>
                                <div class="detail-item">
                                    <span class="detail-label">City</span>
                                    <span class="detail-value">${userDetail.city}</span>
                                </div>
                                <div class="detail-item">
                                    <span class="detail-label">State</span>
                                    <span class="detail-value">${userDetail.state}</span>
                                </div>
                                <div class="detail-item">
                                    <span class="detail-label">Country</span>
                                    <span class="detail-value">${userDetail.country}</span>
                                </div>
                            </div>
                        </c:if>

                        <c:if test="${empty userDetail}">
                            <div class="text-center py-4" style="color: var(--soft-blue);">
                                <i class="bi bi-inbox" style="font-size: 2rem; color: var(--bright-blue);"></i>
                                <p class="mt-2 mb-0">No additional details available for this user.</p>
                            </div>
                        </c:if>
                    </div>

                </div>

                <!-- card footer with actions -->
                <div class="profile-footer">
                    <a href="listUser" class="btn footer-btn btn-back">
                        <i class="bi bi-arrow-left"></i> Back
                    </a>
                    <a href="/editUser?userId=${user.userId}" class="btn footer-btn btn-edit">
                        <i class="bi bi-pencil-fill"></i> Edit
                    </a>
                </div>

            </div>

        </main>
    </div>

    <!-- ==================== FOOTER (EXACTLY LIKE DASHBOARD) ==================== -->
    <footer class="dashboard-footer">
        2026 SmartIntern - Designed BY Rathod Darshan
    </footer>

    <!-- Scripts -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>

    <script>
        (function() {
            "use strict";

            // Initialize AOS
            AOS.init({
                duration: 600,
                once: true,
                offset: 50,
                easing: 'cubic-bezier(0.165, 0.84, 0.44, 1)'
            });

            // Sidebar logic - UNCHANGED
            const layout = document.getElementById('dashboardLayout');
            const sidebar = document.getElementById('mainSidebar');
            const toggleBtn = document.getElementById('toggleCollapseBtn');
            const fullscreenBtn = document.getElementById('fullscreenModeBtn');
            const collapseText = document.getElementById('collapseText');

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

            fullscreenBtn.innerHTML = '<i class="bi bi-arrows-fullscreen"></i> Fullscreen';
            collapseText.innerText = 'Collapse';

            // Staggered animation for dropdowns
            document.querySelectorAll('.dropdown').forEach((dropdown, index) => {
                dropdown.style.animation = `dropdownAppear 0.5s cubic-bezier(0.34, 1.56, 0.64, 1) ${index * 0.1}s forwards`;
            });
        })();
    </script>

    <!-- Additional animation style -->
    <style>
        @keyframes dropdownAppear {
            from { opacity: 0; transform: translateX(-20px); }
            to { opacity: 1; transform: translateX(0); }
        }
        
        .nav-sidebar .dropdown {
            animation-fill-mode: both;
        }
    </style>

</body>
</html>