<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Command Center | SmartIntern</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">

<style>
body{
    background:#eef2f7;
    font-family:'Segoe UI',sans-serif;
}

/* TOP BAR */
.topbar{
    background:#0f172a;
    color:#fff;
    padding:14px 26px;
}
.brand{
    font-size:22px;
    font-weight:700;
}

/* LAYOUT */
.wrapper{
    display:flex;
    min-height:calc(100vh - 64px);
}

/* SIDEBAR */
.sidebar{
    width:260px;
    background:#020617;
    padding:20px;
}
.sidebar h6{
    color:#94a3b8;
    font-size:12px;
    margin-bottom:15px;
}
.sidebar a{
    display:flex;
    align-items:center;
    gap:10px;
    padding:11px 14px;
    border-radius:10px;
    color:#e5e7eb;
    text-decoration:none;
    margin-bottom:6px;
}
.sidebar a:hover,
.sidebar a.active{
    background:#2563eb;
}

/* CONTENT */
.content{
    flex:1;
    padding:30px;
}

/* CARDS */
.box{
    background:#fff;
    border-radius:16px;
    padding:22px;
    border:1px solid #e5e7eb;
}

/* SYSTEM STATUS */
.status-pill{
    display:flex;
    justify-content:space-between;
    align-items:center;
    padding:10px 14px;
    border-radius:12px;
    margin-bottom:10px;
}
.ok{background:#ecfdf5;color:#047857;}
.warn{background:#fff7ed;color:#c2410c;}
.danger{background:#fef2f2;color:#b91c1c;}

/* QUICK ACTION */
.quick-btn{
    width:100%;
    border-radius:12px;
    padding:14px;
    font-weight:600;
}

/* ACTIVITY */
.activity{
    font-size:14px;
    padding:10px 0;
    border-bottom:1px solid #e5e7eb;
}
.activity:last-child{border:none;}

.footer{
    background:#020617;
    color:#94a3b8;
    padding:12px;
    text-align:center;
    font-size:13px;
}
</style>
</head>

<body>

<!-- TOP BAR -->
<div class="topbar d-flex justify-content-between align-items-center">
    <div class="brand">SmartIntern • Admin Command Center</div>
    <a href="logout" class="btn btn-outline-light btn-sm">
        <i class="bi bi-box-arrow-right"></i> Logout
    </a>
</div>

<div class="wrapper">

    <!-- SIDEBAR -->
    <div class="sidebar">
        <h6>ADMIN NAVIGATION</h6>

        <a href="#" class="active">
            <i class="bi bi-command"></i> Command Center
        </a>
        <a href="verifyEmployers">
            <i class="bi bi-patch-check"></i> Employer Verification
        </a>
        <a href="manageUsers">
            <i class="bi bi-people"></i> Users
        </a>
        <a href="internships">
            <i class="bi bi-briefcase"></i> Internships
        </a>
        <a href="reports">
            <i class="bi bi-graph-up"></i> Reports
        </a>
    </div>

    <!-- MAIN -->
    <div class="content">

        <div class="row g-4">

            <!-- SYSTEM HEALTH -->
            <div class="col-md-4">
                <div class="box">
                    <h6 class="fw-semibold mb-3">System Health</h6>

                    <div class="status-pill ok">
                        <span>Platform Status</span>
                        <strong>Operational</strong>
                    </div>

                    <div class="status-pill ok">
                        <span>User Authentication</span>
                        <strong>Stable</strong>
                    </div>

                    <div class="status-pill warn">
                        <span>Pending Employer Verifications</span>
                        <strong>4</strong>
                    </div>

                    <div class="status-pill danger">
                        <span>Reported Internships</span>
                        <strong>1</strong>
                    </div>
                </div>
            </div>

            <!-- ADMIN TASK INBOX -->
            <div class="col-md-4">
                <div class="box">
                    <h6 class="fw-semibold mb-3">Admin Task Inbox</h6>

                    <div class="activity">
                        🏢 <strong>TechNova</strong> waiting for verification
                    </div>
                    <div class="activity">
                        📄 Internship report flagged by student
                    </div>
                    <div class="activity">
                        👤 New employer registered today
                    </div>
                    <div class="activity">
                        🎓 Certificate approval pending
                    </div>
                </div>
            </div>

            <!-- QUICK ACTIONS -->
            <div class="col-md-4">
                <div class="box">
                    <h6 class="fw-semibold mb-3">Quick Admin Actions</h6>

                    <button class="btn btn-primary quick-btn mb-2">
                        Verify Employers
                    </button>
                    <button class="btn btn-outline-primary quick-btn mb-2">
                        View Internship Reports
                    </button>
                    <button class="btn btn-outline-danger quick-btn">
                        Suspend User
                    </button>
                </div>
            </div>

            <!-- LIVE ACTIVITY FEED -->
            <div class="col-md-12">
                <div class="box">
                    <h6 class="fw-semibold mb-3">Live Platform Activity</h6>

                    <div class="activity">
                        👨‍🎓 Student <strong>Darshan</strong> applied for Java Internship
                    </div>
                    <div class="activity">
                        🏢 Employer <strong>InnoSoft</strong> posted a new internship
                    </div>
                    <div class="activity">
                        ✅ Employer <strong>CodeCraft</strong> verified by Admin
                    </div>
                    <div class="activity">
                        🎓 Internship marked as completed
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>

<div class="footer">
    © 2026 SmartIntern — Intelligent Internship Platform
</div>

</body>
</html>