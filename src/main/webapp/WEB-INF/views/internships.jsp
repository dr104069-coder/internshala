<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SmartIntern | All Internships</title>

<!-- Bootstrap 5 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Bootstrap Icons -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">
<!-- Font Awesome 6 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800;900&display=swap" rel="stylesheet">
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
    --hot-fuchsia: #ff1654;
    --light-skyblue: #e6f3ff;
    --skyblue: #b8e1fc;
    
    --primary: #4361ee;
    --secondary: #06b6d4;
    --success: #10b981;
    --warning: #f59e0b;
    --danger: #ef4444;
    --dark: #0f172a;
    --gray: #475569;
    --card-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.1);
    --hover-shadow: 0 30px 60px -15px rgba(0, 0, 0, 0.15);
    --transition-bounce: 500ms cubic-bezier(0.34, 1.56, 0.64, 1);
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
    0%, 100% { transform: translateY(0) rotate(0deg) scale(1); }
    25% { transform: translateY(-8px) rotate(5deg) scale(1.05); }
    50% { transform: translateY(5px) rotate(-3deg) scale(0.98); }
    75% { transform: translateY(-3px) rotate(2deg) scale(1.02); }
}

@keyframes iconMove {
    0%, 100% { transform: scale(1) rotate(0deg); color: white; }
    33% { transform: scale(1.15) rotate(10deg); }
    66% { transform: scale(0.95) rotate(-10deg); }
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
    0% { opacity: 0; transform: scale(0.8) translateY(30px); }
    100% { opacity: 1; transform: scale(1) translateY(0); }
}

@keyframes pulseGlow {
    0% { box-shadow: 0 0 0 0 rgba(36, 123, 160, 0.4); }
    70% { box-shadow: 0 0 0 10px rgba(36, 123, 160, 0); }
    100% { box-shadow: 0 0 0 0 rgba(36, 123, 160, 0); }
}

@keyframes rotate {
    from { transform: rotate(0deg); }
    to { transform: rotate(360deg); }
}

@keyframes pulse {
    0% { transform: scale(1); }
    50% { transform: scale(1.1); }
    100% { transform: scale(1); }
}

/* Modern Header */
.modern-header {
    background: linear-gradient(135deg, var(--cerulean) 0%, var(--tropical-teal) 100%);
    padding: 1.5rem 0;
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
    gap: 1.5rem;
}

.logo-area {
    display: flex;
    align-items: center;
    gap: 1rem;
}

.smartintern-logo {
    position: relative;
    width: 65px;
    height: 65px;
    display: flex;
    align-items: center;
    justify-content: center;
}

.logo-blue {
    width: 45px;
    height: 45px;
    background: linear-gradient(135deg, var(--primary), var(--secondary));
    border-radius: 14px;
    display: flex;
    align-items: center;
    justify-content: center;
    position: relative;
    animation: logoMove 4s var(--transition-bounce) infinite;
    box-shadow: 0 0 20px rgba(67, 97, 238, 0.3);
}

.logo-blue i {
    font-size: 24px;
    color: white;
    animation: iconMove 3s var(--transition-bounce) infinite;
}

.logo-text h1 {
    color: white;
    font-size: 1.4rem;
    font-weight: 700;
    margin: 0;
}

.logo-text p {
    color: rgba(255, 255, 255, 0.85);
    margin: 0;
    font-size: 0.7rem;
    font-weight: 500;
}

/* Navigation Links */
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
    padding: 0.5rem 1rem;
    border-radius: 40px;
    color: white;
    text-decoration: none;
    font-weight: 600;
    font-size: 0.9rem;
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

/* Profile Dropdown */
.profile-dropdown {
    position: relative;
    display: flex;
    align-items: center;
    gap: 0.6rem;
    cursor: pointer;
    padding: 0.4rem 0.8rem;
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
    width: 34px;
    height: 34px;
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
    font-size: 0.7rem;
    transition: transform 0.3s;
}

.profile-dropdown:hover .profile-arrow {
    transform: rotate(180deg);
}

