<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SmartIntern | Internship Details</title>

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
    /* Ocean Sunset Color Palette - Same as Dashboard */
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

/* Modern Header - Same as Dashboard */
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
    gap: 1.2rem;
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
    width: 60px;
    height: 60px;
    background: linear-gradient(135deg, var(--primary), var(--secondary));
    border-radius: 18px;
    display: flex;
    align-items: center;
    justify-content: center;
    position: relative;
    animation: logoMove 4s var(--transition-bounce) infinite;
    box-shadow: 0 0 25px rgba(67, 97, 238, 0.4);
}

.logo-blue i {
    font-size: 30px;
    color: white;
    filter: drop-shadow(0 0 10px rgba(67, 97, 238, 0.5));
    animation: iconMove 3s var(--transition-bounce) infinite;
}

.logo-text h1 {
    color: white;
    font-size: 1.8rem;
    font-weight: 800;
    margin: 0;
    letter-spacing: -0.5px;
}

.logo-text p {
    color: rgba(255, 255, 255, 0.9);
    margin: 0;
    font-size: 0.85rem;
    font-weight: 500;
}

/* Navigation Links in Header */
.header-nav {
    display: flex;
    align-items: center;
    gap: 1rem;
    background: rgba(255, 255, 255, 0.2);
    backdrop-filter: blur(10px);
    padding: 0.6rem 1.5rem;
    border-radius: 60px;
    border: 1px solid rgba(255, 255, 255, 0.25);
}

.nav-link-header {
    display: flex;
    align-items: center;
    gap: 0.7rem;
    padding: 0.7rem 1.4rem;
    border-radius: 50px;
    color: white;
    text-decoration: none;
    font-weight: 600;
    font-size: 1rem;
    transition: all 0.3s;
}

.nav-link-header i {
    font-size: 1.1rem;
}

.nav-link-header:hover {
    background: rgba(255, 255, 255, 0.25);
    color: var(--cream);
    transform: translateY(-2px);
}

.nav-badge-header {
    background: var(--hot-fuchsia);
    color: white;
    padding: 0.25rem 0.7rem;
    border-radius: 30px;
    font-size: 0.75rem;
    font-weight: 700;
    margin-left: 0.5rem;
}

/* Profile Dropdown Menu */
.profile-dropdown {
    position: relative;
    display: flex;
    align-items: center;
    gap: 1rem;
    cursor: pointer;
    padding: 0.6rem 1.2rem;
    border-radius: 60px;
    background: rgba(255, 255, 255, 0.2);
    transition: all 0.3s;
}

.profile-dropdown:hover {
    background: rgba(255, 255, 255, 0.3);
    transform: translateY(-2px);
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
}

.profile-avatar {
    width: 44px;
    height: 44px;
    background: linear-gradient(135deg, var(--success), var(--secondary));
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    color: white;
    font-weight: 700;
    font-size: 1.1rem;
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
    font-weight: 700;
    font-size: 1rem;
    letter-spacing: 0.3px;
}

.profile-arrow {
    color: white;
    font-size: 0.8rem;
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
    border-radius: 20px;
    box-shadow: 0 20px 40px rgba(0, 0, 0, 0.2);
    min-width: 240px;
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
    gap: 1rem;
    padding: 0.9rem 1.4rem;
    color: var(--dark);
    text-decoration: none;
    transition: all 0.3s;
    font-size: 0.9rem;
    font-weight: 500;
    border-left: 3px solid transparent;
}

.dropdown-item-custom i {
    width: 22px;
    font-size: 1rem;
    color: var(--cerulean);
}

.dropdown-item-custom:hover {
    background: var(--light-skyblue);
    color: var(--cerulean);
    border-left-color: var(--cerulean);
    padding-left: 1.6rem;
}

.dropdown-divider {
    height: 1px;
    background: #e2e8f0;
    margin: 0.5rem 0;
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
    gap: 1.8rem;
}

.notification-badge {
    position: relative;
    cursor: pointer;
    transition: all 0.3s;
    padding: 0.5rem;
}

.notification-badge:hover {
    transform: scale(1.1);
}

