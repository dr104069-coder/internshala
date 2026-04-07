<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SmartIntern | My Enrolled Internships</title>

<!-- Bootstrap 5 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Bootstrap Icons -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">
<!-- Font Awesome 6 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
<!-- AOS Animation -->
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">

<style>
:root {
    --cerulean: #247ba0;
    --cerulean-dark: #1a5f7e;
    --cerulean-light: #4098c0;
    --tropical-teal: #70c1b3;
    --tropical-teal-dark: #5aa394;
    --celadon: #b2dbbf;
    --celadon-dark: #8fc0a0;
    --cream: #f3ffbd;
    --cream-dark: #e0ecaa;
    --hot-fuchsia: #ff1654;
    --hot-fuchsia-dark: #e0104a;
    --light-skyblue: #e6f3ff;
    --skyblue: #b8e1fc;
    --soft-blue: #d4eaff;
    
    --primary: #4361ee;
    --primary-dark: #3a56d4;
    --secondary: #06b6d4;
    --success: #10b981;
    --warning: #f59e0b;
    --danger: #ef4444;
    --dark: #0f172a;
    --gray: #475569;
    --light: #f8fafc;
    --card-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.1);
    --hover-shadow: 0 30px 60px -15px rgba(0, 0, 0, 0.15);
    --glass-bg: rgba(210, 235, 255, 0.95);
    --transition-bounce: 500ms cubic-bezier(0.34, 1.56, 0.64, 1);
    --transition-smooth: 350ms cubic-bezier(0.23, 1, 0.32, 1);
    
    --bg-primary: #d9efff;
    --bg-secondary: #c6e6ff;
    --bg-tertiary: var(--celadon-dark);
    --footer-bg: linear-gradient(135deg, var(--cerulean) 0%, var(--tropical-teal) 100%);
}

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: 'Inter', sans-serif;
    background: linear-gradient(135deg, #d9efff 0%, #c6e6ff 50%, #b8e1fc 100%);
    color: var(--dark);
    overflow-x: hidden;
    display: flex;
    flex-direction: column;
    min-height: 100vh;
}

::-webkit-scrollbar {
    width: 8px;
    height: 8px;
}

::-webkit-scrollbar-track {
    background: var(--skyblue);
    border-radius: 10px;
}

::-webkit-scrollbar-thumb {
    background: linear-gradient(135deg, var(--cerulean), var(--tropical-teal));
    border-radius: 10px;
}

::-webkit-scrollbar-thumb:hover {
    background: linear-gradient(135deg, var(--hot-fuchsia), var(--tropical-teal));
}

@keyframes logoMove {
    0%, 100% { transform: translateY(0) rotate(0deg) scale(1); box-shadow: 0 0 20px rgba(67, 97, 238, 0.3); }
    25% { transform: translateY(-8px) rotate(5deg) scale(1.05); box-shadow: 0 10px 30px rgba(67, 97, 238, 0.5); }
    50% { transform: translateY(5px) rotate(-3deg) scale(0.98); box-shadow: 0 5px 25px rgba(67, 97, 238, 0.4); }
    75% { transform: translateY(-3px) rotate(2deg) scale(1.02); box-shadow: 0 8px 28px rgba(67, 97, 238, 0.45); }
}

@keyframes iconMove {
    0%, 100% { transform: scale(1) rotate(0deg); color: white; }
    33% { transform: scale(1.15) rotate(10deg); color: var(--primary-light); }
    66% { transform: scale(0.95) rotate(-10deg); color: var(--secondary); }
}

@keyframes headerFade {
    from { opacity: 0; transform: translateY(-30px); }
    to { opacity: 1; transform: translateY(0); }
}

@keyframes mainFade {
    from { opacity: 0; transform: translateY(20px); }
    to { opacity: 1; transform: translateY(0); }
}

@keyframes cardAppear {
    from { opacity: 0; transform: scale(0.9) translateY(20px); }
    to { opacity: 1; transform: scale(1) translateY(0); }
}

@keyframes pulse {
    0% { transform: scale(1); }
    50% { transform: scale(1.1); }
    100% { transform: scale(1); }
}

.modern-header {
    background: linear-gradient(135deg, var(--cerulean) 0%, var(--tropical-teal) 100%);
    padding: 1rem 0;
    position: sticky;
    top: 0;
    z-index: 1000;
    box-shadow: 0 8px 25px rgba(0, 0, 0, 0.15);
    animation: headerFade 0.8s ease-out;
    border-bottom: 2px solid rgba(255, 255, 255, 0.2);
}

.header-container {
    max-width: 1600px;
    margin: 0 auto;
    padding: 0 2rem;
    display: flex;
    justify-content: space-between;
    align-items: center;
    flex-wrap: wrap;
    gap: 1rem;
}

.logo-area {
    display: flex;
    align-items: center;
    gap: 0.8rem;
}

.smartintern-logo {
    position: relative;
    width: 50px;
    height: 50px;
    display: flex;
    align-items: center;
    justify-content: center;
}

.logo-blue {
    width: 40px;
    height: 40px;
    background: linear-gradient(135deg, var(--primary), var(--secondary));
    border-radius: 12px;
    display: flex;
    align-items: center;
    justify-content: center;
    position: relative;
    animation: logoMove 4s var(--transition-bounce) infinite;
    box-shadow: 0 0 20px rgba(67, 97, 238, 0.3);
}

.logo-blue i {
    font-size: 20px;
    color: white;
    filter: drop-shadow(0 0 10px rgba(67, 97, 238, 0.5));
    animation: iconMove 3s var(--transition-bounce) infinite;
}

