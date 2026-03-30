<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employer Registration · SmartIntern Admin</title>

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
            text-decoration: none;
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
           REGISTRATION CARD - MATCHING DASHBOARD STYLE
           ======================================================== */
        .registration-card {
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

        .registration-card:hover {
            border-color: var(--bright-blue);
            box-shadow: var(--shadow-lg), var(--shadow-blue);
        }

        .registration-card::after {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 6px;
            height: 100%;
            background: linear-gradient(180deg, var(--bright-blue), var(--bright-blue-light));
            border-radius: 30px 0 0 30px;
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

        .card-header-custom {
            margin-bottom: 2rem;
            border-bottom: 1px solid var(--border-blue);
            padding-bottom: 1rem;
        }

        .card-header-custom h2 {
            font-size: 1.8rem;
            font-weight: 700;
            color: var(--pure-white);
            margin: 0;
            display: flex;
            align-items: center;
            gap: 0.8rem;
        }

        .card-header-custom h2 i {
            color: var(--bright-blue);
            background: rgba(75, 139, 190, 0.1);
            padding: 10px;
            border-radius: 12px;
        }

        .card-header-custom p {
            color: var(--soft-blue);
            margin: 0.5rem 0 0 0;
            font-size: 0.95rem;
        }

        /* User Info Panel */
        .user-info-panel {
            background: rgba(255, 255, 255, 0.05);
            border-radius: 20px;
            padding: 1.5rem;
            margin-bottom: 2rem;
            border: 1px solid var(--border-blue);
        }

        .info-label {
            font-size: 0.75rem;
            font-weight: 700;
            color: var(--soft-blue);
            text-transform: uppercase;
            letter-spacing: 1px;
            margin-bottom: 0.25rem;
        }

        .info-label i {
            color: var(--bright-blue);
        }

        .info-value {
            font-weight: 600;
            color: var(--pure-white);
            font-size: 1.1rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .info-value i {
            color: var(--bright-blue);
            background: rgba(75, 139, 190, 0.1);
            padding: 6px;
            border-radius: 12px;
            font-size: 0.9rem;
        }

        .info-value.default {
            color: var(--text-muted);
            font-style: italic;
        }

        .badge.bg-primary {
            background: var(--bright-blue) !important;
            color: var(--pure-white);
        }

        .text-muted {
            color: var(--text-muted) !important;
        }

        /* Form Elements */
        .form-label-custom {
            font-weight: 600;
            color: var(--soft-blue);
            margin-bottom: 0.5rem;
            font-size: 0.9rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .form-label-custom i {
            color: var(--bright-blue);
            font-size: 1rem;
        }

        .form-control-custom, .form-select-custom {
            border: 1px solid var(--border-blue);
            border-radius: 16px;
            padding: 0.8rem 1.2rem;
            font-size: 0.95rem;
            transition: all var(--transition-soft);
            background: rgba(255, 255, 255, 0.05);
            color: var(--pure-white);
            width: 100%;
        }

        .form-control-custom:focus, .form-select-custom:focus {
            border-color: var(--bright-blue);
            box-shadow: 0 0 0 3px rgba(75, 139, 190, 0.1);
            background: rgba(255, 255, 255, 0.1);
            outline: none;
        }

        .form-control-custom:hover, .form-select-custom:hover {
            border-color: var(--bright-blue-light);
            background: rgba(255, 255, 255, 0.08);
        }

        .form-control-custom::placeholder {
            color: var(--text-muted);
            opacity: 0.7;
        }

        .form-select-custom option {
            background: var(--deep-blue-dark);
            color: var(--pure-white);
        }

        textarea.form-control-custom {
            resize: vertical;
            min-height: 100px;
        }

        .info-text-custom {
            font-size: 0.8rem;
            color: var(--text-muted);
            margin-top: 0.4rem;
            display: flex;
            align-items: center;
            gap: 0.3rem;
        }

        .info-text-custom i {
            color: var(--bright-blue);
            font-size: 0.8rem;
        }

        .required-star {
            color: #ef4444;
            margin-left: 2px;
        }

        /* Message Alerts */
        .error-message-custom {
            background: rgba(239, 68, 68, 0.1);
            border-left: 4px solid #ef4444;
            border-radius: 16px;
            padding: 1rem 1.5rem;
            margin-bottom: 2rem;
            color: #f87171;
            font-weight: 500;
            display: flex;
            align-items: center;
            gap: 0.8rem;
            border: 1px solid rgba(239, 68, 68, 0.3);
        }

        .error-message-custom i {
            font-size: 1.2rem;
            color: #ef4444;
        }

        .success-message-custom {
            background: rgba(16, 185, 129, 0.1);
            border-left: 4px solid #10b981;
            border-radius: 16px;
            padding: 1rem 1.5rem;
            margin-bottom: 2rem;
            color: #34d399;
            font-weight: 500;
            display: flex;
            align-items: center;
            gap: 0.8rem;
            border: 1px solid rgba(16, 185, 129, 0.3);
        }

        .success-message-custom i {
            color: #10b981;
        }

        /* Buttons */
        .btn-register {
            background: var(--bright-blue);
            color: var(--pure-white);
            border: none;
            border-radius: 40px;
            padding: 1rem 2rem;
            font-weight: 600;
            font-size: 1rem;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 0.8rem;
            width: 100%;
            transition: all var(--transition-soft);
        }

        .btn-register:hover {
            background: var(--bright-blue-dark);
            transform: translateY(-2px);
            box-shadow: var(--shadow-blue);
        }

        .btn-register i {
            font-size: 1.1rem;
        }

        .btn-skip {
            background: transparent;
            border: 1px solid var(--border-blue);
            color: var(--soft-blue);
            border-radius: 40px;
            padding: 0.7rem 1.5rem;
            font-weight: 500;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            transition: all var(--transition-soft);
        }

        .btn-skip:hover {
            background: var(--bright-blue);
            border-color: var(--bright-blue);
            color: var(--pure-white);
            transform: translateX(-2px);
            box-shadow: var(--shadow-blue);
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
            margin-top: auto;
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
            .registration-card { padding: 2rem; }
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
            .registration-card { padding: 1.5rem; }
        }

        @media (max-width: 480px) {
            .registration-card { padding: 1.2rem; }
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
            <a href="dashboard" class="dark-btn">
                <i class="bi bi-house-door"></i> <span>Dashboard</span>
            </a>
            <a href="logout" class="logout-btn">
                <i class="bi bi-box-arrow-right"></i> <span>Exit</span>
            </a>
        </div>
    </header>

    <!-- LAYOUT -->
    <div class="dashboard-layout" id="dashboardLayout">

        <!-- SIDEBAR - EXACTLY LIKE DASHBOARD WITH ALL LINKS -->
        <aside class="nav-sidebar" id="mainSidebar">
            <div class="nav-category">Core</div>

            <!-- Dashboard dropdown -->
            <div class="dropdown">
                <button class="dropdown-toggle" type="button" data-bs-toggle="dropdown">
                    <i class="bi bi-speedometer2"></i> <span>Dashboard</span>
                </button>
            </div>

            <div class="nav-category">Identity</div>

            <!-- Manage Users dropdown -->
            <div class="dropdown">
                <button class="dropdown-toggle" type="button" data-bs-toggle="dropdown">
                    <i class="bi bi-people-fill"></i> <span>Manage Users</span>
                </button>
                <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="${pageContext.request.contextPath}/listUser"><i class="bi bi-person-plus"></i> <span>Users</span></a></li>
                    <li><a class="dropdown-item" href="${pageContext.request.contextPath}/addUser"><i class="bi bi-person-dash"></i> <span>Add User</span></a></li>
                </ul>
            </div>

            <!-- Verify Student dropdown -->
            <div class="dropdown">
                <button class="dropdown-toggle" type="button" data-bs-toggle="dropdown">
                    <i class="bi bi-patch-check-fill"></i> <span>Verify Student</span>
                </button>
                <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="${pageContext.request.contextPath}/listStudent"><i class="bi bi-check-circle"></i> <span>Students</span></a></li>
                    <li><a class="dropdown-item" href="${pageContext.request.contextPath}/addStudentInfo"><i class="bi bi-x-circle"></i> <span>Add Student</span></a></li>
                </ul>
            </div>

          

            <!-- Verify Employers dropdown - ACTIVE -->
            <div class="dropdown">
                <button class="dropdown-toggle active" type="button" data-bs-toggle="dropdown">
                    <i class="bi bi-building"></i> <span>Verify Employers</span>
                </button>
                <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="listEmployer"><i class="bi bi-shield-check"></i> <span>Employers List</span></a></li>
                    <li><a class="dropdown-item" href="employer"><i class="bi bi-shield-exclamation"></i> <span>Add Employer</span></a></li>
                </ul>
            </div>

            <div class="nav-category">Opportunities</div>

            <!-- Post Internship dropdown -->
            <div class="dropdown">
                <button class="dropdown-toggle" type="button" data-bs-toggle="dropdown">
                    <i class="bi bi-briefcase-fill"></i> <span>Internship</span>
                </button>
                <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="#"><i class="bi bi-send"></i> <span>View All</span></a></li>
                    <li><a class="dropdown-item" href="addInternship"><i class="bi bi-file-text"></i> <span>Add Internship</span></a></li>
                </ul>
            </div>

            <!-- Enrollments dropdown -->
            <div class="dropdown">
                <button class="dropdown-toggle" type="button" data-bs-toggle="dropdown">
                    <i class="bi bi-journal-bookmark-fill"></i> <span>Enrollments</span>
                </button>
                <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="#"><i class="bi bi-list-check"></i> <span>List</span></a></li>
                    <li><a class="dropdown-item" href="addInternshipEnrollment"><i class="bi bi-clock-history"></i> <span>New Enroll</span></a></li>
                </ul>
            </div>

            <!-- Applications dropdown -->
            <div class="dropdown">
                <button class="dropdown-toggle" type="button" data-bs-toggle="dropdown">
                    <i class="bi bi-send-fill"></i> <span>Applications</span>
                </button>
                <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="#"><i class="bi bi-envelope-open"></i> <span>Inbox</span></a></li>
                    <li><a class="dropdown-item" href="applyInternship"><i class="bi bi-archive"></i> <span>New Application</span></a></li>
                </ul>
            </div>

            <!-- Reviews dropdown -->
            <div class="dropdown">
                <button class="dropdown-toggle" type="button" data-bs-toggle="dropdown">
                    <i class="bi bi-star-fill"></i> <span>Reviews</span>
                </button>
                <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="#"><i class="bi bi-star-half"></i> <span>All Reviews</span></a></li>
                    <li><a class="dropdown-item" href="review"><i class="bi bi-star"></i> <span>Add Review</span></a></li>
                </ul>
            </div>

            <!-- Certificates dropdown -->
            <div class="dropdown">
                <button class="dropdown-toggle" type="button" data-bs-toggle="dropdown">
                    <i class="bi bi-award-fill"></i> <span>Certificates</span>
                </button>
                <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="#"><i class="bi bi-file-pdf"></i> <span>All Certificates</span></a></li>
                    <li><a class="dropdown-item" href="certificate"><i class="bi bi-download"></i> <span>Generate</span></a></li>
                </ul>
            </div>
        </aside>

        <!-- MAIN PANEL - EMPLOYER REGISTRATION CONTENT (UNTOUCHED LOGIC) -->
        <main class="main-panel">

            <!-- Registration Card -->
            <div class="registration-card">
                
                <!-- Card Header -->
                <div class="card-header-custom">
                    <h2>
                        <i class="bi bi-building"></i>
                        Complete Company Profile
                    </h2>
                    <p><i class="bi bi-info-circle me-1"></i> Please fill in your company details to start posting internships</p>
                </div>
                
                <!-- Error Display -->
                <c:if test="${not empty error}">
                    <div class="error-message-custom">
                        <i class="bi bi-exclamation-triangle-fill"></i>
                        <span>${error}</span>
                    </div>
                </c:if>
                
                <!-- Success Message -->
                <c:if test="${not empty success}">
                    <div class="success-message-custom">
                        <i class="bi bi-check-circle-fill"></i>
                        <span>${success}</span>
                    </div>
                </c:if>
                
                <!-- ========== USER INFO PANEL - FIXED WITH SESSION DATA ========== -->
                <div class="user-info-panel">
                    <div class="row g-4">
                        <div class="col-md-6">
                            <div class="info-label">
                                <i class="bi bi-person-badge me-1"></i>Logged in as
                            </div>
                            <div class="info-value ${empty sessionScope.user ? 'default' : ''}">
                                <i class="bi bi-person-circle"></i>
                                <c:choose>
                                    <c:when test="${not empty sessionScope.user}">
                                        ${sessionScope.user.firstName} ${sessionScope.user.lastName}
                                        <c:if test="${not empty sessionScope.user.role}">
                                            <span class="badge bg-primary ms-2" style="font-size: 0.7rem;">${sessionScope.user.role}</span>
                                        </c:if>
                                    </c:when>
                                    <c:otherwise>
                                        <span>Loading user info...</span>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="info-label">
                                <i class="bi bi-envelope me-1"></i>Email address
                            </div>
                            <div class="info-value ${empty sessionScope.user ? 'default' : ''}">
                                <i class="bi bi-envelope"></i>
                                <c:choose>
                                    <c:when test="${not empty sessionScope.user}">
                                        ${sessionScope.user.email}
                                    </c:when>
                                    <c:otherwise>
                                        <span>Email will be synced from your account</span>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                    </div>
                    
                    <!-- User ID hidden but available if needed (for debugging) -->
                    <c:if test="${not empty sessionScope.user}">
                        <div class="row mt-2">
                            <div class="col-12">
                                <small class="text-muted">
                                    <i class="bi bi-key"></i> User ID: ${sessionScope.user.userId}
                                </small>
                            </div>
                        </div>
                    </c:if>
                </div>

                <!-- Registration Form -->
                <form action="saveEmployer" method="post">
                    
                    <!-- Hidden User ID field - Uncomment if needed in future -->
                    <!-- <input type="hidden" name="userId" value="${sessionScope.user.userId}" /> -->

                    <!-- Company Name -->
                    <div class="mb-4">
                        <label class="form-label-custom">
                            <i class="bi bi-buildings"></i>
                            Company Name <span class="required-star">*</span>
                        </label>
                        <input type="text" name="companyName" class="form-control-custom" 
                               placeholder="e.g. Google, Microsoft, etc." required 
                               value="${employer.companyName}">
                    </div>

                    <!-- Company Type -->
                    <div class="mb-4">
                        <label class="form-label-custom">
                            <i class="bi bi-tags"></i>
                            Company Type <span class="required-star">*</span>
                        </label>
                        <select name="companyType" class="form-select-custom" required>
                            <option value="" disabled selected>-- Select Company Type --</option>
                            <option value="Startup">🚀 Startup</option>
                            <option value="MNC">🌍 MNC</option>
                            <option value="Private Ltd">🏢 Private Ltd</option>
                            <option value="Government">🏛️ Government</option>
                            <option value="NGO">❤️ NGO</option>
                            <option value="Other">📌 Other</option>
                        </select>
                    </div>

                    <!-- Website -->
                    <div class="mb-4">
                        <label class="form-label-custom">
                            <i class="bi bi-globe2"></i>
                            Website
                        </label>
                        <input type="url" name="website" class="form-control-custom" 
                               placeholder="https://www.example.com"
                               value="${employer.website}">
                        <div class="info-text-custom">
                            <i class="bi bi-info-circle"></i>
                            Optional but recommended
                        </div>
                    </div>

                    <!-- Company Address -->
                    <div class="mb-4">
                        <label class="form-label-custom">
                            <i class="bi bi-geo-alt"></i>
                            Company Address <span class="required-star">*</span>
                        </label>
                        <textarea name="companyAddress" class="form-control-custom" 
                                  rows="3" placeholder="Full company address" required>${employer.companyAddress}</textarea>
                    </div>

                    <!-- HR Name -->
                    <div class="mb-4">
                        <label class="form-label-custom">
                            <i class="bi bi-person-badge"></i>
                            HR/Contact Person Name <span class="required-star">*</span>
                        </label>
                        <input type="text" name="hrName" class="form-control-custom" 
                               placeholder="Full name of HR or contact person" required
                               value="${employer.hrName}">
                    </div>

                    <!-- HR Mobile -->
                    <div class="mb-4">
                        <label class="form-label-custom">
                            <i class="bi bi-phone"></i>
                            HR Mobile Number <span class="required-star">*</span>
                        </label>
                        <input type="tel" name="hrMobile" class="form-control-custom" 
                               pattern="[0-9]{10}" maxlength="10" 
                               placeholder="10 digit mobile number" required
                               value="${employer.hrMobile}">
                        <div class="info-text-custom">
                            <i class="bi bi-info-circle"></i>
                            Enter 10 digit mobile number without +91
                        </div>
                    </div>

                    <!-- Submit Button -->
                    <div class="d-grid mt-5">
                        <button type="submit" class="btn-register">
                            <i class="bi bi-check2-circle"></i>
                            Register & Continue to Dashboard
                        </button>
                    </div>
                    
                    <!-- Skip Link -->
                    <div class="text-center mt-4">
                        <a href="dashboard" class="btn-skip">
                            <i class="bi bi-arrow-left"></i>
                            Skip for now
                        </a>
                    </div>

                </form>
            </div>

        </main>
    </div>

    <!-- FOOTER - EXACTLY LIKE DASHBOARD -->
    <footer class="dashboard-footer">
        2026 SmartIntern — professional employer registration · all rights reserved
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

            // Note: toggle button and fullscreen button are not in this page
            // But we keep the script for consistency

            // Staggered animation for dropdowns
            document.querySelectorAll('.dropdown').forEach((dropdown, index) => {
                dropdown.style.animation = `dropdownAppear 0.5s cubic-bezier(0.34, 1.56, 0.64, 1) ${index * 0.1}s forwards`;
            });

            // Optional: Show session data in console for debugging (remove in production)
            console.log('Session user data:', {
                user: '${sessionScope.user}',
                userId: '${sessionScope.user.userId}',
                email: '${sessionScope.user.email}',
                firstName: '${sessionScope.user.firstName}',
                lastName: '${sessionScope.user.lastName}',
                role: '${sessionScope.user.role}'
            });
        })();
    </script>

</body>
</html>