.notification-badge i {
    font-size: 1.5rem;
    color: white;
    opacity: 0.95;
}

.notification-count {
    position: absolute;
    top: -5px;
    right: -5px;
    background: var(--danger);
    color: white;
    font-size: 0.7rem;
    font-weight: 700;
    width: 20px;
    height: 20px;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    border: 2px solid white;
    animation: pulse 2s infinite;
}

/* Main Container */
.main-container {
    max-width: 1600px;
    margin: 2rem auto;
    padding: 0 2rem;
    flex: 1;
    width: 100%;
    animation: mainFade 1s ease-out;
}

/* Two Column Layout */
.two-column-layout {
    display: flex;
    gap: 2rem;
}

/* Left Column */
.left-column {
    flex: 2;
}

.left-content {
    display: flex;
    flex-direction: column;
    gap: 1.5rem;
}

/* Right Column */
.right-column {
    width: 450px;
    position: sticky;
    top: 100px;
    height: fit-content;
}

.right-content {
    display: flex;
    flex-direction: column;
    gap: 1.5rem;
}

/* Cards - Same style as Dashboard */
.info-card, .poster-card {
    background: rgba(255, 255, 255, 0.85);
    backdrop-filter: blur(8px);
    border-radius: 24px;
    padding: 1.8rem;
    box-shadow: 0 10px 30px -5px rgba(0, 0, 0, 0.08);
    border: 1px solid var(--tropical-teal);
    transition: all 0.4s cubic-bezier(0.165, 0.84, 0.44, 1);
}

.info-card:hover, .poster-card:hover {
    transform: translateY(-5px);
    border-color: var(--cerulean);
    box-shadow: var(--hover-shadow);
    background: rgba(255, 255, 255, 0.95);
}

.poster-card {
    text-align: center;
}

.poster-image {
    max-width: 100%;
    max-height: 350px;
    width: auto;
    height: auto;
    object-fit: contain;
    border-radius: 16px;
    margin: 0 auto;
}

/* Company Header */
.internship-header {
    margin-bottom: 1.5rem;
}

.company-info {
    display: flex;
    align-items: center;
    gap: 1.5rem;
    margin-bottom: 1.5rem;
}

.company-logo {
    width: 80px;
    height: 80px;
    background: linear-gradient(135deg, var(--cerulean), var(--tropical-teal));
    border-radius: 20px;
    display: flex;
    align-items: center;
    justify-content: center;
    color: white;
    font-size: 2rem;
    font-weight: 700;
    transition: all 0.3s;
}

.company-logo:hover {
    transform: rotate(5deg) scale(1.05);
    box-shadow: 0 10px 20px rgba(36, 123, 160, 0.3);
}

.company-details {
    flex: 1;
}

.internship-title {
    font-size: 1.8rem;
    font-weight: 800;
    color: var(--dark);
    margin: 0 0 0.5rem 0;
}

.company-name {
    color: var(--cerulean);
    font-size: 1rem;
    display: flex;
    align-items: center;
    gap: 0.5rem;
    font-weight: 600;
}

/* Status Badge */
.status-badge {
    display: inline-block;
    padding: 0.6rem 1.5rem;
    border-radius: 50px;
    font-weight: 700;
    font-size: 0.9rem;
    margin-bottom: 1.5rem;
}

.status-open {
    background: #d1fae5;
    color: var(--success);
    border: 1px solid #86efac;
}

.status-upcoming {
    background: #fff7ed;
    color: var(--warning);
    border: 1px solid #fed7aa;
}

.status-closed {
    background: #fee2e2;
    color: var(--danger);
    border: 1px solid #fecaca;
}

/* Details Section */
.details-section {
    background: rgba(210, 235, 255, 0.5);
    border-radius: 20px;
    padding: 1.5rem;
    margin-top: 0.5rem;
}

.details-grid {
    display: grid;
    grid-template-columns: repeat(5, 1fr);
    gap: 1rem;
}

.detail-item {
    background: white;
    border-radius: 16px;
    padding: 1rem 0.5rem;
    text-align: center;
    border: 1px solid var(--tropical-teal);
    transition: all 0.3s;
}

