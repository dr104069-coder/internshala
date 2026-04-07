<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit User · SmartIntern Admin</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body {
            font-family: 'Inter', sans-serif;
            background: linear-gradient(145deg, #2C3E50 0%, #1e2b38 100%);
            min-height: 100vh;
        }
        .edit-card {
            background: rgba(44, 62, 80, 0.85);
            backdrop-filter: blur(12px);
            border-radius: 30px;
            border: 1px solid rgba(75, 139, 190, 0.3);
            max-width: 900px;
            margin: 2rem auto;
            box-shadow: 0 8px 24px rgba(44, 62, 80, 0.4);
        }
        .edit-header {
            background: linear-gradient(135deg, #1e2b38, #2C3E50);
            padding: 1.2rem 1.8rem;
            border-bottom: 1px solid rgba(75, 139, 190, 0.3);
            border-radius: 30px 30px 0 0;
        }
        .edit-header h4 {
            margin: 0;
            color: white;
            font-weight: 600;
        }
        .edit-header h4 i { color: #4B8BBE; margin-right: 10px; }
        .edit-body { padding: 2rem; }
        .form-section {
            background: rgba(255,255,255,0.03);
            border-radius: 20px;
            padding: 1.5rem;
            margin-bottom: 1.5rem;
            border: 1px solid rgba(75, 139, 190, 0.2);
        }
        .form-section-title {
            color: white;
            font-weight: 600;
            margin-bottom: 1.2rem;
            padding-bottom: 0.5rem;
            border-bottom: 1px solid rgba(75, 139, 190, 0.3);
        }
        .form-section-title i { color: #4B8BBE; margin-right: 8px; }
        .form-label { color: #B3CDE0; font-weight: 500; font-size: 0.85rem; margin-bottom: 0.3rem; }
        .form-control, .form-select {
            background: rgba(255,255,255,0.08);
            border: 1px solid rgba(75, 139, 190, 0.3);
            border-radius: 12px;
            color: white;
            padding: 0.6rem 1rem;
        }
        .form-control:focus, .form-select:focus {
            background: rgba(255,255,255,0.12);
            border-color: #4B8BBE;
            box-shadow: 0 0 0 2px rgba(75, 139, 190, 0.2);
            color: white;
        }
        .form-control:disabled { background: rgba(255,255,255,0.03); color: #A8A8A8; }
        .form-row { display: flex; gap: 1rem; margin-bottom: 1rem; flex-wrap: wrap; }
        .form-group { flex: 1; min-width: 200px; }
        .role-group { display: flex; gap: 1rem; margin-top: 0.5rem; flex-wrap: wrap; }
        .role-option { flex: 1; }
        .role-option input[type="radio"] { display: none; }
        .role-option label {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 0.5rem;
            padding: 0.6rem 1rem;
            background: rgba(255,255,255,0.05);
            border: 1px solid rgba(75, 139, 190, 0.3);
            border-radius: 40px;
            color: #B3CDE0;
            cursor: pointer;
            transition: all 0.3s;
        }
        .role-option input[type="radio"]:checked + label {
            background: #4B8BBE;
            color: white;
            border-color: #4B8BBE;
        }
        .role-option label:hover { background: rgba(75, 139, 190, 0.2); transform: translateY(-2px); }
        .edit-footer {
            background: rgba(255,255,255,0.03);
            padding: 1rem 1.8rem;
            display: flex;
            justify-content: flex-end;
            gap: 1rem;
            border-top: 1px solid rgba(75, 139, 190, 0.3);
            border-radius: 0 0 30px 30px;
        }
        .btn-cancel, .btn-update {
            padding: 0.5rem 1.5rem;
            border-radius: 40px;
            font-weight: 500;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            transition: all 0.3s;
        }
        .btn-cancel {
            background: rgba(255,255,255,0.05);
            border: 1px solid rgba(75, 139, 190, 0.3);
            color: #B3CDE0;
        }
        .btn-cancel:hover { background: #4B8BBE; color: white; transform: translateY(-2px); }
        .btn-update {
            background: rgba(75, 139, 190, 0.2);
            border: 1px solid #4B8BBE;
            color: #4B8BBE;
        }
        .btn-update:hover { background: #4B8BBE; color: white; transform: translateY(-2px); }
        .profile-img-preview {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            object-fit: cover;
            border: 3px solid #4B8BBE;
        }
        .text-muted { color: #A8A8A8 !important; font-size: 0.75rem; }
        .alert-danger { background: rgba(220, 53, 69, 0.2); border-color: #dc3545; color: #ff8a92; border-radius: 12px; }
    </style>
</head>
<body>

<div class="container py-4">
    <div class="edit-card">
        <div class="edit-header">
            <h4><i class="bi bi-pencil-square"></i> Edit User Profile</h4>
        </div>

        <form action="${pageContext.request.contextPath}/updateUser" method="post" enctype="multipart/form-data" id="editUserForm">
            
            <!-- Hidden fields -->
            <input type="hidden" name="userId" value="${user.userId}" />
            <input type="hidden" name="userDetailId" value="${userDetail.userDetailId}" />

            <div class="edit-body">
                
                <!-- Display any error messages -->
                <c:if test="${not empty error}">
                    <div class="alert alert-danger mb-3">${error}</div>
                </c:if>

                <!-- Section 1: Basic Information -->
                <div class="form-section">
                    <div class="form-section-title"><i class="bi bi-person-circle"></i> Basic Information</div>
                    
                    <div class="form-row">
                        <div class="form-group">
                            <label class="form-label">First Name *</label>
                            <input type="text" class="form-control" name="firstName" value="${user.firstName}" required>
                        </div>
                        <div class="form-group">
                            <label class="form-label">Last Name *</label>
                            <input type="text" class="form-control" name="lastName" value="${user.lastName}" required>
                        </div>
                    </div>
                    
                    <div class="form-row">
                        <div class="form-group">
                            <label class="form-label">Email *</label>
                            <input type="email" class="form-control" name="email" value="${user.email}" required>
                        </div>
                        <div class="form-group">
                            <label class="form-label">Phone</label>
                            <input type="tel" class="form-control" name="phone" value="${user.phone}">
                        </div>
                    </div>
                    
                    <div class="form-row">
                        <div class="form-group">
                            <label class="form-label">Gender</label>
                            <select class="form-select" name="gender">
                                <option value="MALE" ${user.gender == 'MALE' ? 'selected' : ''}>Male</option>
                                <option value="FEMALE" ${user.gender == 'FEMALE' ? 'selected' : ''}>Female</option>
                                <option value="OTHER" ${user.gender == 'OTHER' ? 'selected' : ''}>Other</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label class="form-label">User Type</label>
                            <select class="form-select" name="usertype">
                                <option value="REGULAR" ${user.usertype == 'REGULAR' ? 'selected' : ''}>Regular</option>
                                <option value="PREMIUM" ${user.usertype == 'PREMIUM' ? 'selected' : ''}>Premium</option>
                            </select>
                        </div>
                    </div>
                    
                    <div class="form-row">
                        <div class="form-group">
                            <label class="form-label">Status</label>
                            <select class="form-select" name="active">
                                <option value="true" ${user.active ? 'selected' : ''}>Active</option>
                                <option value="false" ${!user.active ? 'selected' : ''}>Inactive</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label class="form-label">Created At</label>
                            <input type="text" class="form-control" value="${user.createdAt}" disabled>
                        </div>
                    </div>
                    
                    <div class="form-row">
                        <div class="form-group">
                            <label class="form-label">Role *</label>
                            <div class="role-group">
                                <div class="role-option">
                                    <input type="radio" name="role" id="roleStudent" value="STUDENT" ${user.role == 'STUDENT' ? 'checked' : ''}>
                                    <label for="roleStudent"><i class="bi bi-mortarboard-fill"></i> STUDENT</label>
                                </div>
                                <div class="role-option">
                                    <input type="radio" name="role" id="roleEmployer" value="EMPLOYER" ${user.role == 'EMPLOYER' ? 'checked' : ''}>
                                    <label for="roleEmployer"><i class="bi bi-building"></i> EMPLOYER</label>
                                </div>
                                <div class="role-option">
                                    <input type="radio" name="role" id="roleAdmin" value="ADMIN" ${user.role == 'ADMIN' ? 'checked' : ''}>
                                    <label for="roleAdmin"><i class="bi bi-shield-lock-fill"></i> ADMIN</label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="form-label">Password</label>
                            <input type="password" class="form-control" placeholder="●●●●●●●●" disabled>
                            <small class="text-muted">Password cannot be edited here</small>
                        </div>
                    </div>
                </div>

                <!-- Section 2: Profile Picture -->
                <div class="form-section">
                    <div class="form-section-title"><i class="bi bi-image"></i> Profile Picture</div>
                    <div class="row align-items-center">
                        <div class="col-md-2 text-center mb-2 mb-md-0">
                            <c:choose>
                                <c:when test="${not empty user.profilePicURL}">
                                    <img src="${user.profilePicURL}" class="profile-img-preview" alt="Profile">
                                </c:when>
                                <c:otherwise>
                                    <img src="https://via.placeholder.com/80" class="profile-img-preview" alt="Default">
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <div class="col-md-10">
                            <label class="form-label">Change Profile Picture</label>
                            <input type="file" class="form-control" name="profilePic" accept="image/*">
                            <small class="text-muted">Leave empty to keep current image</small>
                        </div>
                    </div>
                </div>

                <!-- Section 3: Additional Details -->
                <div class="form-section">
                    <div class="form-section-title"><i class="bi bi-info-circle-fill"></i> Additional Details</div>
                    <div class="form-row">
                        <div class="form-group">
                            <label class="form-label">Qualification</label>
                            <input type="text" class="form-control" name="qualification" value="${userDetail.qualification}">
                        </div>
                        <div class="form-group">
                            <label class="form-label">City</label>
                            <input type="text" class="form-control" name="city" value="${userDetail.city}">
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group">
                            <label class="form-label">State</label>
                            <input type="text" class="form-control" name="state" value="${userDetail.state}">
                        </div>
                        <div class="form-group">
                            <label class="form-label">Country</label>
                            <input type="text" class="form-control" name="country" value="${userDetail.country}">
                        </div>
                    </div>
                </div>
            </div>

            <div class="edit-footer">
                <a href="${pageContext.request.contextPath}/viewUser?userId=${user.userId}" class="btn-cancel">
                    <i class="bi bi-x-lg"></i> Cancel
                </a>
                <button type="submit" class="btn-update">
                    <i class="bi bi-check-lg"></i> Update Profile
                </button>
            </div>
        </form>
    </div>
</div>

<script>
    // Debug: Log form submission
    document.getElementById('editUserForm').addEventListener('submit', function(e) {
        var selectedRole = document.querySelector('input[name="role"]:checked');
        console.log('Selected Role:', selectedRole ? selectedRole.value : 'NOT SELECTED');
        
        if (!selectedRole) {
            e.preventDefault();
            alert('Please select a role (STUDENT, EMPLOYER, or ADMIN)');
            return false;
        }
    });
</script>

</body>
</html>