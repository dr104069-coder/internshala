package com.grownited.controller;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.grownited.entity.CertificateEntity;
import com.grownited.entity.InternshipEnrollmentEntity;
import com.grownited.entity.InternshipEntity;
import com.grownited.entity.UserEntity;
import com.grownited.repository.CertificateRepository;
import com.grownited.repository.InternshipEnrollmentRepository;
import com.grownited.repository.InternshipRepository;
import com.grownited.repository.UserRepository;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class InternshipEnrollmentController {
	
	@Autowired
	InternshipEnrollmentRepository internshipenrollmentrepository;
	
	@Autowired
	InternshipRepository internshipRepository;
	
	@Autowired
	UserRepository userRepository;
	
	@Autowired
	CertificateRepository certificaterepository;
	
//	@GetMapping("/addInternshipEnrollment")
//	public String openInternshipEnrollmentPage(Model model) {
//
//	    List<InternshipEntity> internshipList =
//	            internshipRepository.findByStatus("OPEN");
//
//	    model.addAttribute("internshipList", internshipList);
//
//	    return "addInternshipEnrollment";
//	}
	
	@GetMapping("/addInternshipEnrollment")
	public String openInternshipEnrollmentPage(Model model) {

	    List<InternshipEntity> internshipList =
	            internshipRepository.findByStatus("OPEN");

	    model.addAttribute("internshipList", internshipList);

	    return "addInternshipEnrollment";
	}
	
	
	@PostMapping("/saveInternshipEnrollment")
	public String saveInternshipEnrollment(
	        @RequestParam("internshipId") Integer internshipId,
	        @RequestParam(required = false) Integer studentId,
	        InternshipEnrollmentEntity enrollment,
	        HttpSession session) {

	    UserEntity user = (UserEntity) session.getAttribute("user");

	    if (user == null) {
	        return "redirect:/login";
	    }

	    UserEntity student;

	    // 👑 ADMIN can select student manually
	    if (user.getRole().equals("ADMIN") && studentId != null) {
	        student = userRepository.findById(studentId).orElse(null);
	    } else {
	        // 👨‍🎓 STUDENT or ADMIN without selection
	        student = user;
	    }

	    if (student == null) {
	        return "redirect:/addInternshipEnrollment";
	    }

	    InternshipEntity internship =
	            internshipRepository.findById(internshipId).orElse(null);

	    if (internship == null) {
	        return "redirect:/addInternshipEnrollment";
	    }

	    enrollment.setStudent(student);
	    enrollment.setInternship(internship);

	    internshipenrollmentrepository.save(enrollment);

	    return "redirect:/listEnrollment";
	}
	
	@GetMapping("/listEnrollment")
	public String listEnrollments(HttpSession session, Model model) {

	    UserEntity user = (UserEntity) session.getAttribute("user");

	    if (user == null) {
	        return "redirect:/login";
	    }

	    List<InternshipEnrollmentEntity> enrollments;

	    if (user.getRole().equals("ADMIN")) {
	        // 👑 ADMIN → See All
	        enrollments = internshipenrollmentrepository.findAll();
	    } else {
	        // 👨‍🎓 STUDENT → See Own
	        enrollments = internshipenrollmentrepository
	                .findByStudentUserId(user.getUserId());
	    }

	    model.addAttribute("enrollments", enrollments);

	    return "listEnrollment";
	}
	
	@GetMapping("/viewEnrollment")
	public String viewEnrollment(@RequestParam Integer enrollmentId, Model model) {

	    InternshipEnrollmentEntity enrollment =
	            internshipenrollmentrepository.findById(enrollmentId).orElse(null);

	    model.addAttribute("enrollment", enrollment);

	    return "viewEnrollment";
	}
	
	@GetMapping("/deleteEnrollment")
	public String deleteEnrollment(@RequestParam Integer enrollmentId) {

	    internshipenrollmentrepository.deleteById(enrollmentId);

	    return "redirect:/listEnrollment";
	}
	
//	@GetMapping("/addInternshipEnrollment")
//    public String openInternshipEnrollmentPage() {
//        return "addInternshipEnrollment"; // JSP name
//    }
	
	/*@PostMapping("/saveInternshipEnrollment")
    public String saveInternshipEnrollment(InternshipEnrollmentEntity enrollment) {

        // If joining date is null, set today
        if (enrollment.getJoiningDate() == null) {
            enrollment.setJoiningDate(LocalDate.now());
        }

        internshipenrollmentrepository.save(enrollment);

        return "redirect:/studentDashboard";
    }
	
	@PostMapping("/saveInternshipEnrollment")
	public String saveInternshipEnrollment(
	        @RequestParam(INTERNSHIP_ID) Integer internshipId,
	        HttpSession session) {

	    // Get logged-in student ID from session
	    Integer studentId = (Integer) session.getAttribute("userId");

	    InternshipEnrollmentEntity enrollment = new InternshipEnrollmentEntity();

	    // ✅ Set Foreign Keys
	    enrollment.setStudentId(studentId);
	    enrollment.setInternshipId(internshipId);

	    // ✅ Set default values
	    enrollment.setJoiningDate(LocalDate.now());
	    enrollment.setStatus("ON_GOING");  // default status
	    enrollment.setPerformanceRating(null);
	    enrollment.setCompletionDate(null);

	    internshipenrollmentrepository.save(enrollment);

	    return "redirect:/studentDashboard";
	}*/
	
	
	@GetMapping("/viewEnrolledStudents")
	public String viewEnrolledStudents(@RequestParam("internshipId") Integer internshipId, 
	                                   HttpSession session, 
	                                   Model model) {
	    
	    // Check if user is logged in
	    UserEntity user = (UserEntity) session.getAttribute("user");
	    if (user == null) {
	        return "redirect:/login";
	    }
	    
	    // Get the internship
	    InternshipEntity internship = internshipRepository.findById(internshipId).orElse(null);
	    if (internship == null) {
	        return "redirect:/employerdashboard";
	    }
	    
	    // Get all enrolled students for this internship
	    List<InternshipEnrollmentEntity> enrollments = internshipenrollmentrepository
	            .findByInternship(internship);
	    
	    // Add to model
	    model.addAttribute("internship", internship);
	    model.addAttribute("enrollments", enrollments);
	    model.addAttribute("totalStudents", enrollments.size());
	    
	    // Calculate statistics
	    long ongoingCount = enrollments.stream()
	            .filter(e -> "ON_GOING".equals(e.getStatus()))
	            .count();
	    long completedCount = enrollments.stream()
	            .filter(e -> "COMPLETED".equals(e.getStatus()))
	            .count();
	    long droppedCount = enrollments.stream()
	            .filter(e -> "DROPPED".equals(e.getStatus()))
	            .count();
	    
	    model.addAttribute("ongoingCount", ongoingCount);
	    model.addAttribute("completedCount", completedCount);
	    model.addAttribute("droppedCount", droppedCount);
	    
	    return "viewEnrolledStudents";
	}
	
	// Add these methods to your InternshipEnrollmentController class

	@GetMapping("/editEnrollment")
	public String editEnrollment(@RequestParam Integer enrollmentId, Model model) {
	    InternshipEnrollmentEntity enrollment = internshipenrollmentrepository.findById(enrollmentId).orElse(null);
	    if (enrollment == null) {
	        return "redirect:/listEnrollment";
	    }
	    model.addAttribute("enrollment", enrollment);
	    return "editEnrollment";
	}

	@PostMapping("/updateEnrollment")
	public String updateEnrollment(@RequestParam Integer enrollmentId,
	                               @RequestParam(required = false) LocalDate completionDate,
	                               @RequestParam(required = false) Integer performanceRating,
	                               @RequestParam(required = false) String status,
	                               @RequestParam Integer internshipId) {
	    
	    InternshipEnrollmentEntity enrollment = internshipenrollmentrepository.findById(enrollmentId).orElse(null);
	    
	    if (enrollment != null) {
	        if (completionDate != null) {
	            enrollment.setCompletionDate(completionDate);
	        }
	        if (performanceRating != null) {
	            enrollment.setPerformanceRating(performanceRating);
	        }
	        if (status != null) {
	            enrollment.setStatus(status);
	            // If status is COMPLETED and completion date is null, set it to today
	            if ("COMPLETED".equals(status) && enrollment.getCompletionDate() == null) {
	                enrollment.setCompletionDate(LocalDate.now());
	            }
	        }
	        internshipenrollmentrepository.save(enrollment);
	    }
	    
	    return "redirect:/viewEnrolledStudents?internshipId=" + internshipId;
	}

	@GetMapping("/dropStudent")
	public String dropStudent(@RequestParam Integer enrollmentId, @RequestParam Integer internshipId) {
	    internshipenrollmentrepository.deleteById(enrollmentId);
	    return "redirect:/viewEnrolledStudents?internshipId=" + internshipId;
	}

	@GetMapping("/generateCertificate")
	public String generateCertificate(@RequestParam Integer enrollmentId, Model model, HttpServletRequest request) {
	    InternshipEnrollmentEntity enrollment = internshipenrollmentrepository.findById(enrollmentId).orElse(null);
	    
	    if (enrollment != null && "COMPLETED".equals(enrollment.getStatus())) {
	        
	        // Check if certificate already exists for this enrollment
	        CertificateEntity existingCertificate = certificaterepository.findByEnrollment(enrollment);
	        
	        if (existingCertificate == null) {
	            // Create new certificate
	            CertificateEntity certificate = new CertificateEntity();
	            certificate.setEnrollment(enrollment);
	            certificate.setIssuedDate(LocalDate.now());
	            
	            // Generate unique verification code
	            String verificationCode = generateVerificationCode(enrollment);
	            certificate.setVerificationCode(verificationCode);
	            
	            // Save certificate first to get certificateId
	            CertificateEntity savedCertificate = certificaterepository.save(certificate);
	            
	            // Generate the certificate page URL
	            String certificateURL = generateCertificateURL(request, savedCertificate.getCertificateId());
	            savedCertificate.setCertificateURL(certificateURL);
	            
	            // Update with URL
	            certificaterepository.save(savedCertificate);
	            
	            model.addAttribute("certificate", savedCertificate);
	        } else {
	            model.addAttribute("certificate", existingCertificate);
	        }
	        
	        return "certificatePage";
	    }
	    return "redirect:/viewEnrolledStudents?internshipId=" + (enrollment != null ? enrollment.getInternship().getInternshipId() : 0);
	}

	// Helper method to generate unique verification code
	private String generateVerificationCode(InternshipEnrollmentEntity enrollment) {
	    // Format: CERT-YYYYMMDD-ENROLLMENTID-RANDOM
	    String datePart = LocalDate.now().toString().replace("-", "");
	    String randomPart = String.format("%04d", (int)(Math.random() * 10000));
	    return String.format("CERT-%s-%d-%s", datePart, enrollment.getInternshipEnrollmentId(), randomPart);
	}

	// Helper method to generate certificate page URL
	private String generateCertificateURL(HttpServletRequest request, Integer certificateId) {
	    String baseUrl = request.getRequestURL().toString().replace(request.getRequestURI(), "");
	    return baseUrl + request.getContextPath() + "/viewCertificate?certificateId=" + certificateId;
	}
	
	@GetMapping("/viewCertificate1")
	public String viewCertificate1(@RequestParam Integer certificateId, Model model) {
	    CertificateEntity certificate = certificaterepository.findById(certificateId).orElse(null);
	    if (certificate != null) {
	        model.addAttribute("certificate", certificate);
	        return "certificatePage";
	    }
	    return "redirect:/myCertificates";
	}
	
	@GetMapping("/updateEnrollment")
	public String updateEnrollment(@RequestParam Integer enrollmentId, Model model) {
	    InternshipEnrollmentEntity enrollment = internshipenrollmentrepository.findById(enrollmentId).orElse(null);
	    
	    if (enrollment == null) {
	        return "redirect:/listEnrollment";
	    }
	    
	    model.addAttribute("enrollment", enrollment);
	    return "updateEnroll";
	}
	
	@PostMapping("/editEnrollmentSubmit")
	public String editEnrollmentSubmit(@RequestParam Integer enrollmentId,
	                                   @RequestParam(required = false) LocalDate joiningDate,
	                                   @RequestParam(required = false) LocalDate completionDate,
	                                   @RequestParam(required = false) Integer performanceRating,
	                                   @RequestParam(required = false) String status,
	                                   RedirectAttributes redirectAttributes) {
	    
	    InternshipEnrollmentEntity enrollment = internshipenrollmentrepository.findById(enrollmentId).orElse(null);
	    
	    if (enrollment != null) {
	        if (joiningDate != null) enrollment.setJoiningDate(joiningDate);
	        if (completionDate != null) enrollment.setCompletionDate(completionDate);
	        if (performanceRating != null) enrollment.setPerformanceRating(performanceRating);
	        if (status != null) {
	            enrollment.setStatus(status);
	            if ("COMPLETED".equals(status) && enrollment.getCompletionDate() == null) {
	                enrollment.setCompletionDate(LocalDate.now());
	            }
	        }
	        internshipenrollmentrepository.save(enrollment);
	        redirectAttributes.addFlashAttribute("success", "Enrollment updated successfully!");
	    } else {
	        redirectAttributes.addFlashAttribute("error", "Enrollment not found!");
	    }
	    
	    return "redirect:/listEnrollment";
	}
	
}