.detail-item:hover {
    transform: translateY(-4px);
    border-color: var(--cerulean);
    box-shadow: 0 8px 15px -6px rgba(36, 123, 160, 0.15);
}

.detail-icon {
    width: 40px;
    height: 40px;
    background: var(--light-skyblue);
    border-radius: 12px;
    display: flex;
    align-items: center;
    justify-content: center;
    margin: 0 auto 0.75rem;
    color: var(--cerulean);
    font-size: 1.1rem;
    transition: all 0.3s;
}

.detail-item:hover .detail-icon {
    background: var(--cerulean);
    color: white;
}

.detail-label {
    font-size: 0.7rem;
    font-weight: 700;
    color: var(--gray);
    text-transform: uppercase;
    margin-bottom: 0.3rem;
}

.detail-value {
    font-size: 1rem;
    font-weight: 700;
    color: var(--dark);
}

/* Dates Grid */
.dates-grid {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 1rem;
    margin-top: 1rem;
}

.date-item {
    background: rgba(210, 235, 255, 0.5);
    border-radius: 16px;
    padding: 1rem;
    text-align: center;
    border: 1px solid var(--tropical-teal);
    transition: all 0.3s;
}

.date-item:hover {
    background: white;
    transform: translateY(-4px);
    border-color: var(--cerulean);
}

.date-icon {
    width: 42px;
    height: 42px;
    background: white;
    border-radius: 12px;
    display: flex;
    align-items: center;
    justify-content: center;
    margin: 0 auto 0.75rem;
    color: var(--cerulean);
    font-size: 1.2rem;
    transition: all 0.3s;
}

.date-item:hover .date-icon {
    background: var(--cerulean);
    color: white;
}

.date-label {
    font-size: 0.75rem;
    font-weight: 600;
    color: var(--gray);
    text-transform: uppercase;
    margin-bottom: 0.4rem;
}

.date-value {
    font-size: 0.95rem;
    font-weight: 700;
    color: var(--dark);
}

/* Section Title */
.section-title {
    font-size: 1.3rem;
    font-weight: 700;
    color: var(--cerulean);
    margin: 0 0 1rem 0;
    display: flex;
    align-items: center;
    gap: 0.5rem;
}

.section-title i {
    color: var(--cerulean);
    background: var(--light-skyblue);
    padding: 8px;
    border-radius: 12px;
    font-size: 1rem;
}

/* Description */
.description-text {
    color: var(--dark);
    line-height: 1.7;
    background: rgba(210, 235, 255, 0.5);
    padding: 1.5rem;
    border-radius: 16px;
    border: 1px solid var(--tropical-teal);
    font-size: 1rem;
    transition: all 0.3s;
}

.description-text:hover {
    background: white;
    border-color: var(--cerulean);
}

/* Skills Tags */
.skills-tags {
    display: flex;
    flex-wrap: wrap;
    gap: 0.75rem;
}

.skill-tag {
    background: rgba(210, 235, 255, 0.5);
    color: var(--cerulean-dark);
    padding: 0.6rem 1.3rem;
    border-radius: 40px;
    font-size: 0.9rem;
    font-weight: 600;
    border: 1px solid var(--tropical-teal);
    display: inline-flex;
    align-items: center;
    gap: 0.5rem;
    transition: all 0.3s;
}

.skill-tag:hover {
    background: linear-gradient(135deg, var(--cerulean), var(--tropical-teal));
    color: white;
    transform: translateY(-3px);
    border-color: transparent;
    box-shadow: 0 8px 15px -4px rgba(36, 123, 160, 0.3);
}

.skill-tag i {
    color: var(--cerulean);
}

.skill-tag:hover i {
    color: white;
}

/* Employer Info */
.employer-info {
    background: rgba(210, 235, 255, 0.5);
    padding: 1.5rem;
    border-radius: 16px;
    border-left: 4px solid var(--cerulean);
    border: 1px solid var(--tropical-teal);
    transition: all 0.3s;
}

.employer-info:hover {
    background: white;
    border-color: var(--cerulean);
}