.logo-text h1 {
    color: white;
    font-size: 1.3rem;
    font-weight: 700;
    margin: 0;
}

.logo-text p {
    color: rgba(255, 255, 255, 0.85);
    margin: 0;
    font-size: 0.7rem;
    font-weight: 500;
}

.header-nav {
    display: flex;
    align-items: center;
    gap: 0.5rem;
    background: rgba(255, 255, 255, 0.2);
    backdrop-filter: blur(10px);
    padding: 0.3rem 0.8rem;
    border-radius: 50px;
    border: 1px solid rgba(255, 255, 255, 0.25);
}

.nav-link-header {
    display: flex;
    align-items: center;
    gap: 0.5rem;
    padding: 0.4rem 0.8rem;
    border-radius: 40px;
    color: white;
    text-decoration: none;
    font-weight: 600;
    font-size: 0.85rem;
    transition: all 0.3s;
}

.nav-link-header i {
    font-size: 0.9rem;
}

.nav-link-header:hover {
    background: rgba(255, 255, 255, 0.25);
    color: var(--cream);
    transform: translateY(-2px);
}

.nav-badge-header {
    background: var(--hot-fuchsia);
    color: white;
    padding: 0.15rem 0.5rem;
    border-radius: 20px;
    font-size: 0.65rem;
    font-weight: 600;
    margin-left: 0.3rem;
}

.header-actions {
    display: flex;
    align-items: center;
    gap: 1rem;
}

.header-search {
    position: relative;
    width: 250px;
}

.header-search input {
    width: 100%;
    padding: 0.5rem 1rem;
    padding-left: 2rem;
    border: none;
    border-radius: 50px;
    background: rgba(255, 255, 255, 0.2);
    color: white;
    font-size: 0.85rem;
    transition: all 0.3s;
}

.header-search input::placeholder {
    color: rgba(255, 255, 255, 0.7);
}

.header-search input:focus {
    outline: none;
    background: rgba(255, 255, 255, 0.3);
    box-shadow: 0 0 0 3px rgba(255, 255, 255, 0.2);
}

.header-search i {
    position: absolute;
    left: 0.8rem;
    top: 50%;
    transform: translateY(-50%);
    color: white;
    font-size: 0.8rem;
}

.notification-badge {
    position: relative;
    cursor: pointer;
    transition: all 0.3s;
    padding: 0.3rem;
}

.notification-badge:hover {
    transform: scale(1.1);
}

.notification-badge i {
    font-size: 1.2rem;
    color: white;
    opacity: 0.9;
}

.notification-count {
    position: absolute;
    top: -5px;
    right: -5px;
    background: var(--danger);
    color: white;
    font-size: 0.6rem;
    font-weight: 600;
    width: 16px;
    height: 16px;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    border: 2px solid white;
    animation: pulse 2s infinite;
}

.profile-dropdown {
    position: relative;
    display: flex;
    align-items: center;
    gap: 0.5rem;
    cursor: pointer;
    padding: 0.4rem 1rem;
    border-radius: 50px;
    background: rgba(255, 255, 255, 0.2);
    transition: all 0.3s;
}



.profile-dropdown:hover {
    background: rgba(255, 255, 255, 0.3);
    transform: translateY(-2px);
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
}

.profile-avatar {
    width: 32px;
    height: 32px;
    background: linear-gradient(135deg, var(--success), var(--secondary));
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    color: white;
    font-weight: 600;
    font-size: 0.9rem;
    overflow: hidden;
    transition: all 0.3s;
    border: 2px solid rgba(255, 255, 255, 0.5);
}

.profile-dropdown:hover .profile-avatar {
    transform: rotate(360deg);
    transition: transform 0.6s;
    border-color: white;
}

.profile-avatar img {
    width: 100%;
    height: 100%;
    object-fit: cover;
}

.profile-name {
    color: white;
    font-weight: 600;
    font-size: 0.85rem;
}

.profile-arrow {
    color: white;
    font-size: 0.75rem;
    transition: transform 0.3s;
}

.profile-dropdown:hover .profile-arrow {
    transform: rotate(180deg);
}

.dropdown-menu-custom {
    position: absolute;
    top: calc(100% + 8px);
    right: 0;
    margin-top: 0;
    background: white;
    border-radius: 12px;
    box-shadow: 0 20px 40px rgba(0, 0, 0, 0.2);
    min-width: 200px;
    display: none;
    z-index: 1000;
    overflow: hidden;
    animation: dropdownFade 0.3s ease-out;
    border: 1px solid rgba(0, 0, 0, 0.05);
}

@keyframes dropdownFade {
    from { opacity: 0; transform: translateY(-10px); }
    to { opacity: 1; transform: translateY(0); }
}

.profile-dropdown:hover .dropdown-menu-custom,
.dropdown-menu-custom:hover {
    display: block;
}

.dropdown-item-custom {
    display: flex;
    align-items: center;
    gap: 0.7rem;
    padding: 0.7rem 1rem;
    color: var(--dark);
    text-decoration: none;
    transition: all 0.3s;
    font-size: 0.8rem;
    font-weight: 500;
    border-left: 3px solid transparent;
}

.dropdown-item-custom i {
    width: 18px;
    font-size: 0.85rem;
    color: var(--cerulean);
}

.dropdown-item-custom:hover {
    background: var(--light-skyblue);
    color: var(--cerulean);
    border-left-color: var(--cerulean);
    padding-left: 1.2rem;
}

.dropdown-divider {
    height: 1px;
    background: #e2e8f0;
    margin: 0.3rem 0;
}

.dropdown-item-custom.logout {
    color: var(--danger);
}

.dropdown-item-custom.logout i {
    color: var(--danger);
}

