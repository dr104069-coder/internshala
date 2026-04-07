<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User List · SmartIntern Admin</title>

    <!-- Bootstrap & Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    <!-- AOS Animation -->
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">
<!-- DataTables CSS -->
<link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/dataTables.bootstrap5.min.css">

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
           USER LIST CONTAINER - MATCHING DASHBOARD STYLE
           ======================================================== */
        .user-list-container {
            background: var(--glass-deep);
            backdrop-filter: blur(12px);
            -webkit-backdrop-filter: blur(12px);
            border-radius: 24px;
            padding: 2rem;
            border: 1px solid var(--border-blue);
            box-shadow: var(--shadow-md);
            transition: all var(--transition-elegant);
        }

        .user-list-container:hover {
            border-color: var(--bright-blue);
            box-shadow: var(--shadow-lg), var(--shadow-blue);
        }

        .user-list-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 2rem;
            padding-bottom: 1rem;
            border-bottom: 1px solid var(--border-blue);
        }

        .user-list-header h3 {
            font-size: 1.8rem;
            font-weight: 700;
            color: var(--pure-white);
            display: flex;
            align-items: center;
            gap: 0.7rem;
        }

        .user-list-header h3 i {
            background: rgba(75, 139, 190, 0.1);
            padding: 10px;
            border-radius: 12px;
            color: var(--bright-blue);
        }

        .header-buttons {
            display: flex;
            gap: 1rem;
        }

        .btn-add-user {
            background: rgba(75, 139, 190, 0.1);
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
        }

        .btn-add-user:hover {
            background: var(--bright-blue);
            border-color: var(--bright-blue);
            color: var(--pure-white);
            transform: translateY(-2px);
            box-shadow: var(--shadow-blue);
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

        /* ========================================================
           TABLE STYLES - MATCHING DASHBOARD COLORS
           ======================================================== */
        .table {
            margin-bottom: 0;
            color: var(--text-secondary) !important;
        }

        .table > :not(caption) > * > * {
            background: transparent !important;
            color: var(--text-secondary) !important;
            border-bottom-color: var(--border-blue) !important;
        }

        .table thead th {
            color: var(--pure-white) !important;
            font-weight: 600;
            font-size: 0.85rem;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            border-bottom: 2px solid var(--bright-blue) !important;
            padding: 1rem 0.8rem;
        }

        .table tbody tr {
            transition: all var(--transition-soft);
            border-bottom: 1px solid var(--border-blue) !important;
        }

        .table tbody tr:hover {
            background: rgba(75, 139, 190, 0.05) !important;
        }

        .table tbody td {
            padding: 1rem 0.8rem;
            vertical-align: middle;
            color: var(--text-secondary) !important;
        }

        .table tbody td strong {
            color: var(--pure-white) !important;
            font-weight: 600;
        }

        /* Badge Styles */
        .badge {
            padding: 0.5rem 1rem;
            border-radius: 40px;
            font-weight: 500;
            font-size: 0.8rem;
        }

        .badge.bg-primary {
            background: var(--bright-blue) !important;
            color: white;
        }

        .badge.bg-success {
            background: #10b981 !important;
            color: white;
        }

        .badge.bg-danger {
            background: #ef4444 !important;
            color: white;
        }

        /* Action Buttons - Matching Dashboard Style */
        .action-btns {
            display: flex;
            gap: 0.5rem;
            flex-wrap: wrap;
        }

        .btn-sm {
            padding: 0.4rem 1rem;
            border-radius: 40px;
            font-size: 0.75rem;
            font-weight: 600;
            transition: all var(--transition-soft);
            border: 1px solid transparent;
            display: inline-flex;
            align-items: center;
            gap: 0.3rem;
            text-decoration: none;
        }

        .btn-warning {
            background: rgba(245, 158, 11, 0.1);
            color: #fbbf24;
            border-color: rgba(245, 158, 11, 0.3);
        }

        .btn-warning:hover {
            background: #f59e0b;
            color: white;
            transform: translateY(-2px);
            border-color: #f59e0b;
        }

        .btn-danger {
            background: rgba(239, 68, 68, 0.1);
            color: #f87171;
            border-color: rgba(239, 68, 68, 0.3);
        }

        .btn-danger:hover {
            background: #ef4444;
            color: white;
            transform: translateY(-2px);
            border-color: #ef4444;
        }

        .btn-secondary {
            background: rgba(75, 139, 190, 0.1);
            color: var(--soft-blue);
            border-color: rgba(75, 139, 190, 0.3);
        }

        .btn-secondary:hover {
            background: var(--bright-blue);
            color: white;
            transform: translateY(-2px);
            border-color: var(--bright-blue);
        }

        /* Email icon */
        .bi-envelope {
            color: var(--bright-blue);
            margin-right: 0.3rem;
        }

        /* Empty State */
        .empty-state {
            text-align: center;
            padding: 3rem;
            color: var(--text-muted);
        }

        .empty-state i {
            font-size: 3rem;
            color: var(--bright-blue);
            margin-bottom: 1rem;
        }

        /* Form Styles for Modal */
        .form-floating > .form-control,
        .form-floating > .form-select {
            background: var(--glass-deep);
            border: 1px solid var(--border-blue);
            color: var(--pure-white);
            height: calc(3.5rem + 2px);
            line-height: 1.25;
        }
        
        .form-floating > .form-control:focus,
        .form-floating > .form-select:focus {
            background: var(--glass-deep-darker);
            border-color: var(--bright-blue);
            box-shadow: 0 0 0 0.25rem rgba(75, 139, 190, 0.25);
            color: var(--pure-white);
        }
        
        .form-floating > label {
            color: var(--text-muted);
            padding: 1rem 0.75rem;
        }
        
        .form-floating > .form-control:focus ~ label,
        .form-floating > .form-control:not(:placeholder-shown) ~ label,
        .form-floating > .form-select ~ label {
            color: var(--bright-blue);
            opacity: 1;
            transform: scale(0.85) translateY(-0.75rem) translateX(0.15rem);
        }
        
        .form-check-input {
            background: var(--glass-deep);
            border-color: var(--border-blue);
        }
        
        .form-check-input:checked {
            background-color: var(--bright-blue);
            border-color: var(--bright-blue);
        }
        
        .form-check-label {
            color: var(--text-secondary);
        }
        
        .file-upload-area {
            border: 2px dashed var(--border-blue);
            border-radius: 16px;
            padding: 1.5rem;
            text-align: center;
            background: var(--glass-deep);
            color: var(--text-secondary);
            cursor: pointer;
            transition: all var(--transition-soft);
        }
        
        .file-upload-area:hover {
            border-color: var(--bright-blue);
            background: rgba(75, 139, 190, 0.05);
        }
        
        .btn-cancel, .btn-save-user {
            transition: all var(--transition-soft);
        }
        
        .btn-cancel:hover {
            background: rgba(255, 255, 255, 0.1);
            color: var(--pure-white);
            transform: translateY(-2px);
        }
        
        .btn-save-user:hover {
            background: var(--bright-blue-dark);
            transform: translateY(-2px);
            box-shadow: var(--shadow-blue);
        }
        
        /* Scrollable modal body for many fields */
        .modal-body {
            max-height: 70vh;
            overflow-y: auto;
        }
        
        .modal-body::-webkit-scrollbar {
            width: 8px;
        }
        
        .modal-body::-webkit-scrollbar-track {
            background: var(--glass-deep);
            border-radius: 10px;
        }
        
        .modal-body::-webkit-scrollbar-thumb {
            background: var(--bright-blue);
            border-radius: 10px;
        }
        
        .modal-body::-webkit-scrollbar-thumb:hover {
            background: var(--bright-blue-light);
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
            .user-list-header {
                flex-direction: column;
                gap: 1rem;
                align-items: flex-start;
            }
            .header-buttons {
                width: 100%;
                justify-content: space-between;
            }
        }
        
        /* Report Dropdown Styles */
.report-dropdown {
    position: relative;
    display: inline-block;
}

.report-btn {
    background: rgba(75, 139, 190, 0.1);
    border: 1px solid var(--border-blue);
    color: var(--soft-blue);
    border-radius: 40px;
    padding: 0.7rem 1.8rem;
    font-weight: 600;
    font-size: 0.95rem;
    display: flex;
    align-items: center;
    gap: 0.6rem;
    cursor: pointer;
}

.report-btn:hover {
    background: var(--bright-blue);
    color: var(--pure-white);
}

.report-menu {
    position: absolute;
    top: 100%;
    right: 0;
    margin-top: 0.5rem;
    background: var(--glass-deep-darker);
    border: 1px solid var(--border-blue);
    border-radius: 16px;
    padding: 0.5rem;
    min-width: 220px;
    z-index: 1000;
    display: none;
}

.report-dropdown.active .report-menu {
    display: block;
}

.report-menu-item {
    display: flex;
    align-items: center;
    gap: 0.8rem;
    padding: 0.7rem 1.2rem;
    border-radius: 12px;
    color: var(--soft-blue);
    cursor: pointer;
    width: 100%;
    background: none;
    border: none;
    text-align: left;
}

.report-menu-item:hover {
    background: rgba(75, 139, 190, 0.1);
    color: var(--pure-white);
}

.report-menu-item i {
    font-size: 1.2rem;
    width: 1.5rem;
}

/* DataTables Customization */
.dataTables_wrapper .dataTables_length,
.dataTables_wrapper .dataTables_filter {
    margin-bottom: 1.5rem;
    color: var(--text-secondary) !important;
}

.dataTables_wrapper .dataTables_length select,
.dataTables_wrapper .dataTables_filter input {
    background: rgba(255, 255, 255, 0.08) !important;
    border: 1px solid var(--border-blue) !important;
    color: var(--pure-white) !important;
    border-radius: 40px !important;
    padding: 0.5rem 1.2rem !important;
    font-size: 0.9rem !important;
}

.dataTables_wrapper .dataTables_length select option {
    background: var(--deep-blue-dark) !important;
    color: var(--pure-white) !important;
}

.dataTables_wrapper .dataTables_info {
    color: var(--text-secondary) !important;
    padding-top: 1.5rem !important;
    font-size: 0.9rem !important;
}

.dataTables_wrapper .dataTables_paginate {
    color: var(--text-secondary) !important;
    margin-top: 1.5rem !important;
    display: flex !important;
    justify-content: flex-end !important;
    gap: 0.5rem !important;
}

.dataTables_wrapper .dataTables_paginate .paginate_button {
    background: rgba(255, 255, 255, 0.05) !important;
    border: 1px solid var(--border-blue) !important;
    color: var(--soft-blue) !important;
    border-radius: 12px !important;
    margin: 0 2px !important;
    padding: 0.6rem 1.2rem !important;
    font-weight: 500 !important;
    transition: all var(--transition-soft) !important;
    cursor: pointer !important;
}

.dataTables_wrapper .dataTables_paginate .paginate_button.current {
    background: var(--bright-blue) !important;
    border-color: var(--bright-blue) !important;
    color: var(--pure-white) !important;
    font-weight: 600 !important;
    box-shadow: var(--shadow-blue) !important;
}

.dataTables_wrapper .dataTables_paginate .paginate_button:hover:not(.current) {
    background: rgba(75, 139, 190, 0.2) !important;
    border-color: var(--bright-blue) !important;
    color: var(--pure-white) !important;
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

            <!-- Manage Users dropdown - ACTIVE -->
            <div class="dropdown">
                <button class="dropdown-toggle active" type="button" data-bs-toggle="dropdown">
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

            <!-- Internship dropdown -->
            <div class="dropdown">
                <button class="dropdown-toggle" type="button" data-bs-toggle="dropdown">
                    <i class="bi bi-briefcase-fill"></i> <span>Internship</span>
                </button>
                <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="listInternship"><i class="bi bi-send"></i> <span>List Internship</span></a></li>
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
                    <li><a class="dropdown-item" href="applyInternship"><i class="bi bi-archive"></i> <span>New Application</span></a></li>
                </ul>
            </div>

            <!-- Reviews dropdown -->
            <div class="dropdown">
                <button class="dropdown-toggle" type="button" data-bs-toggle="dropdown">
                    <i class="bi bi-star-fill"></i> <span>Reviews</span>
                </button>
                <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="listReview"><i class="bi bi-star-half"></i> <span>All Reviews</span></a></li>
                    <li><a class="dropdown-item" href="review"><i class="bi bi-star"></i> <span>Add Review</span></a></li>
                </ul>
            </div>

            <!-- Certificates dropdown -->
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

            <div class="user-list-container">
                
                <!-- Header with title, back button, and add button -->
                <div class="user-list-header">
                    <h3>
                        <i class="bi bi-people-fill"></i> 
                        User Management
                    </h3>
                   <div style="display: flex; gap: 1rem;">
    <!-- Report Dropdown -->
    <div class="report-dropdown" id="reportDropdown">
        <button class="report-btn" id="reportBtn" type="button">
            <i class="bi bi-download"></i> Download Report
            <i class="bi bi-chevron-down"></i>
        </button>
        <div class="report-menu">
            <button class="report-menu-item" onclick="exportToPDF()"><i class="bi bi-file-pdf"></i> PDF</button>
            <button class="report-menu-item" onclick="exportToExcel()"><i class="bi bi-file-excel"></i> Excel</button>
            <button class="report-menu-item" onclick="exportToCSV()"><i class="bi bi-file-spreadsheet"></i> CSV</button>
            <button class="report-menu-item" onclick="exportToWord()"><i class="bi bi-file-word"></i> Word</button>
            <button class="report-menu-item" onclick="printReport()"><i class="bi bi-printer"></i> Print</button>
            <button class="report-menu-item" onclick="copyToClipboard()"><i class="bi bi-clipboard"></i> Copy</button>
        </div>
    </div>
    <a href="dashboard" class="btn-back">
        <i class="bi bi-arrow-left"></i> Back
    </a>
    <button class="btn-add-user" data-bs-toggle="modal" data-bs-target="#addUserModal">
        <i class="bi bi-plus-circle"></i> Add User
    </button>
</div>
                </div>

                <!-- Table with Sr, First Name, Email, Role, Status, Actions -->
                <div class="table-responsive">
                   <table id="usersTable" class="table table-hover align-middle">
                        <thead>
                            <tr>
                                <th width="8%">Sr No</th>
                                <th width="15%">First Name</th>
                                <th width="20%">Email</th>
                                <th width="10%">Role</th>
                                <th width="10%">Status</th>
                                <th width="22%">Actions</th>
                            </tr>
                        </thead>

                        <tbody>
                            <c:forEach var="user" items="${userList}" varStatus="s">
                                <tr>
                                    <td><strong>${s.count}</strong></td>
                                    <td>${user.firstName}</td>
                                    <td><i class="bi bi-envelope"></i> ${user.email}</td>
                                    <td>
                                        <span class="badge bg-primary">${user.role}</span>
                                    </td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${user.active}">
                                                <span class="badge bg-success">Active</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="badge bg-danger">Inactive</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>
                                        <div class="action-btns">
                                            <a href="/editUser?userId=${user.userId}" class="btn-sm btn-warning">
                                                <i class="bi bi-pencil-square"></i> Edit
                                            </a>
                                            <a href="deleteUser?userId=${user.userId}" class="btn-sm btn-danger" 
                                               onclick="return confirm('Are you sure you want to delete this user?');">
                                                <i class="bi bi-trash"></i> Delete
                                            </a>
                                            <a href="viewUser?userId=${user.userId}" class="btn-sm btn-secondary">
                                                <i class="bi bi-eye"></i> View
                                            </a>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>

                            <c:if test="${empty userList}">
                                <tr>
                                    <td colspan="6" class="empty-state">
                                        <i class="bi bi-inbox"></i>
                                        <p>No users found</p>
                                    </td>
                                </tr>
                            </c:if>
                        </tbody>
                    </table>
                </div>
            </div>

        </main>
    </div>

    <!-- ADD USER MODAL - Updated with all fields and submits to /register -->
    <div class="modal fade" id="addUserModal" tabindex="-1" aria-labelledby="addUserModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-xl modal-dialog-centered">
            <div class="modal-content" style="background: var(--glass-deep-darker); backdrop-filter: blur(12px); border: 1px solid var(--border-blue);">
                
                <div class="modal-header" style="border-bottom: 1px solid var(--border-blue);">
                    <h5 class="modal-title" style="color: var(--pure-white);">
                        <i class="bi bi-person-plus-fill" style="color: var(--bright-blue);"></i>
                        Add New User
                    </h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
                </div>
                
                <div class="modal-body">
                    <!-- Form submits to /register and redirects to listuser page -->
                    <form action="/saveuser" method="post" enctype="multipart/form-data">
                        
                        <div class="row g-4">
                            <!-- Left Column -->
                            <div class="col-md-6">
                                <div class="form-floating mb-3">
                                    <input type="text" class="form-control" id="firstName" name="firstName" placeholder="First Name" required>
                                    <label for="firstName">First Name *</label>
                                </div>
                                
                                <div class="form-floating mb-3">
                                    <input type="text" class="form-control" id="lastName" name="lastName" placeholder="Last Name" required>
                                    <label for="lastName">Last Name *</label>
                                </div>
                                
                                <div class="form-floating mb-3">
                                    <input type="email" class="form-control" id="email" name="email" placeholder="Email" required>
                                    <label for="email">Email Address *</label>
                                </div>
                                
                                <div class="form-floating mb-3">
                                    <input type="password" class="form-control" id="password" name="password" placeholder="Password" required>
                                    <label for="password">Password *</label>
                                </div>
                                
                                <div class="form-floating mb-3">
                                    <input type="tel" class="form-control" id="phone" name="phone" placeholder="Phone" required>
                                    <label for="phone">Phone Number *</label>
                                </div>
                                
                                <div class="form-floating mb-3">
                                    <select class="form-select" id="gender" name="gender" required>
                                        <option value="" disabled selected>-- Select Gender --</option>
                                        <option value="Male">Male</option>
                                        <option value="Female">Female</option>
                                        <option value="Other">Other</option>
                                    </select>
                                    <label for="gender">Gender *</label>
                                </div>
                            </div>
                            
                            <!-- Middle Column -->
                            <div class="col-md-6">
                                <div class="form-floating mb-3">
                                    <select class="form-select" id="role" name="role" required>
                                        <option value="" disabled selected>-- Select Role --</option>
                                        <option value="ADMIN">Admin</option>
                                        <option value="STUDENT">Student</option>
                                        <option value="EMPLOYER">Employer</option>
                                    </select>
                                    <label for="role">Role *</label>
                                </div>
                                
                                <div class="form-floating mb-3">
                                    <input type="text" class="form-control" id="qualification" name="qualification" placeholder="Qualification">
                                    <label for="qualification">Qualification</label>
                                </div>
                                
                                <div class="form-floating mb-3">
                                    <input type="text" class="form-control" id="city" name="city" placeholder="City">
                                    <label for="city">City</label>
                                </div>
                                
                                <div class="form-floating mb-3">
                                    <input type="text" class="form-control" id="state" name="state" placeholder="State">
                                    <label for="state">State</label>
                                </div>
                                
                                <div class="form-floating mb-3">
                                    <input type="text" class="form-control" id="country" name="country" placeholder="Country">
                                    <label for="country">Country</label>
                                </div>
                                
                                <div class="mb-3">
                                    <label class="form-label" style="color: var(--text-secondary);">Account Status</label>
                                    <div class="d-flex gap-4">
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" name="active" id="activeYes" value="true" checked>
                                            <label class="form-check-label" for="activeYes">Active</label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" name="active" id="activeNo" value="false">
                                            <label class="form-check-label" for="activeNo">Inactive</label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <!-- Profile Picture Row (full width) -->
                        <div class="row mt-3">
                            <div class="col-12">
                                <div class="mb-3">
                                    <label for="profilePic" class="form-label" style="color: var(--text-secondary);">Profile Picture</label>
                                    <div class="file-upload-area" onclick="document.getElementById('profilePic').click()">
                                        <i class="bi bi-cloud-arrow-up" style="color: var(--bright-blue); font-size: 2rem;"></i>
                                        <p class="mb-1">Click or drag to upload</p>
                                        <small>JPG, PNG or GIF (Max 2MB)</small>
                                        <input type="file" class="d-none" id="profilePic" name="profilePic" accept="image/*">
                                    </div>
                                    <!-- Hidden field for profilePicURL if needed -->
                                    <input type="hidden" name="profilePicURL" id="profilePicURL" value="">
                                </div>
                            </div>
                        </div>
                        
                        <div class="row mt-4">
                            <div class="col-12 d-flex justify-content-end gap-3">
                                <button type="button" class="btn-cancel" data-bs-dismiss="modal"
                                        style="background: transparent; color: var(--text-secondary); border: 1px solid var(--border-blue); border-radius: 40px; padding: 0.8rem 2rem;">
                                    <i class="bi bi-x-circle me-2"></i>Cancel
                                </button>
                                <button type="submit" class="btn-save-user"
                                        style="background: var(--bright-blue); color: var(--pure-white); border: none; border-radius: 40px; padding: 0.8rem 2rem;">
                                    <i class="bi bi-check-circle me-2"></i>Save User
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- FOOTER - EXACTLY LIKE DASHBOARD -->
    <footer class="dashboard-footer">
        2026 SmartIntern - Designed BY Rathod Darshan
    </footer>

    <!-- Scripts -->
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.13.6/js/dataTables.bootstrap5.min.js"></script>
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    
   <script>
    (function() {
        "use strict";

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

        // Initialize DataTable
        $(document).ready(function() {
            if ($('#usersTable').length > 0 && $('#usersTable tbody tr').length > 0) {
                $('#usersTable').DataTable({
                    pageLength: 10,
                    lengthMenu: [[5, 10, 25, 50, -1], [5, 10, 25, 50, "All"]],
                    language: {
                        search: "<i class='bi bi-search'></i> Search:",
                        lengthMenu: "Show _MENU_ entries",
                        info: "Showing _START_ to _END_ of _TOTAL_ users",
                        paginate: {
                            first: "First",
                            last: "Last",
                            next: "Next",
                            previous: "Previous"
                        }
                    },
                    columnDefs: [
                        { orderable: false, targets: [5] } // Disable sorting on Actions column
                    ],
                    autoWidth: false,
                    drawCallback: function() {
                        $('.dataTables_paginate').addClass('mt-3');
                    }
                });
            }
        });

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
            
            setTimeout(() => {
                if ($.fn.DataTable.isDataTable('#usersTable')) {
                    $('#usersTable').DataTable().columns.adjust().draw();
                }
            }, 300);
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
            
            setTimeout(() => {
                if ($.fn.DataTable.isDataTable('#usersTable')) {
                    $('#usersTable').DataTable().columns.adjust().draw();
                }
            }, 300);
        });

        fullscreenBtn.innerHTML = '<i class="bi bi-arrows-fullscreen"></i> Fullscreen';
        collapseText.innerText = 'Collapse';
        
        // File upload display
        document.getElementById('profilePic')?.addEventListener('change', function(e) {
            let fileName = e.target.files[0]?.name;
            if (fileName) {
                let uploadArea = document.querySelector('.file-upload-area p');
                if (uploadArea) {
                    uploadArea.innerHTML = '<i class="bi bi-check-circle-fill text-success"></i> ' + fileName;
                }
                document.getElementById('profilePicURL').value = '/uploads/' + fileName;
            }
        });

        // ========== REPORT DROPDOWN FUNCTIONS ==========
        const reportDropdown = document.getElementById('reportDropdown');
        const reportBtn = document.getElementById('reportBtn');

        if (reportBtn) {
            reportBtn.addEventListener('click', function(e) {
                e.preventDefault();
                e.stopPropagation();
                reportDropdown.classList.toggle('active');
            });
            
            document.addEventListener('click', function(e) {
                if (reportDropdown && !reportDropdown.contains(e.target)) {
                    reportDropdown.classList.remove('active');
                }
            });
        }

        // Make export functions globally accessible
        window.exportToPDF = exportToPDF;
        window.exportToExcel = exportToExcel;
        window.exportToCSV = exportToCSV;
        window.exportToWord = exportToWord;
        window.printReport = printReport;
        window.copyToClipboard = copyToClipboard;

        function getUserData() {
            var data = [['SR. NO.', 'FIRST NAME', 'EMAIL', 'ROLE', 'STATUS']];
            
            // Get all rows from the table body
            var rows = document.querySelectorAll('#usersTable tbody tr');
            
            for (var i = 0; i < rows.length; i++) {
                var cells = rows[i].querySelectorAll('td');
                if (cells.length >= 5) {
                    // Get SR NO
                    var srNo = cells[0] ? cells[0].innerText.trim() : '';
                    
                    // Get First Name
                    var firstName = cells[1] ? cells[1].innerText.trim() : '';
                    
                    // Get Email (remove any icon if present)
                    var email = cells[2] ? cells[2].innerHTML.replace(/<i[^>]*><\/i>/, '').trim() : '';
                    email = email.replace(/&nbsp;/g, '').trim();
                    
                    // Get Role
                    var roleSpan = cells[3] ? cells[3].querySelector('.badge') : null;
                    var role = roleSpan ? roleSpan.innerText.trim() : (cells[3] ? cells[3].innerText.trim() : '');
                    
                    // Get Status
                    var statusSpan = cells[4] ? cells[4].querySelector('.badge') : null;
                    var status = statusSpan ? statusSpan.innerText.trim() : (cells[4] ? cells[4].innerText.trim() : '');
                    
                    data.push([srNo, firstName, email, role, status]);
                }
            }
            return data;
        }

        function exportToPDF() {
            var data = getUserData();
            if (data.length <= 1) { 
                alert('No data to export!'); 
                return; 
            }
            
            var win = window.open('', '_blank');
            var html = '<!DOCTYPE html><html><head><title>Users Report</title><style>';
            html += 'body{font-family:"Segoe UI",Arial,sans-serif;margin:40px;padding:20px}';
            html += 'h1{color:#2C3E50;text-align:center;margin-bottom:10px}';
            html += '.header{text-align:center;margin-bottom:30px;border-bottom:2px solid #4B8BBE;padding-bottom:20px}';
            html += '.header p{color:#666;margin:5px 0}';
            html += 'table{width:100%;border-collapse:collapse;margin-top:20px}';
            html += 'th{background-color:#4B8BBE;color:white;padding:12px;text-align:left;font-weight:bold}';
            html += 'td{padding:10px;border-bottom:1px solid #ddd}';
            html += 'tr:hover{background-color:#f5f5f5}';
            html += '.footer{margin-top:30px;text-align:center;font-size:12px;color:#999;border-top:1px solid #ddd;padding-top:20px}';
            html += '.status-active{color:#10b981;font-weight:bold}';
            html += '.status-inactive{color:#ef4444;font-weight:bold}';
            html += '</style></head><body>';
            html += '<div class="header">';
            html += '<h1>SmartIntern - Users Report</h1>';
            html += '<p>Generated on: ' + new Date().toLocaleString() + '</p>';
            html += '<p>Total Users: ' + (data.length - 1) + '</p>';
            html += '</div>';
            html += '<table border="1" cellpadding="8" cellspacing="0" style="width:100%;border-collapse:collapse;">';
            html += '<thead><tr>';
            for (var j = 0; j < data[0].length; j++) {
                html += '<th style="background:#4B8BBE;color:white;padding:12px;">' + data[0][j] + '</th>';
            }
            html += '</tr></thead><tbody>';
            
            for (var i = 1; i < data.length; i++) {
                var row = data[i];
                var status = row[4] ? row[4].toString().trim() : '';
                var statusStyle = (status === 'Active') ? 'color:#10b981;font-weight:bold;' : 'color:#ef4444;font-weight:bold;';
                
                html += '<tr>';
                for (var j = 0; j < row.length; j++) {
                    if (j === 4) {
                        html += '<td style="padding:10px;border-bottom:1px solid #ddd;' + statusStyle + '">' + (row[j] || '') + '</td>';
                    } else {
                        html += '<td style="padding:10px;border-bottom:1px solid #ddd;">' + (row[j] || '') + '</td>';
                    }
                }
                html += '</tr>';
            }
            
            html += '</tbody></table>';
            html += '<div class="footer">';
            html += '<p>This is a system-generated report from SmartIntern Platform</p>';
            html += '<p>&copy; 2026 SmartIntern - All Rights Reserved</p>';
            html += '</div>';
            html += '</body></html>';
            
            win.document.write(html);
            win.document.close();
            win.print();
        }

        function exportToExcel() {
            var data = getUserData();
            if (data.length <= 1) { 
                alert('No data to export!'); 
                return; 
            }
            
            var html = '<html><head><meta charset="UTF-8"><title>Users Report</title></head><body>';
            html += '<table border="1">';
            for (var i = 0; i < data.length; i++) {
                html += '<tr>';
                for (var j = 0; j < data[i].length; j++) {
                    var tag = (i === 0) ? 'th' : 'td';
                    html += '<' + tag + '>' + (data[i][j] || '') + '</' + tag + '>';
                }
                html += '</tr>';
            }
            html += '</table></body></html>';
            
            var blob = new Blob([html], { type: 'application/vnd.ms-excel' });
            var link = document.createElement('a');
            link.href = URL.createObjectURL(blob);
            link.download = 'Users_Report_' + new Date().toISOString().slice(0,10) + '.xls';
            link.click();
            URL.revokeObjectURL(link.href);
        }

        function exportToCSV() {
            var data = getUserData();
            if (data.length <= 1) { 
                alert('No data to export!'); 
                return; 
            }
            
            var csv = '';
            for (var i = 0; i < data.length; i++) {
                var row = [];
                for (var j = 0; j < data[i].length; j++) {
                    var value = data[i][j] || '';
                    // Escape quotes and wrap in quotes if contains comma
                    if (value.includes(',') || value.includes('"') || value.includes('\n')) {
                        value = '"' + value.replace(/"/g, '""') + '"';
                    }
                    row.push(value);
                }
                csv += row.join(',') + '\n';
            }
            
            var blob = new Blob(["\uFEFF" + csv], { type: 'text/csv;charset=utf-8;' });
            var link = document.createElement('a');
            link.href = URL.createObjectURL(blob);
            link.download = 'Users_Report_' + new Date().toISOString().slice(0,10) + '.csv';
            link.click();
            URL.revokeObjectURL(link.href);
        }

        function exportToWord() {
            var data = getUserData();
            if (data.length <= 1) { 
                alert('No data to export!'); 
                return; 
            }
            
            var html = '<html><head><meta charset="UTF-8"><title>Users Report</title>';
            html += '<style>table{border-collapse:collapse;width:100%}th,td{border:1px solid #000;padding:8px}th{background:#4B8BBE;color:white}</style>';
            html += '</head><body>';
            html += '<h1>SmartIntern - Users Report</h1>';
            html += '<p>Generated: ' + new Date().toLocaleString() + '</p>';
            html += '<p>Total Users: ' + (data.length - 1) + '</p>';
            html += '<table border="1" cellpadding="5" cellspacing="0">';
            for (var i = 0; i < data.length; i++) {
                html += '<tr>';
                for (var j = 0; j < data[i].length; j++) {
                    var tag = (i === 0) ? 'th' : 'td';
                    html += '<' + tag + '>' + (data[i][j] || '') + '</' + tag + '>';
                }
                html += '</tr>';
            }
            html += '</table></body></html>';
            
            var blob = new Blob([html], { type: 'application/msword' });
            var link = document.createElement('a');
            link.href = URL.createObjectURL(blob);
            link.download = 'Users_Report_' + new Date().toISOString().slice(0,10) + '.doc';
            link.click();
            URL.revokeObjectURL(link.href);
        }

        function printReport() {
            var data = getUserData();
            if (data.length <= 1) { 
                alert('No data to print!'); 
                return; 
            }
            
            var win = window.open('', '_blank');
            var html = '<html><head><title>Print Users Report</title>';
            html += '<style>';
            html += 'body{font-family:Arial,sans-serif;margin:20px}';
            html += 'table{border-collapse:collapse;width:100%;margin-top:20px}';
            html += 'th{background:#4B8BBE;color:white;padding:10px;text-align:left}';
            html += 'td{padding:8px;border-bottom:1px solid #ddd}';
            html += 'h1{color:#2C3E50}';
            html += '.header{text-align:center;margin-bottom:30px}';
            html += '.footer{margin-top:30px;text-align:center;font-size:12px;color:#999}';
            html += '@media print{.no-print{display:none}}';
            html += '</style>';
            html += '</head><body>';
            html += '<button class="no-print" onclick="window.print()" style="margin-bottom:20px;padding:10px 20px;cursor:pointer">Print</button>';
            html += '<div class="header">';
            html += '<h1>SmartIntern - Users Report</h1>';
            html += '<p>Generated: ' + new Date().toLocaleString() + '</p>';
            html += '<p>Total Users: ' + (data.length - 1) + '</p>';
            html += '</div>';
            html += '<table>';
            html += '<thead><tr>';
            for (var j = 0; j < data[0].length; j++) {
                html += '<th>' + data[0][j] + '</th>';
            }
            html += '</tr></thead><tbody>';
            for (var i = 1; i < data.length; i++) {
                html += '<tr>';
                for (var j = 0; j < data[i].length; j++) {
                    html += '<td>' + (data[i][j] || '') + '</td>';
                }
                html += '</tr>';
            }
            html += '</tbody></table>';
            html += '<div class="footer">';
            html += '<p>&copy; 2026 SmartIntern - All Rights Reserved</p>';
            html += '</div>';
            html += '</body></html>';
            win.document.write(html);
            win.document.close();
        }

        function copyToClipboard() {
            var data = getUserData();
            if (data.length <= 1) { 
                alert('No data to copy!'); 
                return; 
            }
            
            var text = '';
            for (var i = 0; i < data.length; i++) {
                text += data[i].join('\t') + '\n';
            }
            
            navigator.clipboard.writeText(text).then(function() {
                var original = reportBtn.innerHTML;
                reportBtn.innerHTML = '<i class="bi bi-check-circle"></i> Copied!';
                setTimeout(function() { 
                    reportBtn.innerHTML = original; 
                    if(reportDropdown) reportDropdown.classList.remove('active'); 
                }, 2000);
            }).catch(function() {
                alert('Failed to copy! Please try again.');
            });
        }
    })();
</script>

    <!-- Additional styles for dropdown animations -->
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