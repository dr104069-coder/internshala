<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Admin Dashboard | SmartIntern</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">

<style>
body{
    margin:0;
    background:#f4f6f9;
    font-family:'Segoe UI',sans-serif;
}

/* HEADER */
.header{
    background:#0f172a;
    color:white;
    padding:15px 30px;
    display:flex;
    justify-content:space-between;
    align-items:center;
    box-shadow:0 2px 8px rgba(0,0,0,0.1);
}

.header h5{
    margin:0;
    font-weight:600;
}

/* LAYOUT */
.layout{
    display:flex;
    min-height:calc(100vh - 70px);
}

/* SIDEBAR */
.sidebar{
    width:260px;
    background:#111827;
    padding:20px;
}

.sidebar-title{
    color:#9ca3af;
    font-size:12px;
    text-transform:uppercase;
    letter-spacing:1px;
    margin-top:20px;
    margin-bottom:10px;
}

.sidebar a{
    display:flex;
    align-items:center;
    gap:10px;
    padding:10px 12px;
    border-radius:8px;
    color:#e5e7eb;
    text-decoration:none;
    margin-bottom:6px;
    transition:0.2s;
    font-size:14px;
}

.sidebar a:hover{
    background:#1f2937;
    transform:translateX(3px);
}

.sidebar a.active{
    background:#2563eb;
}

/* CONTENT */
.content{
    flex:1;
    padding:30px;
}

/* CARDS */
.stat-card{
    background:white;
    border-radius:15px;
    padding:20px;
    box-shadow:0 5px 15px rgba(0,0,0,0.05);
}

.stat-card h6{
    font-size:13px;
    color:#6b7280;
}

.stat-number{
    font-size:26px;
    font-weight:700;
}

/* ACTIVITY */
.activity-card{
    background:white;
    border-radius:15px;
    padding:20px;
    margin-top:20px;
    box-shadow:0 5px 15px rgba(0,0,0,0.05);
}

.activity-item{
    padding:10px 0;
    border-bottom:1px solid #eee;
    font-size:14px;
}

.activity-item:last-child{
    border-bottom:none;
}

/* FOOTER */
.footer{
    background:#111827;
    color:#9ca3af;
    text-align:center;
    padding:12px;
    font-size:13px;
}
</style>
</head>

<body>

<!-- HEADER -->
<div class="header">
    <h5>SmartIntern Admin Panel</h5>
    <div>
        <a href="logout" class="btn btn-light btn-sm">
            <i class="bi bi-box-arrow-right"></i> Logout
        </a>
    </div>
</div>

<div class="layout">

    <!-- SIDEBAR -->
    <div class="sidebar">

        <div class="sidebar-title">Main</div>
        <a href="#" class="active">
            <i class="bi bi-speedometer2"></i> Dashboard
        </a>

        <div class="sidebar-title">User Management</div>
        <a href="listUser">
            <i class="bi bi-people"></i> Manage Users
        </a>
        
      <div class="sidebar-title">Student</div>
        <a href="addStudentInfo">
            <i class="bi bi-patch-check"></i> Verify Student
        </a>

        <div class="sidebar-title">Employer</div>
        <a href="employer">
            <i class="bi bi-patch-check"></i> Verify Employers
        </a>
        

        <div class="sidebar-title">Internships</div>
        <a href="addInternship">
            <i class="bi bi-briefcase"></i> Manage Internships
        </a>
         <a href="addInternshipEnrollment">
            <i class="bi bi-briefcase"></i> Manage Internships
        </a>
         <a href="applyInternship">
            <i class="bi bi-briefcase"></i> Manage Internships
        </a>
        <a href="review">
            <i class="bi bi-graph-up"></i> Review
        </a>
        <a href="certificate">
            <i class="bi bi-graph-up"></i> Certificate
        </a>

    </div>

    <!-- CONTENT -->
    <div class="content">

        <div class="row g-4">

            <div class="col-md-3">
                <div class="stat-card">
                    <h6>Total Users</h6>
                    <div class="stat-number">128</div>
                </div>
            </div>

            <div class="col-md-3">
                <div class="stat-card">
                    <h6>Active Internships</h6>
                    <div class="stat-number">34</div>
                </div>
            </div>

            <div class="col-md-3">
                <div class="stat-card">
                    <h6>Pending Employers</h6>
                    <div class="stat-number">4</div>
                </div>
            </div>

            <div class="col-md-3">
                <div class="stat-card">
                    <h6>Reports Flagged</h6>
                    <div class="stat-number">1</div>
                </div>
            </div>

        </div>

        <!-- ACTIVITY -->
        <div class="activity-card">
            <h6 class="mb-3 fw-semibold">Recent Activity</h6>

            <div class="activity-item">
                👨‍🎓 Student Darshan applied for Java Internship
            </div>

            <div class="activity-item">
                🏢 InnoSoft posted a new internship
            </div>

            <div class="activity-item">
                ✅ CodeCraft employer verified
            </div>

            <div class="activity-item">
                🎓 Internship marked completed
            </div>
        </div>

    </div>

</div>

<!-- FOOTER -->
<div class="footer">
    © 2026 SmartIntern — Internship Management Platform
</div>

</body>
</html>
