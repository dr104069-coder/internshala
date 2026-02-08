<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Employer Registration | SmartIntern</title>

<!-- Bootstrap 5 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
    body {
        background: linear-gradient(135deg, #1e3c72, #2a5298);
        min-height: 100vh;
    }

    .card {
        border-radius: 15px;
        box-shadow: 0 8px 25px rgba(0,0,0,0.2);
    }

    .card-header {
        background-color: #0d6efd;
        color: white;
        font-weight: bold;
        text-align: center;
        font-size: 20px;
    }

    .btn-custom {
        width: 100%;
        border-radius: 25px;
    }
</style>

</head>
<body>

<div class="container mt-5 mb-5">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">

                <div class="card-header">
                    Employer Registration Form
                </div>

                <div class="card-body">

                    <form action="saveEmployer" method="post">

                        <!-- Company Name -->
                        <div class="mb-3">
                            <label class="form-label">Company Name</label>
                            <input type="text" name="companyName" class="form-control" required>
                        </div>

                        <!-- Company Type -->
                        <div class="mb-3">
                            <label class="form-label">Company Type</label>
                            <select name="companyType" class="form-select">
                                <option value="">Select Type</option>
                                <option>Startup</option>
                                <option>MNC</option>
                                <option>Private Ltd</option>
                                <option>Government</option>
                            </select>
                        </div>

                        <!-- Website -->
                        <div class="mb-3">
                            <label class="form-label">Website</label>
                            <input type="url" name="website" class="form-control">
                        </div>

                        <!-- Company Address -->
                        <div class="mb-3">
                            <label class="form-label">Company Address</label>
                            <textarea name="companyAddress" class="form-control" rows="3"></textarea>
                        </div>

                        <!-- HR Name -->
                        <div class="mb-3">
                            <label class="form-label">HR Name</label>
                            <input type="text" name="hrName" class="form-control">
                        </div>

                        <!-- HR Mobile -->
                        <div class="mb-3">
                            <label class="form-label">HR Mobile</label>
                            <input type="text" name="hrMobile" class="form-control" pattern="[0-9]{10}" placeholder="10 digit number">
                        </div>

                        <!-- Company Verified -->
                        <div class="mb-3">
                            <label class="form-label">Company Verified</label>
                            <select name="companyVerified" class="form-select">
                                <option value="false">Not Verified</option>
                                <option value="true">Verified</option>
                            </select>
                        </div>

                        <!-- Created At -->
                        <div class="mb-3">
                            <label class="form-label">Created Date</label>
                            <input type="date" name="createdAt" class="form-control">
                        </div>

                        <!-- User ID -->
                        <div class="mb-3">
                            <label class="form-label">User ID</label>
                            <input type="number" name="userId" class="form-control" required>
                        </div>

                        <!-- Submit -->
                        <div class="d-grid">
                            <button type="submit" class="btn btn-primary btn-custom">
                                Register Employer
                            </button>
                        </div>

                    </form>

                </div>

            </div>
        </div>
    </div>
</div>

</body>
</html>
