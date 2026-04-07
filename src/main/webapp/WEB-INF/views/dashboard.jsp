<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>SmartIntern · Analytics Dashboard</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/chart.js@4.4.0/dist/chart.umd.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

  <style>
    :root {
      --deep-blue: #2C3E50;
      --bright-blue: #4B8BBE;
      --soft-blue: #B3CDE0;
      --pure-white: #FFFFFF;
      --medium-grey: #A8A8A8;
      --glass-deep: rgba(44, 62, 80, 0.7);
      --glass-deep-darker: rgba(44, 62, 80, 0.85);
      --border-blue: rgba(75, 139, 190, 0.3);
      --sidebar-width: 280px;
      --header-height: 80px;
    }

    * { margin: 0; padding: 0; box-sizing: border-box; }

    body {
      font-family: 'Inter', sans-serif;
      background: linear-gradient(145deg, #2C3E50 0%, #1e2b38 100%);
      min-height: 100vh;
      transition: all 0.3s ease;
    }

    /* Light Theme */
    body.light-theme {
      background: linear-gradient(145deg, #e0e5ec 0%, #f0f4f8 100%);
    }
    body.light-theme .metric-card,
    body.light-theme .chart-card,
    body.light-theme .nav-sidebar,
    body.light-theme .admin-header,
    body.light-theme .dashboard-footer {
      background: rgba(255, 255, 255, 0.95);
    }
    body.light-theme .metric-card h6,
    body.light-theme .chart-card h6,
    body.light-theme .metric-number,
    body.light-theme .dropdown-toggle,
    body.light-theme .dropdown-item {
      color: #2C3E50;
    }

    .admin-header {
      height: var(--header-height);
      background: var(--glass-deep-darker);
      backdrop-filter: blur(12px);
      border-bottom: 1px solid var(--border-blue);
      padding: 0 2rem;
      display: flex;
      justify-content: space-between;
      align-items: center;
      position: sticky;
      top: 0;
      z-index: 1000;
    }

    .logo-container { display: flex; align-items: center; gap: 1rem; }
    .logo-text { font-size: 1.5rem; font-weight: 700; color: var(--pure-white); }
    .logo-blue {
      width: 42px;
      height: 42px;
      background: linear-gradient(135deg, #2C3E50, #4B8BBE);
      border-radius: 12px;
      display: flex;
      align-items: center;
      justify-content: center;
    }
    .logo-blue i { font-size: 22px; color: white; }

    .dark-btn, .logout-btn {
      background: rgba(255, 255, 255, 0.05);
      border: 1px solid var(--border-blue);
      color: var(--soft-blue);
      border-radius: 40px;
      padding: 0.5rem 1.2rem;
      font-weight: 500;
      transition: all 0.3s ease;
      cursor: pointer;
      text-decoration: none;
      display: inline-flex;
      align-items: center;
      gap: 0.5rem;
      font-size: 0.9rem;
    }
    .dark-btn:hover, .logout-btn:hover {
      background: var(--bright-blue);
      color: var(--pure-white);
    }

    .dashboard-layout { display: flex; min-height: calc(100vh - var(--header-height)); }

    .nav-sidebar {
      width: var(--sidebar-width);
      background: var(--glass-deep-darker);
      backdrop-filter: blur(12px);
      border-right: 1px solid var(--border-blue);
      padding: 1.5rem 1rem;
      transition: width 0.3s ease;
      overflow-y: auto;
    }

    .nav-category {
      color: var(--medium-grey);
      font-size: 0.7rem;
      text-transform: uppercase;
      letter-spacing: 2px;
      margin: 1rem 0 0.5rem 0.8rem;
    }

    .dropdown { width: 100%; margin-bottom: 0.2rem; }

    .dropdown-toggle {
      display: flex;
      align-items: center;
      gap: 1rem;
      padding: 0.7rem 1rem;
      border-radius: 10px;
      color: var(--soft-blue);
      background: transparent;
      border: none;
      width: 100%;
      text-align: left;
      transition: all 0.3s ease;
      font-size: 0.9rem;
    }
    .dropdown-toggle:hover { 
      background: rgba(75, 139, 190, 0.1); 
      color: white;
      transform: translateX(5px);
    }
    .dropdown-toggle i { 
      color: var(--bright-blue); 
      font-size: 1.2rem;
      width: 1.6rem;
    }
    .dropdown-toggle.active {
      background: rgba(75, 139, 190, 0.15);
      border-left: 3px solid var(--bright-blue);
      color: white;
    }

    .dropdown-menu {
      background: var(--glass-deep);
      backdrop-filter: blur(12px);
      border: 1px solid var(--border-blue);
      border-radius: 10px;
      padding: 0.4rem;
      margin-left: 1.8rem;
      margin-top: 0.2rem;
    }

    .dropdown-item {
      border-radius: 6px;
      padding: 0.5rem 0.8rem;
      color: var(--soft-blue);
      display: flex;
      align-items: center;
      gap: 0.6rem;
      transition: all 0.3s ease;
      text-decoration: none;
      font-size: 0.85rem;
    }
    .dropdown-item:hover {
      background: rgba(75, 139, 190, 0.1);
      color: white;
      transform: translateX(5px);
    }
    .dropdown-item i { color: var(--bright-blue); font-size: 0.9rem; width: 1.2rem; }

    .main-panel { flex: 1; padding: 1.5rem; background: transparent; overflow-y: auto; }

    .metric-card, .chart-card {
      background: var(--glass-deep);
      backdrop-filter: blur(12px);
      border-radius: 16px;
      padding: 1.2rem;
      border: 1px solid var(--border-blue);
      transition: all 0.3s ease;
      height: 100%;
    }
    .metric-card:hover, .chart-card:hover { 
      transform: translateY(-3px); 
      border-color: var(--bright-blue);
      box-shadow: 0 8px 25px rgba(75, 139, 190, 0.2);
    }

    .metric-number { font-size: 2rem; font-weight: 700; color: var(--pure-white); }
    .metric-card h6, .chart-card h6 { 
      color: var(--soft-blue); 
      margin-bottom: 0.8rem;
      font-size: 0.8rem;
      text-transform: uppercase;
      letter-spacing: 1px;
    }

    canvas { max-height: 220px; width: 100% !important; }

    .dashboard-footer {
      background: var(--glass-deep-darker);
      color: var(--medium-grey);
      text-align: center;
      padding: 0.8rem;
      font-size: 0.8rem;
      border-top: 1px solid var(--border-blue);
    }

    .toast-notification {
      position: fixed;
      top: 90px;
      right: 20px;
      background: var(--bright-blue);
      color: white;
      padding: 10px 18px;
      border-radius: 8px;
      z-index: 9999;
      animation: slideIn 0.3s ease;
      font-size: 0.9rem;
    }
    @keyframes slideIn {
      from { transform: translateX(100%); opacity: 0; }
      to { transform: translateX(0); opacity: 1; }
    }

    .nav-sidebar.collapsed { width: 70px; padding: 1.5rem 0.3rem; }
    .nav-sidebar.collapsed .nav-category,
    .nav-sidebar.collapsed .dropdown-toggle span,
    .nav-sidebar.collapsed .dropdown-menu { display: none; }
    .nav-sidebar.collapsed .dropdown-toggle { justify-content: center; padding: 0.7rem 0; }
    .nav-sidebar.collapsed .dropdown-toggle i { margin: 0; }

    .dashboard-layout.fullscreen .nav-sidebar { display: none; }

    @media (max-width: 768px) { 
      .main-panel { padding: 1rem; } 
      .admin-header { padding: 0 1rem; }
      .dark-btn span { display: none; }
      .dark-btn { padding: 0.5rem 0.8rem; }
    }
  </style>
</head>
<body>

  <header class="admin-header">
    <div class="logo-container">
      <div class="logo-blue"><i class="bi bi-briefcase-fill"></i></div>
      <span class="logo-text">SmartIntern</span>
    </div>
    <div class="header-actions">
      <span class="dark-btn" id="toggleThemeBtn" title="Dark/Light Mode">
        <i class="bi bi-moon-stars-fill"></i> <span>Theme</span>
      </span>
      <span class="dark-btn" id="exportPDFBtn" title="Export Dashboard">
        <i class="bi bi-file-pdf-fill"></i> <span>PDF</span>
      </span>
      <span class="dark-btn" id="refreshDataBtn" title="Refresh Data">
        <i class="bi bi-arrow-repeat"></i> <span>Refresh</span>
      </span>
      <span class="dark-btn" id="toggleCollapseBtn">
        <i class="bi bi-layout-sidebar"></i> <span id="collapseText">Collapse</span>
      </span>
      <span class="dark-btn" id="fullscreenBtn" title="Fullscreen">
        <i class="bi bi-arrows-fullscreen"></i> <span>Full</span>
      </span>
      <a href="logout" class="logout-btn"><i class="bi bi-box-arrow-right"></i> <span>Exit</span></a>
    </div>
  </header>

  <div class="dashboard-layout" id="dashboardLayout">

    <aside class="nav-sidebar" id="mainSidebar">
      <div class="nav-category">Core</div>
      <div class="dropdown">
        <button class="dropdown-toggle active" type="button" data-bs-toggle="collapse" data-bs-target="#dashboardMenu">
          <i class="bi bi-speedometer2"></i> <span>Dashboard</span>
        </button>
      </div>
      <div class="nav-category">Identity</div>
      <div class="dropdown">
        <button class="dropdown-toggle" type="button" data-bs-toggle="collapse" data-bs-target="#userMenu">
          <i class="bi bi-people-fill"></i> <span>Manage Users</span>
        </button>
        <div class="collapse" id="userMenu">
          <div class="dropdown-menu show">
            <a class="dropdown-item" href="/listUser"><i class="bi bi-person-plus"></i> Users</a>
            <a class="dropdown-item" href="addUser"><i class="bi bi-person-dash"></i> Add User</a>
          </div>
        </div>
      </div>
      <div class="dropdown">
        <button class="dropdown-toggle" type="button" data-bs-toggle="collapse" data-bs-target="#studentMenu">
          <i class="bi bi-patch-check-fill"></i> <span>Verify Student</span>
        </button>
        <div class="collapse" id="studentMenu">
          <div class="dropdown-menu show">
            <a class="dropdown-item" href="listStudent"><i class="bi bi-check-circle"></i> Students</a>
            <a class="dropdown-item" href="addStudentInfo"><i class="bi bi-x-circle"></i> Add Student</a>
          </div>
        </div>
      </div>
      <div class="dropdown">
        <button class="dropdown-toggle" type="button" data-bs-toggle="collapse" data-bs-target="#employerMenu">
          <i class="bi bi-building"></i> <span>Verify Employers</span>
        </button>
        <div class="collapse" id="employerMenu">
          <div class="dropdown-menu show">
            <a class="dropdown-item" href="listEmployer"><i class="bi bi-shield-check"></i> Employers</a>
            <a class="dropdown-item" href="employer"><i class="bi bi-shield-exclamation"></i> Add Employer</a>
          </div>
        </div>
      </div>
      <div class="nav-category">Opportunities</div>
      <div class="dropdown">
        <button class="dropdown-toggle" type="button" data-bs-toggle="collapse" data-bs-target="#internshipMenu">
          <i class="bi bi-briefcase-fill"></i> <span>Internship</span>
        </button>
        <div class="collapse" id="internshipMenu">
          <div class="dropdown-menu show">
            <a class="dropdown-item" href="listInternship"><i class="bi bi-send"></i> List Internship</a>
            <a class="dropdown-item" href="addInternship"><i class="bi bi-file-text"></i> Add Internship</a>
          </div>
        </div>
      </div>
      <div class="dropdown">
        <button class="dropdown-toggle" type="button" data-bs-toggle="collapse" data-bs-target="#enrollmentMenu">
          <i class="bi bi-journal-bookmark-fill"></i> <span>Enrollments</span>
        </button>
        <div class="collapse" id="enrollmentMenu">
          <div class="dropdown-menu show">
            <a class="dropdown-item" href="listEnrollment"><i class="bi bi-list-check"></i> List Enrollments</a>
            <a class="dropdown-item" href="addInternshipEnrollment"><i class="bi bi-clock-history"></i> New Enroll</a>
          </div>
        </div>
      </div>
      <div class="dropdown">
        <button class="dropdown-toggle" type="button" data-bs-toggle="collapse" data-bs-target="#applicationMenu">
          <i class="bi bi-send-fill"></i> <span>Applications</span>
        </button>
        <div class="collapse" id="applicationMenu">
          <div class="dropdown-menu show">
            <a class="dropdown-item" href="listapplications"><i class="bi bi-envelope-open"></i> Applications</a>
            <a class="dropdown-item" href="applyInternship"><i class="bi bi-archive"></i> Add Application</a>
          </div>
        </div>
      </div>
      <div class="dropdown">
        <button class="dropdown-toggle" type="button" data-bs-toggle="collapse" data-bs-target="#reviewMenu">
          <i class="bi bi-star-fill"></i> <span>Reviews</span>
        </button>
        <div class="collapse" id="reviewMenu">
          <div class="dropdown-menu show">
            <a class="dropdown-item" href="listReview"><i class="bi bi-star-half"></i> Review</a>
            <a class="dropdown-item" href="review"><i class="bi bi-star"></i> Add Review</a>
          </div>
        </div>
      </div>
      <div class="dropdown">
        <button class="dropdown-toggle" type="button" data-bs-toggle="collapse" data-bs-target="#certificateMenu">
          <i class="bi bi-award-fill"></i> <span>Certificates</span>
        </button>
        <div class="collapse" id="certificateMenu">
          <div class="dropdown-menu show">
            <a class="dropdown-item" href="listCertificate"><i class="bi bi-file-pdf"></i> List Certificate</a>
            <a class="dropdown-item" href="certificate"><i class="bi bi-download"></i> Add Certificate</a>
          </div>
        </div>
      </div>
    </aside>

    <main class="main-panel" id="mainPanel">

      <!-- Metric Cards Row -->
      <div class="row g-3 mb-4">
        <div class="col-md-3">
          <div class="metric-card">
            <h6><i class="bi bi-people-fill"></i> Total Users</h6>
            <div class="metric-number">${totalUsers}</div>
          </div>
        </div>
        <div class="col-md-3">
          <div class="metric-card">
            <h6><i class="bi bi-briefcase-fill"></i> Total Internships</h6>
            <div class="metric-number">${totalInternships}</div>
          </div>
        </div>
        <div class="col-md-3">
          <div class="metric-card">
            <h6><i class="bi bi-send-fill"></i> Total Applications</h6>
            <div class="metric-number">${totalApplications}</div>
          </div>
        </div>
        <div class="col-md-3">
          <div class="metric-card">
            <h6><i class="bi bi-award-fill"></i> Total Enrollments</h6>
            <div class="metric-number">${totalEnrollments}</div>
          </div>
        </div>
      </div>

      <!-- Graphs Row 1 -->
      <div class="row g-3 mb-4">
        <div class="col-md-6">
          <div class="chart-card">
            <div class="d-flex justify-content-between align-items-center">
              <h6><i class="bi bi-pie-chart-fill"></i> 1. User Role Distribution</h6>
              <button class="btn btn-sm btn-outline-info" onclick="exportChartAsImage('userRoleChart', 'User_Roles')">
                <i class="bi bi-download"></i>
              </button>
            </div>
            <canvas id="userRoleChart"></canvas>
          </div>
        </div>
        <div class="col-md-6">
          <div class="chart-card">
            <div class="d-flex justify-content-between align-items-center">
              <h6><i class="bi bi-calendar-week"></i> 2. Monthly Registrations</h6>
              <button class="btn btn-sm btn-outline-info" onclick="toggleChartType('monthlyRegChart')">
                <i class="bi bi-bar-chart-steps"></i> Toggle
              </button>
            </div>
            <canvas id="monthlyRegChart"></canvas>
          </div>
        </div>
      </div>

      <!-- Graphs Row 2 -->
      <div class="row g-3 mb-4">
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

      <!-- Graphs Row 3 -->
      <div class="row g-3 mb-4">
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

      <!-- Graph Row 4 -->
      <div class="row g-3">
        <div class="col-md-12">
          <div class="chart-card">
            <div class="d-flex justify-content-between align-items-center">
              <h6><i class="bi bi-file-pdf-fill"></i> 7. Certificates Issued Monthly</h6>
              <button class="btn btn-sm btn-outline-info" onclick="toggleChartType('certificatesChart')">
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
  <script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.10.1/html2pdf.bundle.min.js"></script>

  <script>
    // ========== GLOBAL VARIABLES ==========
    let charts = {};
    let currentChartTypes = { monthlyRegChart: 'bar', certificatesChart: 'line' };

    // ========== SIDEBAR COLLAPSE ==========
    const layout = document.getElementById('dashboardLayout');
    const sidebar = document.getElementById('mainSidebar');
    const toggleBtn = document.getElementById('toggleCollapseBtn');
    const collapseText = document.getElementById('collapseText');

    toggleBtn.addEventListener('click', function(e) {
      e.preventDefault();
      sidebar.classList.toggle('collapsed');
      collapseText.innerText = sidebar.classList.contains('collapsed') ? 'Expand' : 'Collapse';
    });

    // ========== FULLSCREEN ==========
    const fullscreenBtn = document.getElementById('fullscreenBtn');
    fullscreenBtn.addEventListener('click', function() {
      if (!document.fullscreenElement) {
        document.documentElement.requestFullscreen();
        fullscreenBtn.innerHTML = '<i class="bi bi-fullscreen-exit"></i> <span>Exit</span>';
      } else {
        document.exitFullscreen();
        fullscreenBtn.innerHTML = '<i class="bi bi-arrows-fullscreen"></i> <span>Full</span>';
      }
    });

    document.addEventListener('fullscreenchange', () => {
      if (document.fullscreenElement) {
        fullscreenBtn.innerHTML = '<i class="bi bi-fullscreen-exit"></i> <span>Exit</span>';
      } else {
        fullscreenBtn.innerHTML = '<i class="bi bi-arrows-fullscreen"></i> <span>Full</span>';
      }
    });

    // ========== THEME SWITCHER ==========
    const themeBtn = document.getElementById('toggleThemeBtn');
    let isDarkMode = true;
    themeBtn.addEventListener('click', function() {
      isDarkMode = !isDarkMode;
      if(isDarkMode) {
        document.body.classList.remove('light-theme');
        themeBtn.innerHTML = '<i class="bi bi-moon-stars-fill"></i> <span>Theme</span>';
      } else {
        document.body.classList.add('light-theme');
        themeBtn.innerHTML = '<i class="bi bi-sun-fill"></i> <span>Theme</span>';
      }
      showToast('Switched to ' + (isDarkMode ? 'Dark' : 'Light') + ' Mode');
    });

    // ========== TOAST NOTIFICATION ==========
    function showToast(message) {
      const toast = document.createElement('div');
      toast.className = 'toast-notification';
      toast.innerHTML = '<i class="bi bi-check-circle"></i> ' + message;
      document.body.appendChild(toast);
      setTimeout(function() { toast.remove(); }, 3000);
    }

    // ========== EXPORT CHART AS IMAGE ==========
    function exportChartAsImage(chartId, filename) {
      const canvas = document.getElementById(chartId);
      if(canvas) {
        const link = document.createElement('a');
        link.download = filename + '.png';
        link.href = canvas.toDataURL();
        link.click();
        showToast('Exported ' + filename);
      }
    }

    // ========== EXPORT AS PDF ==========
    document.getElementById('exportPDFBtn').addEventListener('click', function() {
      const element = document.getElementById('mainPanel');
      html2pdf().from(element).set({
        margin: [10, 10, 10, 10],
        filename: 'SmartIntern_Dashboard.pdf',
        html2canvas: { scale: 2 },
        jsPDF: { unit: 'mm', format: 'a4', orientation: 'landscape' }
      }).save();
      showToast('Exporting dashboard as PDF...');
    });

    // ========== REFRESH DATA ==========
    document.getElementById('refreshDataBtn').addEventListener('click', function() {
      location.reload();
    });

    // ========== TOGGLE CHART TYPE ==========
    function toggleChartType(chartId) {
      const canvas = document.getElementById(chartId);
      if(!canvas) return;
      
      const currentType = currentChartTypes[chartId] || 'bar';
      let newType, labels, values, label;
      
      if(chartId === 'monthlyRegChart') {
        labels = monthlyLabels;
        values = monthlyValues;
        label = 'New Users';
        newType = currentType === 'bar' ? 'line' : 'bar';
      } else {
        labels = certMonths;
        values = certCounts;
        label = 'Certificates Issued';
        newType = currentType === 'line' ? 'bar' : 'line';
      }
      
      if(charts[chartId]) charts[chartId].destroy();
      
      if(newType === 'bar') {
        charts[chartId] = createBarChart(canvas.getContext('2d'), labels, values, label);
      } else {
        charts[chartId] = createLineChart(canvas.getContext('2d'), labels, values, label);
      }
      
      currentChartTypes[chartId] = newType;
      showToast('Chart type changed to ' + newType.toUpperCase());
    }

    // ========== GRAPH DATA FROM BACKEND ==========
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

    // Chart.js Configuration
    Chart.defaults.font.family = "'Inter', sans-serif";
    Chart.defaults.color = '#B3CDE0';

    function createPieChart(ctx, labels, values) {
      if(!ctx || !labels.length) return null;
      return new Chart(ctx, {
        type: 'doughnut',
        data: { 
          labels: labels, 
          datasets: [{ 
            data: values, 
            backgroundColor: ['#4B8BBE', '#2C3E50', '#B3CDE0', '#A8A8A8', '#6ba5d1'], 
            borderWidth: 0,
            hoverOffset: 10
          }] 
        },
        options: { 
          responsive: true, 
          maintainAspectRatio: true,
          plugins: { 
            legend: { position: 'bottom', labels: { color: '#B3CDE0', font: { size: 10 } } }
          } 
        }
      });
    }

    function createBarChart(ctx, labels, values, label) {
      if(!ctx || !labels.length) return null;
      return new Chart(ctx, {
        type: 'bar',
        data: { 
          labels: labels, 
          datasets: [{ 
            label: label, 
            data: values, 
            backgroundColor: '#4B8BBE', 
            borderRadius: 8,
            barPercentage: 0.65
          }] 
        },
        options: { 
          responsive: true, 
          maintainAspectRatio: true,
          plugins: { legend: { labels: { color: '#B3CDE0' } } },
          scales: { 
            y: { ticks: { color: '#B3CDE0', stepSize: 1 }, grid: { color: 'rgba(179, 205, 224, 0.1)' } }, 
            x: { ticks: { color: '#B3CDE0' }, grid: { color: 'rgba(179, 205, 224, 0.1)' } } 
          } 
        }
      });
    }

    function createLineChart(ctx, labels, values, label) {
      if(!ctx || !labels.length) return null;
      return new Chart(ctx, {
        type: 'line',
        data: { 
          labels: labels, 
          datasets: [{ 
            label: label, 
            data: values, 
            borderColor: '#4B8BBE', 
            backgroundColor: 'rgba(75, 139, 190, 0.1)', 
            fill: true, 
            tension: 0.4,
            pointBackgroundColor: '#4B8BBE',
            pointBorderColor: '#FFFFFF',
            pointRadius: 4
          }] 
        },
        options: { 
          responsive: true, 
          maintainAspectRatio: true,
          plugins: { legend: { labels: { color: '#B3CDE0' } } },
          scales: { 
            y: { ticks: { color: '#B3CDE0', stepSize: 1 }, grid: { color: 'rgba(179, 205, 224, 0.1)' } }, 
            x: { ticks: { color: '#B3CDE0' }, grid: { color: 'rgba(179, 205, 224, 0.1)' } } 
          } 
        }
      });
    }

    function createHorizontalBarChart(ctx, labels, values, label) {
      if(!ctx || !labels.length) return null;
      return new Chart(ctx, {
        type: 'bar',
        data: { 
          labels: labels, 
          datasets: [{ 
            label: label, 
            data: values, 
            backgroundColor: '#4B8BBE', 
            borderRadius: 8
          }] 
        },
        options: { 
          indexAxis: 'y', 
          responsive: true, 
          maintainAspectRatio: true,
          plugins: { legend: { labels: { color: '#B3CDE0' } } },
          scales: { 
            x: { ticks: { color: '#B3CDE0', stepSize: 1 }, grid: { color: 'rgba(179, 205, 224, 0.1)' } }, 
            y: { ticks: { color: '#B3CDE0' }, grid: { display: false } } 
          } 
        }
      });
    }

    // Create all charts
    if(roleLabels.length) charts.userRoleChart = createPieChart(document.getElementById('userRoleChart'), roleLabels, roleValues);
    if(monthlyLabels.length) charts.monthlyRegChart = createBarChart(document.getElementById('monthlyRegChart'), monthlyLabels, monthlyValues, 'New Users');
    if(statusLabels.length) charts.internshipStatusChart = createPieChart(document.getElementById('internshipStatusChart'), statusLabels, statusValues);
    if(appLabels.length) charts.applicationStatusChart = createPieChart(document.getElementById('applicationStatusChart'), appLabels, appValues);
    if(topTitles.length) charts.topInternshipsChart = createHorizontalBarChart(document.getElementById('topInternshipsChart'), topTitles, topCounts, 'Applications');
    if(enrollLabels.length) charts.enrollmentStatusChart = createPieChart(document.getElementById('enrollmentStatusChart'), enrollLabels, enrollValues);
    if(certMonths.length) charts.certificatesChart = createLineChart(document.getElementById('certificatesChart'), certMonths, certCounts, 'Certificates Issued');

    console.log("Dashboard loaded successfully!");
  </script>
</body>
</html>