.dropdown-item-custom.logout:hover {
    background: #fee2e2;
    color: var(--danger);
    border-left-color: var(--danger);
}

.main-content {
    max-width: 1400px;
    margin: 2rem auto;
    padding: 0 2rem;
    flex: 1;
    width: 100%;
    animation: mainFade 1s ease-out;
}

.filter-section {
    background: rgba(255, 255, 255, 0.9);
    backdrop-filter: blur(10px);
    border-radius: 24px;
    padding: 1.5rem;
    margin-bottom: 2rem;
    border: 1px solid var(--tropical-teal);
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
}

.filter-title {
    font-size: 1.1rem;
    font-weight: 600;
    color: var(--cerulean);
    margin-bottom: 1rem;
    display: flex;
    align-items: center;
    gap: 0.5rem;
}

.filter-options {
    display: flex;
    flex-wrap: wrap;
    gap: 2rem;
    align-items: center;
}

.filter-group {
    display: flex;
    align-items: center;
    gap: 1rem;
    flex-wrap: wrap;
}

.filter-label {
    font-weight: 600;
    color: var(--cerulean);
    font-size: 0.85rem;
}

.filter-select {
    padding: 0.5rem 1rem;
    border: 1px solid var(--tropical-teal);
    border-radius: 12px;
    font-size: 0.85rem;
    color: var(--dark);
    background: white;
    cursor: pointer;
    transition: all 0.3s;
    min-width: 130px;
}

.filter-select:hover, .filter-select:focus {
    border-color: var(--cerulean);
    outline: none;
    box-shadow: 0 0 0 3px rgba(36, 123, 160, 0.1);
}

.filter-badge {
    display: flex;
    gap: 0.5rem;
    flex-wrap: wrap;
}

.filter-badge .badge {
    padding: 0.4rem 1rem;
    background: white;
    color: var(--dark);
    border-radius: 50px;
    font-size: 0.75rem;
    font-weight: 600;
    cursor: pointer;
    transition: all 0.3s;
    border: 1px solid var(--tropical-teal);
}

.filter-badge .badge:hover {
    background: linear-gradient(135deg, var(--cerulean), var(--tropical-teal));
    color: white;
    transform: translateY(-2px);
}

.filter-badge .badge.active {
    background: linear-gradient(135deg, var(--cerulean), var(--tropical-teal));
    color: white;
    border-color: transparent;
}

.filter-reset {
    padding: 0.4rem 1rem;
    background: white;
    border: 1px solid var(--tropical-teal);
    border-radius: 12px;
    color: var(--danger);
    cursor: pointer;
    transition: all 0.3s;
    font-size: 0.75rem;
    font-weight: 600;
    margin-left: auto;
}

.filter-reset:hover {
    background: var(--danger);
    color: white;
    border-color: var(--danger);
    transform: translateY(-2px);
}

.results-count {
    margin-bottom: 1.5rem;
    font-size: 0.9rem;
    color: var(--gray);
    background: rgba(255, 255, 255, 0.7);
    display: inline-block;
    padding: 0.4rem 1rem;
    border-radius: 50px;
}

.results-count span {
    font-weight: 700;
    color: var(--cerulean);
    font-size: 1rem;
}

