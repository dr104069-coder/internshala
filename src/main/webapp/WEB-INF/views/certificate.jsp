<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SmartIntern · Issue Certificate</title>

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
           SIDEBAR - EXACTLY LIKE DASHBOARD WITH ALL DROPDOWNS
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
            animation: categoryFade 0.5s ease-out;
        }

        @keyframes categoryFade {
            from { opacity: 0; transform: translateX(-10px); }
            to { opacity: 0.7; transform: translateX(0); }
        }

        .nav-sidebar .dropdown {
            width: 100%;
            margin-bottom: 0.3rem;
            animation: dropdownAppear 0.5s var(--transition-elegant);
            animation-fill-mode: both;
        }

        .nav-sidebar .dropdown:nth-child(2) { animation-delay: 0.1s; }
        .nav-sidebar .dropdown:nth-child(4) { animation-delay: 0.2s; }
        .nav-sidebar .dropdown:nth-child(5) { animation-delay: 0.3s; }
        .nav-sidebar .dropdown:nth-child(6) { animation-delay: 0.4s; }
        .nav-sidebar .dropdown:nth-child(8) { animation-delay: 0.5s; }
        .nav-sidebar .dropdown:nth-child(9) { animation-delay: 0.6s; }
        .nav-sidebar .dropdown:nth-child(10) { animation-delay: 0.7s; }
        .nav-sidebar .dropdown:nth-child(11) { animation-delay: 0.8s; }
        .nav-sidebar .dropdown:nth-child(12) { animation-delay: 0.9s; }
        .nav-sidebar .dropdown:nth-child(13) { animation-delay: 1.0s; }
        .nav-sidebar .dropdown:nth-child(14) { animation-delay: 1.1s; }

        @keyframes dropdownAppear {
            from { opacity: 0; transform: translateX(-20px); }
            to { opacity: 1; transform: translateX(0); }
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
            position: relative;
            overflow: hidden;
        }

        .nav-sidebar .dropdown-toggle::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, var(--glass-bright), transparent);
            transition: left 0.6s var(--transition-elegant);
            z-index: -1;
        }

        .nav-sidebar .dropdown-toggle:hover::before {
            left: 100%;
        }

        .nav-sidebar .dropdown-toggle i {
            font-size: 1.3rem;
            width: 1.8rem;
            color: var(--bright-blue);
            transition: all var(--transition-bounce);
            animation: iconGlow 3s ease-in-out infinite;
        }

        @keyframes iconGlow {
            0%, 100% { filter: drop-shadow(0 0 5px rgba(75, 139, 190, 0.3)); }
            50% { filter: drop-shadow(0 0 15px rgba(75, 139, 190, 0.6)); }
        }

        .nav-sidebar .dropdown-toggle:hover {
            color: var(--pure-white);
            transform: translateX(8px);
            background: rgba(75, 139, 190, 0.05);
        }

        .nav-sidebar .dropdown-toggle:hover i {
            color: var(--bright-blue);
            transform: scale(1.25) rotate(5deg);
            animation: none;
        }

        .nav-sidebar .dropdown-toggle.active {
            background: rgba(75, 139, 190, 0.1);
            border-left: 3px solid var(--bright-blue);
            color: var(--pure-white);
            animation: activePulse 2s ease-in-out infinite;
        }

        @keyframes activePulse {
            0%, 100% { border-left-color: var(--bright-blue); }
            50% { border-left-color: var(--bright-blue-light); }
        }

        .nav-sidebar .dropdown-toggle.active i {
            color: var(--bright-blue);
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
            animation: menuExpand 0.5s var(--transition-bounce);
            transform-origin: top;
        }

        @keyframes menuExpand {
            from { opacity: 0; transform: translateY(-15px) scaleY(0.8); }
            to { opacity: 1; transform: translateY(0) scaleY(1); }
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
            margin: 0.2rem 0.3rem;
            position: relative;
            overflow: hidden;
            animation: itemSlide 0.4s var(--transition-elegant);
            animation-fill-mode: both;
        }

        .nav-sidebar .dropdown-item:nth-child(1) { animation-delay: 0.05s; }
        .nav-sidebar .dropdown-item:nth-child(2) { animation-delay: 0.1s; }

        @keyframes itemSlide {
            from { opacity: 0; transform: translateX(-15px); }
            to { opacity: 1; transform: translateX(0); }
        }

        .nav-sidebar .dropdown-item:hover {
            background: rgba(75, 139, 190, 0.05);
            color: var(--pure-white);
            padding-left: 2rem;
            transform: translateX(5px);
        }

        .nav-sidebar .dropdown-item i {
            color: var(--bright-blue);
            font-size: 1.1rem;
            width: 1.4rem;
            transition: all var(--transition-bounce);
        }

        .nav-sidebar .dropdown-item:hover i {
            color: var(--bright-blue);
            transform: scale(1.3) rotate(360deg);
        }

        .dropdown-toggle::after {
            margin-left: auto;
            color: var(--bright-blue);
        }

        .nav-sidebar.collapsed .dropdown-toggle::after {
            display: none;
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
           PAGE HEADER - MATCHING DASHBOARD STYLE
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
           FORM CARD - MATCHING DASHBOARD STYLE
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
            max-width: 800px;
            margin: 0 auto;
            position: relative;
            overflow: hidden;
        }

        .form-card:hover {
            border-color: var(--bright-blue);
            box-shadow: var(--shadow-lg), var(--shadow-blue);
        }

        .form-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 6px;
            height: 100%;
            background: linear-gradient(180deg, var(--bright-blue), var(--bright-blue-light));
            border-radius: 30px 0 0 30px;
        }

        .form-title {
            font-size: 1.8rem;
            font-weight: 700;
            color: var(--pure-white);
            margin-bottom: 2rem;
            display: flex;
            align-items: center;
            gap: 0.8rem;
        }

        .form-title i {
            background: rgba(75, 139, 190, 0.1);
            padding: 12px;
            border-radius: 14px;
            color: var(--bright-blue);
        }

        /* Info Box */
        .info-box {
            background: rgba(75, 139, 190, 0.1);
            border-radius: 18px;
            padding: 1rem;
            margin-bottom: 1.5rem;
            border: 1px solid var(--border-blue);
            display: flex;
            align-items: center;
            gap: 1rem;
        }

        .info-box i {
            color: var(--bright-blue);
            font-size: 1.5rem;
        }

        .info-box strong {
            color: var(--pure-white);
        }

        .info-box small {
            color: var(--soft-blue);
        }

        /* Form Elements */
        .form-label {
            font-weight: 600;
            color: var(--soft-blue);
            margin-bottom: 0.5rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .form-label i {
            color: var(--bright-blue);
            font-size: 1.1rem;
        }

        .form-control, .form-select {
            width: 100%;
            padding: 0.75rem 1.2rem;
            border-radius: 18px;
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

        .form-control::placeholder {
            color: var(--text-muted);
            opacity: 0.7;
        }

        .form-select {
            color: var(--pure-white);
        }

        .form-select option {
            background: var(--deep-blue-dark);
            color: var(--pure-white);
        }

        .form-control:disabled {
            background: rgba(255, 255, 255, 0.03);
            border-color: var(--border-blue);
            color: var(--text-muted);
        }

        .form-text {
            color: var(--text-muted);
            font-size: 0.85rem;
            margin-top: 0.5rem;
            display: flex;
            align-items: center;
            gap: 0.4rem;
        }

        .form-text i {
            color: #34d399;
        }

        /* Submit Button */
        .btn-save {
            background: rgba(75, 139, 190, 0.1);
            border: 1px solid var(--border-blue);
            color: var(--soft-blue);
            padding: 1rem 2rem;
            border-radius: 60px;
            font-weight: 600;
            font-size: 1.1rem;
            width: 100%;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 0.8rem;
            transition: all var(--transition-soft);
            margin-top: 1.5rem;
        }

        .btn-save:hover {
            background: var(--bright-blue);
            border-color: var(--bright-blue);
            color: var(--pure-white);
            transform: translateY(-2px);
            box-shadow: var(--shadow-blue);
        }

        .btn-save i {
            font-size: 1.2rem;
        }

        /* Additional Info */
        .additional-info {
            margin-top: 1.5rem;
            padding-top: 1rem;
            border-top: 1px solid var(--border-blue);
            text-align: center;
        }

        .additional-info small {
            color: var(--text-muted);
        }

        .additional-info i {
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
            .form-card { padding: 1.5rem; }
            .page-header {
                flex-direction: column;
                align-items: flex-start;
            }
            .info-box {
                flex-direction: column;
                text-align: center;
            }
        }

        @media (max-width: 480px) {
            .form-card { padding: 1.2rem; }
        }

        /* Dropdown Animations */
        @keyframes dropdownAppear {
            from { opacity: 0; transform: translateX(-20px); }
            to { opacity: 1; transform: translateX(0); }
        }
        
        .nav-sidebar .dropdown {
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
    <div class="dashboard-layout" id="dashboardLayout">

        <!-- SIDEBAR - EXACTLY LIKE DASHBOARD WITH ALL DROPDOWNS -->
        <aside class="nav-sidebar" id="mainSidebar">
            <div class="nav-category">Core</div>

            <!-- Dashboard dropdown -->
            <div class="dropdown">
                <button class="dropdown-toggle" type="button" data-bs-toggle="dropdown">
                    <i class="bi bi-speedometer2"></i> <span>Dashboard</span>
                </button>
                <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="#"><i class="bi bi-graph-up"></i> <span>Analytics</span></a></li>
                    <li><a class="dropdown-item" href="#"><i class="bi bi-pie-chart"></i> <span>Reports</span></a></li>
                </ul>
            </div>

            <div class="nav-category">Identity</div>

            <!-- Manage Users dropdown -->
            <div class="dropdown">
                <button class="dropdown-toggle" type="button" data-bs-toggle="dropdown">
                    <i class="bi bi-people-fill"></i> <span>Manage Users</span>
                </button>
                <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="/listUser"><i class="bi bi-person-plus"></i> <span>Users</span></a></li>
                    <li><a class="dropdown-item" href=""><i class="bi bi-person-dash"></i> <span>Add User</span></a></li>
                </ul>
            </div>

            <!-- Verify Student dropdown -->
            <div class="dropdown">
                <button class="dropdown-toggle" type="button" data-bs-toggle="dropdown">
                    <i class="bi bi-patch-check-fill"></i> <span>Verify Student</span>
                </button>
                <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="listStudent"><i class="bi bi-check-circle"></i> <span>Students</span></a></li>
                    <li><a class="dropdown-item" href="addStudentInfo"><i class="bi bi-x-circle"></i> <span>Add Student</span></a></li>
                </ul>
            </div>

            <!-- Manage Student dropdown -->
            <div class="dropdown">
                <button class="dropdown-toggle" type="button" data-bs-toggle="dropdown">
                    <i class="bi bi-pencil-square"></i> <span>Manage Student</span>
                </button>
                <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="#"><i class="bi bi-plus-circle"></i> <span>Edit</span></a></li>
                    <li><a class="dropdown-item" href="#"><i class="bi bi-gear"></i> <span>Settings</span></a></li>
                </ul>
            </div>

            <!-- Verify Employers dropdown -->
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

            <!-- Post Internship dropdown -->
            <div class="dropdown">
                <button class="dropdown-toggle" type="button" data-bs-toggle="dropdown">
                    <i class="bi bi-briefcase-fill"></i> <span>Internship</span>
                </button>
                <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="listInternship"><i class="bi bi-send"></i> <span>listInternship</span></a></li>
                    <li><a class="dropdown-item" href="addInternship"><i class="bi bi-file-text"></i> <span>Add Internship</span></a></li>
                </ul>
            </div>

            <!-- Enrollments dropdown -->
            <div class="dropdown">
                <button class="dropdown-toggle" type="button" data-bs-toggle="dropdown">
                    <i class="bi bi-journal-bookmark-fill"></i> <span>Enrollments</span>
                </button>
                <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="listEnrollment"><i class="bi bi-list-check"></i> <span>List Enrollments</span></a></li>
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
                    <li><a class="dropdown-item" href="applyInternship"><i class="bi bi-archive"></i> <span>Add New</span></a></li>
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

            <!-- Certificates dropdown - ACTIVE -->
            <div class="dropdown">
                <button class="dropdown-toggle active" type="button" data-bs-toggle="dropdown">
                    <i class="bi bi-award-fill"></i> <span>Certificates</span>
                </button>
                <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="listCertificate"><i class="bi bi-file-pdf"></i> <span>List Certificates</span></a></li>
                    <li><a class="dropdown-item active" href="certificate"><i class="bi bi-download"></i> <span>Issue Certificate</span></a></li>
                </ul>
            </div>
        </aside>

        <!-- MAIN PANEL - ISSUE CERTIFICATE CONTENT (UNTOUCHED LOGIC) -->
        <main class="main-panel" id="mainPanel">

            <!-- Page Header -->
            <div class="page-header">
                <div class="page-title">
                    <i class="bi bi-award-fill"></i>
                    Issue New Certificate
                </div>
                <a href="listCertificate" class="btn-back">
                    <i class="bi bi-arrow-left"></i> Back to List
                </a>
            </div>

            <!-- Form Card -->
            <div class="form-card">
                
                <div class="form-title">
                    <i class="bi bi-file-earmark-pdf-fill"></i>
                    Certificate Details
                </div>

                <!-- Info Box -->
                <div class="info-box">
                    <i class="bi bi-info-circle-fill"></i>
                    <div>
                        <strong>Only completed enrollments are shown</strong><br>
                        <small>Students must complete their internship to receive certificates</small>
                    </div>
                </div>

                <form action="saveCertificate" method="post">

                    <!-- Enrollment Dropdown (ONLY COMPLETED) -->
                    <div class="mb-4">
                        <label class="form-label">
                            <i class="bi bi-person-workspace"></i> Select Completed Enrollment
                        </label>
                        <select name="enrollmentId" class="form-select" required>
                            <option value="" selected disabled>-- Choose an enrollment --</option>
                            <c:forEach items="${enrollments}" var="e">
                                <option value="${e.internshipEnrollmentId}">
                                    ${e.student.firstName} ${e.student.lastName} - ${e.internship.title} (${e.internship.employer.companyName})
                                </option>
                            </c:forEach>
                        </select>
                        <div class="form-text">
                            <i class="bi bi-check-circle-fill"></i> Only enrollments with "Completed" status are displayed
                        </div>
                    </div>

                    <!-- Certificate URL -->
                    <div class="mb-4">
                        <label class="form-label">
                            <i class="bi bi-link-45deg"></i> Certificate URL
                        </label>
                        <input type="url" 
                               name="certificateURL" 
                               class="form-control"
                               placeholder="https://example.com/certificates/abc123.pdf"
                               required>
                        <div class="form-text">
                            <i class="bi bi-cloud-upload"></i> Enter the URL where the certificate PDF is stored
                        </div>
                    </div>

                    <!-- Issued Date -->
                    <div class="mb-4">
                        <label class="form-label">
                            <i class="bi bi-calendar-check"></i> Issued Date
                        </label>
                        <input type="date" 
                               name="issuedDate" 
                               class="form-control"
                               value="${java.time.LocalDate.now()}"
                               required>
                    </div>

                    <!-- Verification Code (Auto-generated) -->
                    <div class="mb-4">
                        <label class="form-label">
                            <i class="bi bi-qr-code"></i> Verification Code
                        </label>
                        <input type="text" 
                               class="form-control"
                               value="Auto-generated unique code"
                               disabled>
                        <div class="form-text">
                            <i class="bi bi-shield-check"></i> 
                            A unique verification code will be automatically generated when you save
                        </div>
                    </div>

                    <button type="submit" class="btn-save">
                        <i class="bi bi-check2-circle"></i> Issue Certificate
                    </button>

                </form>

                <!-- Additional Info -->
                <div class="additional-info">
                    <small>
                        <i class="bi bi-shield-lock"></i> 
                        All certificates are digitally verifiable using the unique code
                    </small>
                </div>
            </div>

        </main>
    </div>

    <!-- FOOTER - EXACTLY LIKE DASHBOARD -->
    <footer class="dashboard-footer">
        2026 SmartIntern — Certificate Management System
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

            const layout = document.getElementById('dashboardLayout');
            const sidebar = document.getElementById('mainSidebar');
            const toggleBtn = document.getElementById('toggleCollapseBtn');
            const fullscreenBtn = document.getElementById('fullscreenModeBtn');
            const collapseText = document.getElementById('collapseText');

            // Set today's date as default for date input
            document.addEventListener('DOMContentLoaded', function() {
                const dateInput = document.querySelector('input[type="date"]');
                if (dateInput && !dateInput.value) {
                    const today = new Date().toISOString().split('T')[0];
                    dateInput.value = today;
                }
            });

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

            fullscreenBtn.innerHTML = '<i class="bi bi-arrows-fullscreen"></i> Fullscreen';
            collapseText.innerText = 'Collapse';

            // Staggered animation for dropdowns
            document.querySelectorAll('.dropdown').forEach((dropdown, index) => {
                dropdown.style.animation = `dropdownAppear 0.5s cubic-bezier(0.34, 1.56, 0.64, 1) ${index * 0.1}s forwards`;
            });
        })();
    </script>

</body>
</html>