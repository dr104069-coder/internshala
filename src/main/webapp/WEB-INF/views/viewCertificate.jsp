<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>SmartIntern · View Certificate</title>

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
       CERTIFICATE VIEW CARD - MATCHING DASHBOARD STYLE
       ======================================================== */
    .certificate-view-card {
      background: var(--glass-deep);
      backdrop-filter: blur(12px);
      -webkit-backdrop-filter: blur(12px);
      border-radius: 30px;
      border: 1px solid var(--border-blue);
      padding: 3rem;
      box-shadow: var(--shadow-md);
      transition: all var(--transition-elegant);
      max-width: 900px;
      margin: 0 auto;
    }

    .certificate-view-card:hover {
      border-color: var(--bright-blue);
      box-shadow: var(--shadow-lg), var(--shadow-blue);
    }

    .certificate-header {
      text-align: center;
      margin-bottom: 3rem;
      position: relative;
    }

    .certificate-header::after {
      content: '';
      position: absolute;
      bottom: -1.5rem;
      left: 25%;
      width: 50%;
      height: 2px;
      background: linear-gradient(90deg, transparent, var(--bright-blue), transparent);
    }

    .certificate-icon-large {
      background: linear-gradient(135deg, var(--deep-blue), var(--bright-blue));
      width: 80px;
      height: 80px;
      border-radius: 24px;
      display: flex;
      align-items: center;
      justify-content: center;
      margin: 0 auto 1.5rem;
      box-shadow: var(--shadow-md), var(--shadow-blue);
      border: 2px solid var(--bright-blue);
    }

    .certificate-icon-large i {
      font-size: 3rem;
      color: var(--pure-white);
    }

    .certificate-title {
      font-size: 2.2rem;
      font-weight: 700;
      color: var(--pure-white);
      margin-bottom: 0.5rem;
    }

    .certificate-subtitle {
      color: var(--soft-blue);
      font-size: 1rem;
      letter-spacing: 2px;
      text-transform: uppercase;
    }

    .info-grid {
      display: grid;
      grid-template-columns: repeat(2, 1fr);
      gap: 2rem;
      margin: 3rem 0;
    }

    .info-item {
      padding: 1.5rem;
      background: rgba(255, 255, 255, 0.05);
      border-radius: 24px;
      border: 1px solid var(--border-blue);
      transition: all var(--transition-soft);
    }

    .info-item:hover {
      background: rgba(75, 139, 190, 0.1);
      border-color: var(--bright-blue);
      transform: translateY(-2px);
      box-shadow: var(--shadow-sm);
    }

    .info-label {
      color: var(--soft-blue);
      font-size: 0.8rem;
      text-transform: uppercase;
      letter-spacing: 1px;
      margin-bottom: 0.5rem;
      display: flex;
      align-items: center;
      gap: 0.5rem;
    }

    .info-label i {
      color: var(--bright-blue);
    }

    .info-value {
      font-size: 1.2rem;
      font-weight: 600;
      color: var(--pure-white);
    }

    .info-value.large {
      font-size: 1.5rem;
    }

    /* Verification Code Box */
    .verification-code-box {
      background: rgba(75, 139, 190, 0.1);
      border: 2px dashed var(--border-blue);
      border-radius: 60px;
      padding: 1rem 2rem;
      text-align: center;
      margin: 2rem 0;
    }

    .verification-code-box .code {
      font-family: 'Courier New', monospace;
      font-size: 1.8rem;
      font-weight: 700;
      color: var(--pure-white);
      letter-spacing: 4px;
    }

    .verification-code-box .label {
      color: var(--soft-blue);
      font-size: 0.85rem;
      text-transform: uppercase;
      margin-bottom: 0.5rem;
    }

    /* Certificate Preview */
    .certificate-preview {
      background: rgba(255, 255, 255, 0.05);
      border-radius: 24px;
      padding: 2rem;
      text-align: center;
      margin: 2rem 0;
      border: 1px solid var(--border-blue);
    }

    .certificate-preview img {
      max-width: 100%;
      max-height: 300px;
      border-radius: 16px;
      box-shadow: var(--shadow-md);
    }

    .certificate-preview h5 {
      color: var(--pure-white);
      margin-bottom: 1rem;
    }

    .certificate-preview p {
      color: var(--soft-blue);
      font-size: 0.9rem;
      margin-top: 1rem;
    }

    .certificate-preview p i {
      color: #ef4444;
    }

    .certificate-preview-placeholder {
      background: rgba(255, 255, 255, 0.03);
      border: 2px dashed var(--border-blue);
      border-radius: 24px;
      padding: 4rem;
      color: var(--soft-blue);
    }

    .certificate-preview-placeholder i {
      font-size: 4rem;
      margin-bottom: 1rem;
      color: var(--bright-blue);
    }

    .certificate-preview-placeholder h5 {
      color: var(--pure-white);
      margin-bottom: 0.5rem;
    }

    /* Status Badges */
    .status-badge {
      display: inline-flex;
      align-items: center;
      gap: 0.5rem;
      padding: 0.5rem 1.2rem;
      border-radius: 40px;
      font-weight: 500;
      font-size: 0.9rem;
      border: 1px solid transparent;
    }

    .status-verified {
      background: rgba(16, 185, 129, 0.15);
      color: #34d399;
      border: 1px solid rgba(16, 185, 129, 0.3);
    }

    .status-pending {
      background: rgba(245, 158, 11, 0.15);
      color: #fbbf24;
      border: 1px solid rgba(245, 158, 11, 0.3);
    }

    /* Action Buttons */
    .action-buttons {
      display: flex;
      gap: 1rem;
      justify-content: center;
      margin-top: 3rem;
      flex-wrap: wrap;
    }

    .btn-download {
      background: rgba(75, 139, 190, 0.1);
      border: 1px solid var(--border-blue);
      color: var(--soft-blue);
      padding: 1rem 2.5rem;
      border-radius: 60px;
      text-decoration: none;
      display: inline-flex;
      align-items: center;
      gap: 0.8rem;
      font-weight: 600;
      transition: all var(--transition-soft);
    }

    .btn-download:hover {
      background: var(--bright-blue);
      border-color: var(--bright-blue);
      color: var(--pure-white);
      transform: translateY(-2px);
      box-shadow: var(--shadow-blue);
    }

    .btn-edit {
      background: rgba(255, 255, 255, 0.05);
      border: 1px solid var(--border-blue);
      color: var(--soft-blue);
      padding: 1rem 2.5rem;
      border-radius: 60px;
      text-decoration: none;
      display: inline-flex;
      align-items: center;
      gap: 0.8rem;
      font-weight: 600;
      transition: all var(--transition-soft);
    }

    .btn-edit:hover {
      background: var(--bright-blue);
      border-color: var(--bright-blue);
      color: var(--pure-white);
      transform: translateY(-2px);
      box-shadow: var(--shadow-blue);
    }

    /* Additional Info */
    .additional-info {
      margin-top: 2rem;
      padding-top: 1rem;
      border-top: 1px solid var(--border-blue);
      text-align: center;
      color: var(--soft-blue);
      font-size: 0.85rem;
    }

    .additional-info i {
      color: #34d399;
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
      .certificate-view-card { padding: 2rem; }
      .info-grid { gap: 1rem; }
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
      .certificate-view-card { padding: 1.5rem; }
      .info-grid { grid-template-columns: 1fr; }
      .page-header {
        flex-direction: column;
        align-items: flex-start;
      }
      .action-buttons {
        flex-direction: column;
        width: 100%;
      }
      .btn-download, .btn-edit {
        width: 100%;
        justify-content: center;
      }
      .verification-code-box .code {
        font-size: 1.2rem;
      }
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
          <li><a class="dropdown-item active" href="listCertificate"><i class="bi bi-file-pdf"></i> <span>List Certificates</span></a></li>
          <li><a class="dropdown-item" href="certificate"><i class="bi bi-download"></i> <span>Add Certificate</span></a></li>
        </ul>
      </div>
    </aside>

    <!-- MAIN PANEL - VIEW CERTIFICATE CONTENT (UNTOUCHED LOGIC) -->
    <main class="main-panel" id="mainPanel">

      <!-- Page Header with Back Button -->
      <div class="page-header">
        <div class="page-title">
          <i class="bi bi-award-fill"></i>
          Certificate Details
        </div>
        <a href="listCertificate" class="btn-back">
          <i class="bi bi-arrow-left"></i> Back to List
        </a>
      </div>

      <!-- Certificate View Card -->
      <div class="certificate-view-card">
        
        <!-- Certificate Header -->
        <div class="certificate-header">
          <div class="certificate-icon-large">
            <i class="bi bi-award-fill"></i>
          </div>
          <h1 class="certificate-title">Certificate of Completion</h1>
          <div class="certificate-subtitle">INTERNSHIP PROGRAM</div>
        </div>

        <!-- Student & Internship Info -->
        <div class="info-grid">
          <div class="info-item">
            <div class="info-label">
              <i class="bi bi-person-circle"></i> Student Name
            </div>
            <div class="info-value large">
              ${certificate.enrollment.student.firstName} ${certificate.enrollment.student.lastName}
            </div>
          </div>
          
          <div class="info-item">
            <div class="info-label">
              <i class="bi bi-envelope-fill"></i> Email
            </div>
            <div class="info-value">
              ${certificate.enrollment.student.email}
            </div>
          </div>

          <div class="info-item">
            <div class="info-label">
              <i class="bi bi-briefcase-fill"></i> Internship
            </div>
            <div class="info-value">
              ${certificate.enrollment.internship.title}
            </div>
          </div>

          <div class="info-item">
            <div class="info-label">
              <i class="bi bi-building"></i> Company
            </div>
            <div class="info-value">
              ${certificate.enrollment.internship.employer.companyName}
            </div>
          </div>

          <div class="info-item">
            <div class="info-label">
              <i class="bi bi-calendar-check"></i> Issued Date
            </div>
            <div class="info-value">
              ${certificate.issuedDate}
            </div>
          </div>

          <div class="info-item">
            <div class="info-label">
              <i class="bi bi-check-circle"></i> Status
            </div>
            <div class="info-value">
              <c:choose>
                <c:when test="${not empty certificate.certificateURL}">
                  <span class="status-badge status-verified">
                    <i class="bi bi-check-circle-fill"></i> Verified & Uploaded
                  </span>
                </c:when>
                <c:otherwise>
                  <span class="status-badge status-pending">
                    <i class="bi bi-clock"></i> Pending Upload
                  </span>
                </c:otherwise>
              </c:choose>
            </div>
          </div>
        </div>

        <!-- Verification Code -->
        <div class="verification-code-box">
          <div class="label">Verification Code</div>
          <div class="code">${certificate.verificationCode}</div>
        </div>

        <!-- Certificate Preview -->
        <div class="certificate-preview">
          <c:choose>
            <c:when test="${not empty certificate.certificateURL}">
              <h5>Certificate Preview</h5>
              <img src="${certificate.certificateURL}" alt="Certificate Preview">
              <p>
                <i class="bi bi-file-pdf-fill"></i> 
                File: ${certificate.certificateURL}
              </p>
            </c:when>
            <c:otherwise>
              <div class="certificate-preview-placeholder">
                <i class="bi bi-file-earmark-pdf"></i>
                <h5>No Certificate Uploaded Yet</h5>
                <p>Click the upload button to add a certificate file</p>
              </div>
            </c:otherwise>
          </c:choose>
        </div>

        <!-- Action Buttons -->
        <div class="action-buttons">
          <c:if test="${not empty certificate.certificateURL}">
            <a href="downloadCertificate?certificateId=${certificate.certificateId}" class="btn-download">
              <i class="bi bi-download"></i> Download Certificate
            </a>
          </c:if>
          
          <c:if test="${empty certificate.certificateURL}">
            <a href="uploadCertificate?certificateId=${certificate.certificateId}" class="btn-download">
              <i class="bi bi-cloud-upload"></i> Upload Certificate
            </a>
          </c:if>
          
          <a href="editCertificate?certificateId=${certificate.certificateId}" class="btn-edit">
            <i class="bi bi-pencil-square"></i> Edit Details
          </a>
        </div>

        <!-- Additional Info -->
        <div class="additional-info">
          <i class="bi bi-shield-check"></i> 
          This certificate is digitally verified. Use verification code above to verify.
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