.employer-name {
    font-weight: 800;
    color: var(--dark);
    margin-bottom: 0.5rem;
    font-size: 1.1rem;
}

.employer-detail {
    color: var(--gray);
    font-size: 0.9rem;
    display: flex;
    align-items: center;
    gap: 0.5rem;
}

/* Buttons */
.btn-apply, .btn-applied, .btn-back {
    display: block;
    width: 100%;
    text-align: center;
    padding: 1rem;
    border-radius: 16px;
    font-weight: 700;
    font-size: 1rem;
    text-decoration: none;
    border: none;
    cursor: pointer;
    transition: all 0.3s;
    margin-bottom: 1rem;
}

.btn-apply {
    background: linear-gradient(135deg, var(--cerulean), var(--tropical-teal));
    color: white;
    box-shadow: 0 4px 10px rgba(36, 123, 160, 0.3);
}

.btn-apply:hover {
    transform: translateY(-3px);
    box-shadow: 0 10px 25px rgba(36, 123, 160, 0.4);
}

.btn-apply.disabled {
    background: var(--gray);
    box-shadow: none;
    cursor: not-allowed;
    opacity: 0.6;
    transform: none;
}

.btn-applied {
    background: var(--success);
    color: white;
    box-shadow: 0 4px 10px rgba(16, 185, 129, 0.2);
    cursor: default;
}

.btn-back {
    background: rgba(255, 255, 255, 0.8);
    color: var(--dark);
    border: 1px solid var(--tropical-teal);
    margin-bottom: 0;
}

.btn-back:hover {
    background: white;
    border-color: var(--cerulean);
    color: var(--cerulean);
    transform: translateX(-5px);
}

