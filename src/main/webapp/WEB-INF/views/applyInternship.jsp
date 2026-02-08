<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Apply Internship | SmartIntern</title>

<!-- Bootstrap 5 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">

<style>
    body {
        background: linear-gradient(to right, #eef2f3, #dfe9f3);
        font-family: 'Segoe UI', sans-serif;
    }

    .card-custom {
        border: none;
        border-radius: 20px;
        box-shadow: 0 10px 25px rgba(0,0,0,0.08);
        padding: 40px;
    }

    .form-control, .form-select {
        border-radius: 10px;
        padding: 10px;
    }

    .btn-apply {
        background: linear-gradient(45deg, #007bff, #0056b3);
        color: white;
        border-radius: 30px;
        padding: 10px 35px;
        font-weight: 600;
        letter-spacing: 1px;
        transition: 0.3s;
    }

    .btn-apply:hover {
        transform: scale(1.05);
        color: white;
    }

    .title-icon {
        font-size: 26px;
        color: #007bff;
    }

</style>

</head>
<body>

<div class="container py-5">
    <div class="row justify-content-center">
        <div class="col-lg-8">

            <div class="card card-custom">

                <div class="text-center mb-4">
                    <i class="bi bi-file-earmark-text-fill title-icon"></i>
                    <h3 class="mt-2">Apply for Internship</h3>
                    <p class="text-muted">Submit your application professionally</p>
                </div>

                <form action="saveApplication" method="post" enctype="multipart/form-data">

                    <!-- Hidden Fields -->
                    <input type="hidden" name="internshipId" value="${internshipId}">
                    <input type="hidden" name="studentId" value="${studentId}">

                    <!-- Cover Letter -->
                    <div class="mb-4">
                        <label class="form-label fw-semibold">
                            <i class="bi bi-pencil-square"></i> Cover Letter
                        </label>
                        <textarea name="coverLetter" rows="6" class="form-control"
                            placeholder="Explain why you are a good fit for this internship..." required></textarea>
                    </div>

                    <!-- Resume Upload -->
                    <div class="mb-4">
                        <label class="form-label fw-semibold">
                            <i class="bi bi-upload"></i> Upload Resume
                        </label>
                        <input type="file" name="resumeFile" class="form-control" accept=".pdf,.doc,.docx" required>
                        <small class="text-muted">Accepted formats: PDF, DOC, DOCX</small>
                    </div>

                    <!-- Submit Button -->
                    <div class="text-center mt-4">
                        <button type="submit" class="btn btn-apply">
                            <i class="bi bi-send-fill"></i> Submit Application
                        </button>
                    </div>

                </form>

            </div>

        </div>
    </div>
</div>

</body>
</html>
