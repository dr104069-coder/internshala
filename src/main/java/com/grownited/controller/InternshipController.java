package com.grownited.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.cloudinary.Cloudinary;
import com.grownited.entity.EmployerEntity;
import com.grownited.entity.InternshipEntity;
import com.grownited.entity.UserEntity;
import com.grownited.repository.EmployerRepository;
import com.grownited.repository.InternshipRepository;

import jakarta.servlet.http.HttpSession;

@Controller
public class InternshipController {
	
	@Autowired
	InternshipRepository internshiprepository;
	
	@Autowired
	EmployerRepository employerRepository;
	
	
	@Autowired
	Cloudinary cloudinary;

	
	@GetMapping("/addInternship")
	public String openaddInternshipPage() {
		return "addInternship";
	}
	
	
	@GetMapping("/createInternship")
	public String openCreateInternship() {
	    return "createInternship";
	}
	
//	@PostMapping("/saveInternship")
//	public String saveInternship(InternshipEntity internshipEntity) {
//
//	    internshipEntity.setCreatedAt(LocalDateTime.now());
//	    internshipEntity.setStatus("OPEN");   // default if needed
//
//	    internshiprepository.save(internshipEntity);
//
//	    return "redirect:/dashboard";
//	}

	

//	@PostMapping("/saveInternship")
//	public String saveInternship(@ModelAttribute InternshipEntity internship, HttpSession session) {
//
//	    UserEntity user = (UserEntity) session.getAttribute("user");
//	    if (user == null) return "redirect:/login";
//
//	    List<EmployerEntity> employers = employerRepository.findAllByUser(user);
//	    EmployerEntity employer;
//
//	    if (employers.isEmpty()) {
//	        // Create a dummy employer for admin or new employer
//	        employer = new EmployerEntity();
//	        employer.setCompanyName(user.getRole().equals("ADMIN") ? "ADMIN DUMMY EMPLOYER" : "EMPLOYER PROFILE");
//	        employer.setUser(user);
//	        employerRepository.save(employer); // save so FK exists
//	    } else {
//	        // Pick the first employer safely
//	        employer = employers.get(0);
//	    }
//
//	    internship.setEmployer(employer);           // 🔗 FK
//	    internship.setCreatedAt(LocalDateTime.now()); 
//	    if (internship.getStatus() == null) internship.setStatus("OPEN");
//
//	    internshiprepository.save(internship);
//
//	    return "redirect:/dashboard";
//	}
	
	@PostMapping("/saveInternship")
	public String saveInternship(InternshipEntity internship,
	                             @RequestParam("posterFile") MultipartFile posterFile,
	                             HttpSession session) {

	    // 🔐 Get logged-in user
	    UserEntity user = (UserEntity) session.getAttribute("user");
	    if (user == null) {
	        return "redirect:/login";
	    }

	    EmployerEntity employer = null;

	    if ("EMPLOYER".equals(user.getRole())) {
	        employer = (EmployerEntity) employerRepository.findAllByUser(user);
	        if (employer == null) {
	            return "redirect:/login";
	        }
	    } else if ("ADMIN".equals(user.getRole())) {

	        employer = employerRepository.findAll().stream()
	                .filter(e -> e.getUser().getUserId().equals(user.getUserId()))
	                .findFirst()
	                .orElseGet(() -> {
	                    EmployerEntity adminEmp = new EmployerEntity();
	                    adminEmp.setUser(user);
	                    adminEmp.setCompanyName("ADMIN POSTED INTERNSHIPS");
	                    adminEmp.setCompanyType("ADMIN");
	                    adminEmp.setHrName("ADMIN");
	                    adminEmp.setCompanyVerified(true);
	                    adminEmp.setCreatedAt(LocalDate.now());
	                    return employerRepository.save(adminEmp);
	                });
	    } else {
	        return "redirect:/login";
	    }

	    // 🖼️ Cloudinary Upload Logic
	    try {
	        if (posterFile != null && !posterFile.isEmpty()) {

	            Map<String, Object> map = cloudinary.uploader().upload(posterFile.getBytes(), null);

	            String posterUrl = map.get("secure_url").toString();

	            internship.setPosterUrl(posterUrl);
	        }
	    } catch (IOException e) {
	        e.printStackTrace();
	    }

	    // 🔗 Link employer and set defaults
	    internship.setEmployer(employer);
	    internship.setCreatedAt(LocalDateTime.now());

	    internshiprepository.save(internship);

	    return "redirect:/listInternship";
	}
	
	
	
	@PostMapping("/saveInternshipEmployer")
	public String saveInternshipByEmployer(InternshipEntity internship,
	                                       @RequestParam("posterFile") MultipartFile posterFile,
	                                       HttpSession session) {

	    // 🔐 Get logged-in user
	    UserEntity user = (UserEntity) session.getAttribute("user");

	    if (user == null || !"EMPLOYER".equals(user.getRole())) {
	        return "redirect:/login";
	    }

	    // 🔗 Get employer (FIXED - no casting issue)
	    List<EmployerEntity> employers = employerRepository.findAllByUser(user);

	    if (employers.isEmpty()) {
	        return "redirect:/employer"; // create employer profile first
	    }

	    EmployerEntity employer = employers.get(0);

	    // 🖼️ Upload Poster (Cloudinary)
	    try {
	        if (posterFile != null && !posterFile.isEmpty()) {
	            Map<String, Object> map = cloudinary.uploader().upload(posterFile.getBytes(), null);
	            String posterUrl = map.get("secure_url").toString();
	            internship.setPosterUrl(posterUrl);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    // ⚙️ Set backend fields
	    internship.setEmployer(employer);          // 🔐 SESSION FK
	    internship.setCreatedAt(LocalDateTime.now());
	    internship.setStatus("ACTIVE");            // default status

	    // 💾 Save
	    internshiprepository.save(internship);

	    return "redirect:/employerdashboard";
	}
	
	
	
	@GetMapping("/listInternship")
	public String listInternship(Model model) {
	    // Get all internships
	    List<InternshipEntity> internshipList = internshiprepository.findAll();
	    model.addAttribute("internshipList", internshipList);
	    return "listInternship"; // JSP page: listInternship.jsp
	}

	@GetMapping("/viewInternship")
	public String viewInternship(@RequestParam Integer internshipId, Model model) {
	    // Find internship by ID
	    InternshipEntity internship = internshiprepository
	            .findById(internshipId)
	            .orElse(null);

	    model.addAttribute("internship", internship);
	    return "viewInternship"; // JSP page: viewInternship.jsp
	}

	@GetMapping("/deleteInternship")
	public String deleteInternship(@RequestParam Integer internshipId) {
	    // Delete internship by ID
	    internshiprepository.deleteById(internshipId);
	    return "redirect:/listInternship";
	}

}
