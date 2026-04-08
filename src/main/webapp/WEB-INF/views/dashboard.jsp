<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>SmartIntern · Analytics Dashboard</title>

  <!-- Bootstrap & Icons -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">
  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
  <!-- Chart.js & SweetAlert -->
  <script src="https://cdn.jsdelivr.net/npm/chart.js@4.4.0/dist/chart.umd.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
  <!-- html2pdf for PDF export -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.10.1/html2pdf.bundle.min.js"></script>

  <style>
    /* ========================================================
       PROFESSIONAL BLUE COLOR SYSTEM - EXACTLY LIKE USER LIST (CODE A)
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

    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }

    body {
      font-family: 'Inter', sans-serif;
      background: linear-gradient(145deg, #2C3E50 0%, #1e2b38 100%);
      min-height: 100vh;
      transition: all var(--transition-soft);
    }

    /* Light Theme Override */
    body.light-theme {
      background: linear-gradient(145deg, #e0e5ec 0%, #f0f4f8 100%);
    }
    body.light-theme .metric-card,
    body.light-theme .chart-card,
    body.light-theme .nav-sidebar,
    body.light-theme .admin-header,
    body.light-theme .dashboard-footer {
      background: rgba(255, 255, 255, 0.95) !important;
      backdrop-filter: blur(12px);
    }
    body.light-theme .metric-card h6,
    body.light-theme .chart-card h6,
    body.light-theme .metric-number,
    body.light-theme .dropdown-toggle,
    body.light-theme .dropdown-item,
    body.light-theme .nav-category {
      color: var(--deep-blue) !important;
    }
    body.light-theme .metric-card,
    body.light-theme .chart-card {
      border-color: rgba(75, 139, 190, 0.2);
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

    /* ========================================================
       HEADER - EXACTLY LIKE CODE A
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
      animation: logoMove 4s var(--transition-bounce) infinite;
      box-shadow: 0 0 20px rgba(75, 139, 190, 0.3);
    }

    @keyframes logoMove {
      0%, 100% { transform: translateY(0) rotate(0deg) scale(1); }
      25% { transform: translateY(-8px) rotate(5deg) scale(1.05); }
      50% { transform: translateY(5px) rotate(-3deg) scale(0.98); }
      75% { transform: translateY(-3px) rotate(2deg) scale(1.02); }
    }

    .logo-blue i {
      font-size: 28px;
      color: var(--pure-white);
      filter: drop-shadow(0 0 10px rgba(75, 139, 190, 0.5));
    }

    .logo-text {
      font-size: 1.6rem;
      font-weight: 700;
      color: var(--pure-white);
      letter-spacing: -0.5px;
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
       LAYOUT & SIDEBAR - EXACTLY LIKE CODE A
       ======================================================== */
    .dashboard-layout {
      display: flex;
      min-height: calc(100vh - var(--header-height));
      transition: all var(--transition-smooth);
    }

    .nav-sidebar {
      width: var(--sidebar-width);
      background: var(--glass-deep-darker);
      backdrop-filter: blur(12px);
      border-right: 1px solid var(--border-blue);
      padding: 2rem 1.2rem;
      box-shadow: var(--shadow-lg);
      transition: width 0.3s var(--transition-elegant);
      display: flex;
      flex-direction: column;
      overflow: hidden;
      white-space: nowrap;
      z-index: 500;
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
      text-decoration: none;
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
       MAIN PANEL & CARDS
       ======================================================== */
    .main-panel {
      flex: 1;
      padding: 2.5rem;
      background: transparent;
      transition: all var(--transition-smooth);
    }

    .metric-card, .chart-card {
      background: var(--glass-deep);
      backdrop-filter: blur(12px);
      border-radius: 24px;
      padding: 1.5rem;
      border: 1px solid var(--border-blue);
      transition: all var(--transition-elegant);
      height: 100%;
    }

    .metric-card:hover, .chart-card:hover {
      border-color: var(--bright-blue);
      box-shadow: var(--shadow-lg), var(--shadow-blue);
      transform: translateY(-3px);
    }

    .metric-number {
      font-size: 2.5rem;
      font-weight: 800;
      color: var(--pure-white);
      margin-top: 0.5rem;
    }

    .metric-card h6, .chart-card h6 {
      color: var(--soft-blue);
      font-size: 0.85rem;
      text-transform: uppercase;
      letter-spacing: 1px;
      font-weight: 600;
      margin-bottom: 0.5rem;
    }

    canvas {
      max-height: 220px;
      width: 100% !important;
    }

    /* Toast Notification */
    .toast-notification {
      position: fixed;
      top: 90px;
      right: 20px;
      background: var(--bright-blue);
      color: white;
      padding: 10px 20px;
      border-radius: 40px;
      z-index: 9999;
      animation: slideIn 0.3s ease;
      font-size: 0.9rem;
      box-shadow: var(--shadow-md);
    }

    @keyframes slideIn {
      from { transform: translateX(100%); opacity: 0; }
      to { transform: translateX(0); opacity: 1; }
    }

    .dashboard-footer {
      background: var(--glass-deep-darker);
      backdrop-filter: blur(12px);
      color: var(--medium-grey);
      text-align: center;
      padding: 1.5rem;
      font-size: 0.9rem;
      border-top: 1px solid var(--border-blue);
    }

    @media (max-width: 768px) {
      .admin-header { padding: 0 1.5rem; }
      .main-panel { padding: 1.5rem; }
      .dark-btn span { display: none; }
      .dark-btn { padding: 0.6rem; }
    }
  </style>
</head>
<body>

  <!-- HEADER - EXACTLY LIKE CODE A -->
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
      <span class="dark-btn" id="toggleThemeBtn">
        <i class="bi bi-moon-stars-fill"></i> <span>Theme</span>
      </span>
      <span class="dark-btn" id="exportPDFBtn">
        <i class="bi bi-file-pdf-fill"></i> <span>PDF</span>
      </span>
      <span class="dark-btn" id="refreshDataBtn">
        <i class="bi bi-arrow-repeat"></i> <span>Refresh</span>
      </span>
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

    <!-- MAIN PANEL - DASHBOARD CONTENT -->
    <main class="main-panel" id="mainPanel">
      <!-- Metric Cards Row -->
      <div class="row g-4 mb-4">
        <div class="col-md-3">
          <div class="metric-card">
            <h6><i class="bi bi-people-fill me-1"></i> Total Users</h6>
            <div class="metric-number">${totalUsers != null ? totalUsers : 0}</div>
          </div>
        </div>
        <div class="col-md-3">
          <div class="metric-card">
            <h6><i class="bi bi-briefcase-fill me-1"></i> Total Internships</h6>
            <div class="metric-number">${totalInternships != null ? totalInternships : 0}</div>
          </div>
        </div>
        <div class="col-md-3">
          <div class="metric-card">
            <h6><i class="bi bi-send-fill me-1"></i> Total Applications</h6>
            <div class="metric-number">${totalApplications != null ? totalApplications : 0}</div>
          </div>
        </div>
        <div class="col-md-3">
          <div class="metric-card">
            <h6><i class="bi bi-award-fill me-1"></i> Total Enrollments</h6>
            <div class="metric-number">${totalEnrollments != null ? totalEnrollments : 0}</div>
          </div>
        </div>
      </div>

      <!-- Row 1: Role Distribution & Monthly Registrations -->
      <div class="row g-4 mb-4">
        <div class="col-md-6">
          <div class="chart-card">
            <div class="d-flex justify-content-between align-items-center mb-2">
              <h6><i class="bi bi-pie-chart-fill"></i> 1. User Role Distribution</h6>
              <button class="btn btn-sm" style="background:rgba(75,139,190,0.2); color:var(--soft-blue); border-radius:20px;" onclick="exportChartAsImage('userRoleChart', 'User_Roles')">
                <i class="bi bi-download"></i>
              </button>
            </div>
            <canvas id="userRoleChart"></canvas>
          </div>
        </div>
        <div class="col-md-6">
          <div class="chart-card">
            <div class="d-flex justify-content-between align-items-center mb-2">
              <h6><i class="bi bi-calendar-week"></i> 2. Monthly Registrations</h6>
              <button class="btn btn-sm" style="background:rgba(75,139,190,0.2); color:var(--soft-blue); border-radius:20px;" onclick="toggleChartType('monthlyRegChart')">
                <i class="bi bi-bar-chart-steps"></i> Toggle
              </button>
            </div>
            <canvas id="monthlyRegChart"></canvas>
          </div>
        </div>
      </div>

      <!-- Row 2: Internship Status & Application Status -->
      <div class="row g-4 mb-4">
        <div class="col-md-6">
          <div class="chart-card">
            <h6><i class="bi bi-briefcase"></i> 3. Internship Status</h6>
            <canvas id="internshipStatusChart"></canvas>
          </div>
        </div>
        <div class="col-md-6">
          <div class="chart-card">
            <h6><i class="bi bi-funnel-fill"></i> 4. Application Status</h6>
            <canvas id="applicationStatusChart"></canvas>
          </div>
        </div>
      </div>

      <!-- Row 3: Top Internships & Enrollment Status -->
      <div class="row g-4 mb-4">
        <div class="col-md-6">
          <div class="chart-card">
            <h6><i class="bi bi-trophy"></i> 5. Top 5 Internships</h6>
            <canvas id="topInternshipsChart"></canvas>
          </div>
        </div>
        <div class="col-md-6">
          <div class="chart-card">
            <h6><i class="bi bi-journal-check"></i> 6. Enrollment Status</h6>
            <canvas id="enrollmentStatusChart"></canvas>
          </div>
        </div>
      </div>

      <!-- Row 4: Certificates Issued Monthly -->
      <div class="row g-4">
        <div class="col-md-12">
          <div class="chart-card">
            <div class="d-flex justify-content-between align-items-center mb-2">
              <h6><i class="bi bi-file-pdf-fill"></i> 7. Certificates Issued Monthly</h6>
              <button class="btn btn-sm" style="background:rgba(75,139,190,0.2); color:var(--soft-blue); border-radius:20px;" onclick="toggleChartType('certificatesChart')">
                <i class="bi bi-bar-chart-steps"></i> Toggle
              </button>
            </div>
            <canvas id="certificatesChart" style="max-height: 260px;"></canvas>
          </div>
        </div>
      </div>
    </main>
  </div>

  <footer class="dashboard-footer">
    2026 SmartIntern - Analytics Dashboard | Designed BY Rathod Darshan
  </footer>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
  <script>
    (function() {
      // ========== SIDEBAR FUNCTIONALITY (MATCHING CODE A) ==========
      const layout = document.getElementById('dashboardLayout');
      const sidebar = document.getElementById('mainSidebar');
      const toggleBtn = document.getElementById('toggleCollapseBtn');
      const collapseText = document.getElementById('collapseText');
      const fullscreenBtn = document.getElementById('fullscreenModeBtn');

      if(toggleBtn) {
        toggleBtn.addEventListener('click', function(e) {
          e.preventDefault();
          if(layout.classList.contains('fullscreen')) layout.classList.remove('fullscreen');
          sidebar.classList.toggle('collapsed');
          collapseText.innerText = sidebar.classList.contains('collapsed') ? 'Expand' : 'Collapse';
          setTimeout(() => { window.dispatchEvent(new Event('resize')); }, 300);
        });
      }

      if(fullscreenBtn) {
        fullscreenBtn.addEventListener('click', function(e) {
          e.preventDefault();
          layout.classList.toggle('fullscreen');
          if(layout.classList.contains('fullscreen')) {
            sidebar.classList.remove('collapsed');
            collapseText.innerText = 'Collapse';
            fullscreenBtn.innerHTML = '<i class="bi bi-fullscreen-exit"></i> <span>Sidebar off</span>';
          } else {
            fullscreenBtn.innerHTML = '<i class="bi bi-arrows-fullscreen"></i> <span>Fullscreen</span>';
          }
          setTimeout(() => { window.dispatchEvent(new Event('resize')); }, 300);
        });
      }

      // ========== THEME TOGGLE ==========
      const themeBtn = document.getElementById('toggleThemeBtn');
      let isDark = true;
      if(themeBtn) {
        themeBtn.addEventListener('click', () => {
          isDark = !isDark;
          if(isDark) {
            document.body.classList.remove('light-theme');
            themeBtn.innerHTML = '<i class="bi bi-moon-stars-fill"></i> <span>Theme</span>';
          } else {
            document.body.classList.add('light-theme');
            themeBtn.innerHTML = '<i class="bi bi-sun-fill"></i> <span>Theme</span>';
          }
          showToast('Switched to ' + (isDark ? 'Dark' : 'Light') + ' Mode');
        });
      }

      // ========== TOAST UTILITY ==========
      function showToast(msg) {
        const toast = document.createElement('div');
        toast.className = 'toast-notification';
        toast.innerHTML = '<i class="bi bi-check-circle"></i> ' + msg;
        document.body.appendChild(toast);
        setTimeout(() => toast.remove(), 3000);
      }

      // ========== EXPORT CHART AS IMAGE ==========
      window.exportChartAsImage = function(chartId, filename) {
        const canvas = document.getElementById(chartId);
        if(canvas) {
          const link = document.createElement('a');
          link.download = filename + '.png';
          link.href = canvas.toDataURL();
          link.click();
          showToast('Exported ' + filename);
        }
      };

      // ========== PDF EXPORT ==========
      document.getElementById('exportPDFBtn')?.addEventListener('click', () => {
        const element = document.getElementById('mainPanel');
        html2pdf().from(element).set({
          margin: [10,10,10,10],
          filename: 'SmartIntern_Dashboard.pdf',
          html2canvas: { scale: 2 },
          jsPDF: { unit: 'mm', format: 'a4', orientation: 'landscape' }
        }).save();
        showToast('Exporting dashboard as PDF...');
      });

      // ========== REFRESH ==========
      document.getElementById('refreshDataBtn')?.addEventListener('click', () => location.reload());

      // ========== CHART DATA FROM BACKEND (FALLBACKS) ==========
      const roleLabels = ${roleLabelsJson != null ? roleLabelsJson : '[]'};
      const roleValues = ${roleValuesJson != null ? roleValuesJson : '[]'};
      const monthlyLabels = ${monthlyLabelsJson != null ? monthlyLabelsJson : '[]'};
      const monthlyValues = ${monthlyValuesJson != null ? monthlyValuesJson : '[]'};
      const statusLabels = ${statusLabelsJson != null ? statusLabelsJson : '[]'};
      const statusValues = ${statusValuesJson != null ? statusValuesJson : '[]'};
      const appLabels = ${appLabelsJson != null ? appLabelsJson : '[]'};
      const appValues = ${appValuesJson != null ? appValuesJson : '[]'};
      const topTitles = ${topTitlesJson != null ? topTitlesJson : '[]'};
      const topCounts = ${topCountsJson != null ? topCountsJson : '[]'};
      const enrollLabels = ${enrollLabelsJson != null ? enrollLabelsJson : '[]'};
      const enrollValues = ${enrollValuesJson != null ? enrollValuesJson : '[]'};
      const certMonths = ${certMonthsJson != null ? certMonthsJson : '[]'};
      const certCounts = ${certCountsJson != null ? certCountsJson : '[]'};

      // Chart helpers
      function createPie(ctx, labels, values) {
        if(!ctx || !labels.length) return null;
        return new Chart(ctx, {
          type: 'doughnut',
          data: { labels, datasets: [{ data: values, backgroundColor: ['#4B8BBE','#2C3E50','#B3CDE0','#A8A8A8','#6ba5d1'], borderWidth: 0, hoverOffset: 10 }] },
          options: { responsive: true, maintainAspectRatio: true, plugins: { legend: { position: 'bottom', labels: { color: '#B3CDE0', font: { size: 10 } } } } }
        });
      }
      function createBar(ctx, labels, values, label) {
        if(!ctx || !labels.length) return null;
        return new Chart(ctx, {
          type: 'bar',
          data: { labels, datasets: [{ label, data: values, backgroundColor: '#4B8BBE', borderRadius: 8 }] },
          options: { responsive: true, maintainAspectRatio: true, plugins: { legend: { labels: { color: '#B3CDE0' } } }, scales: { y: { ticks: { color: '#B3CDE0', stepSize: 1 }, grid: { color: 'rgba(179,205,224,0.1)' } }, x: { ticks: { color: '#B3CDE0' }, grid: { display: false } } } }
        });
      }
      function createLine(ctx, labels, values, label) {
        if(!ctx || !labels.length) return null;
        return new Chart(ctx, {
          type: 'line',
          data: { labels, datasets: [{ label, data: values, borderColor: '#4B8BBE', backgroundColor: 'rgba(75,139,190,0.1)', fill: true, tension: 0.4, pointBackgroundColor: '#4B8BBE', pointBorderColor: '#FFF' }] },
          options: { responsive: true, maintainAspectRatio: true, plugins: { legend: { labels: { color: '#B3CDE0' } } }, scales: { y: { ticks: { color: '#B3CDE0', stepSize: 1 }, grid: { color: 'rgba(179,205,224,0.1)' } }, x: { ticks: { color: '#B3CDE0' }, grid: { display: false } } } }
        });
      }
      function createHorizBar(ctx, labels, values, label) {
        if(!ctx || !labels.length) return null;
        return new Chart(ctx, {
          type: 'bar',
          data: { labels, datasets: [{ label, data: values, backgroundColor: '#4B8BBE', borderRadius: 8 }] },
          options: { indexAxis: 'y', responsive: true, maintainAspectRatio: true, plugins: { legend: { labels: { color: '#B3CDE0' } } }, scales: { x: { ticks: { color: '#B3CDE0', stepSize: 1 }, grid: { color: 'rgba(179,205,224,0.1)' } }, y: { ticks: { color: '#B3CDE0' }, grid: { display: false } } } }
        });
      }

      let charts = {};
      let chartTypes = { monthlyRegChart: 'bar', certificatesChart: 'line' };

      if(roleLabels.length) charts.userRoleChart = createPie(document.getElementById('userRoleChart'), roleLabels, roleValues);
      if(monthlyLabels.length) charts.monthlyRegChart = createBar(document.getElementById('monthlyRegChart'), monthlyLabels, monthlyValues, 'New Users');
      if(statusLabels.length) charts.internshipStatusChart = createPie(document.getElementById('internshipStatusChart'), statusLabels, statusValues);
      if(appLabels.length) charts.applicationStatusChart = createPie(document.getElementById('applicationStatusChart'), appLabels, appValues);
      if(topTitles.length) charts.topInternshipsChart = createHorizBar(document.getElementById('topInternshipsChart'), topTitles, topCounts, 'Applications');
      if(enrollLabels.length) charts.enrollmentStatusChart = createPie(document.getElementById('enrollmentStatusChart'), enrollLabels, enrollValues);
      if(certMonths.length) charts.certificatesChart = createLine(document.getElementById('certificatesChart'), certMonths, certCounts, 'Certificates Issued');

      window.toggleChartType = function(chartId) {
        const canvas = document.getElementById(chartId);
        if(!canvas) return;
        const current = chartTypes[chartId];
        let newType, labels, values, label;
        if(chartId === 'monthlyRegChart') {
          labels = monthlyLabels; values = monthlyValues; label = 'New Users';
          newType = current === 'bar' ? 'line' : 'bar';
        } else {
          labels = certMonths; values = certCounts; label = 'Certificates Issued';
          newType = current === 'line' ? 'bar' : 'line';
        }
        if(charts[chartId]) charts[chartId].destroy();
        if(newType === 'bar') charts[chartId] = createBar(canvas.getContext('2d'), labels, values, label);
        else charts[chartId] = createLine(canvas.getContext('2d'), labels, values, label);
        chartTypes[chartId] = newType;
        showToast('Chart type changed to ' + newType.toUpperCase());
      };

      console.log("Analytics Dashboard with Code A Sidebar Loaded");
    })();
  </script>
</body>
</html>