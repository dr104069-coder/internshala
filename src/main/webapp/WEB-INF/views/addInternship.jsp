<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Post Internship | SmartIntern</title>

<!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">

<style>
    body {
        background: linear-gradient(135deg, #1e3c72, #2a5298);
        min-height: 100vh;
        font-family: 'Segoe UI', sans-serif;
    }

    .glass-card {
        background: rgba(255, 255, 255, 0.15);
        backdrop-filter: blur(12px);
        border-radius: 20px;
        box-shadow: 0 8px 32px rgba(0,0,0,0.3);
        padding: 40px;
        color: white;
    }

    .form-label {
        font-weight: 500;
    }

    .form-control, .form-select {
        border-radius: 10px;
    }

    .section-title {
        font-size: 20px;
        font-weight: 600;
        margin-top: 20px;
        border-bottom: 1px solid rgba(255,255,255,0.3);
        padding-bottom: 5px;
    }

    .btn-custom {
        border-radius: 30px;
        padding: 10px 30px;
        font-weight: 600;
        letter-spacing: 1px;
    }

</style>

</head>
<body>

<div class="container py-5">
    <div class="glass-card mx-auto" style="max-width: 1000px;">

        <h2 class="text-center mb-4">
            <i class="bi bi-briefcase-fill"></i> Post New Internship
        </h2>

        <form action="saveInternship" method="post">

            <!-- Basic Information -->
            <div class="section-title">Basic Information</div>

            <div class="row mt-3">
                <div class="col-md-6">
                    <label class="form-label">Internship Title</label>
                    <input type="text" name="title" class="form-control" placeholder="e.g. Full Stack Developer Intern" required>
                </div>

                <div class="col-md-6">
                    <label class="form-label">Internship Type</label>
                    <select name="internshipType" class="form-select" required>
                        <option value="">Select Type</option>
                        <option value="REMOTE">Remote</option>
                        <option value="ONSITE">Onsite</option>
                        <option value="HYBRID">Hybrid</option>
                    </select>
                </div>
            </div>

            <div class="mt-3">
                <label class="form-label">Description</label>
                <textarea name="description" rows="4" class="form-control" placeholder="Enter internship details..." required></textarea>
            </div>

            <!-- Duration & Stipend -->
            <div class="section-title">Duration & Stipend</div>

            <div class="row mt-3">
                <div class="col-md-4">
                    <label class="form-label">Duration (Months)</label>
                    <input type="number" name="durationMonths" class="form-control" min="1">
                </div>

                <div class="col-md-4">
                    <label class="form-label">Monthly Stipend (₹)</label>
                    <input type="number" step="0.01" name="stipend" class="form-control">
                </div>

                <div class="col-md-4">
                    <label class="form-label">Openings</label>
                    <input type="number" name="openings" class="form-control">
                </div>
            </div>

            <div class="mt-3">
                <label class="form-label">Skills Required</label>
                <textarea name="skillsRequired" rows="2" class="form-control" placeholder="Java, Spring Boot, React..."></textarea>
            </div>

            <!-- Dates -->
            <div class="section-title">Schedule</div>

            <div class="row mt-3">
                <div class="col-md-4">
                    <label class="form-label">Start Date</label>
                    <input type="date" name="startDate" class="form-control">
                </div>

                <div class="col-md-4">
                    <label class="form-label">End Date</label>
                    <input type="date" name="endDate" class="form-control">
                </div>

                <div class="col-md-4">
                    <label class="form-label">Last Apply Date</label>
                    <input type="date" name="lastApplyDate" class="form-control">
                </div>
            </div>

            <!-- Payment & Status -->
            <div class="section-title">Status</div>

            <div class="row mt-3">
                <div class="col-md-4">
                    <label class="form-label">Is Paid?</label>
                    <select name="isPaid" class="form-select">
                        <option value="true">Yes (Paid)</option>
                        <option value="false">No (Unpaid)</option>
                    </select>
                </div>

                <div class="col-md-4">
                    <label class="form-label">Status</label>
                    <select name="status" class="form-select">
                        <option value="OPEN">Open</option>
                        <option value="CLOSED">Closed</option>
                    </select>
                </div>

                <div class="col-md-4">
                    <label class="form-label">Employer ID</label>
                    <input type="number" name="employerId" class="form-control">
                </div>
            </div>

            <!-- Hidden CreatedAt -->
            <input type="hidden" name="createdAt">

            <!-- Submit Button -->
            <div class="text-center mt-5">
                <button type="submit" class="btn btn-light btn-custom">
                    <i class="bi bi-send-fill"></i> Publish Internship
                </button>
            </div>

        </form>

    </div>
</div>

</body>
</html> 
