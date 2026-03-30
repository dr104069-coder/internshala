<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SmartIntern | Student Dashboard</title>

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
    /* Ocean Sunset Color Palette - No White Background */
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

/* Custom Scrollbar */
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

/* Logo Animations */
@keyframes logoMove {
    0%, 100% { 
        transform: translateY(0) rotate(0deg) scale(1);
        box-shadow: 0 0 20px rgba(67, 97, 238, 0.3);
    }
    25% { 
        transform: translateY(-8px) rotate(5deg) scale(1.05);
        box-shadow: 0 10px 30px rgba(67, 97, 238, 0.5);
    }
    50% { 
        transform: translateY(5px) rotate(-3deg) scale(0.98);
        box-shadow: 0 5px 25px rgba(67, 97, 238, 0.4);
    }
    75% { 
        transform: translateY(-3px) rotate(2deg) scale(1.02);
        box-shadow: 0 8px 28px rgba(67, 97, 238, 0.45);
    }
}

@keyframes iconMove {
    0%, 100% { 
        transform: scale(1) rotate(0deg);
        color: white;
    }
    33% { 
        transform: scale(1.15) rotate(10deg);
        color: var(--primary-light);
    }
    66% { 
        transform: scale(0.95) rotate(-10deg);
        color: var(--secondary);
    }
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

@keyframes glowPulse {
    0% { box-shadow: 0 0 5px rgba(67, 97, 238, 0.3); }
    50% { box-shadow: 0 0 20px rgba(67, 97, 238, 0.5), 0 0 30px rgba(6, 182, 212, 0.3); }
    100% { box-shadow: 0 0 5px rgba(67, 97, 238, 0.3); }
}

@keyframes pulse {
    0% { transform: scale(1); }
    50% { transform: scale(1.1); }
    100% { transform: scale(1); }
}

/* Modern Header - Normal Size */
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
    filter: drop-shadow(0 0 10px rgba(67, 97, 238, 0.5));
    animation: iconMove 3s var(--transition-bounce) infinite;
}

.logo-text h1 {
    color: white;
    font-size: 1.5rem;
    font-weight: 700;
    margin: 0;
}

.logo-text p {
    color: rgba(255, 255, 255, 0.85);
    margin: 0;
    font-size: 0.75rem;
    font-weight: 500;
}

/* Navigation Links in Header */
.header-nav {
    display: flex;
    align-items: center;
    gap: 0.75rem;
    background: rgba(255, 255, 255, 0.2);
    backdrop-filter: blur(10px);
    padding: 0.3rem 1rem;
    border-radius: 60px;
    border: 1px solid rgba(255, 255, 255, 0.25);
}

.nav-link-header {
    display: flex;
    align-items: center;
    gap: 0.6rem;
    padding: 0.5rem 1rem;
    border-radius: 40px;
    color: white;
    text-decoration: none;
    font-weight: 600;
    font-size: 0.9rem;
    transition: all 0.3s;
}

.nav-link-header i {
    font-size: 1rem;
}

.nav-link-header:hover {
    background: rgba(255, 255, 255, 0.25);
    color: var(--cream);
    transform: translateY(-2px);
}

.nav-badge-header {
    background: var(--hot-fuchsia);
    color: white;
    padding: 0.2rem 0.6rem;
    border-radius: 20px;
    font-size: 0.7rem;
    font-weight: 600;
    margin-left: 0.4rem;
}

/* Profile Dropdown Menu */
.profile-dropdown {
    position: relative;
    display: flex;
    align-items: center;
    gap: 0.8rem;
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
    width: 38px;
    height: 38px;
    background: linear-gradient(135deg, var(--success), var(--secondary));
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    color: white;
    font-weight: 600;
    font-size: 1rem;
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
    font-size: 0.9rem;
}

.profile-arrow {
    color: white;
    font-size: 0.75rem;
    transition: transform 0.3s;
}

.profile-dropdown:hover .profile-arrow {
    transform: rotate(180deg);
}

