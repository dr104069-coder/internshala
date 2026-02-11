<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
    <title>View User | SmartIntern</title>

    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" 
          rel="stylesheet">

    <style>
        .profile-img {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            object-fit: cover;
            border: 3px solid #dee2e6;
        }
    </style>
</head>

<body>

<div class="container mt-5">

    <div class="card shadow-lg">
        <div class="card-header bg-dark text-white">
            <h4 class="mb-0">User Profile</h4>
        </div>

        <div class="card-body">

            <div class="row">

                <!-- Profile Image -->
                <div class="col-md-3 text-center">
                    <c:choose>
                        <c:when test="${not empty user.profilePicURL}">
                            <img src="${user.profilePicURL}" class="profile-img">
                        </c:when>
                        <c:otherwise>
                            <img src="https://via.placeholder.com/120" 
                                 class="profile-img">
                        </c:otherwise>
                    </c:choose>
                </div>

                <!-- Basic Info -->
                <div class="col-md-9">
                    <h4>${user.firstName} ${user.lastName}</h4>

                    <p><strong>Email:</strong> ${user.email}</p>
                    <p><strong>Phone:</strong> ${user.phone}</p>
                    <p><strong>Gender:</strong> ${user.gender}</p>

                    <p>
                        <strong>Role:</strong>
                        <span class="badge bg-primary">
                            ${user.role}
                        </span>
                    </p>

                    <p>
                        <strong>User Type:</strong>
                        <span class="badge bg-info text-dark">
                            ${user.usertype}
                        </span>
                    </p>

                    <p>
                        <strong>Status:</strong>
                        <c:choose>
                            <c:when test="${user.active}">
                                <span class="badge bg-success">Active</span>
                            </c:when>
                            <c:otherwise>
                                <span class="badge bg-danger">Inactive</span>
                            </c:otherwise>
                        </c:choose>
                    </p>

                    <p>
                        <strong>Created At:</strong> ${user.createdAt}
                    </p>
                </div>

            </div>

            <hr>

            <!-- Additional Details -->
            <h5>Additional Details</h5>

            <c:if test="${not empty userDetail}">
                <div class="row mt-3">
                    <div class="col-md-6">
                        <p><strong>Qualification:</strong> ${userDetail.qualification}</p>
                    </div>

                    <div class="col-md-6">
                        <p><strong>City:</strong> ${userDetail.city}</p>
                    </div>

                    <div class="col-md-6">
                        <p><strong>State:</strong> ${userDetail.state}</p>
                    </div>

                    <div class="col-md-6">
                        <p><strong>Country:</strong> ${userDetail.country}</p>
                    </div>
                </div>
            </c:if>

            <c:if test="${empty userDetail}">
                <p class="text-muted mt-3">
                    No additional details available for this user.
                </p>
            </c:if>

        </div>

        <div class="card-footer text-end">
            <a href="listUser" class="btn btn-secondary">Back</a>
            <a href="editUser?userId=${user.userId}" 
               class="btn btn-warning">Edit</a>
        </div>

    </div>

</div>

</body>
</html>
