<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<header class="admin-header">
    <div class="logo-container">
        <div class="smartintern-logo">
            <div class="logo-blue">
                <i class="bi bi-briefcase-fill"></i>
            </div>
        </div>
        <span class="logo-text">SmartIntern</span>
    </div>
    <div class="header-actions">
        <span class="dark-btn" id="toggleCollapseBtn">
            <i class="bi bi-layout-sidebar"></i> <span id="collapseText">Collapse</span>
        </span>
        <span class="dark-btn" id="fullscreenModeBtn">
            <i class="bi bi-arrows-fullscreen"></i> <span>Fullscreen</span>
        </span>
        <a href="${pageContext.request.contextPath}/logout" class="btn logout-btn">
            <i class="bi bi-box-arrow-right"></i> <span>Exit</span>
        </a>
    </div>
</header>