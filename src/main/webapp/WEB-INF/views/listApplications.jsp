<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SmartIntern · Applications List</title>

    <!-- Bootstrap & Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">
    
    <!-- DataTables -->
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/dataTables.bootstrap5.min.css">
    
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
           LAYOUT
           ======================================================== */
        .dashboard-layout {
            display: flex;
            min-height: calc(100vh - var(--header-height));
        }

        /* ========================================================
           SIDEBAR
           ======================================================== */
        .nav-sidebar {
            width: var(--sidebar-width);
            background: var(--glass-deep-darker);
            backdrop-filter: blur(12px);
            border-right: 1px solid var(--border-blue);
            padding: 2rem 1.2rem;
            box-shadow: var(--shadow-lg);
            transition: width 0.3s var(--transition-elegant), padding 0.3s ease;
            border-radius: 0 30px 30px 0;
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
            font-size: 0.95rem;
            font-weight: 500;
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
        }

        /* ========================================================
           MAIN PANEL
           ======================================================== */
        .main-panel {
            flex: 1;
            padding: 2.5rem;
            background: transparent;
            width: calc(100% - var(--sidebar-width));
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

        .btn-add {
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
            text-decoration: none;
        }

        .btn-add:hover {
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
           TABLE CONTAINER - IMPROVED SPACING
           ======================================================== */
        .table-container {
            background: var(--glass-deep);
            backdrop-filter: blur(12px);
            border-radius: 24px;
            border: 1px solid var(--border-blue);
            padding: 2rem;
            box-shadow: var(--shadow-md);
            overflow: hidden;
        }

        /* ========================================================
           TABLE STYLES - OPTIMIZED SPACING
           ======================================================== */
        .table {
            margin-bottom: 0;
            width: 100%;
            border-collapse: separate;
            border-spacing: 0 8px;
            color: var(--text-secondary) !important;
        }

        .table thead th {
            color: var(--pure-white) !important;
            font-weight: 700;
            font-size: 0.85rem;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            border-bottom: 2px solid var(--bright-blue) !important;
            padding: 1.2rem 1rem !important;
            background: transparent !important;
            text-align: left;
        }

        /* Column width distribution */
        .table thead th:nth-child(1) { width: 8%; }   /* Sr. No. */
        .table thead th:nth-child(2) { width: 27%; }  /* Internship */
        .table thead th:nth-child(3) { width: 25%; }  /* Student Name */
        .table thead th:nth-child(4) { width: 15%; }  /* Status */
        .table thead th:nth-child(5) { width: 25%; }  /* Actions */

        .table tbody tr {
            border-bottom: 1px solid var(--border-blue) !important;
            transition: all var(--transition-soft);
            background: rgba(44, 62, 80, 0.3) !important;
            border-radius: 12px !important;
            margin-bottom: 8px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        }

        .table tbody tr:hover {
            background: rgba(75, 139, 190, 0.15) !important;
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
        }

        .table tbody td {
            padding: 1.2rem 1rem !important;
            color: var(--text-secondary) !important;
            background: transparent !important;
            vertical-align: middle;
            border: none;
        }

        .table tbody td:first-child {
            border-top-left-radius: 12px;
            border-bottom-left-radius: 12px;
        }

        .table tbody td:last-child {
            border-top-right-radius: 12px;
            border-bottom-right-radius: 12px;
        }

        .table tbody td strong {
            color: var(--pure-white) !important;
            font-weight: 600;
            background: rgba(75, 139, 190, 0.2);
            padding: 0.3rem 0.8rem;
            border-radius: 20px;
            display: inline-block;
        }

        /* Fix for any white backgrounds in table */
        .table, .table * {
            background-color: transparent !important;
        }

        /* DataTables wrapper background fix */
        .dataTables_wrapper {
            background: transparent !important;
        }

        .dataTables_length, 
        .dataTables_filter, 
        .dataTables_info, 
        .dataTables_paginate {
            color: var(--text-secondary) !important;
            background: transparent !important;
            margin-bottom: 1.5rem;
        }

        /* Status Badges - Enhanced */
        .badge-custom {
            padding: 0.6rem 1.2rem;
            border-radius: 40px;
            font-weight: 600;
            font-size: 0.85rem;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            border: 1px solid transparent;
            width: fit-content;
            white-space: nowrap;
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

        .badge-default {
            background: rgba(255, 255, 255, 0.1);
            color: var(--text-muted);
            border: 1px solid var(--border-blue);
        }

        /* Action Buttons - Enhanced with better spacing */
        .action-btns {
            display: flex;
            gap: 0.8rem;
            flex-wrap: wrap;
            justify-content: flex-start;
        }

        .btn-sm {
            padding: 0.5rem 1.2rem;
            border-radius: 40px;
            font-size: 0.8rem;
            font-weight: 600;
            transition: all var(--transition-soft);
            border: 1px solid transparent;
            display: inline-flex;
            align-items: center;
            gap: 0.6rem;
            text-decoration: none;
            white-space: nowrap;
            letter-spacing: 0.3px;
        }

        .btn-view-details {
            background: rgba(6, 182, 212, 0.15);
            color: #67e8f9;
            border: 1px solid rgba(6, 182, 212, 0.3);
        }

        .btn-view-details:hover {
            background: #06b6d4;
            color: white;
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(6, 182, 212, 0.3);
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

        /* Empty State */
        .empty-state {
            text-align: center;
            padding: 4rem 2rem;
        }

        .empty-state i {
            font-size: 4rem;
            color: var(--bright-blue);
            margin-bottom: 1.5rem;
            opacity: 0.7;
        }

        .empty-state h5 {
            color: var(--pure-white);
            margin-bottom: 0.8rem;
            font-size: 1.5rem;
            font-weight: 600;
        }

        .empty-state p {
            color: var(--text-muted);
            margin-bottom: 2rem;
            font-size: 1rem;
        }

        /* DataTables Customization - Improved */
        .dataTables_wrapper .dataTables_length,
        .dataTables_wrapper .dataTables_filter {
            margin-bottom: 2rem;
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
            padding: 0.5rem !important;
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
            display: inline-block !important;
            font-size: 0.9rem !important;
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

        /* ========================================================
           FOOTER
           ======================================================== */
        .dashboard-footer {
            background: var(--glass-deep-darker);
            backdrop-filter: blur(12px);
            color: var(--medium-grey);
            text-align: center;
            padding: 1.5rem;
            font-size: 0.9rem;
            border-top: 1px solid var(--border-blue);
        }

        /* ========================================================
           RESPONSIVE
           ======================================================== */
        @media (max-width: 1200px) {
            .main-panel { padding: 2rem; }
            .table thead th:nth-child(2) { width: 25%; }
            .table thead th:nth-child(3) { width: 23%; }
            .table thead th:nth-child(5) { width: 27%; }
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
            .page-header {
                flex-direction: column;
                align-items: flex-start;
            }
            .table thead th {
                font-size: 0.75rem;
                padding: 1rem 0.6rem !important;
            }
            .table tbody td {
                padding: 1rem 0.6rem !important;
                font-size: 0.9rem;
            }
            .action-btns {
                flex-direction: column;
                gap: 0.5rem;
            }
            .btn-sm {
                width: 100%;
                justify-content: center;
                padding: 0.5rem 0.8rem;
                font-size: 0.75rem;
            }
            .badge-custom {
                padding: 0.4rem 0.8rem;
                font-size: 0.75rem;
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

        <!-- SIDEBAR -->
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

            <!-- Applications dropdown - ACTIVE -->
            <div class="dropdown">
                <button class="dropdown-toggle active" type="button" data-bs-toggle="dropdown">
                    <i class="bi bi-send-fill"></i> <span>Applications</span>
                </button>
                <ul class="dropdown-menu">
                    <li><a class="dropdown-item active" href="listapplications"><i class="bi bi-envelope-open"></i> <span>All Applications</span></a></li>
                    <li><a class="dropdown-item" href="applyInternship"><i class="bi bi-archive"></i> <span>Apply New</span></a></li>
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
                    <li><a class="dropdown-item" href="listCertificate"><i class="bi bi-file-pdf"></i> <span>List Certificates</span></a></li>
                    <li><a class="dropdown-item" href="certificate"><i class="bi bi-download"></i> <span>Add Certificate</span></a></li>
                </ul>
            </div>
        </aside>

        <!-- MAIN PANEL -->
        <main class="main-panel" id="mainPanel">

            <!-- Page Header -->
            <div class="page-header">
                <div class="page-title">
                    <i class="bi bi-send-fill"></i>
                    Applications List
                </div>
                <div style="display: flex; gap: 1rem;">
                    <a href="applyInternship" class="btn-add">
                        <i class="bi bi-plus-lg"></i> New Application
                    </a>
                    <a href="dashboard" class="btn-back">
                        <i class="bi bi-arrow-left"></i> Back
                    </a>
                </div>
            </div>

            <!-- Applications Table -->
            <div class="table-container">
                <c:choose>
                    <c:when test="${not empty applications}">
                        <div class="table-responsive">
                            <table id="applicationsTable" class="table align-middle">
                                <thead>
                                    <tr>
                                        <th>Sr. No.</th>
                                        <th>Internship</th>
                                        <th>Student Name</th>
                                        <th>Status</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="app" items="${applications}" varStatus="status">
                                        <tr>
                                            <td><strong>${status.index + 1}</strong></td>
                                            
                                            <!-- Internship Details - Only title, no ID -->
                                            <td>
                                                ${app.internship.title}
                                            </td>
                                            
                                            <!-- Student Details - Only full name, no ID or email -->
                                            <td>
                                                ${app.student.firstName} ${app.student.lastName}
                                            </td>
                                            
                                            <td>
                                                <c:choose>
                                                    <c:when test="${app.applicationStatus == 'APPLIED'}">
                                                        <span class="badge-custom badge-applied">
                                                            <i class="bi bi-clock"></i> Applied
                                                        </span>
                                                    </c:when>
                                                    <c:when test="${app.applicationStatus == 'SHORTLISTED'}">
                                                        <span class="badge-custom badge-shortlisted">
                                                            <i class="bi bi-star"></i> Shortlisted
                                                        </span>
                                                    </c:when>
                                                    <c:when test="${app.applicationStatus == 'SELECTED'}">
                                                        <span class="badge-custom badge-selected">
                                                            <i class="bi bi-check-circle"></i> Selected
                                                        </span>
                                                    </c:when>
                                                    <c:when test="${app.applicationStatus == 'REJECTED'}">
                                                        <span class="badge-custom badge-rejected">
                                                            <i class="bi bi-x-circle"></i> Rejected
                                                        </span>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span class="badge-custom badge-default">${app.applicationStatus}</span>
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                            
                                            <td>
                                                <div class="action-btns">
                                                    <a href="/viewApplication?applicationId=${app.applicationId}" 
                                                       class="btn-sm btn-view-details"
                                                       title="View Details">
                                                       <i class="bi bi-eye-fill"></i> View
                                                    </a>
                                                    <a href="/editApplication?applicationId=${app.applicationId}" 
                                                       class="btn-sm btn-edit"
                                                       title="Edit Application">
                                                       <i class="bi bi-pencil-square"></i> Edit
                                                    </a>
                                                    <a href="/deleteApplication?applicationId=${app.applicationId}" 
                                                       class="btn-sm btn-delete"
                                                       title="Delete"
                                                       onclick="return confirm('Are you sure you want to delete this application?')">
                                                       <i class="bi bi-trash-fill"></i> Delete
                                                    </a>
                                                </div>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </c:when>
                    
                    <c:otherwise>
                        <div class="empty-state">
                            <i class="bi bi-inbox"></i>
                            <h5>No Applications Found</h5>
                            <p>There are no internship applications in the system yet.</p>
                            <a href="applyInternship" class="btn-add" style="display: inline-flex;">
                                <i class="bi bi-plus-lg"></i> Create New Application
                            </a>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>

        </main>
    </div>

    <!-- FOOTER -->
    <footer class="dashboard-footer">
        2026 SmartIntern — Application Management System
    </footer>

    <!-- Scripts -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.6/js/dataTables.bootstrap5.min.js"></script>

    <script>
        (function() {
            "use strict";

            const layout = document.getElementById('dashboardLayout');
            const sidebar = document.getElementById('mainSidebar');
            const toggleBtn = document.getElementById('toggleCollapseBtn');
            const fullscreenBtn = document.getElementById('fullscreenModeBtn');
            const collapseText = document.getElementById('collapseText');

            // Initialize DataTable if table exists and has data
            $(document).ready(function() {
                if ($('#applicationsTable').length > 0) {
                    $('#applicationsTable').DataTable({
                        pageLength: 10,
                        lengthMenu: [[5, 10, 25, 50, -1], [5, 10, 25, 50, "All"]],
                        language: {
                            search: "<i class='bi bi-search'></i> Search:",
                            lengthMenu: "Show _MENU_ entries",
                            info: "Showing _START_ to _END_ of _TOTAL_ applications",
                            paginate: {
                                first: "First",
                                last: "Last",
                                next: "Next",
                                previous: "Previous"
                            }
                        },
                        columnDefs: [
                            { orderable: false, targets: [4] } // Disable sorting on Actions column
                        ],
                        // Improve spacing and layout
                        autoWidth: false,
                        drawCallback: function() {
                            $('.dataTables_paginate').addClass('mt-3');
                        }
                    });
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
                
                // Redraw DataTable after animation
                setTimeout(() => {
                    if ($.fn.DataTable.isDataTable('#applicationsTable')) {
                        $('#applicationsTable').DataTable().columns.adjust().draw();
                    }
                }, 300);
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
                
                setTimeout(() => {
                    if ($.fn.DataTable.isDataTable('#applicationsTable')) {
                        $('#applicationsTable').DataTable().columns.adjust().draw();
                    }
                }, 300);
            });

            fullscreenBtn.innerHTML = '<i class="bi bi-arrows-fullscreen"></i> Fullscreen';
            collapseText.innerText = 'Collapse';
        })();
    </script>

</body>
</html>