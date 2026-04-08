<%-- listInternship.jsp (UPDATED with Dashboard Sidebar) --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>SmartIntern · List Internships</title>

  <!-- Bootstrap & Icons -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">
  
  <!-- DataTables -->
  <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/dataTables.bootstrap5.min.css">
  
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

    .d-flex.align-items-center.gap-3 {
        display: flex;
        align-items: center;
        gap: 1rem;
        flex-wrap: wrap;
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
    transition: all var(--transition-soft);
    text-decoration: none;
    cursor: pointer;
}

.report-btn:hover {
    background: var(--bright-blue);
    border-color: var(--bright-blue);
    color: var(--pure-white);
    transform: translateY(-2px);
    box-shadow: var(--shadow-blue);
}

.report-menu {
    position: absolute;
    top: 100%;
    right: 0;
    margin-top: 0.5rem;
    background: var(--glass-deep-darker);
    backdrop-filter: blur(12px);
    border: 1px solid var(--border-blue);
    border-radius: 16px;
    padding: 0.5rem;
    min-width: 220px;
    z-index: 1000;
    box-shadow: var(--shadow-lg);
    display: none;
}

.report-dropdown.active .report-menu {
    display: block;
    animation: menuExpand 0.3s var(--transition-bounce);
}

.report-menu-item {
    display: flex;
    align-items: center;
    gap: 0.8rem;
    padding: 0.7rem 1.2rem;
    border-radius: 12px;
    color: var(--soft-blue);
    text-decoration: none;
    transition: all var(--transition-soft);
    cursor: pointer;
    font-size: 0.9rem;
    width: 100%;
    background: none;
    border: none;
    text-align: left;
}

.report-menu-item:hover {
    background: rgba(75, 139, 190, 0.1);
    color: var(--pure-white);
    transform: translateX(5px);
}

.report-menu-item i {
    font-size: 1.2rem;
    width: 1.5rem;
}

