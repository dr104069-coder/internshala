<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Internship | Employer</title>

<!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
body {
    background: linear-gradient(to right, #eef2f3, #dfe9f3);
}

.container-box {
    max-width: 900px;
    margin: auto;
    margin-top: 40px;
}

.card {
    border-radius: 15px;
    border: none;
    box-shadow: 0 4px 25px rgba(0,0,0,0.1);
}

.form-control, .form-select {
    border-radius: 10px;
}

.btn-custom {
    background: #198754;
    color: white;
    border-radius: 10px;
}

.btn-custom:hover {
    background: #157347;
}
</style>

</head>
<body>

<div class="container container-box">
    <div class="card p-4">

        <h3 class="text-center mb-4">Post Internship</h3>

       <form action="${pageContext.request.contextPath}/saveInternshipEmployer" method="post" enctype="multipart/form-data">

            <!-- Title -->
            <div class="mb-3">
                <label class="form-label">Internship Title</label>
                <input type="text" name="title" class="form-control" required>
            </div>

            <!-- Description -->
            <div class="mb-3">
                <label class="form-label">Description</label>
                <textarea name="description" class="form-control" rows="4" required></textarea>
            </div>

            <!-- Type -->
            <div class="mb-3">
                <label class="form-label">Internship Type</label>
                <select name="internshipType" class="form-select" required>
                    <option value="">Select Type</option>
                    <option value="REMOTE">Remote</option>
                    <option value="ONSITE">Onsite</option>
                    <option value="HYBRID">Hybrid</option>
                </select>
            </div>

            <!-- Duration + Stipend -->
            <div class="row">
                <div class="col-md-6 mb-3">
                    <label class="form-label">Duration (Months)</label>
                    <input type="number" name="durationMonths" class="form-control" required>
                </div>

                <div class="col-md-6 mb-3">
                    <label class="form-label">Stipend (₹)</label>
                    <input type="number" name="stipend" class="form-control">
                </div>
            </div>

            <!-- Paid -->
            <div class="mb-3">
                <label class="form-label">Is Paid?</label>
                <select name="isPaid" class="form-select">
                    <option value="true">Paid</option>
                    <option value="false">Unpaid</option>
                </select>
            </div>

            <!-- Location -->
            <div class="mb-3">
                <label class="form-label">Location</label>
                <input type="text" name="location" class="form-control">
            </div>

            <!-- Skills -->
            <div class="mb-3">
                <label class="form-label">Skills Required</label>
                <input type="text" name="skillsRequired" class="form-control" placeholder="Java, Spring Boot, SQL">
            </div>

            <!-- Openings -->
            <div class="mb-3">
                <label class="form-label">Number of Openings</label>
                <input type="number" name="openings" class="form-control">
            </div>

            <!-- Dates -->
            <div class="row">
                <div class="col-md-4 mb-3">
                    <label class="form-label">Start Date</label>
                    <input type="date" name="startDate" class="form-control">
                </div>

                <div class="col-md-4 mb-3">
                    <label class="form-label">End Date</label>
                    <input type="date" name="endDate" class="form-control">
                </div>

                <div class="col-md-4 mb-3">
                    <label class="form-label">Last Apply Date</label>
                    <input type="date" name="lastApplyDate" class="form-control">
                </div>
            </div>

            <!-- Poster -->
            <div class="mb-3">
                <label class="form-label">Upload Poster</label>
                <input type="file" name="posterFile" class="form-control">
            </div>

            <!-- Submit -->
            <div class="text-center">
                <button type="submit" class="btn btn-custom px-4">Post Internship</button>
            </div>

        </form>
    </div>
</div>

</body>
</html>