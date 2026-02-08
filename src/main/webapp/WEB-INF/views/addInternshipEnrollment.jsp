<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Internship Enrollment | SmartIntern</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
    body{
        background: linear-gradient(to right, #eef2f7, #ffffff);
    }
    .card{
        border-radius: 16px;
        box-shadow: 0 10px 30px rgba(0,0,0,0.08);
        border: none;
    }
    .form-label{
        font-weight: 600;
        font-size: 14px;
    }
</style>

</head>
<body>

<div class="container mt-5">
<div class="row justify-content-center">
<div class="col-md-8">

<div class="card p-4">

<h4 class="text-center mb-4 fw-bold">
Internship Enrollment
</h4>

<form action="saveInternshipEnrollment" method="post">

    <!-- Student ID from Session -->
    <input type="hidden" name="studentId" value="${sessionScope.userId}">

    <div class="row">

        <!-- Internship Dropdown -->
        <div class="col-md-12 mb-3">
            <label class="form-label">Select Internship</label>
            <select name="internshipId" class="form-select" required>
                <option value="">-- Choose Internship --</option>
                <c:forEach items="${internshipList}" var="i">
                    <option value="${i.internshipId}">
                        ${i.title} - ${i.companyName}
                    </option>
                </c:forEach>
            </select>
        </div>

        <!-- Joining Date -->
        <div class="col-md-6 mb-3">
            <label class="form-label">Joining Date</label>
            <input type="date" name="joiningDate" class="form-control" required>
        </div>

        <!-- Completion Date -->
        <div class="col-md-6 mb-3">
            <label class="form-label">Completion Date</label>
            <input type="date" name="completionDate" class="form-control">
        </div>

        <!-- Performance Rating -->
        <div class="col-md-6 mb-3">
            <label class="form-label">Performance Rating (1-10)</label>
            <input type="number" name="performanceRating"
                   min="1" max="10"
                   class="form-control"
                   placeholder="Optional">
        </div>

        <!-- Status -->
        <div class="col-md-6 mb-3">
            <label class="form-label">Status</label>
            <select name="status" class="form-select" required>
                <option value="">-- Select Status --</option>
                <option value="ON_GOING">ON_GOING</option>
                <option value="COMPLETED">COMPLETED</option>
                <option value="DROPPED">DROPPED</option>
            </select>
        </div>

    </div>

    <div class="text-center mt-4">
        <button type="submit" class="btn btn-dark px-4">
            Save Enrollment
        </button>
        <a href="studentDashboard" class="btn btn-outline-secondary px-4">
            Cancel
        </a>
    </div>

</form>

</div>
</div>
</div>
</div>

</body>
</html>
