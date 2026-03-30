package com.grownited.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.grownited.entity.InternshipEnrollmentEntity;
import com.grownited.entity.InternshipEntity;
import com.grownited.entity.UserEntity;
import com.grownited.repository.InternshipEnrollmentRepository;
import com.grownited.repository.InternshipRepository;
import com.grownited.repository.UserRepository;

import jakarta.servlet.http.HttpSession;

@Controller
public class InternshipEnrollmentController {
	
	@Autowired
	InternshipEnrollmentRepository internshipenrollmentrepository;
	
	@Autowired
	InternshipRepository internshipRepository;
	
	@Autowired
	UserRepository userRepository;
	
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
	
	

}
