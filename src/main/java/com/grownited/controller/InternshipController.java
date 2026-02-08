package com.grownited.controller;

import java.time.LocalDateTime;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.grownited.entity.InternshipEntity;
import com.grownited.repository.InternshipRepository;

@Controller
public class InternshipController {
	
	@Autowired
	InternshipRepository internshiprepository;
	
	@GetMapping("/addInternship")
	public String openaddInternshipPage() {
		return "addInternship";
	}
	
	@PostMapping("/saveInternship")
	public String saveInternship(InternshipEntity internshipEntity) {

	    internshipEntity.setCreatedAt(LocalDateTime.now());
	    internshipEntity.setStatus("OPEN");   // default if needed

	    internshiprepository.save(internshipEntity);

	    return "redirect:/studentDashboard";
	}

}