/* Countdown */
.countdown-container {
    background: linear-gradient(135deg, #fff7ed, #ffedd5);
    border-radius: 20px;
    padding: 1.5rem;
    margin-bottom: 1rem;
    border: 1px solid #fed7aa;
}

.countdown-header {
    display: flex;
    align-items: center;
    gap: 0.5rem;
    color: #9a3412;
    font-weight: 700;
    font-size: 0.95rem;
    margin-bottom: 1rem;
}

.countdown-display {
    display: flex;
    justify-content: center;
    align-items: center;
    gap: 0.25rem;
    background: white;
    padding: 1rem;
    border-radius: 16px;
}

.countdown-number {
    font-size: 1.8rem;
    font-weight: 800;
    color: #9a3412;
    line-height: 1;
    min-width: 50px;
    text-align: center;
}

.countdown-label {
    font-size: 0.7rem;
    color: var(--gray);
    font-weight: 600;
}

.countdown-separator {
    font-size: 1.5rem;
    color: #9a3412;
    font-weight: 600;
}

.start-info {
    text-align: center;
    font-size: 0.85rem;
    color: var(--gray);
    margin-top: 1rem;
    padding: 0.5rem;
    background: rgba(255,255,255,0.7);
    border-radius: 12px;
}

.btn-notify-sm {
    display: block;
    width: 100%;
    background: white;
    color: #9a3412;
    text-align: center;
    padding: 0.8rem;
    border-radius: 12px;
    font-weight: 600;
    font-size: 0.9rem;
    text-decoration: none;
    border: 1px solid #fed7aa;
    transition: all 0.3s;
    margin-top: 0.5rem;
}

.btn-notify-sm:hover {
    background: #ea580c;
    color: white;
    border-color: #ea580c;
    transform: translateY(-3px);
}

/* Not Found */
.not-found {
    text-align: center;
    padding: 3rem;
    background: rgba(255, 255, 255, 0.85);
    border-radius: 24px;
    border: 1px solid var(--tropical-teal);
}

/* Modern Footer - Same as Dashboard */
.modern-footer {
    background: var(--footer-bg);
    color: rgba(255, 255, 255, 0.9);
    padding: 2.2rem 0;
    margin-top: 2rem;
    border-top: 2px solid rgba(255, 255, 255, 0.2);
    box-shadow: 0 -4px 20px rgba(0, 0, 0, 0.05);
}

.footer-container {
    max-width: 1600px;
    margin: 0 auto;
    padding: 0 2rem;
    display: flex;
    justify-content: space-between;
    align-items: center;
    flex-wrap: wrap;
    gap: 1.8rem;
}

.footer-logo {
    display: flex;
    align-items: center;
    gap: 1rem;
}

.footer-logo i {
    font-size: 1.8rem;
    color: var(--cream);
    animation: pulse 2s infinite;
}

.footer-logo span {
    font-size: 1.3rem;
    font-weight: 800;
    color: white;
    letter-spacing: -0.3px;
}

.footer-links {
    display: flex;
    gap: 2.5rem;
}

.footer-links a {
    color: rgba(255, 255, 255, 0.85);
    text-decoration: none;
    transition: all 0.3s;
    font-size: 1rem;
    font-weight: 600;
    padding: 0.3rem 0;
    position: relative;
}

.footer-links a::after {
    content: '';
    position: absolute;
    bottom: 0;
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
    font-size: 0.95rem;
    color: rgba(255, 255, 255, 0.85);
    font-weight: 500;
}

.footer-copyright i {
    color: var(--hot-fuchsia);
    animation: pulse 1.5s infinite;
}

.footer-copyright strong {
    color: var(--cream);
    font-weight: 800;
}

/* Responsive */
@media (max-width: 1200px) {
    .two-column-layout {
        flex-direction: column;
    }
    
    .right-column {
        width: 100%;
        position: static;
    }
    
    .details-grid {
        grid-template-columns: repeat(3, 1fr);
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
    }
    
    .main-container {
        padding: 0 1rem;
    }
    
    .company-info {
        flex-direction: column;
        text-align: center;
    }
    
    .details-grid {
        grid-template-columns: repeat(2, 1fr);
    }
    
    .dates-grid {
        grid-template-columns: 1fr;
    }
    
    .footer-container {
        flex-direction: column;
        text-align: center;
    }
    
    .footer-links {
        justify-content: center;
        flex-wrap: wrap;
    }
}
</style>
</head>
<body>

<!-- Modern Header - Same as Dashboard -->
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

<!-- Main Container -->
<div class="main-container">
    <c:choose>
        <c:when test="${empty internship}">
            <div class="not-found">
                <i class="fas fa-exclamation-circle" style="font-size: 3rem; color: var(--danger);"></i>
                <h3 style="margin: 1rem 0;">Internship Not Found</h3>
                <p>The internship you're looking for doesn't exist.</p>
                <a href="studentDashboard" class="btn-back" style="display: inline-block; width: auto; padding: 0.8rem 1.8rem;">Return to Dashboard</a>
            </div>
        </c:when>
        <c:otherwise>
            
            <!-- Two Column Layout -->
            <div class="two-column-layout">
                
                <!-- LEFT COLUMN - Main Content -->
                <div class="left-column">
                    <div class="left-content">
                        
                        <!-- Company Info + Key Details Card -->
                        <div class="info-card">
                            <div class="internship-header">
                                <div class="company-info">
                                    <div class="company-logo">
                                        <span>${fn:substring(internship.employer.companyName, 0, 2)}</span>
                                    </div>
                                    <div class="company-details">
                                        <h1 class="internship-title">${internship.title}</h1>
                                        <div class="company-name">
                                            <i class="fas fa-building"></i> ${internship.employer.companyName}
                                        </div>
                                    </div>
                                </div>
                                
                                <!-- Status Badge -->
                                <c:choose>
                                    <c:when test="${calculatedStatus eq 'OPEN'}">
                                        <span class="status-badge status-open"><i class="fas fa-circle" style="font-size: 0.4rem;"></i> OPEN FOR APPLICATIONS</span>
                                    </c:when>
                                    <c:when test="${calculatedStatus eq 'UPCOMING'}">
                                        <span class="status-badge status-upcoming"><i class="fas fa-clock"></i> UPCOMING INTERNSHIP</span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="status-badge status-closed"><i class="fas fa-times-circle"></i> APPLICATIONS CLOSED</span>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            
                            <!-- Key Details -->
                            <div class="details-section">
                                <div class="details-grid">
                                    <div class="detail-item">
                                        <div class="detail-icon"><i class="fas fa-map-marker-alt"></i></div>
                                        <div class="detail-label">LOCATION</div>
                                        <div class="detail-value">${internship.location}</div>
                                    </div>
                                    <div class="detail-item">
                                        <div class="detail-icon"><i class="fas fa-briefcase"></i></div>
                                        <div class="detail-label">TYPE</div>
                                        <div class="detail-value">${internship.internshipType}</div>
                                    </div>
                                    <div class="detail-item">
                                        <div class="detail-icon"><i class="fas fa-calendar-alt"></i></div>
                                        <div class="detail-label">DURATION</div>
                                        <div class="detail-value">${internship.durationMonths} months</div>
                                    </div>
                                    <div class="detail-item">
                                        <div class="detail-icon"><i class="fas fa-rupee-sign"></i></div>
                                        <div class="detail-label">STIPEND</div>
                                        <div class="detail-value">
                                            <c:choose>
                                                <c:when test="${internship.stipend > 0}">₹${internship.stipend}/month</c:when>
                                                <c:otherwise>Free</c:otherwise>
                                            </c:choose>
                                        </div>
                                    </div>
                                    <div class="detail-item">
                                        <div class="detail-icon"><i class="fas fa-users"></i></div>
                                        <div class="detail-label">OPENINGS</div>
                                        <div class="detail-value">${internship.openings}</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <!-- Important Dates Card -->
                        <div class="info-card">
                            <div class="section-title">
                                <i class="fas fa-calendar-alt"></i> Important Dates
                            </div>
                            <div class="dates-grid">
                                <div class="date-item">
                                    <div class="date-icon"><i class="fas fa-play"></i></div>
                                    <div class="date-label">START DATE</div>
                                    <div class="date-value">${internship.startDate}</div>
                                </div>
                                <div class="date-item">
                                    <div class="date-icon"><i class="fas fa-stop"></i></div>
                                    <div class="date-label">END DATE</div>
                                    <div class="date-value">${internship.endDate}</div>
                                </div>
                                <div class="date-item">
                                    <div class="date-icon"><i class="fas fa-hourglass-end"></i></div>
                                    <div class="date-label">LAST APPLY</div>
                                    <div class="date-value">${internship.lastApplyDate}</div>
                                </div>
                            </div>
                        </div>
                        
                        <!-- Description Card -->
                        <div class="info-card">
                            <div class="section-title">
                                <i class="fas fa-file-alt"></i> Description
                            </div>
                            <div class="description-text">
                                ${internship.description}
                            </div>
                        </div>
                        
                        <!-- Skills Card -->
                        <div class="info-card">
                            <div class="section-title">
                                <i class="fas fa-code"></i> Skills Required
                            </div>
                            <div class="skills-tags">
                                <c:forEach var="skill" items="${fn:split(internship.skillsRequired, ',')}">
                                    <span class="skill-tag">
                                        <i class="fas fa-check-circle"></i> ${fn:trim(skill)}
                                    </span>
                                </c:forEach>
                            </div>
                        </div>
                        
                        <!-- Employer Card -->
                        <div class="info-card">
                            <div class="section-title">
                                <i class="fas fa-building"></i> Employer Details
                            </div>
                            <div class="employer-info">
                                <div class="employer-name">
                                    <i class="fas fa-building"></i> ${internship.employer.companyName}
                                </div>
                                <c:if test="${not empty internship.employer.hrName}">
                                    <div class="employer-detail">
                                        <i class="fas fa-user"></i> HR: ${internship.employer.hrName}
                                    </div>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
                
                <!-- RIGHT COLUMN - Poster & Actions -->
                <div class="right-column">
                    <div class="right-content">
                        
                        <!-- Poster Card -->
                        <div class="poster-card">
                            <c:choose>
                                <c:when test="${not empty internship.posterUrl}">
                                    <img src="${internship.posterUrl}" class="poster-image" alt="Poster">
                                </c:when>
                                <c:otherwise>
                                    <img src="https://via.placeholder.com/500x350?text=SmartIntern+Internship" class="poster-image" alt="Default">
                                </c:otherwise>
                            </c:choose>
                        </div>
                        
                        <!-- Action Card -->
                        <div class="info-card">
                            <c:choose>
                                <%-- Already Applied --%>
                                <c:when test="${hasApplied}">
                                    <div class="btn-applied">
                                        <i class="fas fa-check-circle"></i> Already Applied
                                    </div>
                                </c:when>
                                
                                <%-- Not Applied Yet --%>
                                <c:otherwise>
                                    <c:choose>
                                        <%-- OPEN - Show Apply Button --%>
                                        <c:when test="${shouldShowApply}">
                                            <a href="applyInternship?internshipId=${internship.internshipId}" class="btn-apply">
                                                <i class="fas fa-paper-plane"></i> Apply Now
                                            </a>
                                        </c:when>
                                        
                                        <%-- UPCOMING - Show Countdown --%>
                                        <c:when test="${calculatedStatus eq 'UPCOMING'}">
                                            <div class="countdown-container">
                                                <div class="countdown-header">
                                                    <i class="fas fa-rocket"></i>
                                                    <span>Starts in</span>
                                                </div>
                                                
                                                <!-- Live Countdown Timer -->
                                                <div class="countdown-display" id="countdownDisplay">
                                                    <span class="countdown-number" id="days">0</span>
                                                    <span class="countdown-label">d</span>
                                                    <span class="countdown-separator">:</span>
                                                    <span class="countdown-number" id="hours">00</span>
                                                    <span class="countdown-label">h</span>
                                                    <span class="countdown-separator">:</span>
                                                    <span class="countdown-number" id="minutes">00</span>
                                                    <span class="countdown-label">m</span>
                                                    <span class="countdown-separator">:</span>
                                                    <span class="countdown-number" id="seconds">00</span>
                                                    <span class="countdown-label">s</span>
                                                </div>
                                                
                                                <div class="start-info">
                                                    <i class="fas fa-calendar-alt"></i>
                                                    Starts: <strong>${internship.startDate}</strong>
                                                </div>
                                                
                                                <a href="#" class="btn-notify-sm" onclick="notifyMe(${internship.internshipId}); return false;">
                                                    <i class="fas fa-bell"></i> Notify Me
                                                </a>
                                            </div>
                                        </c:when>
                                        
                                        <%-- CLOSED --%>
                                        <c:otherwise>
                                            <div class="btn-apply disabled">
                                                <i class="fas fa-ban"></i> Applications Closed
                                            </div>
                                        </c:otherwise>
                                    </c:choose>
                                </c:otherwise>
                            </c:choose>
                            
                            <!-- Back Button -->
                            <a href="studentDashboard" class="btn-back">
                                <i class="fas fa-arrow-left"></i> Back to Dashboard
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </c:otherwise>
    </c:choose>
</div>

<!-- Modern Footer - Same as Dashboard -->
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
AOS.init({
    duration: 800,
    once: true,
    offset: 50
});

function notifyMe(id) {
    alert('✓ You will be notified when this internship opens!');
}

<c:if test="${calculatedStatus eq 'UPCOMING'}">
    (function() {
        const startDateStr = "${internship.startDate}";
        const startDate = new Date(startDateStr + "T00:00:00");
        
        function updateCountdown() {
            const now = new Date().getTime();
            const distance = startDate.getTime() - now;
            
            if (distance < 0) {
                location.reload();
                return;
            }
            
            const days = Math.floor(distance / (1000 * 60 * 60 * 24));
            const hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
            const minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
            const seconds = Math.floor((distance % (1000 * 60)) / 1000);
            
            document.getElementById('days').textContent = days;
            document.getElementById('hours').textContent = hours.toString().padStart(2, '0');
            document.getElementById('minutes').textContent = minutes.toString().padStart(2, '0');
            document.getElementById('seconds').textContent = seconds.toString().padStart(2, '0');
        }
        
        updateCountdown();
        setInterval(updateCountdown, 1000);
    })();
</c:if>

// Notification bell click
document.querySelector('.notification-badge')?.addEventListener('click', function() {
    alert('You have 3 new notifications');
});
</script>
</body>
</html>