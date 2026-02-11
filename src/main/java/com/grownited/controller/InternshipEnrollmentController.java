package com.grownited.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import com.grownited.entity.InternshipEnrollmentEntity;
import com.grownited.entity.InternshipEntity;
import com.grownited.repository.InternshipEnrollmentRepository;
import com.grownited.repository.InternshipRepository;

import jakarta.servlet.http.HttpSession;

@Controller
public class InternshipEnrollmentController {
	
	@Autowired
	InternshipEnrollmentRepository internshipenrollmentrepository;
	
	@Autowired
	InternshipRepository internshipRepository;
	
	@GetMapping("/addInternshipEnrollment")
	public String openInternshipEnrollmentPage(Model model) {

	    List<InternshipEntity> internshipList =
	            internshipRepository.findByStatus("OPEN");

	    model.addAttribute("internshipList", internshipList);

	    return "addInternshipEnrollment";
	}
	
	@PostMapping("/saveInternshipEnrollment")
	public String saveInternshipEnrollment(InternshipEnrollmentEntity enrollment,
	                                       HttpSession session) {

	    Integer studentId = (Integer) session.getAttribute("userId");
	    enrollment.setStudentId(studentId);

	    internshipenrollmentrepository.save(enrollment);

	    return "redirect:/studentDashboard";
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
