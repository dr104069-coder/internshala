<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<title>User List | SmartIntern</title>

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">

<style>
.profile-pic {
	width: 40px;
	height: 40px;
	border-radius: 50%;
	object-fit: cover;
}
</style>

</head>

<body>

<div class="container mt-5">

	<div class="d-flex justify-content-between align-items-center mb-4">
		<h3>User List</h3>
		<a href="newUser" class="btn btn-primary">+ Add User</a>
	</div>

	<table class="table table-bordered table-hover table-striped shadow">
		<thead class="table-dark">
			<tr>
				<th>SrNo</th>
				<th>Name</th>
				<th>Email</th>
				<th>Phone</th>
				<th>Role</th>
				<th>User Type</th>
				<th>Gender</th>
				<th>Profile</th>
				<th>Status</th>
				<th>Created At</th>
				<th>Action</th>
			</tr>
		</thead>

		<tbody>

			<c:forEach var="user" items="${userList}" varStatus="s">
				<tr>

					<td>${s.count}</td>

					<td>${user.firstName} ${user.lastName}</td>

					<td>${user.email}</td>

					<td>${user.phone}</td>

					<td>
						<span class="badge bg-primary">
							${user.role}
						</span>
					</td>

					<td>
						<span class="badge bg-info text-dark">
							${user.usertype}
						</span>
					</td>

					<td>${user.gender}</td>

					<td class="text-center">
						<c:choose>
							<c:when test="${not empty user.profilePicURL}">
								<img src="${user.profilePicURL}" class="profile-pic" />
							</c:when>
							<c:otherwise>
								<img src="https://via.placeholder.com/40"
									 class="profile-pic" />
							</c:otherwise>
						</c:choose>
					</td>

					<td>
						<c:choose>
							<c:when test="${user.active}">
								<span class="badge bg-success">Active</span>
							</c:when>
							<c:otherwise>
								<span class="badge bg-danger">Inactive</span>
							</c:otherwise>
						</c:choose>
					</td>

					<td>${user.createdAt}</td>

					<td>
						<a href="editUser?userId=${user.userId}"
						   class="btn btn-sm btn-warning">Edit</a>

						<a href="deleteUser?userId=${user.userId}"
						   class="btn btn-sm btn-danger"
						   onclick="return confirm('Are you sure?');">
						   Delete
						</a>

						<a href="viewUser?userId=${user.userId}"
						   class="btn btn-sm btn-secondary">
						   View
						</a>
					</td>

				</tr>
			</c:forEach>

			<c:if test="${empty userList}">
				<tr>
					<td colspan="11" class="text-center text-muted">
						No users found
					</td>
				</tr>
			</c:if>

		</tbody>
	</table>

</div>

</body>
</html>