.dropdown-menu-custom {
    position: absolute;
    top: calc(100% + 10px);
    right: 0;
    background: white;
    border-radius: 16px;
    box-shadow: 0 20px 40px rgba(0, 0, 0, 0.2);
    min-width: 230px;
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

.profile-dropdown::after {
    content: '';
    position: absolute;
    bottom: -12px;
    left: 0;
    width: 100%;
    height: 12px;
    background: transparent;
}

.dropdown-item-custom {
    display: flex;
    align-items: center;
    gap: 0.8rem;
    padding: 0.8rem 1.2rem;
    color: var(--dark);
    text-decoration: none;
    transition: all 0.3s;
    font-size: 0.85rem;
    font-weight: 500;
    border-left: 3px solid transparent;
    cursor: pointer;
}

.dropdown-item-custom i {
    width: 20px;
    font-size: 0.9rem;
    color: var(--cerulean);
}

.dropdown-item-custom:hover {
    background: var(--light-skyblue);
    color: var(--cerulean);
    border-left-color: var(--cerulean);
    padding-left: 1.4rem;
}

.dropdown-divider {
    height: 1px;
    background: #e2e8f0;
    margin: 0.4rem 0;
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

.header-actions {
    display: flex;
    align-items: center;
    gap: 1rem;
}

.header-search {
    position: relative;
    width: 280px;
}

.header-search input {
    width: 100%;
    padding: 0.6rem 1rem;
    padding-left: 2.2rem;
    border: none;
    border-radius: 50px;
    background: rgba(255, 255, 255, 0.2);
    color: white;
    font-size: 0.85rem;
    transition: all 0.3s;
    font-weight: 500;
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
    font-size: 0.9rem;
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

.main-content {
    max-width: 1400px;
    margin: 2rem auto;
    padding: 0 2rem;
    flex: 1;
    width: 100%;
    animation: mainFade 1s ease-out;
}

.welcome-card {
    background: linear-gradient(135deg, #5f9ea0 0%, #4682b4 100%);
    border-radius: 30px;
    padding: 2rem;
    margin-bottom: 2rem;
    color: white;
    position: relative;
    overflow: hidden;
    box-shadow: var(--card-shadow);
}

.welcome-card::before {
    content: '';
    position: absolute;
    top: -50%;
    right: -50%;
    width: 200%;
    height: 200%;
    background: radial-gradient(circle, rgba(255,255,255,0.2) 0%, transparent 70%);
    animation: rotate 20s linear infinite;
}

.welcome-content {
    position: relative;
    z-index: 1;
    display: flex;
    justify-content: space-between;
    align-items: center;
    flex-wrap: wrap;
    gap: 1.5rem;
}

.welcome-text h2 {
    font-size: 1.8rem;
    font-weight: 700;
    margin-bottom: 0.5rem;
}

.welcome-text p {
    font-size: 0.95rem;
    opacity: 0.9;
}

.welcome-stats {
    display: flex;
    gap: 1.5rem;
}

.welcome-stat {
    text-align: center;
    padding: 0.8rem 1.5rem;
    background: rgba(255, 255, 255, 0.2);
    border-radius: 16px;
    backdrop-filter: blur(5px);
    transition: all 0.3s;
}

.welcome-stat:hover {
    transform: scale(1.05);
    background: rgba(255, 255, 255, 0.3);
}

.welcome-stat .value {
    font-size: 1.6rem;
    font-weight: 700;
    display: block;
}

.welcome-stat .label {
    font-size: 0.75rem;
    opacity: 0.9;
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

.filter-title i {
    color: var(--cerulean);
    animation: pulseGlow 2s infinite;
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
    padding: 0.6rem 1.2rem;
    border: 1px solid var(--tropical-teal);
    border-radius: 12px;
    font-size: 0.85rem;
    color: var(--dark);
    background: white;
    cursor: pointer;
    transition: all 0.3s;
    min-width: 150px;
    font-weight: 500;
}

.filter-select:hover, .filter-select:focus {
    border-color: var(--cerulean);
    outline: none;
    box-shadow: 0 0 0 3px rgba(36, 123, 160, 0.1);
    transform: translateY(-2px);
}

.filter-badge {
    display: flex;
    gap: 0.7rem;
    flex-wrap: wrap;
}

.filter-badge .badge {
    padding: 0.5rem 1.2rem;
    background: white;
    color: var(--dark);
    border-radius: 50px;
    font-size: 0.8rem;
    font-weight: 600;
    cursor: pointer;
    transition: all 0.3s;
    border: 1px solid var(--tropical-teal);
}

.filter-badge .badge:hover {
    background: linear-gradient(135deg, var(--cerulean), var(--tropical-teal));
    color: white;
    transform: translateY(-2px);
    box-shadow: 0 5px 15px rgba(36, 123, 160, 0.3);
}

.filter-badge .badge.active {
    background: linear-gradient(135deg, var(--cerulean), var(--tropical-teal));
    color: white;
    border-color: transparent;
}

.filter-badge .badge i {
    margin-right: 0.3rem;
}

.filter-reset {
    padding: 0.5rem 1.2rem;
    background: white;
    border: 1px solid var(--tropical-teal);
    border-radius: 12px;
    color: var(--danger);
    cursor: pointer;
    transition: all 0.3s;
    font-size: 0.8rem;
    font-weight: 600;
    margin-left: auto;
}

.filter-reset:hover {
    background: var(--danger);
    color: white;
    border-color: var(--danger);
    transform: translateY(-2px);
    box-shadow: 0 4px 12px rgba(239, 68, 68, 0.3);
}

.results-count {
    margin-bottom: 1.5rem;
    font-size: 0.9rem;
    color: var(--gray);
    background: rgba(255, 255, 255, 0.7);
    display: inline-block;
    padding: 0.5rem 1rem;
    border-radius: 50px;
}

.results-count span {
    font-weight: 700;
    color: var(--cerulean);
    font-size: 1.1rem;
}

.internship-grid {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 1.5rem;
    margin-top: 1rem;
}

.internship-card {
    background: rgba(255, 255, 255, 0.85);
    backdrop-filter: blur(8px);
    border-radius: 20px;
    padding: 1.5rem;
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

.internship-card:nth-child(1) { animation-delay: 0.05s; }
.internship-card:nth-child(2) { animation-delay: 0.1s; }
.internship-card:nth-child(3) { animation-delay: 0.15s; }
.internship-card:nth-child(4) { animation-delay: 0.2s; }
.internship-card:nth-child(5) { animation-delay: 0.25s; }
.internship-card:nth-child(6) { animation-delay: 0.3s; }

.internship-card:hover {
    transform: translateY(-8px);
    border-color: var(--cerulean);
    box-shadow: var(--hover-shadow);
    background: rgba(255, 255, 255, 0.95);
}

.internship-status {
    position: absolute;
    top: 1rem;
    right: 1rem;
    padding: 0.3rem 1rem;
    border-radius: 50px;
    font-size: 0.7rem;
    font-weight: 600;
    z-index: 2;
    box-shadow: 0 2px 8px rgba(0,0,0,0.05);
}

.status-OPEN {
    background: linear-gradient(135deg, #10b981, #059669);
    color: white;
}

.status-LIVE {
    background: linear-gradient(135deg, #06b6d4, #0891b2);
    color: white;
}

.status-UPCOMING {
    background: linear-gradient(135deg, #f59e0b, #d97706);
    color: white;
}

.internship-company-logo {
    width: 60px;
    height: 60px;
    background: linear-gradient(135deg, var(--cerulean), var(--tropical-teal));
    border-radius: 16px;
    display: flex;
    align-items: center;
    justify-content: center;
    margin-bottom: 1rem;
    color: white;
    font-size: 1.3rem;
    font-weight: 700;
    transition: all 0.3s;
    box-shadow: 0 8px 16px rgba(36, 123, 160, 0.2);
}

.internship-card:hover .internship-company-logo {
    transform: rotate(5deg) scale(1.1);
}

.internship-card h4 {
    font-size: 1.1rem;
    font-weight: 700;
    margin-bottom: 0.4rem;
    transition: color 0.3s;
}

.internship-card:hover h4 {
    color: var(--cerulean);
}

.internship-company {
    color: var(--cerulean);
    font-size: 0.85rem;
    margin-bottom: 1rem;
    display: flex;
    align-items: center;
    gap: 0.4rem;
    font-weight: 500;
}

.internship-details {
    display: flex;
    flex-wrap: wrap;
    gap: 1rem;
    margin-bottom: 1rem;
    padding-bottom: 1rem;
    border-bottom: 1px solid rgba(100, 116, 139, 0.2);
    font-size: 0.8rem;
    color: var(--gray);
}

.detail-item {
    display: flex;
    align-items: center;
    gap: 0.5rem;
}

.detail-item i {
    color: var(--cerulean);
    width: 14px;
    font-size: 0.75rem;
}

.internship-footer {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-top: auto;
}

.internship-stipend {
    font-weight: 700;
    font-size: 1rem;
    transition: all 0.3s;
    color: var(--tropical-teal-dark);
}

.internship-card:hover .internship-stipend {
    color: var(--cerulean);
}

.internship-stipend.free {
    color: var(--gray);
}

.btn-outline {
    padding: 0.4rem 1rem;
    border: 1px solid rgba(100, 116, 139, 0.3);
    border-radius: 40px;
    background: transparent;
    color: var(--gray);
    font-size: 0.75rem;
    font-weight: 600;
    cursor: pointer;
    transition: all 0.3s;
    text-decoration: none;
    display: inline-flex;
    align-items: center;
    gap: 0.3rem;
}

.btn-outline:hover {
    border-color: var(--cerulean);
    color: var(--cerulean);
    background: rgba(36, 123, 160, 0.1);
    transform: translateY(-2px);
}

/* Pagination Styles */
.pagination-container {
    display: flex;
    justify-content: center;
    align-items: center;
    gap: 0.5rem;
    margin-top: 2.5rem;
    padding-top: 1rem;
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

.page-info {
    font-weight: 600;
    color: var(--cerulean);
    padding: 0 1rem;
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

.no-results h3 {
    color: var(--dark);
    margin-bottom: 0.5rem;
}

.no-results p {
    color: var(--gray);
}

.modern-footer {
    background: var(--footer-bg);
    color: rgba(255, 255, 255, 0.85);
    padding: 1.2rem 0;
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
    gap: 0.8rem;
}

.footer-logo i {
    font-size: 1.3rem;
    color: var(--cream);
    animation: pulse 2s infinite;
}

.footer-logo span {
    font-size: 1rem;
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
    transition: all 0.3s;
    font-size: 0.85rem;
    font-weight: 500;
    position: relative;
}

.footer-links a::after {
    content: '';
    position: absolute;
    bottom: -3px;
    left: 0;
    width: 0;
    height: 2px;
    background: var(--cream);
    transition: width 0.3s;
}

.footer-links a:hover {
    color: var(--cream);
    transform: translateY(-2px);
}

.footer-links a:hover::after {
    width: 100%;
}

.footer-copyright {
    font-size: 0.8rem;
    color: rgba(255, 255, 255, 0.8);
}

.footer-copyright i {
    color: var(--hot-fuchsia);
    animation: pulse 1.5s infinite;
}

.footer-copyright strong {
    color: var(--cream);
}

@media (max-width: 1200px) {
    .internship-grid {
        grid-template-columns: repeat(2, 1fr);
    }
    
    .filter-options {
        flex-direction: column;
        align-items: flex-start;
    }
    
    .filter-reset {
        margin-left: 0;
    }
}

@media (max-width: 768px) {
    .header-container {
        flex-direction: column;
    }
    
    .header-nav {
        width: 100%;
        justify-content: center;
        flex-wrap: wrap;
    }
    
    .header-actions {
        width: 100%;
        justify-content: center;
        flex-wrap: wrap;
    }
    
    .header-search {
        width: 100%;
    }
    
    .welcome-content {
        flex-direction: column;
        text-align: center;
    }
    
    .internship-grid {
        grid-template-columns: 1fr;
    }
    
    .filter-group {
        flex-direction: column;
        align-items: flex-start;
        width: 100%;
    }
    
    .filter-select {
        width: 100%;
    }
    
    .footer-container {
        flex-direction: column;
        text-align: center;
    }
    
    .footer-links {
        justify-content: center;
        flex-wrap: wrap;
    }
    
    .pagination-container {
        flex-wrap: wrap;
    }
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
                <p>Internship Platform</p>
            </div>
        </div>
        
        <div class="header-nav">
            <a href="studentDashboard" class="nav-link-header">
                <i class="fas fa-th-large"></i>
                <span>Dashboard</span>
            </a>
            <a href="myinternships" class="nav-link-header">
                <i class="fas fa-briefcase"></i>
                <span>My Internships</span>
            </a>
            <a href="/myApplications" class="nav-link-header">
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
                <input type="text" id="searchInput" placeholder="Search internships...">
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
                        <i class="fas fa-certificate"></i> My Certificates
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
    
    <!-- Welcome Card -->
    <div class="welcome-card" data-aos="fade-down" data-aos-duration="800">
        <div class="welcome-content">
            <div class="welcome-text">
                <h2>Explore Active Internships</h2>
                <p>Discover open and live opportunities that match your skills</p>
            </div>
            <div class="welcome-stats">
                <div class="welcome-stat">
                    <span class="value">${activeInternshipsCount}</span>
                    <span class="label">Active Opportunities</span>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Filter Section -->
    <div class="filter-section" data-aos="fade-up" data-aos-duration="800" data-aos-delay="100">
        <div class="filter-title">
            <i class="fas fa-filter"></i>
            <span>Filter Internships</span>
        </div>
        <div class="filter-options">
            <div class="filter-group">
                <span class="filter-label"><i class="fas fa-map-marker-alt"></i> Location:</span>
                <select id="locationFilter" class="filter-select">
                    <option value="all">All Locations</option>
                    <c:forEach var="location" items="${uniqueLocations}">
                        <option value="${location}">${location}</option>
                    </c:forEach>
                </select>
            </div>
            
            <div class="filter-group">
                <span class="filter-label"><i class="fas fa-tag"></i> Type:</span>
                <select id="typeFilter" class="filter-select">
                    <option value="all">All Types</option>
                    <option value="Remote">Remote</option>
                    <option value="Onsite">Onsite</option>
                    <option value="Hybrid">Hybrid</option>
                </select>
            </div>
            
            <div class="filter-group">
                <span class="filter-label"><i class="fas fa-rupee-sign"></i> Stipend:</span>
                <div class="filter-badge">
                    <span class="badge active" data-stipend="all"><i class="fas fa-list"></i> All</span>
                    <span class="badge" data-stipend="paid"><i class="fas fa-rupee-sign"></i> Paid</span>
                    <span class="badge" data-stipend="free"><i class="fas fa-gift"></i> Free</span>
                </div>
            </div>
            
            <button class="filter-reset" id="resetBtn">
                <i class="fas fa-undo-alt"></i> Reset Filters
            </button>
        </div>
    </div>
    
    <!-- Results Count -->
    <div class="results-count" data-aos="fade-right" data-aos-duration="600" data-aos-delay="200">
        Showing <span id="visibleCount">0</span> of <span id="totalCount">${fn:length(activeInternships)}</span> active internships
    </div>
    
    <!-- Internships Grid -->
    <div class="internship-grid" id="internshipsGrid">
        <c:choose>
            <c:when test="${empty activeInternships}">
                <div class="no-results" data-aos="zoom-in" data-aos-duration="800">
                    <i class="fas fa-search"></i>
                    <h3>No Active Internships Found</h3>
                    <p>Try adjusting your filters or check back later for new opportunities.</p>
                </div>
            </c:when>
            <c:otherwise>
                <c:forEach var="internship" items="${activeInternships}" varStatus="status">
                    <div class="internship-card" 
                         data-location="${internship.location}" 
                         data-type="${internship.internshipType}"
                         data-stipend="${internship.stipend}"
                         data-status="${internship.status}"
                         data-title="${fn:toLowerCase(internship.title)}"
                         data-company="${fn:toLowerCase(internship.employer.companyName)}"
                         data-aos="flip-up"
                         data-aos-duration="600"
                         data-aos-delay="${status.index * 50}"
                         onclick="window.location.href='viewInternshipDetails?internshipId=${internship.internshipId}'">
                        
                        <span class="internship-status status-${internship.status}">
                            <c:choose>
                                <c:when test="${internship.status eq 'OPEN'}">
                                    <i class="fas fa-door-open"></i> OPEN FOR APPLICATIONS
                                </c:when>
                                <c:when test="${internship.status eq 'LIVE'}">
                                    <i class="fas fa-bolt"></i> LIVE
                                </c:when>
                                <c:when test="${internship.status eq 'UPCOMING'}">
                                    <i class="far fa-clock"></i> UPCOMING
                                </c:when>
                            </c:choose>
                        </span>
                        
                        <div class="internship-company-logo">
                            <span>${fn:substring(internship.employer.companyName, 0, 2)}</span>
                        </div>
                        
                        <h4>${internship.title}</h4>
                        
                        <div class="internship-company">
                            <i class="fas fa-building"></i> ${internship.employer.companyName}
                        </div>
                        
                        <div class="internship-details">
                            <div class="detail-item">
                                <i class="fas fa-map-marker-alt"></i> ${internship.location}
                            </div>
                            <div class="detail-item">
                                <i class="fas fa-clock"></i> ${internship.internshipType}
                            </div>
                            <div class="detail-item">
                                <i class="fas fa-calendar-alt"></i> ${internship.durationMonths} months
                            </div>
                        </div>
                        
                        <div class="internship-footer">
                            <div class="internship-stipend ${internship.stipend == 0 ? 'free' : ''}">
                                <c:choose>
                                    <c:when test="${internship.stipend > 0}">
                                        <i class="fas fa-rupee-sign"></i> ${internship.stipend}/month
                                    </c:when>
                                    <c:otherwise>
                                        <i class="fas fa-gift"></i> Free
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            
                            <div onclick="event.stopPropagation();">
                                <c:set var="isApplied" value="false" />
                                <c:forEach var="appliedId" items="${appliedInternshipIds}">
                                    <c:if test="${appliedId == internship.internshipId}">
                                        <c:set var="isApplied" value="true" />
                                    </c:if>
                                </c:forEach>
                                
                                <c:choose>
                                    <c:when test="${isApplied}">
                                        <c:set var="appStatus" value="${applicationStatusMap[internship.internshipId]}" />
                                        <c:choose>
                                            <c:when test="${appStatus == 'ACCEPTED'}">
                                                <span class="btn-outline" style="background: #10b981; color: white; border-color: #10b981; cursor: default;">
                                                    <i class="fas fa-check-circle"></i> Accepted
                                                </span>
                                            </c:when>
                                            <c:when test="${appStatus == 'REJECTED'}">
                                                <span class="btn-outline" style="background: #ef4444; color: white; border-color: #ef4444; cursor: default;">
                                                    <i class="fas fa-times-circle"></i> Rejected
                                                </span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="btn-outline" style="background: #f59e0b; color: white; border-color: #f59e0b; cursor: default;">
                                                    <i class="fas fa-hourglass-half"></i> Applied
                                                </span>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="viewInternshipDetails?internshipId=${internship.internshipId}" class="btn-outline" onclick="event.stopPropagation();">
                                            <i class="fas fa-eye"></i> View Details
                                        </a>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </c:otherwise>
        </c:choose>
    </div>
    
    <!-- Pagination -->
    <div class="pagination-container" id="paginationContainer" style="display: none;">
        <button class="page-btn" id="prevBtn" onclick="prevPage()">← Prev</button>
        <div id="paginationNumbers" style="display: flex; gap: 0.5rem;"></div>
        <button class="page-btn" id="nextBtn" onclick="nextPage()">Next →</button>
    </div>
</main>

<!-- Modern Footer -->
<footer class="modern-footer">
    <div class="footer-container">
        <div class="footer-logo">
            <i class="bi bi-briefcase-fill"></i>
            <span>SmartIntern</span>
        </div>
        <div class="footer-links">
            <a href="#">About Us</a>
            <a href="#">Contact</a>
            <a href="#">Privacy Policy</a>
            <a href="#">Terms of Service</a>
            <a href="#">Help Center</a>
        </div>
        <div class="footer-copyright">
            © 2026 SmartIntern · Made with <i class="fas fa-heart"></i> by <strong>Darshan</strong>
        </div>
    </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<script>
AOS.init({
    duration: 800,
    once: true,
    offset: 50
});

// Pagination variables
let currentPage = 1;
let rowsPerPage = 6;
let currentFilteredCards = [];
let allCards = [];

// Filter variables
let currentLocationFilter = 'all';
let currentTypeFilter = 'all';
let currentStipendFilter = 'all';
let currentSearchTerm = '';

// Initialize
document.addEventListener('DOMContentLoaded', function() {
    allCards = Array.from(document.querySelectorAll('.internship-card'));
    updateFiltersAndPagination();
    
    // Add click handler for stat cards if needed
    document.querySelectorAll('.welcome-stat').forEach(stat => {
        stat.addEventListener('click', function() {
            // Optional: filter by status
        });
    });
});

// Pagination functions
function updateFiltersAndPagination() {
    // Apply all filters
    currentFilteredCards = allCards.filter(card => {
        const location = card.getAttribute('data-location') || '';
        const type = card.getAttribute('data-type') || '';
        const stipend = parseInt(card.getAttribute('data-stipend')) || 0;
        const title = card.getAttribute('data-title') || '';
        const company = card.getAttribute('data-company') || '';
        
        let locationMatch = currentLocationFilter === 'all' || location === currentLocationFilter;
        let typeMatch = currentTypeFilter === 'all' || type === currentTypeFilter;
        
        let stipendMatch = true;
        if (currentStipendFilter === 'paid') {
            stipendMatch = stipend > 0;
        } else if (currentStipendFilter === 'free') {
            stipendMatch = stipend === 0;
        }
        
        let searchMatch = true;
        if (currentSearchTerm) {
            searchMatch = title.includes(currentSearchTerm) || company.includes(currentSearchTerm) || location.toLowerCase().includes(currentSearchTerm);
        }
        
        return locationMatch && typeMatch && stipendMatch && searchMatch;
    });
    
    // Update results count
    const visibleCount = currentFilteredCards.length;
    const totalCount = allCards.length;
    document.getElementById('visibleCount').textContent = visibleCount;
    document.getElementById('totalCount').textContent = totalCount;
    
    // Setup pagination
    setupPagination();
}

function setupPagination() {
    const totalPages = Math.ceil(currentFilteredCards.length / rowsPerPage);
    const paginationNumbers = document.getElementById('paginationNumbers');
    
    if (totalPages <= 1) {
        document.getElementById('paginationContainer').style.display = 'none';
        showPage(1);
        return;
    }
    
    document.getElementById('paginationContainer').style.display = 'flex';
    paginationNumbers.innerHTML = '';
    
    // Calculate visible page range
    let startPage = Math.max(1, currentPage - 2);
    let endPage = Math.min(totalPages, startPage + 4);
    
    if (endPage - startPage < 4) {
        startPage = Math.max(1, endPage - 4);
    }
    
    // First page button
    if (startPage > 1) {
        const firstBtn = document.createElement('button');
        firstBtn.className = 'page-btn';
        firstBtn.textContent = '1';
        firstBtn.onclick = () => goToPage(1);
        paginationNumbers.appendChild(firstBtn);
        
        if (startPage > 2) {
            const dots = document.createElement('span');
            dots.textContent = '...';
            dots.style.padding = '0 0.5rem';
            paginationNumbers.appendChild(dots);
        }
    }
    
    // Page number buttons
    for (let i = startPage; i <= endPage; i++) {
        const pageBtn = document.createElement('button');
        pageBtn.className = 'page-btn' + (i === currentPage ? ' active' : '');
        pageBtn.textContent = i;
        pageBtn.onclick = () => goToPage(i);
        paginationNumbers.appendChild(pageBtn);
    }
    
    // Last page button
    if (endPage < totalPages) {
        if (endPage < totalPages - 1) {
            const dots = document.createElement('span');
            dots.textContent = '...';
            dots.style.padding = '0 0.5rem';
            paginationNumbers.appendChild(dots);
        }
        
        const lastBtn = document.createElement('button');
        lastBtn.className = 'page-btn';
        lastBtn.textContent = totalPages;
        lastBtn.onclick = () => goToPage(totalPages);
        paginationNumbers.appendChild(lastBtn);
    }
    
    // Update prev/next buttons
    document.getElementById('prevBtn').disabled = currentPage === 1;
    document.getElementById('nextBtn').disabled = currentPage === totalPages;
    
    // Show current page
    showPage(currentPage);
}

function goToPage(page) {
    currentPage = page;
    setupPagination();
}

function showPage(page) {
    // Hide all cards first
    allCards.forEach(card => card.style.display = 'none');
    
    // Calculate visible cards for current page
    const start = (page - 1) * rowsPerPage;
    const end = start + rowsPerPage;
    const visibleCards = currentFilteredCards.slice(start, end);
    
    // Show only cards for current page
    visibleCards.forEach(card => card.style.display = 'flex');
    
    // Hide no results message if needed
    const noResultsDiv = document.querySelector('.no-results-message');
    if (visibleCards.length === 0 && currentFilteredCards.length === 0) {
        if (!noResultsDiv && document.querySelector('.no-results') === null) {
            const grid = document.getElementById('internshipsGrid');
            const newNoResults = document.createElement('div');
            newNoResults.className = 'no-results no-results-message';
            newNoResults.innerHTML = `
                <i class="fas fa-search"></i>
                <h3>No Active Internships Found</h3>
                <p>Try adjusting your filters to see more opportunities.</p>
            `;
            grid.appendChild(newNoResults);
        }
    } else if (noResultsDiv) {
        noResultsDiv.remove();
    }
}

function prevPage() {
    if (currentPage > 1) {
        currentPage--;
        setupPagination();
    }
}

function nextPage() {
    const totalPages = Math.ceil(currentFilteredCards.length / rowsPerPage);
    if (currentPage < totalPages) {
        currentPage++;
        setupPagination();
    }
}

// Filter functions
function setStipendFilter(filter) {
    currentStipendFilter = filter;
    updateStipendBadgeUI();
    currentPage = 1;
    updateFiltersAndPagination();
}

function updateStipendBadgeUI() {
    const badges = document.querySelectorAll('.filter-badge .badge');
    badges.forEach(badge => {
        badge.classList.remove('active');
        if (badge.getAttribute('data-stipend') === currentStipendFilter) {
            badge.classList.add('active');
        }
    });
}

// Event listeners for filters
document.querySelectorAll('.filter-badge .badge').forEach(badge => {
    badge.addEventListener('click', function() {
        const stipendValue = this.getAttribute('data-stipend');
        setStipendFilter(stipendValue);
    });
});

const locationFilter = document.getElementById('locationFilter');
if (locationFilter) {
    locationFilter.addEventListener('change', function() {
        currentLocationFilter = this.value;
        currentPage = 1;
        updateFiltersAndPagination();
    });
}

const typeFilter = document.getElementById('typeFilter');
if (typeFilter) {
    typeFilter.addEventListener('change', function() {
        currentTypeFilter = this.value;
        currentPage = 1;
        updateFiltersAndPagination();
    });
}

const searchInput = document.getElementById('searchInput');
let searchTimeout;

if (searchInput) {
    searchInput.addEventListener('keyup', function() {
        clearTimeout(searchTimeout);
        searchTimeout = setTimeout(() => {
            currentSearchTerm = this.value.toLowerCase().trim();
            currentPage = 1;
            updateFiltersAndPagination();
        }, 300);
    });
}

const resetBtn = document.getElementById('resetBtn');
if (resetBtn) {
    resetBtn.addEventListener('click', function() {
        if (locationFilter) locationFilter.value = 'all';
        if (typeFilter) typeFilter.value = 'all';
        if (searchInput) searchInput.value = '';
        
        currentLocationFilter = 'all';
        currentTypeFilter = 'all';
        currentStipendFilter = 'all';
        currentSearchTerm = '';
        currentPage = 1;
        
        updateStipendBadgeUI();
        updateFiltersAndPagination();
    });
}

// Notification bell click
document.querySelector('.notification-badge')?.addEventListener('click', function() {
    alert('You have 3 new notifications');
});

// Add animation delays
document.querySelectorAll('.internship-card').forEach((card, index) => {
    card.style.animationDelay = (index * 0.05) + 's';
});
</script>
</body>
</html>