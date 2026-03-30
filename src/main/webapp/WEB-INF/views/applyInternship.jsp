<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<title>Apply Internship</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

</head>

<body>

<div class="container mt-5">

<h3>Apply for Internship</h3>

<form action="saveApplication" method="post" enctype="multipart/form-data">

    <!-- Internship ID Hidden -->
    <input type="hidden" name="internshipId" value="${internshipId}">

    <div class="mb-3">
        <label>Cover Letter</label>
        <textarea name="coverLetter" class="form-control" required></textarea>
    </div>

    <div class="mb-3">
        <label>Upload Resume</label>
        <input type="file" name="resumeFile" class="form-control" required>
    </div>

    <button class="btn btn-primary">Apply Now</button>

</form>

</div>

</body>
</html>