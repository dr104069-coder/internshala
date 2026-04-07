<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SmartIntern | Apply for Internship</title>
    
    <!-- Bootstrap 5 (Core Layout Only) -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">
    <!-- Font Awesome 6 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <!-- Google Fonts: Inter -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    
    <style>
        /* ===== OCEAN SUNSET COLOR PALETTE (exactly from dashboard) ===== */
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
            
            --bg-gradient-start: #d9efff;
            --bg-gradient-end: #b8e1fc;
            --glass-bg: rgba(210, 235, 255, 0.95);
            --card-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.1);
            --hover-shadow: 0 30px 60px -15px rgba(0, 0, 0, 0.15);
            --transition-smooth: 350ms cubic-bezier(0.23, 1, 0.32, 1);
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', sans-serif;
            background: linear-gradient(135deg, var(--bg-gradient-start) 0%, #c6e6ff 50%, var(--bg-gradient-end) 100%);
            color: var(--dark);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 2rem 1.5rem;
            margin: 0;
            position: relative;
            overflow-x: hidden;
        }

        /* Custom Scrollbar (matching dashboard) */
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

        /* Main Application Card - Glassmorphism */
        .apply-card {
            max-width: 680px;
            width: 100%;
            margin: 0 auto;
            background: rgba(255, 255, 255, 0.88);
            backdrop-filter: blur(12px);
            border-radius: 32px;
            border: 1px solid var(--tropical-teal);
            box-shadow: var(--card-shadow);
            padding: 2rem 2rem 2.2rem;
            transition: all var(--transition-smooth);
            animation: cardGlow 0.8s ease-out;
        }

        .apply-card:hover {
            box-shadow: var(--hover-shadow);
            border-color: var(--cerulean-light);
            background: rgba(255, 255, 255, 0.94);
        }

        /* Form Header */
        .form-header {
            text-align: center;
            margin-bottom: 2rem;
            position: relative;
        }

        .form-header .icon-badge {
            width: 70px;
            height: 70px;
            background: linear-gradient(135deg, var(--cerulean), var(--tropical-teal));
            border-radius: 24px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 1.2rem;
            box-shadow: 0 12px 24px -8px rgba(36, 123, 160, 0.4);
            animation: floatIcon 3s ease-in-out infinite;
        }

        .form-header .icon-badge i {
            font-size: 34px;
            color: white;
            filter: drop-shadow(0 2px 6px rgba(0,0,0,0.2));
        }

        .form-header h2 {
            font-size: 1.9rem;
            font-weight: 800;
            background: linear-gradient(135deg, var(--cerulean), var(--tropical-teal-dark));
            -webkit-background-clip: text;
            background-clip: text;
            color: transparent;
            letter-spacing: -0.3px;
            margin-bottom: 0.5rem;
        }

        .form-header p {
            color: var(--gray);
            font-weight: 500;
            font-size: 0.9rem;
            background: rgba(112, 193, 179, 0.15);
            display: inline-block;
            padding: 0.3rem 1rem;
            border-radius: 40px;
            backdrop-filter: blur(4px);
        }

        /* Form Styling */
        .form-label {
            font-weight: 600;
            color: var(--cerulean-dark);
            margin-bottom: 0.5rem;
            font-size: 0.85rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .form-label i {
            color: var(--tropical-teal);
            font-size: 0.9rem;
        }

        .form-control, textarea.form-control {
            background: rgba(255, 255, 255, 0.9);
            border: 1.5px solid rgba(112, 193, 179, 0.5);
            border-radius: 20px;
            padding: 0.75rem 1.2rem;
            font-size: 0.9rem;
            font-weight: 500;
            color: var(--dark);
            transition: all 0.25s ease;
            box-shadow: none;
        }

        .form-control:focus, textarea.form-control:focus {
            border-color: var(--cerulean);
            outline: none;
            box-shadow: 0 0 0 4px rgba(36, 123, 160, 0.15);
            background: white;
        }

        textarea.form-control {
            min-height: 130px;
            resize: vertical;
        }

        input[type="file"].form-control {
            padding: 0.5rem 0.8rem;
            background: rgba(255, 255, 255, 0.8);
        }

        input[type="file"]::file-selector-button {
            background: linear-gradient(135deg, var(--cerulean-light), var(--tropical-teal));
            border: none;
            border-radius: 40px;
            padding: 0.4rem 1rem;
            color: white;
            font-weight: 600;
            font-size: 0.75rem;
            margin-right: 1rem;
            transition: all 0.2s;
            cursor: pointer;
        }

        input[type="file"]::file-selector-button:hover {
            background: linear-gradient(135deg, var(--cerulean), var(--tropical-teal-dark));
            transform: scale(0.97);
        }

        .form-hint {
            font-size: 0.7rem;
            color: var(--gray);
            margin-top: 0.4rem;
            margin-left: 0.5rem;
            display: flex;
            align-items: center;
            gap: 0.3rem;
        }

        /* Apply Button */
        .btn-apply {
            background: linear-gradient(135deg, var(--cerulean), var(--tropical-teal));
            border: none;
            border-radius: 60px;
            padding: 0.85rem 1.8rem;
            font-weight: 700;
            font-size: 1rem;
            color: white;
            width: 100%;
            transition: all 0.3s cubic-bezier(0.23, 1, 0.32, 1);
            box-shadow: 0 8px 20px -8px rgba(36, 123, 160, 0.5);
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 0.7rem;
        }

        .btn-apply:hover {
            transform: translateY(-3px);
            box-shadow: 0 15px 30px -10px rgba(36, 123, 160, 0.7);
            background: linear-gradient(135deg, var(--cerulean-dark), var(--tropical-teal-dark));
            letter-spacing: 0.3px;
        }

        .btn-apply:active {
            transform: translateY(2px);
        }

        /* Back Link */
        .back-link {
            text-align: center;
            margin-top: 1.8rem;
        }

        .back-link a {
            color: var(--cerulean);
            font-weight: 600;
            text-decoration: none;
            font-size: 0.85rem;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            transition: all 0.2s;
            background: rgba(255,255,255,0.5);
            padding: 0.4rem 1.2rem;
            border-radius: 50px;
            backdrop-filter: blur(4px);
        }

        .back-link a:hover {
            color: var(--hot-fuchsia);
            gap: 0.7rem;
            background: rgba(255,255,255,0.8);
            transform: translateX(-3px);
        }

        /* Animations */
        @keyframes cardGlow {
            0% {
                opacity: 0;
                transform: scale(0.96) translateY(20px);
            }
            100% {
                opacity: 1;
                transform: scale(1) translateY(0);
            }
        }

        @keyframes floatIcon {
            0% { transform: translateY(0px); }
            50% { transform: translateY(-8px); }
            100% { transform: translateY(0px); }
        }

        /* Floating Alert */
        .floating-form-alert {
            animation: slideUpFade 0.25s ease-out;
            transition: opacity 0.3s ease;
            border-radius: 60px;
            padding: 0.7rem 1.2rem;
            font-size: 0.85rem;
            font-weight: 600;
            display: flex;
            align-items: center;
            gap: 0.6rem;
            margin-top: 1rem;
            box-shadow: 0 5px 15px rgba(0,0,0,0.05);
        }

        .alert-warning-custom {
            background: rgba(255, 245, 235, 0.95);
            border-left: 4px solid var(--warning);
            color: #0f172a;
        }

        .alert-danger-custom {
            background: rgba(255, 235, 235, 0.95);
            border-left: 4px solid var(--danger);
            color: #0f172a;
        }

        @keyframes slideUpFade {
            from {
                opacity: 0;
                transform: translateY(12px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        /* Responsive */
        @media (max-width: 550px) {
            .apply-card {
                padding: 1.5rem;
            }
            .form-header h2 {
                font-size: 1.5rem;
            }
            .form-header .icon-badge {
                width: 55px;
                height: 55px;
            }
            .form-header .icon-badge i {
                font-size: 26px;
            }
            body {
                padding: 1rem;
            }
        }
    </style>
</head>
<body>

<div class="apply-card">
    <div class="form-header">
        <div class="icon-badge">
            <i class="fas fa-paper-plane"></i>
        </div>
        <h2>Apply for Internship</h2>
        <p><i class="fas fa-briefcase"></i> Take the next step in your career</p>
    </div>

    <!-- Internship application form -->
    <form action="saveApplication" method="post" enctype="multipart/form-data" id="applicationForm">
        <!-- Internship ID Hidden -->
        <input type="hidden" name="internshipId" id="internshipId" value="${internshipId}">

        <!-- Cover Letter Field -->
        <div class="mb-4">
            <label for="coverLetter" class="form-label">
                <i class="fas fa-envelope-open-text"></i> Cover Letter
            </label>
            <textarea class="form-control" id="coverLetter" name="coverLetter" rows="4" 
                      placeholder="Why are you the ideal candidate? Share your motivation, skills, and passion..." required></textarea>
            <div class="form-hint">
                <i class="fas fa-lightbulb"></i> Tip: Personalize your letter for this opportunity.
            </div>
        </div>

        <!-- Resume Upload Field -->
       <div class="mb-4">
    <label for="resumeFile" class="form-label">
        <i class="fas fa-image"></i> Upload Resume (Image)
    </label>

    <input type="file" class="form-control" id="resumeFile" name="resumeFile" 
           accept="image/png, image/jpeg, image/jpg" required>

    <div class="form-hint">
        <i class="fas fa-info-circle"></i> Max size: 5MB, JPG/PNG format only.
    </div>
</div>

        <!-- Apply Button -->
        <button type="submit" class="btn-apply" id="submitBtn">
            <i class="fas fa-check-circle"></i> Submit Application
        </button>
    </form>

    <!-- Back Link -->
    <div class="back-link">
        <a href="internships" class="back-to-internships">
            <i class="fas fa-arrow-left"></i> Browse all internships
        </a>
    </div>
</div>

<!-- Bootstrap JS Bundle -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<script>
    (function() {
        const form = document.getElementById('applicationForm');
        const submitBtn = document.getElementById('submitBtn');
        const originalBtnHtml = submitBtn.innerHTML;

        // Helper: show floating message
        function showFloatingMessage(msg, type) {
            // Remove any existing floating alert
            const existingAlert = document.querySelector('.floating-form-alert');
            if(existingAlert) existingAlert.remove();

            const alertDiv = document.createElement('div');
            alertDiv.className = 'floating-form-alert';
            
            if (type === 'danger') {
                alertDiv.classList.add('alert-danger-custom');
            } else {
                alertDiv.classList.add('alert-warning-custom');
            }
            
            const icon = type === 'danger' ? '<i class="fas fa-exclamation-circle" style="color:#ef4444;"></i>' : '<i class="fas fa-info-circle" style="color:#f59e0b;"></i>';
            alertDiv.innerHTML = icon + ' ' + msg;
            form.parentNode.insertBefore(alertDiv, form.nextSibling);

            setTimeout(() => {
                if(alertDiv) alertDiv.style.opacity = '0';
                setTimeout(() => { if(alertDiv) alertDiv.remove(); }, 400);
            }, 4000);
        }

        // Form validation
        form.addEventListener('submit', function(event) {
            const coverLetter = document.getElementById('coverLetter').value.trim();
            const resumeFile = document.getElementById('resumeFile').files[0];

            if (!coverLetter) {
                event.preventDefault();
                showFloatingMessage('Please write your cover letter.', 'warning');
                document.getElementById('coverLetter').focus();
                return false;
            }

            if (coverLetter.length < 3) {
                event.preventDefault();
                showFloatingMessage('Cover letter should be at least 3 characters long.', 'warning');
                return false;
            }

            if (!resumeFile) {
                event.preventDefault();
                showFloatingMessage('Please upload your resume .', 'warning');
                return false;
            }

            if (!resumeFile.type.startsWith("image/")) {
                event.preventDefault();
                showFloatingMessage('Only image files are allowed (JPG, PNG).', 'danger');
                return false;
            }

            const maxSize = 5 * 1024 * 1024;
            if (resumeFile.size > maxSize) {
                event.preventDefault();
                showFloatingMessage('Resume file size must be less than 5MB.', 'danger');
                return false;
            }

            // Show loading state
            submitBtn.innerHTML = '<i class="fas fa-spinner fa-pulse"></i> Submitting...';
            submitBtn.disabled = true;
            
            return true;
        });

        // File input validation
        const fileInput = document.getElementById('resumeFile');
        fileInput.addEventListener('change', function(e) {
            const file = e.target.files[0];
            if (file && !file.type.startsWith("image/")) {
                showFloatingMessage('Please select an image file (JPG, PNG).', 'danger');
                fileInput.value = '';
            } 
            else if (file && file.size > 5 * 1024 * 1024) {
                showFloatingMessage('File too large. Maximum 5MB allowed.', 'danger');
                fileInput.value = '';
            }
        });

        // Restore button state if page is reloaded
        window.addEventListener('pageshow', function() {
            if(submitBtn) {
                submitBtn.innerHTML = originalBtnHtml;
                submitBtn.disabled = false;
            }
        });
    })();
</script>

</body>
</html>