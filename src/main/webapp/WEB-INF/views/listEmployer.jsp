<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Employer Management | SmartIntern</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">

<style>
body {
    background: #f4f7fb;
}

.card {
    border-radius: 18px;
}

.table thead {
    background-color: #111827;
    color: white;
}

.table tbody tr:hover {
    background-color: #eef2ff;
    transition: 0.2s ease-in-out;
}

.action-btn {
    margin: 0 3px;
}
</style>

</head>
<body>

<div class="container mt-5">

    <div class="card shadow-lg border-0">
        <div class="card-header bg-dark text-white d-flex justify-content-between align-items-center">
            <h4 class="mb-0">Employer Management</h4>
            <span class="badge bg-light text-dark">
                Total: ${employerList.size()}
            </span>
        </div>

        <div class="card-body">

            <div class="table-responsive">

                <table class="table table-hover text-center align-middle">
                    <thead>
                        <tr>
                            <th>SR NO</th>
                            <th>Company Name</th>
                            <th>Company Type</th>
                            <th>Website</th>
                            <th>Actions</th>
                        </tr>
                    </thead>

                    <tbody>

                        <c:forEach items="${employerList}" var="e" varStatus="status">
                            <tr>
                                <td>${status.count}</td>
                                <td class="fw-semibold">${e.companyName}</td>
                                <td>${e.companyType}</td>
                                <td>
                                    <a href="${e.website}" target="_blank" 
                                       class="text-decoration-none">
                                        ${e.website}
                                    </a>
                                </td>

                                <td>
									      <a href="viewEmployer?employerId=${e.employerId}" 
									       class="btn btn-sm btn-primary">
									       View
									    </a>
									
									    <a href="#" class="btn btn-sm btn-warning">
									       Edit
									    </a>
									
									    <a href="deleteEmployer?employerId=${e.employerId}" 
										   class="btn btn-sm btn-danger"
										   onclick="return confirm('Are you sure you want to delete this employer?');">
										   Delete
										</a>
							</td>

                            </tr>
                        </c:forEach>

                    </tbody>

                </table>

            </div>

        </div>
    </div>

</div>

</body>
</html>
