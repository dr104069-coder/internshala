<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Certificate of Completion</title>
<script src="https://cdn.tailwindcss.com"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body class="bg-gradient-to-br from-amber-50 via-yellow-50 to-orange-50 min-h-screen flex items-center justify-center p-8">

<div class="max-w-4xl w-full">
    <!-- Certificate Card -->
    <div class="bg-white rounded-2xl shadow-2xl overflow-hidden border-8 border-double border-amber-600">
        <div class="bg-gradient-to-r from-amber-600 to-orange-600 p-6 text-center">
            <i class="fas fa-certificate text-6xl text-white mb-2"></i>
            <h1 class="text-4xl font-bold text-white">Certificate of Completion</h1>
            <p class="text-amber-100 mt-2">This certificate is proudly presented to</p>
        </div>
        
        <div class="p-12 text-center">
            <!-- Changed from enrollment to certificate.enrollment -->
            <h2 class="text-5xl font-bold text-gray-800 mb-4">${certificate.enrollment.student.firstName} ${certificate.enrollment.student.lastName}</h2>
            
            <div class="my-8">
                <p class="text-xl text-gray-600">for successfully completing the internship program</p>
                <p class="text-2xl font-semibold text-purple-700 my-4">${certificate.enrollment.internship.title}</p>
                
                <div class="flex justify-center gap-8 mt-6 text-gray-600">
                    <div>
                        <i class="fas fa-calendar-alt mr-2"></i>
                        <!-- Changed to use certificate.issuedDate -->
                        <span>Completed: ${certificate.enrollment.completionDate}</span>
                    </div>
                    <div>
                        <i class="fas fa-star mr-2 text-yellow-500"></i>
                        <span>Rating: ${certificate.enrollment.performanceRating}/5</span>
                    </div>
                </div>
                
                <!-- Added Verification Code Display -->
                <div class="mt-6 p-3 bg-gray-50 rounded-lg">
                    <p class="text-sm text-gray-500">Verification Code</p>
                    <p class="text-lg font-mono font-bold text-purple-700">${certificate.verificationCode}</p>
                </div>
            </div>
            
            <div class="border-t-2 border-dashed border-gray-300 my-8 pt-8">
                <div class="flex justify-between items-center">
                    <div class="text-left">
                        <p class="text-sm text-gray-500">Issue Date</p>
                        <!-- Changed to use certificate.issuedDate -->
                        <p class="font-semibold">${certificate.issuedDate}</p>
                    </div>
                    <div class="text-right">
                        <p class="text-sm text-gray-500">Certificate ID</p>
                        <p class="font-semibold">#${certificate.certificateId}</p>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="bg-gray-100 p-4 text-center">
            <button onclick="window.print()" class="bg-gradient-to-r from-purple-600 to-pink-600 text-white px-6 py-2 rounded-lg hover:from-pink-600 hover:to-purple-700 transition">
                <i class="fas fa-print mr-2"></i>Print Certificate
            </button>
            <!-- Dynamic Back Button -->
            <a href="javascript:history.back()" 
               class="inline-block ml-4 bg-gray-600 text-white px-6 py-2 rounded-lg hover:bg-gray-700 transition">
                <i class="fas fa-arrow-left mr-2"></i>Back
            </a>
        </div>
    </div>
</div>

</body>
</html>