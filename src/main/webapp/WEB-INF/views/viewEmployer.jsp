<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Employer Details | SmartIntern</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">

<style>
body {
    background: #f4f7fb;
}

.card {
    border-radius: 18px;
}

.label-title {
    font-weight: 600;
    color: #6c757d;
    font-size: 14px;
}

.value-text {
    font-weight: 500;
    font-size: 16px;
}

.section-divider {
    border-top: 1px solid #dee2e6;
    margin: 20px 0;
}
</style>

</head>
<body>

<div class="container mt-5">

    <div class="card shadow-lg border-0">
        
        <div class="card-header bg-dark text-white d-flex justify-content-between align-items-center">
            <h4 class="mb-0">
                <i class="bi bi-building"></i> Employer Details
            </h4>
            <a href="listEmployer" class="btn btn-light btn-sm">
                <i class="bi bi-arrow-left"></i> Back
            </a>
        </div>

        <div class="card-body">

            <!-- Company Information -->
            <h5 class="mb-3 text-primary">Company Information</h5>

            <div class="row">
                <div class="col-md-6 mb-3">
                    <div class="label-title">Company Name</div>
                    <div class="value-text">${employer.companyName}</div>
                </div>

                <div class="col-md-6 mb-3">
                    <div class="label-title">Company Type</div>
                    <div class="value-text">${employer.companyType}</div>
                </div>

                <div class="col-md-6 mb-3">
                    <div class="label-title">Website</div>
                    <div class="value-text">
                        <a href="${employer.website}" target="_blank">
                            ${employer.website}
                        </a>
                    </div>
                </div>

                <div class="col-md-6 mb-3">
                    <div class="label-title">Company Address</div>
                    <div class="value-text">${employer.companyAddress}</div>
                </div>
            </div>

            <div class="section-divider"></div>

            <!-- HR Information -->
            <h5 class="mb-3 text-primary">HR Information</h5>

            <div class="row">
                <div class="col-md-6 mb-3">
                    <div class="label-title">HR Name</div>
                    <div class="value-text">${employer.hrName}</div>
                </div>

                <div class="col-md-6 mb-3">
                    <div class="label-title">HR Mobile</div>
                    <div class="value-text">${employer.hrMobile}</div>
                </div>
            </div>

            <div class="section-divider"></div>

            <!-- System Information -->
            <h5 class="mb-3 text-primary">System Information</h5>

            <div class="row">
                <div class="col-md-4 mb-3">
                    <div class="label-title">Verified Status</div>
                    <div class="value-text">
                        <c:choose>
                            <c:when test="${employer.companyVerified}">
                                <span class="badge bg-success">Verified</span>
                            </c:when>
                            <c:otherwise>
                                <span class="badge bg-danger">Not Verified</span>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>

                <div class="col-md-4 mb-3">
                    <div class="label-title">Created Date</div>
                    <div class="value-text">${employer.createdAt}</div>
                </div>

                <div class="col-md-4 mb-3">
                    <div class="label-title">User ID</div>
                    <div class="value-text">${employer.userId}</div>
                </div>
            </div>

        </div>
    </div>

</div>

</body>
</html>
