<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Student · SmartIntern</title>

    <!-- Bootstrap & Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', sans-serif;
            background: linear-gradient(145deg, #2C3E50 0%, #1e2b38 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 2rem;
            position: relative;
        }

        body::before {
            content: '';
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-image: 
                linear-gradient(rgba(75, 139, 190, 0.03) 1px, transparent 1px),
                linear-gradient(90deg, rgba(75, 139, 190, 0.03) 1px, transparent 1px);
            background-size: 50px 50px;
            pointer-events: none;
            z-index: -1;
        }

        body::after {
            content: '';
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: radial-gradient(circle at 30% 50%, rgba(75, 139, 190, 0.08) 0%, transparent 50%);
            pointer-events: none;
            z-index: -1;
        }

        .edit-card {
            max-width: 900px;
            width: 100%;
            margin: 0 auto;
            background: rgba(44, 62, 80, 0.85);
            backdrop-filter: blur(12px);
            border-radius: 30px;
            border: 1px solid rgba(75, 139, 190, 0.3);
            box-shadow: 0 8px 32px rgba(44, 62, 80, 0.4);
            overflow: hidden;
            animation: fadeInUp 0.6s cubic-bezier(0.165, 0.84, 0.44, 1);
        }

        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .edit-header {
            background: linear-gradient(135deg, #1e2b38, #2C3E50);
            padding: 1.5rem 2rem;
            border-bottom: 1px solid rgba(75, 139, 190, 0.3);
        }

        .edit-header h4 {
            margin: 0;
            color: #FFFFFF;
            font-weight: 650;
            font-size: 1.5rem;
            display: flex;
            align-items: center;
            gap: 0.75rem;
        }

        .edit-header h4 i {
            color: #4B8BBE;
            background: rgba(75, 139, 190, 0.15);
            padding: 8px;
            border-radius: 14px;
            font-size: 1.3rem;
        }

        .edit-body {
            padding: 2rem;
        }

        .form-section {
            background: rgba(255, 255, 255, 0.03);
            border-radius: 20px;
            padding: 1.5rem;
            margin-bottom: 1.5rem;
            border: 1px solid rgba(75, 139, 190, 0.2);
            transition: all 0.3s ease;
        }

        .form-section:hover {
            border-color: rgba(75, 139, 190, 0.4);
            background: rgba(255, 255, 255, 0.05);
        }

        .form-section-title {
            font-size: 1rem;
            font-weight: 600;
            color: #FFFFFF;
            display: flex;
            align-items: center;
            gap: 0.6rem;
            margin-bottom: 1.5rem;
            padding-bottom: 0.75rem;
            border-bottom: 1px solid rgba(75, 139, 190, 0.3);
        }

        .form-section-title i {
            color: #4B8BBE;
            background: rgba(75, 139, 190, 0.1);
            padding: 6px;
            border-radius: 10px;
            font-size: 0.9rem;
        }

        .form-label {
            color: #B3CDE0;
            font-weight: 500;
            font-size: 0.8rem;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            margin-bottom: 0.5rem;
            display: block;
        }

        .form-label i {
            color: #4B8BBE;
            margin-right: 6px;
        }

        .input-wrapper {
            position: relative;
        }

        .form-control, .form-select {
            width: 100%;
            padding: 0.75rem 1rem 0.75rem 2.8rem;
            border-radius: 16px;
            border: 1px solid rgba(75, 139, 190, 0.3);
            background: rgba(255, 255, 255, 0.08);
            color: #FFFFFF;
            font-size: 0.9rem;
            transition: all 0.3s ease;
        }

        .form-control:focus, .form-select:focus {
            background: rgba(255, 255, 255, 0.12);
            border-color: #4B8BBE;
            box-shadow: 0 0 0 3px rgba(75, 139, 190, 0.2);
            color: #FFFFFF;
            outline: none;
        }

        .form-control::placeholder {
            color: #A8A8A8;
            font-size: 0.85rem;
        }

        .form-select option {
            background: var(--deep-blue-dark);
            color: var(--pure-white);
        }

        .input-icon {
            position: absolute;
            left: 1rem;
            top: 50%;
            transform: translateY(-50%);
            color: #4B8BBE;
            font-size: 1.1rem;
        }

        .form-row {
            display: flex;
            flex-wrap: wrap;
            gap: 1rem;
            margin-bottom: 1rem;
        }

        .form-group {
            flex: 1;
            min-width: 200px;
        }

        .info-box {
            background: rgba(75, 139, 190, 0.1);
            border-radius: 12px;
            padding: 0.75rem 1rem;
            border: 1px solid rgba(75, 139, 190, 0.2);
            color: #B3CDE0;
            font-size: 0.9rem;
        }

        .info-box i {
            color: #4B8BBE;
            margin-right: 8px;
        }

        .current-file {
            background: rgba(75, 139, 190, 0.1);
            border-radius: 10px;
            padding: 0.5rem 1rem;
            margin-top: 0.5rem;
            font-size: 0.75rem;
            color: #B3CDE0;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
        }

        .current-file i {
            color: #4B8BBE;
        }

        .text-muted {
            color: #A8A8A8 !important;
            font-size: 0.7rem;
            display: block;
            margin-top: 0.3rem;
        }

        .edit-footer {
            background: rgba(255, 255, 255, 0.03);
            padding: 1.25rem 2rem;
            display: flex;
            justify-content: flex-end;
            gap: 1rem;
            border-top: 1px solid rgba(75, 139, 190, 0.3);
        }

        .btn {
            border-radius: 40px;
            padding: 0.6rem 1.8rem;
            font-weight: 600;
            font-size: 0.9rem;
            display: inline-flex;
            align-items: center;
            gap: 0.6rem;
            transition: all 0.3s ease;
            border: none;
            cursor: pointer;
            text-decoration: none;
        }

        .btn-cancel {
            background: rgba(255, 255, 255, 0.05);
            border: 1px solid rgba(75, 139, 190, 0.3);
            color: #B3CDE0;
        }

        .btn-cancel:hover {
            background: rgba(75, 139, 190, 0.2);
            color: #FFFFFF;
            transform: translateY(-2px);
        }

        .btn-update {
            background: rgba(75, 139, 190, 0.2);
            border: 1px solid #4B8BBE;
            color: #4B8BBE;
        }

        .btn-update:hover {
            background: #4B8BBE;
            color: #FFFFFF;
            transform: translateY(-2px);
            box-shadow: 0 4px 15px rgba(75, 139, 190, 0.3);
        }

        .alert-danger {
            background: rgba(239, 68, 68, 0.1);
            border: 1px solid rgba(239, 68, 68, 0.3);
            color: #f87171;
            border-radius: 16px;
            padding: 1rem 1.5rem;
            margin-bottom: 1.5rem;
        }

        @media (max-width: 768px) {
            body {
                padding: 1rem;
            }
            .edit-body {
                padding: 1.5rem;
            }
            .form-group {
                min-width: 100%;
            }
            .form-row {
                flex-direction: column;
            }
            .edit-footer {
                flex-direction: column-reverse;
            }
            .btn {
                justify-content: center;
            }
        }
    </style>
</head>
<body>

    <div class="edit-card">
        <div class="edit-header">
            <h4>
                <i class="bi bi-pencil-square"></i>
                Edit Student Profile
            </h4>
        </div>

        <form action="${pageContext.request.contextPath}/updateStudent" method="post" enctype="multipart/form-data">
            
            <input type="hidden" name="studentDetailId" value="${student.studentDetailId}" />

            <div class="edit-body">
                
                <c:if test="${not empty error}">
                    <div class="alert-danger">
                        <i class="bi bi-exclamation-triangle-fill me-2"></i>
                        ${error}
                    </div>
                </c:if>

                <!-- Student Information Section -->
                <div class="form-section">
                    <div class="form-section-title">
                        <i class="bi bi-person-badge"></i>
                        Student Information
                    </div>

                    <div class="form-row">
                        <div class="form-group">
                            <label class="form-label"><i class="bi bi-person-fill"></i> Full Name</label>
                            <div class="info-box">
                                <i class="bi bi-person-circle"></i>
                                ${student.user.firstName} ${student.user.lastName}
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="form-label"><i class="bi bi-envelope-fill"></i> Email</label>
                            <div class="info-box">
                                <i class="bi bi-envelope"></i>
                                ${student.user.email}
                            </div>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group">
                            <label class="form-label"><i class="bi bi-building"></i> College Name *</label>
                            <div class="input-wrapper">
                                <input type="text" class="form-control" name="collegeName" 
                                       value="${student.collegeName}" placeholder="Enter college name" required>
                                <span class="input-icon"><i class="bi bi-university"></i></span>
                            </div>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group">
                            <label class="form-label"><i class="bi bi-book"></i> Degree *</label>
                            <div class="input-wrapper">
                                <input type="text" class="form-control" name="degree" 
                                       value="${student.degree}" placeholder="e.g., B.E., B.Tech, BCA, MCA">
                                <span class="input-icon"><i class="bi bi-mortarboard"></i></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="form-label"><i class="bi bi-sort-numeric-up"></i> Semester</label>
                            <div class="input-wrapper">
                                <input type="number" class="form-control" name="semester" 
                                       value="${student.semester}" placeholder="e.g., 1, 2, 3...">
                                <span class="input-icon"><i class="bi bi-layers"></i></span>
                            </div>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group">
                            <label class="form-label"><i class="bi bi-calendar-check"></i> Graduation Year</label>
                            <div class="input-wrapper">
                                <input type="number" class="form-control" name="graduationYear" 
                                       value="${student.graduationYear}" placeholder="e.g., 2024, 2025">
                                <span class="input-icon"><i class="bi bi-calendar3"></i></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="form-label"><i class="bi bi-person"></i> T-Shirt Size</label>
                            <div class="input-wrapper">
                                <select class="form-select" name="tshirtSize">
                                   <option value="">Select Size</option>

<option value="XS" <c:if test="${student.tshirtSize == 'XS'}">selected</c:if>>XS</option>

<option value="S" <c:if test="${student.tshirtSize == 'S'}">selected</c:if>>S</option>

<option value="M" <c:if test="${student.tshirtSize == 'M'}">selected</c:if>>M</option>

<option value="L" <c:if test="${student.tshirtSize == 'L'}">selected</c:if>>L</option>

<option value="XL" <c:if test="${student.tshirtSize == 'XL'}">selected</c:if>>XL</option>

<option value="XXL" <c:if test="${student.tshirtSize == 'XXL'}">selected</c:if>>XXL</option>

<option value="XXXL" <c:if test="${student.tshirtSize == 'XXXL'}">selected</c:if>>XXXL</option>
                                </select>
                                <span class="input-icon"><i class="bi bi-tshirt"></i></span>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Location Information Section -->
                <div class="form-section">
                    <div class="form-section-title">
                        <i class="bi bi-geo-alt-fill"></i>
                        Location Information
                    </div>

                    <div class="form-row">
                        <div class="form-group">
                            <label class="form-label"><i class="bi bi-geo-alt-fill"></i> City</label>
                            <div class="input-wrapper">
                                <input type="text" class="form-control" name="city" 
                                       value="${student.city}" placeholder="Enter city name">
                                <span class="input-icon"><i class="bi bi-building"></i></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="form-label"><i class="bi bi-map-fill"></i> State</label>
                            <div class="input-wrapper">
                                <input type="text" class="form-control" name="state" 
                                       value="${student.state}" placeholder="Enter state name">
                                <span class="input-icon"><i class="bi bi-globe2"></i></span>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Documents Section -->
                <div class="form-section">
                    <div class="form-section-title">
                        <i class="bi bi-file-earmark-text"></i>
                        Documents
                    </div>

                    <div class="form-row">
                        <div class="form-group">
                            <label class="form-label"><i class="bi bi-image"></i> Profile Picture</label>
                            <div class="input-wrapper">
                                <input type="file" class="form-control" name="profilePic" accept="image/*" style="padding-left: 2.8rem;">
                                <span class="input-icon"><i class="bi bi-camera"></i></span>
                            </div>
                           <c:if test="${not empty student.profilePicPath}">
    <div class="current-file" style="flex-direction: column; align-items: flex-start;">
        
        <img src="${student.profilePicPath}" 
             width="100" height="100"
             style="border-radius: 50%; object-fit: cover; margin-bottom: 8px; border:2px solid #4B8BBE;">

        <span><i class="bi bi-check-circle"></i> Profile Photo</span>
        
    </div>
</c:if>
                            <small class="text-muted">Leave empty to keep current image</small>
                        </div>
                        <div class="form-group">
                            <label class="form-label"><i class="bi bi-file-pdf"></i> Resume</label>
                            <div class="input-wrapper">
                                <input type="file" class="form-control" name="resume" accept=".pdf,.doc,.docx" style="padding-left: 2.8rem;">
                                <span class="input-icon"><i class="bi bi-file-earmark"></i></span>
                            </div>
                            <c:if test="${not empty student.resumePath}">
                                <div class="current-file">
                                    <i class="bi bi-file-earmark-pdf"></i> Current: ${student.resumePath}
                                </div>
                            </c:if>
                            <small class="text-muted">Leave empty to keep current resume (PDF, DOC, DOCX)</small>
                        </div>
                    </div>
                </div>
            </div>

            <div class="edit-footer">
                <a href="${pageContext.request.contextPath}/viewStudent?studentDetailId=${student.studentDetailId}" class="btn btn-cancel">
                    <i class="bi bi-x-lg"></i> Cancel
                </a>
                <button type="submit" class="btn btn-update">
                    <i class="bi bi-check-lg"></i> Update Student
                </button>
            </div>
        </form>
    </div>

</body>
</html>