.welcome-card {
    background: linear-gradient(135deg, #5f9ea0 0%, #4682b4 100%);
    border-radius: 30px;
    padding: 1.5rem;
    margin-bottom: 2rem;
    color: white;
    position: relative;
    overflow: hidden;
}

.welcome-card::before {
    content: '';
    position: absolute;
    top: -50%;
    right: -50%;
    width: 200%;
    height: 200%;
    background: radial-gradient(circle, rgba(255,255,255,0.15) 0%, transparent 70%);
    animation: rotate 20s linear infinite;
}

@keyframes rotate {
    from { transform: rotate(0deg); }
    to { transform: rotate(360deg); }
}

.welcome-content {
    position: relative;
    z-index: 1;
    display: flex;
    justify-content: space-between;
    align-items: center;
    flex-wrap: wrap;
    gap: 1rem;
}

.welcome-text h2 {
    font-size: 1.5rem;
    font-weight: 700;
    margin-bottom: 0.3rem;
}

.welcome-text p {
    font-size: 0.85rem;
    opacity: 0.9;
}

.welcome-stats {
    display: flex;
    gap: 1rem;
}

.welcome-stat {
    text-align: center;
    padding: 0.5rem 1rem;
    background: rgba(255, 255, 255, 0.2);
    border-radius: 12px;
}

.welcome-stat .value {
    font-size: 1.3rem;
    font-weight: 700;
    display: block;
}

.welcome-stat .label {
    font-size: 0.7rem;
    opacity: 0.9;
}

.enrolled-section {
    background: rgba(210, 235, 255, 0.7);
    backdrop-filter: blur(5px);
    padding: 1.5rem;
    border-radius: 28px;
    margin-bottom: 2rem;
    border: 1px solid rgba(112, 193, 179, 0.4);
}

.section-title {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 1.5rem;
}

.section-title h3 {
    font-size: 1.3rem;
    font-weight: 700;
    color: var(--cerulean);
    margin: 0;
}

.internship-grid {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 1.5rem;
}

.internship-card-modern {
    background: rgba(255, 255, 255, 0.85);
    backdrop-filter: blur(8px);
    border-radius: 20px;
    padding: 1.2rem;
    box-shadow: 0 10px 30px -5px rgba(0, 0, 0, 0.08);
    transition: all 0.4s cubic-bezier(0.165, 0.84, 0.44, 1);
    position: relative;
    border: 1px solid var(--tropical-teal);
    animation: cardAppear 0.6s ease-out;
    animation-fill-mode: both;
    cursor: pointer;
    display: flex;
    flex-direction: column;
}

.internship-card-modern:hover {
    transform: translateY(-5px);
    border-color: var(--cerulean);
    box-shadow: var(--hover-shadow);
    background: rgba(255, 255, 255, 0.95);
}

.internship-card-modern.hidden {
    display: none;
}

.enrollment-status {
    position: absolute;
    top: 0.8rem;
    right: 0.8rem;
    padding: 0.2rem 0.8rem;
    border-radius: 50px;
    font-size: 0.7rem;
    font-weight: 600;
    z-index: 1;
}

.status-on-going {
    background: linear-gradient(135deg, var(--tropical-teal), var(--cerulean));
    color: white;
}

.status-completed {
    background: linear-gradient(135deg, #10b981, #059669);
    color: white;
}

.status-dropped {
    background: linear-gradient(135deg, var(--hot-fuchsia), #ff4d7a);
    color: white;
}

.status-on-hold {
    background: linear-gradient(135deg, var(--warning), #ea580c);
    color: white;
}

.internship-company-logo {
    width: 45px;
    height: 45px;
    background: linear-gradient(135deg, var(--cerulean), var(--tropical-teal));
    border-radius: 14px;
    display: flex;
    align-items: center;
    justify-content: center;
    margin-bottom: 0.8rem;
    color: white;
    font-size: 1.1rem;
    font-weight: 700;
}

.internship-card-modern h4 {
    font-size: 1rem;
    font-weight: 700;
    margin-bottom: 0.2rem;
}

.internship-company {
    color: var(--cerulean);
    font-size: 0.75rem;
    margin-bottom: 0.6rem;
    display: flex;
    align-items: center;
    gap: 0.3rem;
}

.internship-details-modern {
    display: flex;
    flex-wrap: wrap;
    gap: 0.6rem;
    margin-bottom: 0.8rem;
    padding-bottom: 0.8rem;
    border-bottom: 1px solid rgba(100, 116, 139, 0.2);
    font-size: 0.7rem;
    color: var(--gray);
}

.detail-item {
    display: flex;
    align-items: center;
    gap: 0.3rem;
}

.detail-item i {
    color: var(--cerulean);
    width: 12px;
    font-size: 0.65rem;
}

.enrollment-info {
    background: rgba(112, 193, 179, 0.15);
    border-radius: 10px;
    padding: 0.6rem;
    margin: 0.4rem 0;
    font-size: 0.7rem;
}

.enrollment-info .info-row {
    display: flex;
    justify-content: space-between;
    margin-bottom: 0.2rem;
}

.enrollment-info .info-label {
    font-weight: 600;
    color: var(--cerulean);
}

.enrollment-info .info-value {
    color: var(--gray);
}

.performance-badge {
    display: inline-block;
    padding: 0.15rem 0.5rem;
    border-radius: 20px;
    font-size: 0.65rem;
    font-weight: 600;
}

.performance-excellent { background: #10b981; color: white; }
.performance-good { background: #06b6d4; color: white; }
.performance-average { background: #f59e0b; color: white; }
.performance-poor { background: #ef4444; color: white; }

.internship-footer {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-top: auto;
}

.internship-stipend {
    font-weight: 700;
    font-size: 0.9rem;
    color: var(--tropical-teal-dark);
}

.btn-outline-modern {
    padding: 0.3rem 0.8rem;
    border: 1px solid rgba(100, 116, 139, 0.3);
    border-radius: 40px;
    background: transparent;
    color: var(--gray);
    font-size: 0.7rem;
    font-weight: 600;
    cursor: pointer;
    transition: all 0.3s;
    text-decoration: none;
    display: inline-block;
}

.btn-outline-modern:hover {
    border-color: var(--cerulean);
    color: var(--cerulean);
    background: rgba(36, 123, 160, 0.1);
}

.btn-primary-modern {
    padding: 0.3rem 0.8rem;
    background: linear-gradient(135deg, var(--cerulean), var(--tropical-teal));
    border: none;
    border-radius: 40px;
    color: white;
    font-size: 0.7rem;
    font-weight: 600;
    cursor: pointer;
    transition: all 0.3s;
    text-decoration: none;
    display: inline-block;
}

.btn-primary-modern:hover {
    transform: translateY(-2px);
    box-shadow: 0 4px 12px rgba(36, 123, 160, 0.3);
}

/* Pagination Styles */
.pagination-container {
    margin-top: 2rem;
    display: flex;
    justify-content: center;
}

.pagination {
    display: flex;
    gap: 0.5rem;
    flex-wrap: wrap;
    justify-content: center;
}

.page-btn {
    padding: 0.5rem 1rem;
    border: 1px solid var(--tropical-teal);
    background: white;
    color: var(--cerulean);
    border-radius: 10px;
    cursor: pointer;
    transition: all 0.3s;
    font-weight: 600;
    font-size: 0.85rem;
}

.page-btn:hover:not(:disabled) {
    background: var(--cerulean);
    color: white;
    transform: translateY(-2px);
}

.page-btn.active {
    background: linear-gradient(135deg, var(--cerulean), var(--tropical-teal));
    color: white;
    border-color: transparent;
}

.page-btn:disabled {
    opacity: 0.5;
    cursor: not-allowed;
}

.no-results {
    text-align: center;
    padding: 3rem;
    background: rgba(255, 255, 255, 0.7);
    border-radius: 24px;
    grid-column: 1 / -1;
}

.no-results i {
    font-size: 3rem;
    color: var(--gray);
    margin-bottom: 1rem;
}

.modern-footer {
    background: var(--footer-bg);
    color: rgba(255, 255, 255, 0.85);
    padding: 1rem 0;
    margin-top: 2rem;
    border-top: 1px solid rgba(255, 255, 255, 0.15);
}

.footer-container {
    max-width: 1400px;
    margin: 0 auto;
    padding: 0 2rem;
    display: flex;
    justify-content: space-between;
    align-items: center;
    flex-wrap: wrap;
    gap: 1rem;
}

.footer-logo {
    display: flex;
    align-items: center;
    gap: 0.5rem;
}

.footer-logo i {
    font-size: 1.2rem;
    color: var(--cream);
}

.footer-logo span {
    font-size: 0.9rem;
    font-weight: 700;
    color: white;
}

.footer-links {
    display: flex;
    gap: 1.5rem;
}

.footer-links a {
    color: rgba(255, 255, 255, 0.8);
    text-decoration: none;
    font-size: 0.8rem;
    font-weight: 500;
    transition: all 0.3s;
}

.footer-links a:hover {
    color: var(--cream);
}

.footer-copyright {
    font-size: 0.75rem;
}

@media (max-width: 1200px) {
    .internship-grid { grid-template-columns: repeat(2, 1fr); }
}

@media (max-width: 768px) {
    .header-container { flex-direction: column; }
    .header-nav { width: 100%; justify-content: center; flex-wrap: wrap; }
    .header-actions { width: 100%; justify-content: center; }
    .header-search { width: 100%; }
    .welcome-content { flex-direction: column; text-align: center; }
    .internship-grid { grid-template-columns: 1fr; }
    .filter-options { flex-direction: column; align-items: stretch; }
    .filter-reset { margin-left: 0; }
    .filter-group { width: 100%; }
    .filter-select { width: 100%; }
    .footer-container { flex-direction: column; text-align: center; }
}
</style>
</head>
<body>

<!-- Modern Header -->
<header class="modern-header">
    <div class="header-container">
        <div class="logo-area">
            <div class="smartintern-logo">
                <div class="logo-blue">
                    <i class="bi bi-briefcase-fill"></i>
                </div>
            </div>
            <div class="logo-text">
                <h1>SmartIntern</h1>
                <p> Internship Platform</p>
            </div>
        </div>
        
        <div class="header-nav">
            <a href="studentDashboard" class="nav-link-header">
                <i class="fas fa-home"></i>
                <span>Dashboard</span>
            </a>
            <a href="myinternships" class="nav-link-header">
                <i class="fas fa-briefcase"></i>
                <span>My Internships</span>
                
            </a>
            <a href="myApplications" class="nav-link-header">
                <i class="fas fa-file-alt"></i>
                <span>Applications</span>
            </a>
            <a href="internships" class="nav-link-header">
                <i class="fas fa-search"></i>
                <span>Internships</span>
            </a>
        </div>
        
        <div class="header-actions">
            <div class="header-search">
                <i class="fas fa-search"></i>
                <input type="text" id="globalSearch" placeholder="Search my internships...">
            </div>
            
            <div class="notification-badge">
                <i class="far fa-bell"></i>
                <span class="notification-count">3</span>
            </div>
            
            <div class="profile-dropdown">
                <div class="profile-avatar">
                    <c:choose>
                        <c:when test="${not empty user.profilePicURL}">
                            <img src="${user.profilePicURL}" alt="${user.firstName}">
                        </c:when>
                        <c:otherwise>
                            <span>${fn:substring(user.firstName, 0, 1)}${fn:substring(user.lastName, 0, 1)}</span>
                        </c:otherwise>
                    </c:choose>
                </div>
                <div class="profile-name">${user.firstName} ${user.lastName}</div>
                <i class="fas fa-chevron-down profile-arrow"></i>
                <div class="dropdown-menu-custom">
                    <a href="/viewProfile" class="dropdown-item-custom">
                        <i class="fas fa-user-circle"></i> My Profile
                    </a>
                    <a href="settings" class="dropdown-item-custom">
                        <i class="fas fa-cog"></i> Settings
                    </a>
                    <a href="/myCertificates" class="dropdown-item-custom">
                        <i class="fas fa-file-alt"></i> My Certificates
                    </a>
                    <div class="dropdown-divider"></div>
                    <a href="logout" class="dropdown-item-custom logout">
                        <i class="fas fa-sign-out-alt"></i> Logout
                    </a>
                </div>
            </div>
        </div>
    </div>
</header>

<!-- Main Content -->
<main class="main-content">
    <div class="welcome-card">
        <div class="welcome-content">
            <div class="welcome-text">
                <h2>My Enrolled Internships, ${user.firstName}! 📚</h2>
                <p>Track your internship progress and performance here.</p>
            </div>
            <div class="welcome-stats">
                <div class="welcome-stat">
                    <span class="value">${enrollmentsCount}</span>
                    <span class="label">Enrolled</span>
                </div>
                <div class="welcome-stat">
                    <span class="value">${completedCount}</span>
                    <span class="label">Completed</span>
                </div>
                <div class="welcome-stat">
                    <span class="value">${ongoingCount}</span>
                    <span class="label">Ongoing</span>
                </div>
            </div>
        </div>
    </div>
    
    <div class="filter-section">
        <div class="filter-title">
            <i class="fas fa-filter"></i>
            <span>Filter Enrolled Internships</span>
        </div>
        <div class="filter-options">
            <div class="filter-group">
                <span class="filter-label"><i class="fas fa-map-marker-alt"></i> Location:</span>
                <select id="locationFilter" class="filter-select">
                    <option value="all">All Locations</option>
                    <c:forEach var="location" items="${uniqueLocations}">
                        <option value="${fn:toLowerCase(location)}">${location}</option>
                    </c:forEach>
                </select>
            </div>
            
            <div class="filter-group">
                <span class="filter-label"><i class="fas fa-tag"></i> Type:</span>
                <select id="typeFilter" class="filter-select">
                    <option value="all">All Types</option>
                    <option value="remote">Remote</option>
                    <option value="onsite">Onsite</option>
                    <option value="hybrid">Hybrid</option>
                </select>
            </div>
            
            <div class="filter-group">
                <span class="filter-label"><i class="fas fa-chart-line"></i> Status:</span>
                <div class="filter-badge">
                    <span class="badge active" data-status="all">All</span>
                    <span class="badge" data-status="ON_GOING">Ongoing</span>
                    <span class="badge" data-status="COMPLETED">Completed</span>
                    <span class="badge" data-status="DROPPED">Dropped</span>
                    <span class="badge" data-status="ON_HOLD">On Hold</span>
                </div>
            </div>
            
            <button class="filter-reset" id="resetBtn">
                <i class="fas fa-undo-alt"></i> Reset
            </button>
        </div>
    </div>
    
    <div class="results-count">
        <span id="visibleCount">${enrollmentsCount}</span> enrolled internships found
    </div>
    
    <div class="enrolled-section">
        <div class="section-title">
            <h3><i class="fas fa-briefcase"></i> My Enrolled Internships</h3>
        </div>
        
        <div class="internship-grid" id="enrolledGrid">
            <c:choose>
                <c:when test="${empty enrollments}">
                    <div class="no-results">
                        <i class="fas fa-inbox"></i>
                        <h3>No Enrolled Internships Yet</h3>
                        <p>Browse internships and enroll now!</p>
                        <a href="internships" class="btn-primary-modern" style="margin-top: 1rem;">Browse Internships</a>
                    </div>
                </c:when>
                <c:otherwise>
                    <c:forEach var="enrollment" items="${enrollments}" varStatus="loop">
                        <c:set var="internship" value="${enrollment.internship}" />
                        <c:if test="${not empty internship}">
                            <div class="internship-card-modern pagination-card" data-page="1"
                                 data-location="${fn:toLowerCase(internship.location)}" 
                                 data-type="${fn:toLowerCase(internship.internshipType)}"
                                 data-status="${enrollment.status}"
                                 data-title="${fn:toLowerCase(internship.title)}"
                                 data-company="${fn:toLowerCase(internship.employer.companyName)}"
                                 onclick="window.location.href='viewInternshipDetails?internshipId=${internship.internshipId}'">
                                
                                <span class="enrollment-status 
                                    <c:choose>
                                        <c:when test="${enrollment.status == 'ON_GOING'}">status-on-going</c:when>
                                        <c:when test="${enrollment.status == 'COMPLETED'}">status-completed</c:when>
                                        <c:when test="${enrollment.status == 'DROPPED'}">status-dropped</c:when>
                                        <c:otherwise>status-on-hold</c:otherwise>
                                    </c:choose>">
                                    <c:choose>
                                        <c:when test="${enrollment.status == 'ON_GOING'}"><i class="fas fa-play-circle"></i> ON GOING</c:when>
                                        <c:when test="${enrollment.status == 'COMPLETED'}"><i class="fas fa-check-circle"></i> COMPLETED</c:when>
                                        <c:when test="${enrollment.status == 'DROPPED'}"><i class="fas fa-times-circle"></i> DROPPED</c:when>
                                        <c:otherwise><i class="fas fa-pause-circle"></i> ON HOLD</c:otherwise>
                                    </c:choose>
                                </span>
                                
                                <div class="internship-company-logo">
                                    <span>${fn:substring(internship.employer.companyName, 0, 2)}</span>
                                </div>
                                
                                <h4>${internship.title}</h4>
                                <div class="internship-company">
                                    <i class="fas fa-building"></i> ${internship.employer.companyName}
                                </div>
                                
                                <div class="internship-details-modern">
                                    <div class="detail-item"><i class="fas fa-map-marker-alt"></i> ${internship.location}</div>
                                    <div class="detail-item"><i class="fas fa-clock"></i> ${internship.internshipType}</div>
                                    <div class="detail-item"><i class="fas fa-calendar-alt"></i> ${internship.durationMonths} months</div>
                                </div>
                                
                                <div class="enrollment-info">
                                    <div class="info-row">
                                        <span class="info-label"><i class="fas fa-calendar-check"></i> Joined:</span>
                                        <span class="info-value">${enrollment.joiningDate}</span>
                                    </div>
                                    <c:if test="${not empty enrollment.completionDate}">
                                        <div class="info-row">
                                            <span class="info-label"><i class="fas fa-flag-checkered"></i> Completed:</span>
                                            <span class="info-value">${enrollment.completionDate}</span>
                                        </div>
                                    </c:if>
                                    <c:if test="${not empty enrollment.performanceRating}">
                                        <div class="info-row">
                                            <span class="info-label"><i class="fas fa-star"></i> Performance:</span>
                                            <span class="info-value">
                                                <span class="performance-badge 
                                                    <c:choose>
                                                        <c:when test="${enrollment.performanceRating >= 4.5}">performance-excellent</c:when>
                                                        <c:when test="${enrollment.performanceRating >= 3.5}">performance-good</c:when>
                                                        <c:when test="${enrollment.performanceRating >= 2.5}">performance-average</c:when>
                                                        <c:otherwise>performance-poor</c:otherwise>
                                                    </c:choose>">
                                                    ${enrollment.performanceRating} / 5.0
                                                </span>
                                            </span>
                                        </div>
                                    </c:if>
                                </div>
                                
                                <div class="internship-footer">
                                    <div class="internship-stipend">
                                        <c:choose>
                                            <c:when test="${internship.stipend > 0}">₹${internship.stipend}/month</c:when>
                                            <c:otherwise>Free</c:otherwise>
                                        </c:choose>
                                    </div>
                                    <div onclick="event.stopPropagation();">
                                        <a href="viewInternshipDetails?internshipId=${internship.internshipId}" class="btn-outline-modern" onclick="event.stopPropagation();">
                                            <i class="fas fa-eye"></i> View
                                        </a>
                                        <c:if test="${enrollment.status == 'ON_GOING'}">
                                            <a href="internshipProgress?enrollmentId=${enrollment.internshipEnrollmentId}" class="btn-primary-modern" onclick="event.stopPropagation();">
                                                <i class="fas fa-chart-line"></i> Progress
                                            </a>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                </c:otherwise>
            </c:choose>
        </div>
        
        <!-- Pagination -->
        <div class="pagination-container" id="paginationContainer" style="display: none;">
            <div class="pagination" id="pagination"></div>
        </div>
    </div>
</main>

<footer class="modern-footer">
    <div class="footer-container">
        <div class="footer-logo">
            <i class="bi bi-briefcase-fill"></i>
            <span>SmartIntern</span>
        </div>
        <div class="footer-links">
            <a href="#">About</a>
            <a href="#">Contact</a>
            <a href="#">Privacy</a>
            <a href="#">Terms</a>
        </div>
        <div class="footer-copyright">
            © 2026 SmartIntern · Made with <i class="fas fa-heart"></i> by <strong>Darshan</strong>
        </div>
    </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<script>
AOS.init({ duration: 800, once: true, offset: 50 });

// Pagination variables
let currentPage = 1;
let itemsPerPage = 6;
let totalVisibleCards = 0;
let allVisibleCards = [];

// Filter variables
let currentLocationFilter = 'all';
let currentTypeFilter = 'all';
let currentStatusFilter = 'all';

function updateVisibleCards() {
    const searchTerm = document.getElementById('globalSearch')?.value.toLowerCase().trim() || '';
    const cards = document.querySelectorAll('#enrolledGrid .internship-card-modern');
    allVisibleCards = [];
    
    cards.forEach(card => {
        const location = card.dataset.location || '';
        const type = card.dataset.type || '';
        const status = card.dataset.status || '';
        const title = card.dataset.title || '';
        const company = card.dataset.company || '';
        
        let locationMatch = currentLocationFilter === 'all' || location === currentLocationFilter;
        let typeMatch = currentTypeFilter === 'all' || type === currentTypeFilter;
        let statusMatch = currentStatusFilter === 'all' || status === currentStatusFilter;
        let searchMatch = true;
        
        if (searchTerm) {
            searchMatch = title.includes(searchTerm) || company.includes(searchTerm) || location.includes(searchTerm);
        }
        
        if (locationMatch && typeMatch && statusMatch && searchMatch) {
            card.classList.remove('hidden');
            allVisibleCards.push(card);
        } else {
            card.classList.add('hidden');
        }
    });
    
    totalVisibleCards = allVisibleCards.length;
    document.getElementById('visibleCount').textContent = totalVisibleCards;
    
    if (totalVisibleCards > itemsPerPage) {
        document.getElementById('paginationContainer').style.display = 'flex';
        setupPagination();
    } else {
        document.getElementById('paginationContainer').style.display = 'none';
        showPage(1);
    }
    
    // Show/hide no results message
    let noResultsDiv = document.querySelector('.no-results-message');
    if (totalVisibleCards === 0 && document.querySelectorAll('#enrolledGrid .internship-card-modern').length > 0) {
        if (!noResultsDiv) {
            noResultsDiv = document.createElement('div');
            noResultsDiv.className = 'no-results no-results-message';
            noResultsDiv.innerHTML = `<i class="fas fa-search"></i><h3>No Enrolled Internships Found</h3><p>Try adjusting your filters.</p>`;
            document.getElementById('enrolledGrid').appendChild(noResultsDiv);
        }
    } else if (noResultsDiv) {
        noResultsDiv.remove();
    }
}

function showPage(page) {
    currentPage = page;
    const start = (page - 1) * itemsPerPage;
    const end = start + itemsPerPage;
    
    // Hide all cards first
    document.querySelectorAll('#enrolledGrid .internship-card-modern').forEach(card => {
        card.style.display = 'none';
    });
    
    // Show cards for current page
    for (let i = start; i < end && i < allVisibleCards.length; i++) {
        allVisibleCards[i].style.display = 'flex';
    }
    
    // Update pagination buttons
    updatePaginationButtons();
}

function setupPagination() {
    const totalPages = Math.ceil(totalVisibleCards / itemsPerPage);
    const paginationEl = document.getElementById('pagination');
    paginationEl.innerHTML = '';
    
    // Previous button
    const prevBtn = document.createElement('button');
    prevBtn.className = 'page-btn';
    prevBtn.innerHTML = '<i class="fas fa-chevron-left"></i>';
    prevBtn.disabled = currentPage === 1;
    prevBtn.onclick = () => {
        if (currentPage > 1) {
            showPage(currentPage - 1);
        }
    };
    paginationEl.appendChild(prevBtn);
    
    // Page numbers
    const maxVisiblePages = 5;
    let startPage = Math.max(1, currentPage - Math.floor(maxVisiblePages / 2));
    let endPage = Math.min(totalPages, startPage + maxVisiblePages - 1);
    
    if (endPage - startPage + 1 < maxVisiblePages) {
        startPage = Math.max(1, endPage - maxVisiblePages + 1);
    }
    
    if (startPage > 1) {
        const firstBtn = document.createElement('button');
        firstBtn.className = 'page-btn';
        firstBtn.textContent = '1';
        firstBtn.onclick = () => showPage(1);
        paginationEl.appendChild(firstBtn);
        
        if (startPage > 2) {
            const dots = document.createElement('span');
            dots.textContent = '...';
            dots.style.padding = '0 0.5rem';
            paginationEl.appendChild(dots);
        }
    }
    
    for (let i = startPage; i <= endPage; i++) {
        const btn = document.createElement('button');
        btn.className = 'page-btn' + (i === currentPage ? ' active' : '');
        btn.textContent = i;
        btn.onclick = () => showPage(i);
        paginationEl.appendChild(btn);
    }
    
    if (endPage < totalPages) {
        if (endPage < totalPages - 1) {
            const dots = document.createElement('span');
            dots.textContent = '...';
            dots.style.padding = '0 0.5rem';
            paginationEl.appendChild(dots);
        }
        
        const lastBtn = document.createElement('button');
        lastBtn.className = 'page-btn';
        lastBtn.textContent = totalPages;
        lastBtn.onclick = () => showPage(totalPages);
        paginationEl.appendChild(lastBtn);
    }
    
    // Next button
    const nextBtn = document.createElement('button');
    nextBtn.className = 'page-btn';
    nextBtn.innerHTML = '<i class="fas fa-chevron-right"></i>';
    nextBtn.disabled = currentPage === totalPages;
    nextBtn.onclick = () => {
        if (currentPage < totalPages) {
            showPage(currentPage + 1);
        }
    };
    paginationEl.appendChild(nextBtn);
}

function updatePaginationButtons() {
    const totalPages = Math.ceil(totalVisibleCards / itemsPerPage);
    const btns = document.querySelectorAll('#pagination .page-btn');
    btns.forEach(btn => {
        const text = btn.textContent;
        if (!isNaN(parseInt(text))) {
            if (parseInt(text) === currentPage) {
                btn.classList.add('active');
            } else {
                btn.classList.remove('active');
            }
        }
    });
    
    // Update prev/next buttons
    const prevBtn = btns[0];
    const nextBtn = btns[btns.length - 1];
    if (prevBtn && prevBtn.innerHTML.includes('chevron-left')) {
        prevBtn.disabled = currentPage === 1;
    }
    if (nextBtn && nextBtn.innerHTML.includes('chevron-right')) {
        nextBtn.disabled = currentPage === totalPages;
    }
}

function setStatusFilter(filter) {
    currentStatusFilter = filter;
    const badges = document.querySelectorAll('.filter-badge .badge');
    badges.forEach(badge => {
        badge.classList.remove('active');
        if (badge.getAttribute('data-status') === filter) {
            badge.classList.add('active');
        }
    });
    currentPage = 1;
    updateVisibleCards();
}

// Event Listeners
document.querySelectorAll('.filter-badge .badge').forEach(badge => {
    badge.addEventListener('click', function() {
        setStatusFilter(this.getAttribute('data-status'));
    });
});

document.getElementById('locationFilter')?.addEventListener('change', function() {
    currentLocationFilter = this.value;
    currentPage = 1;
    updateVisibleCards();
});

document.getElementById('typeFilter')?.addEventListener('change', function() {
    currentTypeFilter = this.value;
    currentPage = 1;
    updateVisibleCards();
});

document.getElementById('globalSearch')?.addEventListener('keyup', function() {
    currentPage = 1;
    updateVisibleCards();
});

document.getElementById('resetBtn')?.addEventListener('click', function() {
    document.getElementById('locationFilter').value = 'all';
    document.getElementById('typeFilter').value = 'all';
    if (document.getElementById('globalSearch')) document.getElementById('globalSearch').value = '';
    
    currentLocationFilter = 'all';
    currentTypeFilter = 'all';
    currentStatusFilter = 'all';
    currentPage = 1;
    
    const badges = document.querySelectorAll('.filter-badge .badge');
    badges.forEach(badge => {
        badge.classList.remove('active');
        if (badge.getAttribute('data-status') === 'all') {
            badge.classList.add('active');
        }
    });
    
    updateVisibleCards();
});

document.querySelector('.notification-badge')?.addEventListener('click', function() {
    alert('You have 3 new notifications');
});

// Initialize
document.addEventListener('DOMContentLoaded', function() {
    updateVisibleCards();
    
    // Add animation delays
    document.querySelectorAll('#enrolledGrid .internship-card-modern').forEach((card, index) => {
        card.style.animationDelay = (index % 6 * 0.05) + 's';
    });
});

//Profile Dropdown - Click to toggle (replaces hover)
document.addEventListener('DOMContentLoaded', function() {
    const profileDropdown = document.querySelector('.profile-dropdown');
    const dropdownMenu = document.querySelector('.dropdown-menu-custom');
    
    if (profileDropdown && dropdownMenu) {
        // Remove any existing hover classes
        profileDropdown.style.cursor = 'pointer';
        
        // Toggle dropdown on click
        profileDropdown.addEventListener('click', function(e) {
            e.stopPropagation();
            dropdownMenu.classList.toggle('show');
            profileDropdown.classList.toggle('active');
        });
        
        // Close dropdown when clicking outside
        document.addEventListener('click', function(e) {
            if (!profileDropdown.contains(e.target)) {
                dropdownMenu.classList.remove('show');
                profileDropdown.classList.remove('active');
            }
        });
        
        // Prevent dropdown from closing when clicking inside it
        dropdownMenu.addEventListener('click', function(e) {
            e.stopPropagation();
        });
    }
});
</script>
</body>
</html>