.report-menu-item.pdf:hover i { color: #ef4444; }
.report-menu-item.excel:hover i { color: #10b981; }
.report-menu-item.csv:hover i { color: #3b82f6; }
.report-menu-item.word:hover i { color: #3b82f6; }
.report-menu-item.print:hover i { color: #8b5cf6; }
.report-menu-item.copy:hover i { color: #f59e0b; }

@keyframes menuExpand {
    from {
        opacity: 0;
        transform: translateY(-10px) scaleY(0.8);
    }
    to {
        opacity: 1;
        transform: translateY(0) scaleY(1);
    }
}

    .btn-add:hover {
        background: var(--bright-blue);
        border-color: var(--bright-blue);
        color: var(--pure-white);
        transform: translateY(-2px);
        box-shadow: var(--shadow-blue);
    }

    /* ========================================================
       TABLE CARD - MATCHING DASHBOARD STYLE
       ======================================================== */
    .table-card {
        background: var(--glass-deep);
        backdrop-filter: blur(12px);
        -webkit-backdrop-filter: blur(12px);
        border-radius: 24px;
        border: 1px solid var(--border-blue);
        padding: 1.8rem;
        box-shadow: var(--shadow-md);
        transition: all var(--transition-elegant);
        overflow: hidden;
    }

    .table-card:hover {
        border-color: var(--bright-blue);
        box-shadow: var(--shadow-lg), var(--shadow-blue);
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

    .sr-no {
        font-weight: 600;
        color: var(--pure-white) !important;
    }

    /* Badge Styles */
    .badge-status {
        padding: 0.4rem 1rem;
        border-radius: 40px;
        font-size: 0.8rem;
        font-weight: 600;
        display: inline-block;
    }

    .badge-open {
        background: rgba(16, 185, 129, 0.15);
        color: #34d399;
        border: 1px solid rgba(16, 185, 129, 0.3);
    }
    
    /* Add these styles around line 245 */
.badge-upcoming {
    background: rgba(245, 158, 11, 0.15);
    color: #fbbf24;
    border: 1px solid rgba(245, 158, 11, 0.3);
}

.badge-default {
    background: rgba(168, 168, 168, 0.15);
    color: var(--medium-grey);
    border: 1px solid rgba(168, 168, 168, 0.3);
}

    .badge-closed {
        background: rgba(239, 68, 68, 0.15);
        color: #f87171;
        border: 1px solid rgba(239, 68, 68, 0.3);
    }

    /* Action Buttons */
    .action-btn {
        padding: 0.4rem 0.8rem;
        border-radius: 30px;
        margin: 0 0.2rem;
        display: inline-block;
        text-decoration: none;
        transition: all var(--transition-soft);
    }

    .btn-view {
        background: rgba(75, 139, 190, 0.1);
        color: var(--soft-blue);
        border: 1px solid rgba(75, 139, 190, 0.3);
    }

    .btn-view:hover {
        background: var(--bright-blue);
        color: white;
        transform: translateY(-2px);
        border-color: var(--bright-blue);
    }

    .btn-edit {
        background: rgba(245, 158, 11, 0.1);
        color: #fbbf24;
        border: 1px solid rgba(245, 158, 11, 0.3);
    }

    .btn-edit:hover {
        background: #f59e0b;
        color: white;
        transform: translateY(-2px);
        border-color: #f59e0b;
    }

    .btn-delete {
        background: rgba(239, 68, 68, 0.1);
        color: #f87171;
        border: 1px solid rgba(239, 68, 68, 0.3);
    }

    .btn-delete:hover {
        background: #ef4444;
        color: white;
        transform: translateY(-2px);
        border-color: #ef4444;
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

    .empty-state h5 {
        color: var(--pure-white);
        margin-bottom: 0.5rem;
    }

    .empty-state p {
        color: var(--text-secondary);
    }

    /* DataTables Customization */
    .dataTables_wrapper .dataTables_length,
    .dataTables_wrapper .dataTables_filter,
    .dataTables_wrapper .dataTables_info,
    .dataTables_wrapper .dataTables_paginate {
        color: var(--text-secondary) !important;
        margin: 1rem 0;
    }

    .dataTables_wrapper .dataTables_length select,
    .dataTables_wrapper .dataTables_filter input {
        background: rgba(255, 255, 255, 0.05);
        border: 1px solid var(--border-blue);
        color: var(--pure-white);
        border-radius: 8px;
        padding: 0.3rem 0.5rem;
    }

    .dataTables_wrapper .dataTables_paginate .paginate_button {
        color: var(--text-secondary) !important;
        border: 1px solid var(--border-blue) !important;
        background: transparent !important;
        border-radius: 8px !important;
        margin: 0 0.2rem;
    }

    .dataTables_wrapper .dataTables_paginate .paginate_button.current {
        background: var(--bright-blue) !important;
        color: white !important;
        border-color: var(--bright-blue) !important;
    }

    .dataTables_wrapper .dataTables_paginate .paginate_button:hover {
        background: rgba(75, 139, 190, 0.2) !important;
        color: var(--pure-white) !important;
        border-color: var(--bright-blue) !important;
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
        .page-header {
            flex-direction: column;
            align-items: flex-start;
        }
        .d-flex.align-items-center.gap-3 {
            flex-direction: column;
            align-items: flex-start;
            width: 100%;
        }
        .btn-back, .btn-add {
            width: 100%;
            justify-content: center;
        }
    }
  </style>
</head>
<body>

  <!-- ==================== HEADER - EXACTLY LIKE DASHBOARD ==================== -->
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

  <!-- ==================== LAYOUT ==================== -->
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

    <!-- ========== MAIN PANEL - INTERNSHIP LIST CONTENT (UNTOUCHED LOGIC) ========== -->
    <main class="main-panel" id="mainPanel">
      
      <!-- Page Header with Back Button and Add Button -->
     <!-- Page Header with Back Button, Report Dropdown and Add Button -->
<div class="page-header">
    <div class="d-flex align-items-center gap-3">
        <a href="dashboard" class="btn-back">
            <i class="bi bi-arrow-left"></i> Back to Dashboard
        </a>
        <h2 class="page-title">
            <i class="bi bi-briefcase"></i>
            Internships List
        </h2>
    </div>
    <div class="d-flex gap-2">
        <!-- Report Dropdown -->
        <div class="report-dropdown" id="reportDropdown">
            <button class="report-btn" id="reportBtn" type="button">
                <i class="bi bi-download"></i> Download Report
                <i class="bi bi-chevron-down"></i>
            </button>
            <div class="report-menu" id="reportMenu">
                <button class="report-menu-item pdf" onclick="exportToPDF()">
                    <i class="bi bi-file-pdf"></i> PDF Document
                </button>
                <button class="report-menu-item excel" onclick="exportToExcel()">
                    <i class="bi bi-file-excel"></i> Excel (XLSX)
                </button>
                <button class="report-menu-item csv" onclick="exportToCSV()">
                    <i class="bi bi-file-spreadsheet"></i> CSV File
                </button>
                <button class="report-menu-item word" onclick="exportToWord()">
                    <i class="bi bi-file-word"></i> Word Document
                </button>
                <button class="report-menu-item print" onclick="printReport()">
                    <i class="bi bi-printer"></i> Print Report
                </button>
                <button class="report-menu-item copy" onclick="copyToClipboard()">
                    <i class="bi bi-clipboard"></i> Copy to Clipboard
                </button>
            </div>
        </div>
        <a href="addInternship" class="btn-add">
            <i class="bi bi-plus-lg"></i> Add New Internship
        </a>
    </div>
</div>

      <!-- Table Card -->
      <div class="table-card">
        <table id="internshipTable" class="table table-hover">
          <thead>
            <tr>
              <th>Sr. No.</th>
              <th>Title</th>
              <th>Employer</th>
              <th>Type</th>
              <th>Status</th>
              <th>Actions</th>
            </tr>
          </thead>
          <tbody>
            <c:choose>
              <c:when test="${empty internshipList}">
                <tr>
                  <td colspan="6" class="empty-state">
                    <i class="bi bi-briefcase"></i>
                    <h5>No Internships Found</h5>
                    <p>Click "Add New Internship" to create your first internship posting.</p>
                  </td>
                </tr>
              </c:when>
              <c:otherwise>
                <c:forEach items="${internshipList}" var="internship" varStatus="status">
                  <tr>
                    <td><span class="sr-no">${status.count}</span></td>
                    <td>${internship.title}</td>
                    <td>${internship.employer.companyName}</td>
                    <td>${internship.internshipType}</td>
                    <td>
                      <c:choose>
                        <c:when test="${internship.status eq 'OPEN'}">
                          <span class="badge-status badge-open">OPEN</span>
                        </c:when>
                        
                        <c:when test="${internship.status eq 'UPCOMING'}">
                        <span class="badge-status badge-upcoming">UPCOMING</span>
                           </c:when>
                        <c:otherwise>
                          <span class="badge-status badge-closed">CLOSED</span>
                        </c:otherwise>
                      </c:choose>
                    </td>
                    <td>
                     <a href="viewInternship?internshipId=${internship.internshipId}" 
   class="action-btn btn-view" 
   title="View"
   onclick="console.log('View clicked for ID: ${internship.internshipId}')">
    <i class="bi bi-eye"></i>
</a>
<a href="Internshipedit?internshipId=${internship.internshipId}" 
   class="action-btn btn-edit"
   onclick="console.log('Edit clicked for ID: ${internship.internshipId}')">
    <i class="bi bi-pencil"></i>
</a>
                      <a href="deleteInternship?internshipId=${internship.internshipId}" class="action-btn btn-delete" title="Delete" onclick="return confirm('Are you sure you want to delete this internship?')">
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
    </main>
  </div>

  <!-- ==================== FOOTER - EXACTLY LIKE DASHBOARD ==================== -->
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

    if (toggleBtn) {
      toggleBtn.addEventListener('click', function(e) {
        e.preventDefault();
        if (layout.classList.contains('fullscreen')) {
          layout.classList.remove('fullscreen');
        }
        sidebar.classList.toggle('collapsed');
        collapseText.innerText = sidebar.classList.contains('collapsed') ? 'Expand' : 'Collapse';
      });
    }

    if (fullscreenBtn) {
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
    }
    
    if (collapseText) collapseText.innerText = 'Collapse';

    // Staggered animation for dropdowns
    document.querySelectorAll('.dropdown').forEach((dropdown, index) => {
      dropdown.style.animation = `dropdownAppear 0.5s cubic-bezier(0.34, 1.56, 0.64, 1) ${index * 0.1}s forwards`;
    });

    // Initialize DataTables
    <c:if test="${not empty internshipList}">
    $(document).ready(function() {
      $('#internshipTable').DataTable({
        pageLength: 10,
        lengthMenu: [[5, 10, 25, 50], [5, 10, 25, 50]],
        language: {
          search: "Search internships:",
          searchPlaceholder: "Type to filter..."
        },
        columnDefs: [
          { orderable: false, targets: 5 }
        ]
      });
    });
    </c:if>

    // Report Dropdown Toggle
    const reportDropdown = document.getElementById('reportDropdown');
    const reportBtn = document.getElementById('reportBtn');

    if (reportBtn) {
      reportBtn.addEventListener('click', function(e) {
        e.preventDefault();
        e.stopPropagation();
        reportDropdown.classList.toggle('active');
      });
      
      // Close dropdown when clicking outside
      document.addEventListener('click', function(e) {
        if (reportDropdown && !reportDropdown.contains(e.target)) {
          reportDropdown.classList.remove('active');
        }
      });
    }

  })();

  // ====================================================
  // REPORT EXPORT FUNCTIONS (GLOBAL SCOPE)
  // ====================================================

  // Get table data - works with DataTables
  function getTableData() {
    var data = [];
    
    // Get DataTables instance if exists
    var table = $('#internshipTable').DataTable();
    var rows;
    
    try {
      // Try to get data from DataTables
      rows = table.rows({ search: 'applied' }).data();
      if (rows && rows.length > 0) {
        // Add headers
        data.push(['Sr. No.', 'Title', 'Employer', 'Type', 'Status']);
        
        // Add data rows
        for (var i = 0; i < rows.length; i++) {
          var row = rows[i];
          data.push([
            (i + 1).toString(),
            row.title || row[1],
            row.employer ? row.employer.companyName : row[2],
            row.internshipType || row[3],
            row.status || row[4]
          ]);
        }
        return data;
      }
    } catch(e) {
      // Fallback to DOM parsing
      console.log('Using DOM fallback for export');
    }
    
    // Fallback: Read from DOM
    var visibleRows = document.querySelectorAll('#internshipTable tbody tr');
    
    if (visibleRows.length === 0 || (visibleRows.length === 1 && visibleRows[0].querySelector('.empty-state'))) {
      return [];
    }
    
    // Add headers
    data.push(['Sr. No.', 'Title', 'Employer', 'Type', 'Status']);
    
    // Add data rows (skip action column)
    for (var i = 0; i < visibleRows.length; i++) {
      var row = visibleRows[i];
      if (row.querySelector('.empty-state')) continue;
      
      var rowData = [];
      var cells = row.querySelectorAll('td');
      for (var j = 0; j < cells.length - 1; j++) {
        rowData.push(cells[j].innerText.trim());
      }
      if (rowData.length > 0) data.push(rowData);
    }
    
    return data;
  }

  // Export to PDF
  function exportToPDF() {
    var checkData = getTableData();
    if (checkData.length <= 1) {
      alert('No data available to export!');
      return;
    }
    
    var printWindow = window.open('', '_blank');
    var date = new Date().toLocaleString();
    
    var htmlContent = '<!DOCTYPE html><html><head><title>Internships Report</title><style>' +
      'body { font-family: "Segoe UI", Arial, sans-serif; margin: 40px; padding: 20px; }' +
      '.header { text-align: center; margin-bottom: 30px; border-bottom: 2px solid #4B8BBE; padding-bottom: 20px; }' +
      '.header h1 { color: #2C3E50; margin: 0; }' +
      '.header p { color: #666; margin: 5px 0; }' +
      'table { width: 100%; border-collapse: collapse; margin-top: 20px; }' +
      'th { background-color: #4B8BBE; color: white; padding: 12px; text-align: left; }' +
      'td { padding: 10px; border-bottom: 1px solid #ddd; }' +
      '.footer { margin-top: 30px; text-align: center; font-size: 12px; color: #999; border-top: 1px solid #ddd; padding-top: 20px; }' +
      '.badge-open { background: #d4edda; color: #155724; display: inline-block; padding: 4px 8px; border-radius: 4px; }' +
      '.badge-upcoming { background: #fff3cd; color: #856404; display: inline-block; padding: 4px 8px; border-radius: 4px; }' +
      '.badge-closed { background: #f8d7da; color: #721c24; display: inline-block; padding: 4px 8px; border-radius: 4px; }' +
      '</style></head><body>' +
      '<div class="header"><h1>SmartIntern - Internships Report</h1>' +
      '<p>Generated on: ' + date + '</p>' +
      '<p>Total Internships: ' + (checkData.length - 1) + '</p></div>' +
      '<table><thead><tr><th>Sr. No.</th><th>Title</th><th>Employer</th><th>Type</th><th>Status</th></tr></thead><tbody>';
    
    for (var i = 1; i < checkData.length; i++) {
      var row = checkData[i];
      var statusText = row[4];
      var badgeClass = '';
      if (statusText === 'OPEN') badgeClass = 'badge-open';
      else if (statusText === 'UPCOMING') badgeClass = 'badge-upcoming';
      else badgeClass = 'badge-closed';
      
      htmlContent += '<tr><td>' + row[0] + '</td><td>' + row[1] + '</td><td>' + row[2] + '</td><td>' + row[3] + '</td><td><span class="' + badgeClass + '">' + row[4] + '</span></td>' + '</tr>';
    }
    
    htmlContent += '</tbody></table>' +
      '<div class="footer"><p>System-generated report from SmartIntern Platform</p><p>&copy; 2026 SmartIntern</p></div>' +
      '<script>window.onload = function() { window.print(); }<\/script>' +
      '</body></html>';
    
    printWindow.document.write(htmlContent);
    printWindow.document.close();
  }

  // Export to Excel
  function exportToExcel() {
    var data = getTableData();
    if (data.length <= 1) {
      alert('No data available to export!');
      return;
    }
    
    var excelHtml = '<html><head><meta charset="UTF-8"><title>Internships Report</title></head><body><table border="1">';
    for (var i = 0; i < data.length; i++) {
      excelHtml += '<tr>';
      for (var j = 0; j < data[i].length; j++) {
        var tag = (i === 0) ? 'th' : 'td';
        excelHtml += '<' + tag + '>' + data[i][j] + '</' + tag + '>';
      }
      excelHtml += '</tr>';
    }
    excelHtml += '</table></body></html>';
    
    var blob = new Blob([excelHtml], { type: 'application/vnd.ms-excel' });
    var link = document.createElement('a');
    var url = URL.createObjectURL(blob);
    var date = new Date();
    var filename = 'Internships_Report_' + date.getFullYear() + '-' + (date.getMonth()+1) + '-' + date.getDate() + '.xls';
    
    link.href = url;
    link.download = filename;
    document.body.appendChild(link);
    link.click();
    document.body.removeChild(link);
    URL.revokeObjectURL(url);
  }

  // Export to CSV
  function exportToCSV() {
    var data = getTableData();
    if (data.length <= 1) {
      alert('No data available to export!');
      return;
    }
    
    var csvContent = data[0].join(",") + "\n";
    for (var i = 1; i < data.length; i++) {
      var row = data[i];
      var processedRow = [];
      for (var j = 0; j < row.length; j++) {
        var cell = row[j];
        if (cell.includes(",") || cell.includes('"') || cell.includes("\n")) {
          cell = cell.replace(/"/g, '""');
          cell = '"' + cell + '"';
        }
        processedRow.push(cell);
      }
      csvContent += processedRow.join(",") + "\n";
    }
    
    var blob = new Blob(["\uFEFF" + csvContent], { type: 'text/csv;charset=utf-8;' });
    var link = document.createElement('a');
    var url = URL.createObjectURL(blob);
    var date = new Date();
    var filename = 'Internships_Report_' + date.getFullYear() + '-' + (date.getMonth()+1) + '-' + date.getDate() + '.csv';
    
    link.href = url;
    link.download = filename;
    document.body.appendChild(link);
    link.click();
    document.body.removeChild(link);
    URL.revokeObjectURL(url);
  }

  // Export to Word
  function exportToWord() {
    var data = getTableData();
    if (data.length <= 1) {
      alert('No data available to export!');
      return;
    }
    
    var date = new Date();
    var formattedDate = date.toLocaleString();
    
    var wordHtml = '<html><head><meta charset="UTF-8"><title>Internships Report</title>' +
      '<style>body { font-family: "Calibri", Arial, sans-serif; margin: 40px; }' +
      'h1 { color: #2C3E50; text-align: center; }' +
      '.info { text-align: center; margin-bottom: 30px; color: #666; }' +
      'table { width: 100%; border-collapse: collapse; }' +
      'th { background-color: #4B8BBE; color: white; padding: 10px; border: 1px solid #ddd; }' +
      'td { padding: 8px; border: 1px solid #ddd; }</style>' +
      '</head><body>' +
      '<h1>SmartIntern - Internships Report</h1>' +
      '<div class="info"><p>Generated on: ' + formattedDate + '</p><p>Total Internships: ' + (data.length - 1) + '</p></div>' +
      '<table><thead><tr>';
    
    for (var i = 0; i < data[0].length; i++) {
      wordHtml += '<th>' + data[0][i] + '</th>';
    }
    wordHtml += '</tr></thead><tbody>';
    
    for (var i = 1; i < data.length; i++) {
      wordHtml += '<tr>';
      for (var j = 0; j < data[i].length; j++) {
        wordHtml += '<td>' + data[i][j] + '</td>';
      }
      wordHtml += '</tr>';
    }
    
    wordHtml += '</tbody></table></body></html>';
    
    var blob = new Blob([wordHtml], { type: 'application/msword' });
    var link = document.createElement('a');
    var url = URL.createObjectURL(blob);
    var filename = 'Internships_Report_' + date.getFullYear() + '-' + (date.getMonth()+1) + '-' + date.getDate() + '.doc';
    
    link.href = url;
    link.download = filename;
    document.body.appendChild(link);
    link.click();
    document.body.removeChild(link);
    URL.revokeObjectURL(url);
  }

  // Print Report
  function printReport() {
    var data = getTableData();
    if (data.length <= 1) {
      alert('No data available to print!');
      return;
    }
    
    var printWindow = window.open('', '_blank');
    var date = new Date().toLocaleString();
    
    var printHtml = '<!DOCTYPE html><html><head><title>Print Internships Report</title>' +
      '<style>@media print { body { margin: 0; padding: 20px; } .no-print { display: none; } }' +
      'body { font-family: Arial, sans-serif; padding: 20px; }' +
      'h1 { color: #2C3E50; text-align: center; }' +
      '.info { text-align: center; margin-bottom: 20px; }' +
      'table { width: 100%; border-collapse: collapse; }' +
      'th { background-color: #4B8BBE; color: white; padding: 10px; border: 1px solid #ddd; }' +
      'td { padding: 8px; border: 1px solid #ddd; }' +
      '.print-btn { display: block; margin: 20px auto; padding: 10px 20px; background: #4B8BBE; color: white; border: none; border-radius: 5px; cursor: pointer; }</style>' +
      '</head><body>' +
      '<button class="print-btn no-print" onclick="window.print()">Print Report</button>' +
      '<h1>SmartIntern - Internships Report</h1>' +
      '<div class="info"><p>Generated on: ' + date + '</p><p>Total Internships: ' + (data.length - 1) + '</p></div>' +
      '<td><thead><tr><th>Sr. No.</th><th>Title</th><th>Employer</th><th>Type</th><th>Status</th></tr></thead><tbody>';
    
    for (var i = 1; i < data.length; i++) {
      printHtml += '<tr>';
      for (var j = 0; j < data[i].length; j++) {
        printHtml += '<td>' + data[i][j] + '</tr>';
      }
      printHtml += '</tr>';
    }
    
    printHtml += '</tbody></tr></body></html>';
    
    printWindow.document.write(printHtml);
    printWindow.document.close();
  }

  // Copy to Clipboard
  function copyToClipboard() {
    var data = getTableData();
    if (data.length <= 1) {
      alert('No data available to copy!');
      return;
    }
    
    var clipboardText = "";
    for (var i = 0; i < data.length; i++) {
      clipboardText += data[i].join("\t") + "\n";
    }
    
    navigator.clipboard.writeText(clipboardText).then(function() {
      var reportBtn = document.getElementById('reportBtn');
      var originalHTML = reportBtn.innerHTML;
      reportBtn.innerHTML = '<i class="bi bi-check-circle"></i> Copied!';
      setTimeout(function() {
        reportBtn.innerHTML = originalHTML;
        var reportDropdown = document.getElementById('reportDropdown');
        if (reportDropdown) reportDropdown.classList.remove('active');
      }, 2000);
    }).catch(function() {
      alert('Failed to copy data to clipboard');
    });
  }
</script>
</body>
</html>