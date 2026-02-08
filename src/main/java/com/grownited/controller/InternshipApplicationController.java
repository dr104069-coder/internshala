package com.grownited.controller;

import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.grownited.entity.InternshipApplicationEntity;
import com.grownited.repository.InternshipApplicationRepository;

import jakarta.servlet.http.HttpSession;

@Controller
public class InternshipApplicationController {
	
	@Autowired
	InternshipApplicationRepository internshipapplicationRepository;
	
	@GetMapping("/applyInternship")
	public String openapplyInternshipPage() {
		return "applyInternship"; // jsp name
	}
	/*@PostMapping("/saveApplication")
	public String saveApplication(InternshipApplicationEntity applicationEntity,
	                              HttpSession session) {

	    // get studentId from session
	    Integer studentId = (Integer) session.getAttribute("userId");

	    applicationEntity.setStudentId(studentId);
	    applicationEntity.setApplicationStatus("APPLIED");
	    applicationEntity.setAppliedAt(LocalDateTime.now());

	    internshipapplicationRepository.save(applicationEntity);

	    return "redirect:/studentDashboard";
	}*/
	@PostMapping("/saveApplication")
	public String saveApplication(
	        @ModelAttribute InternshipApplicationEntity applicationEntity,
	        @RequestParam("resumeFile") MultipartFile file,
	        HttpSession session) throws IOException {

	    Integer studentId = (Integer) session.getAttribute("userId");

	    applicationEntity.setStudentId(studentId);
	    applicationEntity.setApplicationStatus("APPLIED");
	    applicationEntity.setAppliedAt(LocalDateTime.now());

	    // Upload directory
	    String uploadDir = "C:/uploads/";

	    File directory = new File(uploadDir);
	    if (!directory.exists()) {
	        directory.mkdirs();   // 🔥 create folder automatically
	    }

	    String fileName = System.currentTimeMillis() + "_" + file.getOriginalFilename();
	    File destination = new File(uploadDir + fileName);

	    file.transferTo(destination);

	    applicationEntity.setResumeUrl(fileName);

	    internshipapplicationRepository.save(applicationEntity);

	    return "redirect:/studentDashboard";
	}


}
