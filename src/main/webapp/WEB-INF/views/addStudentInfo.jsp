<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Student Information · SmartIntern Admin</title>

    <!-- Bootstrap & Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    <!-- AOS Animation -->
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">

    <style>
        /* ========================================================
           PROFESSIONAL BLUE COLOR SYSTEM - MATCHING DASHBOARD
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

        /* Subtle Grid Pattern */
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

        /* Blue Accent Glow */
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
           SMARTINTERN LOGO
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

        .nav-sidebar.collapsed .dropdown-menu {
            display: none;
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
           FORM CARD STYLES - MATCHING DASHBOARD
           ======================================================== */
        .form-card {
            background: var(--glass-deep);
            backdrop-filter: blur(12px);
            -webkit-backdrop-filter: blur(12px);
            border-radius: 30px;
            border: 1px solid var(--border-blue);
            padding: 2.5rem;
            box-shadow: var(--shadow-md);
            transition: all var(--transition-elegant);
            max-width: 1000px;
            margin: 0 auto;
        }

        .form-card:hover {
            border-color: var(--bright-blue);
            box-shadow: var(--shadow-lg), var(--shadow-blue);
        }

        /* Header with Back Button */
        .form-header-section {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 2rem;
            padding-bottom: 1rem;
            border-bottom: 1px solid var(--border-blue);
        }

        .form-header-section h3 {
            font-size: 1.8rem;
            font-weight: 700;
            color: var(--pure-white);
            display: flex;
            align-items: center;
            gap: 0.7rem;
        }

        .form-header-section h3 i {
            background: rgba(75, 139, 190, 0.1);
            padding: 10px;
            border-radius: 12px;
            color: var(--bright-blue);
        }

        .btn-back {
            background: rgba(255, 255, 255, 0.05);
            border: 1px solid var(--border-blue);
            color: var(--soft-blue);
            border-radius: 40px;
            padding: 0.7rem 1.8rem;
            font-weight: 600;
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

        /* Form Header with Icon */
        .form-header {
            text-align: center;
            margin-bottom: 2.5rem;
        }

        .form-icon {
            width: 80px;
            height: 80px;
            margin: 0 auto 1.5rem;
            background: linear-gradient(135deg, var(--deep-blue), var(--bright-blue));
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: var(--pure-white);
            font-size: 2rem;
            border: 3px solid var(--bright-blue);
            box-shadow: var(--shadow-md), var(--shadow-blue);
        }

        .section-title {
            font-weight: 700;
            margin-bottom: 0.5rem;
            font-size: 2rem;
            color: var(--pure-white);
        }

        .section-sub {
            color: var(--soft-blue);
            font-size: 1rem;
            max-width: 600px;
            margin-left: auto;
            margin-right: auto;
            line-height: 1.6;
        }

        /* Progress Indicator */
        .form-progress {
            display: flex;
            justify-content: center;
            margin-bottom: 3rem;
            position: relative;
        }

        .progress-step {
            width: 45px;
            height: 45px;
            border-radius: 50%;
            background: rgba(255, 255, 255, 0.1);
            border: 2px solid var(--border-blue);
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: 600;
            color: var(--text-secondary);
            margin: 0 30px;
            position: relative;
            transition: all var(--transition-soft);
            z-index: 1;
        }

        .progress-step.active {
            background: var(--bright-blue);
            border-color: var(--bright-blue);
            color: var(--pure-white);
            box-shadow: var(--shadow-blue);
            transform: scale(1.1);
        }

        .progress-step:not(:last-child):after {
            content: '';
            position: absolute;
            width: 60px;
            height: 2px;
            background: var(--border-blue);
            right: -60px;
            top: 50%;
            transform: translateY(-50%);
            z-index: 0;
        }

        /* Form Layout */
        .form-row {
            display: flex;
            flex-wrap: wrap;
            margin: 0 -12px;
        }

        .input-group-custom {
            margin-bottom: 1.8rem;
            padding: 0 12px;
            flex: 1 0 100%;
        }

        @media (min-width: 768px) {
            .input-group-custom {
                flex: 0 0 50%;
                max-width: 50%;
            }
        }

        .input-group-custom label {
            font-weight: 600;
            margin-bottom: 0.5rem;
            display: block;
            color: var(--soft-blue);
            font-size: 0.95rem;
            display: flex;
            align-items: center;
        }

        .input-group-custom label i {
            margin-right: 0.5rem;
            color: var(--bright-blue);
            font-size: 1.1rem;
        }

        .input-wrapper {
            position: relative;
        }

        .input-group-custom input,
        .input-group-custom select {
            width: 100%;
            padding: 0.9rem 1rem 0.9rem 2.8rem;
            border-radius: 16px;
            border: 1px solid var(--border-blue);
            background: rgba(255, 255, 255, 0.05);
            color: var(--pure-white);
            font-size: 1rem;
            transition: all var(--transition-soft);
        }

        .input-group-custom input:focus,
        .input-group-custom select:focus {
            border-color: var(--bright-blue);
            background: rgba(255, 255, 255, 0.1);
            box-shadow: 0 0 0 3px rgba(75, 139, 190, 0.1);
            outline: none;
        }

        .input-group-custom input::placeholder {
            color: var(--text-muted);
            opacity: 0.7;
        }

        .input-group-custom select {
            color: var(--pure-white);
        }

        .input-group-custom select option {
            background: var(--deep-blue-dark);
            color: var(--pure-white);
        }

        .input-icon {
            position: absolute;
            left: 1rem;
            top: 50%;
            transform: translateY(-50%);
            color: var(--bright-blue);
            font-size: 1.1rem;
        }

        .optional-label {
            display: inline-block;
            background: rgba(75, 139, 190, 0.2);
            color: var(--soft-blue);
            padding: 0.2rem 0.8rem;
            border-radius: 20px;
            font-size: 0.7rem;
            font-weight: 600;
            margin-left: 0.5rem;
            border: 1px solid var(--border-blue);
        }

        /* Submit Button */
        .btn-submit-container {
            text-align: center;
            margin-top: 2rem;
        }

        .btn-save {
            background: var(--bright-blue);
            border: none;
            color: var(--pure-white);
            padding: 1rem 3rem;
            border-radius: 40px;
            font-weight: 600;
            font-size: 1.1rem;
            transition: all var(--transition-soft);
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 0.8rem;
            border: 1px solid transparent;
        }

        .btn-save:hover {
            background: var(--bright-blue-dark);
            transform: translateY(-2px);
            box-shadow: var(--shadow-blue);
        }

        .btn-save i {
            font-size: 1.2rem;
        }

        /* Footer Note */
        .form-footer {
            text-align: center;
            margin-top: 2rem;
            color: var(--text-muted);
            font-size: 0.9rem;
            padding-top: 1.5rem;
            border-top: 1px solid var(--border-blue);
        }

        .form-footer i {
            color: var(--bright-blue);
            margin-right: 0.5rem;
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
            .form-card { padding: 2rem; }
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
            .form-header-section {
                flex-direction: column;
                gap: 1rem;
                align-items: flex-start;
            }
            .section-title { font-size: 1.6rem; }
            .progress-step { width: 35px; height: 35px; margin: 0 15px; }
            .progress-step:not(:last-child):after { width: 30px; right: -30px; }
        }

        @media (max-width: 480px) {
            .form-card { padding: 1.5rem; }
            .form-icon { width: 60px; height: 60px; font-size: 1.5rem; }
        }

        /* Dropdown Animations */
        @keyframes dropdownAppear {
            from { opacity: 0; transform: translateX(-20px); }
            to { opacity: 1; transform: translateX(0); }
        }
        
        .nav-sidebar .dropdown {
            animation: dropdownAppear 0.5s var(--transition-elegant);
            animation-fill-mode: both;
        }
    </style>
</head>
<body>

    <!-- HEADER - EXACTLY LIKE DASHBOARD -->
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
            <a href="logout" class="logout-btn">
                <i class="bi bi-box-arrow-right"></i> <span>Exit</span>
            </a>
        </div>
    </header>

    <!-- LAYOUT -->
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

        <!-- MAIN PANEL -->
        <main class="main-panel">

            <div class="form-card">
                
                <!-- Header with Back Button -->
                <div class="form-header-section">
                    <h3>
                        <i class="bi bi-mortarboard-fill"></i> 
                        Add Student Information
                    </h3>
                    <a href="listStudent" class="btn-back">
                        <i class="bi bi-arrow-left"></i> Back to List
                    </a>
                </div>

                <!-- Form Header with Icon -->
                <div class="form-header">
                    <div class="form-icon">
                        <i class="bi bi-person-plus-fill"></i>
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

                <!-- Form - ALL FIELDS EXACTLY THE SAME, just colors changed -->
                <form action="/saveInformation" method="post" enctype="multipart/form-data">
                    
                    <div class="form-row">
                        <!-- LOCATION -->
                        <div class="input-group-custom">
                            <label><i class="bi bi-building"></i> City</label>
                            <div class="input-wrapper">
                                <input type="text" name="city" placeholder="Enter your city">
                                <span class="input-icon"><i class="bi bi-geo-alt-fill"></i></span>
                            </div>
                        </div>
                        
                        <div class="input-group-custom">
                            <label><i class="bi bi-map-fill"></i> State</label>
                            <div class="input-wrapper">
                                <input type="text" name="state" placeholder="Enter your state">
                                <span class="input-icon"><i class="bi bi-globe2"></i></span>
                            </div>
                        </div>

                        <!-- COLLEGE -->
                        <div class="input-group-custom">
                            <label><i class="bi bi-building"></i> College Name</label>
                            <div class="input-wrapper">
                                <input type="text" name="collegeName" placeholder="Enter your college name">
                                <span class="input-icon"><i class="bi bi-university"></i></span>
                            </div>
                        </div>

                        <!-- DEGREE & SEM -->
                        <div class="input-group-custom">
                            <label><i class="bi bi-book"></i> Degree</label>
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
                                <span class="input-icon"><i class="bi bi-mortarboard"></i></span>
                            </div>
                        </div>

                        <div class="input-group-custom">
                            <label><i class="bi bi-sort-numeric-up"></i> Semester</label>
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
                                <span class="input-icon"><i class="bi bi-layers"></i></span>
                            </div>
                        </div>

                        <!-- TSHIRT & YEAR -->
                        <div class="input-group-custom">
                            <label><i class="bi bi-person"></i> T-Shirt Size</label>
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
                                <span class="input-icon"><i class="bi bi-tshirt"></i></span>
                            </div>
                        </div>

                        <div class="input-group-custom">
                            <label><i class="bi bi-calendar-check"></i> Graduation Year</label>
                            <div class="input-wrapper">
                                <input type="number" name="graduationYear" placeholder="e.g. 2024">
                                <span class="input-icon"><i class="bi bi-calendar3"></i></span>
                            </div>
                        </div>

                        <!-- OPTIONAL EXTRAS (NOT REQUIRED, NO LOGIC IMPACT) -->
                        <div class="input-group-custom">
                            <label><i class="bi bi-code-slash"></i> Primary Skill <span class="optional-label">Optional</span></label>
                            <div class="input-wrapper">
                                <input type="text" placeholder="Java, Web Development, AI, etc.">
                                <span class="input-icon"><i class="bi bi-gear"></i></span>
                            </div>
                        </div>

                        <div class="input-group-custom">
                            <label><i class="bi bi-briefcase"></i> Career Interest <span class="optional-label">Optional</span></label>
                            <div class="input-wrapper">
                                <input type="text" placeholder="Software Engineer, Data Analyst, etc.">
                                <span class="input-icon"><i class="bi bi-graph-up"></i></span>
                            </div>
                        </div>
                    </div>

                    <!-- SUBMIT -->
                    <div class="btn-submit-container">
                        <button type="submit" class="btn-save">
                            <i class="bi bi-check-circle"></i> Save Profile & Continue
                        </button>
                    </div>
                    
                    <div class="form-footer">
                        <p><i class="bi bi-shield-check"></i> Your information is secure and will only be used for internship matching</p>
                    </div>
                </form>
            </div>

        </main>
    </div>

    <!-- FOOTER - EXACTLY LIKE DASHBOARD -->
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

            // Sidebar logic
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

            // Staggered animation for dropdowns
            document.querySelectorAll('.dropdown').forEach((dropdown, index) => {
                dropdown.style.animation = `dropdownAppear 0.5s cubic-bezier(0.34, 1.56, 0.64, 1) ${index * 0.1}s forwards`;
            });
        })();
    </script>

</body>
</html>