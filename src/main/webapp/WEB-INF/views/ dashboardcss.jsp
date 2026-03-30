<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
    /* ========================================================
       PROFESSIONAL BLUE COLOR SYSTEM
       #2C3E50 - Deep Blue-Grey
       #4B8BBE - Bright Blue
       #B3CDE0 - Soft Blue
       #FFFFFF - Pure White
       #A8A8A8 - Medium Grey
       ======================================================== */
    :root {
      /* Primary Palette */
      --deep-blue: #2C3E50;
      --bright-blue: #4B8BBE;
      --soft-blue: #B3CDE0;
      --pure-white: #FFFFFF;
      --medium-grey: #A8A8A8;
      
      /* Extended Shades */
      --deep-blue-dark: #1e2b38;
      --deep-blue-light: #3a4f64;
      --bright-blue-dark: #3a6f99;
      --bright-blue-light: #6ba5d1;
      --soft-blue-dark: #8faec9;
      --soft-blue-light: #c5dbea;
      
      /* Glass Backgrounds */
      --glass-deep: rgba(44, 62, 80, 0.7);
      --glass-deep-darker: rgba(44, 62, 80, 0.85);
      --glass-bright: rgba(75, 139, 190, 0.15);
      --glass-soft: rgba(179, 205, 224, 0.15);
      
      /* Borders */
      --border-light: rgba(255, 255, 255, 0.08);
      --border-blue: rgba(75, 139, 190, 0.3);
      --border-soft: rgba(179, 205, 224, 0.3);
      
      /* Text Colors */
      --text-primary: #FFFFFF;
      --text-secondary: #B3CDE0;
      --text-muted: #A8A8A8;
      --text-dark: #2C3E50;
      
      /* Shadows */
      --shadow-sm: 0 2px 8px rgba(44, 62, 80, 0.2);
      --shadow-md: 0 4px 16px rgba(44, 62, 80, 0.3);
      --shadow-lg: 0 8px 24px rgba(44, 62, 80, 0.4);
      --shadow-xl: 0 12px 32px rgba(44, 62, 80, 0.5);
      --shadow-blue: 0 4px 20px rgba(75, 139, 190, 0.3);
      
      /* Layout */
      --sidebar-width: 280px;
      --sidebar-collapsed: 85px;
      --header-height: 80px;
      
      /* Transitions */
      --transition-smooth: 350ms cubic-bezier(0.23, 1, 0.32, 1);
      --transition-bounce: 500ms cubic-bezier(0.34, 1.56, 0.64, 1);
      --transition-elegant: 450ms cubic-bezier(0.165, 0.84, 0.44, 1);
      --transition-soft: 300ms ease-out;
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
       SMARTINTERN LOGO ANIMATIONS
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
      0%, 100% { 
        transform: translateY(0) rotate(0deg) scale(1);
        box-shadow: 0 0 20px rgba(75, 139, 190, 0.3);
      }
      25% { 
        transform: translateY(-8px) rotate(5deg) scale(1.05);
        box-shadow: 0 10px 30px rgba(75, 139, 190, 0.5);
      }
      50% { 
        transform: translateY(5px) rotate(-3deg) scale(0.98);
        box-shadow: 0 5px 25px rgba(75, 139, 190, 0.4);
      }
      75% { 
        transform: translateY(-3px) rotate(2deg) scale(1.02);
        box-shadow: 0 8px 28px rgba(75, 139, 190, 0.45);
      }
    }

    .logo-blue i {
      font-size: 28px;
      color: var(--pure-white);
      filter: drop-shadow(0 0 10px rgba(75, 139, 190, 0.5));
      animation: iconMove 3s var(--transition-bounce) infinite;
    }

    @keyframes iconMove {
      0%, 100% { 
        transform: scale(1) rotate(0deg);
        color: var(--pure-white);
      }
      33% { 
        transform: scale(1.15) rotate(10deg);
        color: var(--soft-blue);
      }
      66% { 
        transform: scale(0.95) rotate(-10deg);
        color: var(--bright-blue-light);
      }
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
      0%, 100% { 
        transform: translateX(0);
        text-shadow: 0 0 10px rgba(75, 139, 190, 0.3);
      }
      25% { 
        transform: translateX(3px);
        text-shadow: 2px 2px 15px rgba(75, 139, 190, 0.5);
      }
      50% { 
        transform: translateX(-2px);
        text-shadow: -2px 2px 15px rgba(75, 139, 190, 0.5);
      }
      75% { 
        transform: translateX(2px);
        text-shadow: 2px -2px 15px rgba(75, 139, 190, 0.5);
      }
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
      0%, 100% { 
        width: 0; 
        opacity: 0; 
        left: 50%; 
      }
      25% { 
        width: 30%; 
        opacity: 0.5; 
        left: 35%; 
      }
      50% { 
        width: 70%; 
        opacity: 1; 
        left: 15%; 
      }
      75% { 
        width: 100%; 
        opacity: 0.8; 
        left: 0; 
      }
    }

    /* ========================================================
       HEADER STYLES
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
    }

    .logout-btn:hover {
      background: var(--bright-blue);
      color: var(--pure-white);
      transform: translateY(-2px);
      box-shadow: var(--shadow-blue);
    }

    /* ========================================================
       LAYOUT STYLES
       ======================================================== */
    .dashboard-layout {
      display: flex;
      min-height: calc(100vh - var(--header-height));
      transition: all var(--transition-smooth);
      position: relative;
    }

    /* ========================================================
       SIDEBAR STYLES
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

    /* Animated Blue Border */
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

    /* Floating Glow Effect */
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

    /* Collapsed State */
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

    /* Fullscreen Mode */
    .dashboard-layout.fullscreen .nav-sidebar {
      transform: translateX(-100%);
      width: 0;
      padding: 0;
    }

    .dashboard-layout.fullscreen .main-panel {
      width: 100%;
    }

    /* Sidebar Categories */
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

    /* Dropdown Toggle */
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
    .nav-sidebar .dropdown:nth-child(13) { animation-delay: 1s; }
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

    /* Hover Effects */
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

    /* Active State */
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

    /* Dropdown Menu */
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
      from { 
        opacity: 0; 
        transform: translateY(-15px) scaleY(0.8);
      }
      to { 
        opacity: 1; 
        transform: translateY(0) scaleY(1);
      }
    }

    /* Dropdown Items */
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
      from { 
        opacity: 0; 
        transform: translateX(-15px);
      }
      to { 
        opacity: 1; 
        transform: translateX(0);
      }
    }

    .nav-sidebar .dropdown-item::before {
      content: '';
      position: absolute;
      top: 0;
      left: -5px;
      width: 2px;
      height: 100%;
      background: var(--bright-blue);
      transform: scaleY(0);
      transition: transform 0.3s var(--transition-elegant);
      box-shadow: 0 0 10px var(--bright-blue);
    }

    .nav-sidebar .dropdown-item:hover::before {
      transform: scaleY(1);
    }

    .nav-sidebar .dropdown-item::after {
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

    .nav-sidebar .dropdown-item:hover::after {
      left: 100%;
    }

    .nav-sidebar .dropdown-item i {
      color: var(--bright-blue);
      font-size: 1.1rem;
      width: 1.4rem;
      transition: all var(--transition-bounce);
    }

    .nav-sidebar .dropdown-item:hover {
      background: rgba(75, 139, 190, 0.05);
      color: var(--pure-white);
      padding-left: 2rem;
      transform: translateX(5px);
    }

    .nav-sidebar .dropdown-item:hover i {
      color: var(--bright-blue);
      transform: scale(1.3) rotate(360deg);
    }

    /* ========================================================
       MAIN PANEL STYLES
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
       METRIC CARDS STYLES
       ======================================================== */
    .metric-card {
      background: var(--glass-deep);
      backdrop-filter: blur(12px);
      -webkit-backdrop-filter: blur(12px);
      border-radius: 20px;
      padding: 2rem 1.8rem;
      border: 1px solid var(--border-blue);
      transition: all var(--transition-elegant);
      position: relative;
      overflow: hidden;
      box-shadow: var(--shadow-md);
      animation: cardAppear 0.6s var(--transition-elegant);
      animation-fill-mode: both;
    }

    .metric-card:nth-child(1) { animation-delay: 0.1s; }
    .metric-card:nth-child(2) { animation-delay: 0.2s; }
    .metric-card:nth-child(3) { animation-delay: 0.3s; }
    .metric-card:nth-child(4) { animation-delay: 0.4s; }

    @keyframes cardAppear {
      from { opacity: 0; transform: translateY(30px); }
      to { opacity: 1; transform: translateY(0); }
    }

    .metric-card::before {
      content: '';
      position: absolute;
      top: 0;
      left: 0;
      width: 4px;
      height: 100%;
      background: var(--bright-blue);
      transform: scaleY(0);
      transition: transform 0.5s var(--transition-elegant);
      border-radius: 20px 0 0 20px;
    }

    .metric-card:hover::before {
      transform: scaleY(1);
    }

    .metric-card:hover {
      transform: translateY(-6px);
      border-color: var(--bright-blue);
      box-shadow: var(--shadow-lg), var(--shadow-blue);
    }

    .metric-card h6 {
      font-size: 0.8rem;
      font-weight: 600;
      color: var(--soft-blue);
      text-transform: uppercase;
      letter-spacing: 1px;
      margin-bottom: 1rem;
    }

    .metric-number {
      font-size: 3rem;
      font-weight: 700;
      color: var(--pure-white);
      line-height: 1;
      margin-bottom: 1rem;
    }

    .trend-badge {
      font-size: 0.8rem;
      background: rgba(255, 255, 255, 0.05);
      color: var(--soft-blue);
      padding: 0.4rem 1.2rem;
      border-radius: 40px;
      display: inline-flex;
      align-items: center;
      width: fit-content;
      gap: 0.5rem;
      font-weight: 500;
      border: 1px solid var(--border-blue);
      transition: all var(--transition-soft);
    }

    .trend-badge:hover {
      background: var(--bright-blue);
      color: var(--pure-white);
      transform: scale(1.05);
    }

    .trend-badge i {
      color: var(--bright-blue);
    }

    .trend-badge:hover i {
      color: var(--pure-white);
    }

    /* ========================================================
       TIMELINE CARD STYLES
       ======================================================== */
    .timeline-card {
      background: var(--glass-deep);
      backdrop-filter: blur(12px);
      -webkit-backdrop-filter: blur(12px);
      border-radius: 24px;
      padding: 2.5rem;
      margin-top: 2.5rem;
      border: 1px solid var(--border-blue);
      transition: all var(--transition-elegant);
      box-shadow: var(--shadow-md);
      animation: timelineAppear 0.8s var(--transition-elegant);
    }

    @keyframes timelineAppear {
      from { opacity: 0; transform: translateY(40px); }
      to { opacity: 1; transform: translateY(0); }
    }

    .timeline-card:hover {
      border-color: var(--bright-blue);
      box-shadow: var(--shadow-lg), var(--shadow-blue);
      transform: translateY(-4px);
    }

    .timeline-title {
      font-size: 1.2rem;
      font-weight: 600;
      color: var(--pure-white);
      display: flex;
      align-items: center;
      gap: 1rem;
      margin-bottom: 2rem;
    }

    .timeline-title i {
      background: rgba(75, 139, 190, 0.1);
      padding: 10px;
      border-radius: 12px;
      color: var(--bright-blue);
      font-size: 1.3rem;
      animation: titleIcon 3s ease-in-out infinite;
    }

    @keyframes titleIcon {
      0%, 100% { transform: scale(1); }
      50% { transform: scale(1.1) rotate(5deg); }
    }

    .timeline-item {
      display: flex;
      align-items: center;
      padding: 1.2rem 1.2rem;
      border-bottom: 1px solid var(--border-blue);
      font-size: 0.95rem;
      color: var(--soft-blue);
      transition: all var(--transition-elegant);
      border-radius: 12px;
      margin-bottom: 0.3rem;
      animation: itemSlideIn 0.5s var(--transition-elegant);
      animation-fill-mode: both;
    }

    .timeline-item:nth-child(1) { animation-delay: 0.1s; }
    .timeline-item:nth-child(2) { animation-delay: 0.2s; }
    .timeline-item:nth-child(3) { animation-delay: 0.3s; }
    .timeline-item:nth-child(4) { animation-delay: 0.4s; }

    @keyframes itemSlideIn {
      from { opacity: 0; transform: translateX(30px); }
      to { opacity: 1; transform: translateX(0); }
    }

    .timeline-item:last-child {
      border-bottom: none;
    }

    .timeline-item:hover {
      background: rgba(75, 139, 190, 0.05);
      transform: translateX(15px);
    }

    .timeline-item i {
      margin-right: 1.5rem;
      font-size: 1.4rem;
      padding: 8px;
      border-radius: 10px;
      color: var(--bright-blue);
      background: rgba(75, 139, 190, 0.1);
      transition: all var(--transition-bounce);
    }

    .timeline-item:hover i {
      transform: scale(1.3) rotate(360deg);
      background: rgba(75, 139, 190, 0.2);
    }

    /* ========================================================
       FOOTER STYLES
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
       RESPONSIVE STYLES
       ======================================================== */
    @media (max-width: 1200px) {
      .main-panel { padding: 2rem; }
      .metric-number { font-size: 2.5rem; }
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
    }
</style>