/* Dropdown Menu */
.dropdown-menu-custom {
    position: absolute;
    top: calc(100% + 8px);
    right: 0;
    margin-top: 0;
    background: white;
    border-radius: 16px;
    box-shadow: 0 20px 40px rgba(0, 0, 0, 0.2);
    min-width: 220px;
    display: none;
    z-index: 1000;
    overflow: hidden;
    animation: dropdownFade 0.3s ease-out;
    border: 1px solid rgba(0, 0, 0, 0.05);
}

@keyframes dropdownFade {
    from {
        opacity: 0;
        transform: translateY(-10px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
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
    gap: 1.5rem;
}

.header-search {
    position: relative;
    width: 300px;
}

.header-search input {
    width: 100%;
    padding: 0.7rem 1.2rem;
    padding-left: 2.5rem;
    border: none;
    border-radius: 50px;
    background: rgba(255, 255, 255, 0.2);
    color: white;
    font-size: 0.9rem;
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
    left: 1rem;
    top: 50%;
    transform: translateY(-50%);
    color: white;
    font-size: 1rem;
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
    font-size: 1.3rem;
    color: white;
    opacity: 0.9;
}

.notification-count {
    position: absolute;
    top: -8px;
    right: -8px;
    background: var(--danger);
    color: white;
    font-size: 0.7rem;
    font-weight: 600;
    width: 18px;
    height: 18px;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    border: 2px solid white;
    animation: pulse 2s infinite;
}

/* Main Content - No Sidebar */
.main-content {
    max-width: 1400px;
    margin: 2rem auto;
    padding: 0 2rem;
    flex: 1;
    width: 100%;
    animation: mainFade 1s ease-out;
}

/* Filter Section - Enhanced (with Type filter) */
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
}

/* Results Count */
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

/* Welcome Card */
.welcome-card {
    background: linear-gradient(135deg, #5f9ea0 0%, #4682b4 100%);
    border-radius: 30px;
    padding: 2rem;
    margin-bottom: 2rem;
    color: white;
    position: relative;
    overflow: hidden;
    box-shadow: 0 25px 50px -12px rgba(70, 130, 180, 0.4);
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

/* Section Styling - No White Background */
.live-section, .upcoming-section {
    background: rgba(210, 235, 255, 0.7);
    backdrop-filter: blur(5px);
    padding: 1.8rem;
    border-radius: 28px;
    margin-bottom: 2rem;
    border: 1px solid rgba(112, 193, 179, 0.4);
    box-shadow: 0 6px 16px rgba(0, 0, 0, 0.05);
}

.section-title {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 1.5rem;
}

.section-title h3 {
    font-size: 1.4rem;
    font-weight: 700;
    color: var(--cerulean);
    margin: 0;
}

/* Internship Grid */
.internship-grid {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 1.5rem;
}

/* Internship Card - No White Background */
.internship-card-modern {
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

.internship-card-modern:nth-child(1) { animation-delay: 0.05s; }
.internship-card-modern:nth-child(2) { animation-delay: 0.1s; }
.internship-card-modern:nth-child(3) { animation-delay: 0.15s; }
.internship-card-modern:nth-child(4) { animation-delay: 0.2s; }
.internship-card-modern:nth-child(5) { animation-delay: 0.25s; }
.internship-card-modern:nth-child(6) { animation-delay: 0.3s; }

.internship-card-modern:hover {
    transform: translateY(-8px);
    border-color: var(--cerulean);
    box-shadow: var(--hover-shadow);
    background: rgba(255, 255, 255, 0.95);
}

.internship-card-modern.hidden {
    display: none;
}

.internship-status {
    position: absolute;
    top: 1rem;
    right: 1rem;
    padding: 0.3rem 1rem;
    border-radius: 50px;
    font-size: 0.75rem;
    font-weight: 600;
    z-index: 1;
}

.status-live {
    background: linear-gradient(135deg, var(--tropical-teal), var(--cerulean));
    color: white;
}

.status-upcoming {
    background: linear-gradient(135deg, var(--hot-fuchsia), #ff4d7a);
    color: white;
}

.internship-company-logo {
    width: 55px;
    height: 55px;
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
}

.internship-card-modern:hover .internship-company-logo {
    transform: rotate(5deg) scale(1.1);
}

.internship-card-modern h4 {
    font-size: 1.1rem;
    font-weight: 700;
    margin-bottom: 0.3rem;
    transition: color 0.3s;
}

.internship-card-modern:hover h4 {
    color: var(--cerulean);
}

.internship-company {
    color: var(--cerulean);
    font-size: 0.85rem;
    margin-bottom: 0.8rem;
    display: flex;
    align-items: center;
    gap: 0.3rem;
}

.internship-details-modern {
    display: flex;
    flex-wrap: wrap;
    gap: 0.8rem;
    margin-bottom: 1rem;
    padding-bottom: 1rem;
    border-bottom: 1px solid rgba(100, 116, 139, 0.2);
    font-size: 0.8rem;
    color: var(--gray);
}

.detail-item {
    display: flex;
    align-items: center;
    gap: 0.4rem;
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

.internship-card-modern:hover .internship-stipend {
    color: var(--cerulean);
}

.internship-stipend.free {
    color: var(--gray);
}

.btn-outline-modern {
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
    display: inline-block;
}

.btn-outline-modern:hover {
    border-color: var(--cerulean);
    color: var(--cerulean);
    background: rgba(36, 123, 160, 0.1);
}

.btn-primary-modern {
    padding: 0.4rem 1.2rem;
    background: linear-gradient(135deg, var(--cerulean), var(--tropical-teal));
    border: none;
    border-radius: 40px;
    color: white;
    font-size: 0.75rem;
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

.view-all-btn {
    display: inline-flex;
    align-items: center;
    gap: 0.5rem;
    padding: 0.5rem 1.2rem;
    background: rgba(255, 255, 255, 0.8);
    border-radius: 50px;
    color: var(--cerulean);
    text-decoration: none;
    font-size: 0.85rem;
    font-weight: 600;
    transition: all 0.3s;
    border: 1px solid var(--tropical-teal);
}

.view-all-btn:hover {
    background: var(--cerulean);
    color: white;
    transform: translateX(5px);
}

.me-2 {
    margin-right: 0.5rem;
}

/* No Results */
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

/* Modern Footer - Normal Size */
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

/* Responsive */
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
                <p>AI-Powered Internship Platform</p>
            </div>
        </div>
        
        <div class="header-nav">
            <a href="myinternships" class="nav-link-header">
                <i class="fas fa-briefcase"></i>
                <span>My Internships</span>
                <span class="nav-badge-header">${liveInternshipsCount + upcomingInternshipsCount}</span>
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
                <input type="text" id="globalSearch" placeholder="Search internships...">
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
                    <a href="applications" class="dropdown-item-custom">
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
    <!-- Welcome Card -->
    <div class="welcome-card">
        <div class="welcome-content">
            <div class="welcome-text">
                <h2>Welcome back, ${user.firstName} ${user.lastName}! 👋</h2>
                <p>Your AI-powered internship assistant is here to help you find the perfect opportunity.</p>
            </div>
            <div class="welcome-stats">
                <div class="welcome-stat">
                    <span class="value">${profileCompletion}%</span>
                    <span class="label">Profile Complete</span>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Filter Section - Enhanced with Type Filter -->
    <div class="filter-section">
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
    <div class="results-count">
        <span id="visibleCount">${fn:length(liveInternships) + fn:length(upcomingInternships)}</span> active internships found
    </div>
    
    <!-- Live Internships Section -->
    <div class="live-section">
        <div class="section-title">
            <h3><i class="fas fa-bolt me-2" style="color: var(--success);"></i> Live Internships</h3>
            <c:if test="${fn:length(liveInternships) > 6}">
                <a href="liveinternship.jsp" class="view-all-btn">
                    View All <i class="fas fa-arrow-right"></i>
                </a>
            </c:if>
        </div>
        
        <div class="internship-grid" id="liveGrid">
            <c:forEach var="internship" items="${liveInternships}" varStatus="status" end="5">
            <div class="internship-card-modern" 
                 data-location="${fn:toLowerCase(internship.location)}" 
                 data-type="${fn:toLowerCase(internship.internshipType)}"
                 data-stipend="${internship.stipend}"
                 data-title="${fn:toLowerCase(internship.title)}"
                 data-company="${fn:toLowerCase(internship.employer.companyName)}"
                 onclick="window.location.href='viewInternshipDetails?internshipId=${internship.internshipId}'">
                <span class="internship-status status-live">
                    <i class="fas fa-circle" style="font-size: 0.5rem;"></i> LIVE
                </span>
                
                <div class="internship-company-logo">
                    <span>${fn:substring(internship.employer.companyName, 0, 2)}</span>
                </div>
                
                <h4>${internship.title}</h4>
                <div class="internship-company">
                    <i class="fas fa-building"></i> ${internship.employer.companyName}
                </div>
                
                <div class="internship-details-modern">
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
                                ₹${internship.stipend}/month
                            </c:when>
                            <c:otherwise>
                                Free
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <div onclick="event.stopPropagation();">
                        <a href="viewInternshipDetails?internshipId=${internship.internshipId}" class="btn-outline-modern me-2" onclick="event.stopPropagation();">
                            <i class="fas fa-eye"></i>
                        </a>
                        <a href="applyInternship?internshipId=${internship.internshipId}" class="btn-primary-modern" onclick="event.stopPropagation();">
                            Apply
                        </a>
                    </div>
                </div>
            </div>
            </c:forEach>
        </div>
    </div>
    
    <!-- Upcoming Internships Section -->
    <div class="upcoming-section">
        <div class="section-title">
            <h3><i class="fas fa-calendar-alt me-2" style="color: var(--warning);"></i> Upcoming Internships</h3>
            <c:if test="${fn:length(upcomingInternships) > 6}">
                <a href="upcominginternship.jsp" class="view-all-btn">
                    View All <i class="fas fa-arrow-right"></i>
                </a>
            </c:if>
        </div>
        
        <div class="internship-grid" id="upcomingGrid">
            <c:forEach var="internship" items="${upcomingInternships}" varStatus="status" end="5">
            <div class="internship-card-modern" 
                 data-location="${fn:toLowerCase(internship.location)}" 
                 data-type="${fn:toLowerCase(internship.internshipType)}"
                 data-stipend="${internship.stipend}"
                 data-title="${fn:toLowerCase(internship.title)}"
                 data-company="${fn:toLowerCase(internship.employer.companyName)}"
                 onclick="window.location.href='viewInternshipDetails?internshipId=${internship.internshipId}'">
                <span class="internship-status status-upcoming">
                    <i class="far fa-clock"></i> Starts: ${internship.startDate}
                </span>
                
                <div class="internship-company-logo">
                    <span>${fn:substring(internship.employer.companyName, 0, 2)}</span>
                </div>
                
                <h4>${internship.title}</h4>
                <div class="internship-company">
                    <i class="fas fa-building"></i> ${internship.employer.companyName}
                </div>
                
                <div class="internship-details-modern">
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
                                ₹${internship.stipend}/month
                            </c:when>
                            <c:otherwise>
                                Free
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <div onclick="event.stopPropagation();">
                        <a href="viewInternshipDetails?internshipId=${internship.internshipId}" class="btn-outline-modern me-2" onclick="event.stopPropagation();">
                            <i class="fas fa-eye"></i>
                        </a>
                        <a href="#" class="btn-outline-modern" onclick="event.stopPropagation(); notifyMe(${internship.internshipId})">
                            <i class="far fa-bell"></i>
                        </a>
                    </div>
                </div>
            </div>
            </c:forEach>
        </div>
    </div>
</main>

<!-- Modern Footer - Normal Size -->
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

<!-- Scripts -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<script>
// Initialize AOS
AOS.init({
    duration: 800,
    once: true,
    offset: 50
});

function notifyMe(id) {
    alert('You will be notified when this internship opens!');
}

// Filter Functions (with Type filter)
let currentLocationFilter = 'all';
let currentTypeFilter = 'all';
let currentStipendFilter = 'all';

// Get all cards from both sections
const liveCards = document.querySelectorAll('#liveGrid .internship-card-modern');
const upcomingCards = document.querySelectorAll('#upcomingGrid .internship-card-modern');
const allCards = [...liveCards, ...upcomingCards];

// Stipend filter badges
function setStipendFilter(filter) {
    currentStipendFilter = filter;
    updateStipendBadgeUI();
    applyFilters();
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

// Add event listeners to stipend badges
document.querySelectorAll('.filter-badge .badge').forEach(badge => {
    badge.addEventListener('click', function() {
        const stipendValue = this.getAttribute('data-stipend');
        setStipendFilter(stipendValue);
    });
});

// Location filter
const locationFilter = document.getElementById('locationFilter');
if (locationFilter) {
    locationFilter.addEventListener('change', function() {
        currentLocationFilter = this.value;
        applyFilters();
    });
}

// Type filter
const typeFilter = document.getElementById('typeFilter');
if (typeFilter) {
    typeFilter.addEventListener('change', function() {
        currentTypeFilter = this.value;
        applyFilters();
    });
}

// Search functionality
const searchInput = document.getElementById('globalSearch');
let searchTimeout;

if (searchInput) {
    searchInput.addEventListener('keyup', function() {
        clearTimeout(searchTimeout);
        searchTimeout = setTimeout(() => {
            const searchTerm = this.value.toLowerCase().trim();
            applyFilters(searchTerm);
        }, 300);
    });
}

// Reset filters
const resetBtn = document.getElementById('resetBtn');
if (resetBtn) {
    resetBtn.addEventListener('click', function() {
        if (locationFilter) locationFilter.value = 'all';
        if (typeFilter) typeFilter.value = 'all';
        if (searchInput) searchInput.value = '';
        
        currentLocationFilter = 'all';
        currentTypeFilter = 'all';
        currentStipendFilter = 'all';
        
        updateStipendBadgeUI();
        applyFilters();
    });
}

function applyFilters(searchTerm = '') {
    let visibleCount = 0;
    
    allCards.forEach(card => {
        const location = card.dataset.location || '';
        const type = card.dataset.type || '';
        const stipend = parseInt(card.dataset.stipend) || 0;
        const title = card.dataset.title || '';
        const company = card.dataset.company || '';
        
        // Location match
        let locationMatch = currentLocationFilter === 'all' || location === currentLocationFilter;
        
        // Type match
        let typeMatch = currentTypeFilter === 'all' || type === currentTypeFilter;
        
        // Stipend match
        let stipendMatch = true;
        if (currentStipendFilter === 'paid') {
            stipendMatch = stipend > 0;
        } else if (currentStipendFilter === 'free') {
            stipendMatch = stipend === 0;
        }
        
        // Search match
        let searchMatch = true;
        if (searchTerm) {
            searchMatch = title.includes(searchTerm) || company.includes(searchTerm) || location.includes(searchTerm);
        }
        
        if (locationMatch && typeMatch && stipendMatch && searchMatch) {
            card.classList.remove('hidden');
            visibleCount++;
        } else {
            card.classList.add('hidden');
        }
    });
    
    // Update results count
    const visibleCountSpan = document.getElementById('visibleCount');
    if (visibleCountSpan) {
        visibleCountSpan.textContent = visibleCount;
    }
    
    // Show/hide no results message
    const liveSection = document.querySelector('.live-section');
    const upcomingSection = document.querySelector('.upcoming-section');
    let noResultsDiv = document.querySelector('.no-results-message');
    
    if (visibleCount === 0) {
        if (!noResultsDiv) {
            noResultsDiv = document.createElement('div');
            noResultsDiv.className = 'no-results no-results-message';
            noResultsDiv.innerHTML = `
                <i class="fas fa-search"></i>
                <h3>No Internships Found</h3>
                <p>Try adjusting your filters to see more opportunities.</p>
            `;
            if (liveSection && upcomingSection) {
                liveSection.parentNode.insertBefore(noResultsDiv, liveSection);
            }
        }
    } else if (noResultsDiv) {
        noResultsDiv.remove();
    }
}

// Notification bell click
document.querySelector('.notification-badge').addEventListener('click', function() {
    alert('You have 3 new notifications');
});

// Add staggered animation for cards
document.addEventListener('DOMContentLoaded', function() {
    allCards.forEach((card, index) => {
        card.style.animationDelay = (index * 0.05) + 's';
    });
    
    // Apply initial filters
    applyFilters();
});
</script>
</body>
</html>