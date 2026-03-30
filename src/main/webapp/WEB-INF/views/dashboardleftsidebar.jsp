<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<aside class="nav-sidebar" id="mainSidebar">
    <div class="nav-category">Core</div>

    <!-- Dashboard dropdown -->
    <div class="dropdown">
        <button class="dropdown-toggle active" type="button" data-bs-toggle="dropdown" aria-expanded="false">
            <i class="bi bi-speedometer2"></i> <span>Dashboard</span>
        </button>
        <!-- Note: Empty dropdown menu removed as in your code -->
    </div>

    <div class="nav-category">Identity</div>

    <!-- Manage Users dropdown -->
    <div class="dropdown">
        <button class="dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
            <i class="bi bi-people-fill"></i> <span>Manage Users</span>
        </button>
        <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/listUser"><i class="bi bi-person-plus"></i> <span>Users</span></a></li>
            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/addUser"><i class="bi bi-person-dash"></i> <span>Add User</span></a></li>
        </ul>
    </div>

    <!-- Verify Student dropdown -->
    <div class="dropdown">
        <button class="dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
            <i class="bi bi-patch-check-fill"></i> <span>Verify Student</span>
        </button>
        <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/listStudent"><i class="bi bi-check-circle"></i> <span>Students</span></a></li>
            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/addStudentInfo"><i class="bi bi-x-circle"></i> <span>Add Student</span></a></li>
        </ul>
    </div>

    <!-- Verify Employers dropdown -->
    <div class="dropdown">
        <button class="dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
            <i class="bi bi-building"></i> <span>Verify Employers</span>
        </button>
        <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/listEmployer"><i class="bi bi-shield-check"></i> <span>Employers</span></a></li>
            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/employer"><i class="bi bi-shield-exclamation"></i> <span>Add Employer</span></a></li>
        </ul>
    </div>

    <div class="nav-category">Opportunities</div>

    <!-- Post Internship dropdown -->
    <div class="dropdown">
        <button class="dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
            <i class="bi bi-briefcase-fill"></i> <span>Internship</span>
        </button>
        <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/listInternship"><i class="bi bi-send"></i> <span>listInternship</span></a></li>
            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/addInternship"><i class="bi bi-file-text"></i> <span>Add Internship</span></a></li>
        </ul>
    </div>

    <!-- Enrollments dropdown -->
    <div class="dropdown">
        <button class="dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
            <i class="bi bi-journal-bookmark-fill"></i> <span>Enrollments</span>
        </button>
        <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/listEnrollment"><i class="bi bi-list-check"></i> <span>List Enrollments</span></a></li>
            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/addInternshipEnrollment"><i class="bi bi-clock-history"></i> <span>New Enroll</span></a></li>
        </ul>
    </div>

    <!-- Applications dropdown -->
    <div class="dropdown">
        <button class="dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
            <i class="bi bi-send-fill"></i> <span>Applications</span>
        </button>
        <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="#"><i class="bi bi-envelope-open"></i> <span>x1</span></a></li>
            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/applyInternship"><i class="bi bi-archive"></i> <span>Add New Internship</span></a></li>
        </ul>
    </div>

    <!-- Reviews dropdown -->
    <div class="dropdown">
        <button class="dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
            <i class="bi bi-star-fill"></i> <span>Reviews</span>
        </button>
        <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/listReview"><i class="bi bi-star-half"></i> <span>Review</span></a></li>
            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/review"><i class="bi bi-star"></i> <span>Add Review</span></a></li>
        </ul>
    </div>

    <!-- Certificates dropdown -->
    <div class="dropdown">
        <button class="dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
            <i class="bi bi-award-fill"></i> <span>Certificates</span>
        </button>
        <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/listCertificate"><i class="bi bi-file-pdf"></i> <span>listCertificate</span></a></li>
            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/certificate"><i class="bi bi-download"></i> <span>Add Certificate</span></a></li>
        </ul>
    </div>
</aside>