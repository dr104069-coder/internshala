package com.grownited.controller;

import java.io.InputStream;
import java.net.URL;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import org.springframework.web.multipart.MultipartFile;

import com.cloudinary.Cloudinary;
import com.grownited.entity.EmployerEntity;
import com.grownited.entity.InternshipApplicationEntity;
import com.grownited.entity.InternshipEnrollmentEntity;
import com.grownited.entity.InternshipEntity;
import com.grownited.entity.UserEntity;
import com.grownited.repository.EmployerRepository;
import com.grownited.repository.InternshipApplicationRepository;
import com.grownited.repository.InternshipEnrollmentRepository;
import com.grownited.repository.InternshipRepository;

import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class InternshipApplicationController {

    @Autowired
    InternshipApplicationRepository internshipapplicationRepository;
    
    @Autowired
    EmployerRepository employerRepository;
    
    @Autowired
    InternshipEnrollmentRepository internshipenrollmentrepository;
    
    @Autowired
	InternshipRepository internshiprepository;
    
    @Autowired
    Cloudinary cloudinary;

    // OPEN APPLY PAGE
    @GetMapping("/applyInternship")
    public String openapplyInternshipPage(
            @RequestParam Integer internshipId,
            Model model) {

        model.addAttribute("internshipId", internshipId);

        return "applyInternship";
    }

    // SAVE APPLICATION
    @PostMapping("/saveApplication")
    public String saveApplication(
            @RequestParam Integer internshipId,
            @RequestParam String coverLetter,
            @RequestParam MultipartFile resumeFile,
            HttpSession session) {

        UserEntity student = (UserEntity) session.getAttribute("user");

        InternshipApplicationEntity application = new InternshipApplicationEntity();

        InternshipEntity internship = new InternshipEntity();
        internship.setInternshipId(internshipId);

        application.setInternship(internship);
        application.setStudent(student);

        application.setCoverLetter(coverLetter);
        try {
        	Map uploadResult = cloudinary.uploader().upload(
        	        resumeFile.getBytes(),
        	        Map.of(
        	            "resource_type", "image"   // 🔥 FIX for PDF
        	            
        	        )
        	);
        	String resumeUrl = uploadResult.get("secure_url").toString();

        	// 🔥 FORCE VIEW (VERY IMPORTANT)
        	

            application.setResumeUrl(resumeUrl);

        } catch (Exception e) {
            e.printStackTrace();
        }
        application.setApplicationStatus("APPLIED");
        application.setAppliedAt(LocalDateTime.now());

        internshipapplicationRepository.save(application);

        return "redirect:/studentDashboard";
    }

    // LIST APPLICATIONS
    @GetMapping("/listapplications")
    public String listApplications(Model model) {

        List<InternshipApplicationEntity> applications =
                internshipapplicationRepository.findAll();

        model.addAttribute("applications", applications);

        return "listApplications";
    }

    // VIEW APPLICATION
    @GetMapping("/viewApplication")
    public String viewApplication(@RequestParam Integer applicationId, Model model) {

        InternshipApplicationEntity application =
                internshipapplicationRepository.findById(applicationId)
                        .orElse(null);

        model.addAttribute("application", application);

        return "viewApplication";
    }

    // DELETE APPLICATION
    @GetMapping("/deleteApplication")
    public String deleteApplication(@RequestParam Integer applicationId) {

        internshipapplicationRepository.deleteById(applicationId);

        return "redirect:/listapplications";
    }
    
    
    @GetMapping("/myApplications")
    public String myApplications(HttpSession session, Model model) {

        UserEntity user = (UserEntity) session.getAttribute("user");

        if (user == null) {
            return "redirect:/login";
        }

        // ✅ Fetch only logged-in user applications
        List<InternshipApplicationEntity> applications =
                internshipapplicationRepository.findByStudent(user);

        model.addAttribute("applications", applications);

        return "applications"; // new JSP
    }
    
    
    @GetMapping("/employerApplications")
    public String viewApplications(HttpSession session, Model model) {

        UserEntity user = (UserEntity) session.getAttribute("user");

        if (user == null) {
            return "redirect:/login";
        }

        EmployerEntity employer = employerRepository.findByUser(user);

        if (employer == null) {
            return "redirect:/profileemployer";
        }

        List<InternshipApplicationEntity> applications =
                internshipapplicationRepository
                .findByInternship_EmployerAndApplicationStatus(employer, "APPLIED");

        model.addAttribute("applications", applications);

        return "employerApplications";
    }
    
    
    
    
    
    @GetMapping("/updateApplicationStatus")
    public String updateStatus(@RequestParam Integer appId,
                               @RequestParam String status,
                               @RequestParam(required = false) String redirectUrl) {

        InternshipApplicationEntity app = internshipapplicationRepository.findById(appId).orElse(null);

        if (app != null) {
            // ✅ Update application status
            app.setApplicationStatus(status);
            internshipapplicationRepository.save(app);

            // 🔥 If ACCEPTED → add to enrollment table
            if ("ACCEPTED".equalsIgnoreCase(status)) {
                InternshipEnrollmentEntity enroll = new InternshipEnrollmentEntity();
                enroll.setStudent(app.getStudent());
                enroll.setInternship(app.getInternship());
                enroll.setJoiningDate(java.time.LocalDate.now());
                enroll.setStatus("ON_GOING");
                enroll.setCompletionDate(null);
                enroll.setPerformanceRating(null);
                internshipenrollmentrepository.save(enroll);
            }
        }

        // 🔹 Redirect to controller URL (not JSP)
        if (redirectUrl != null && !redirectUrl.isEmpty()) {
            return "redirect:" + redirectUrl;  // must be controller mapping
        } else {
            return "redirect:/employerApplications"; // default page
        }
    }
    
 // Add these methods to your InternshipApplicationController class

 // View applications for a specific internship (Employer)
    @GetMapping("/internshipApplications")
    public String internshipApplications(@RequestParam Integer internshipId, 
                                          HttpSession session, 
                                          Model model) {
        
        UserEntity user = (UserEntity) session.getAttribute("user");
        
        if (user == null) {
            return "redirect:/login";
        }
        
        // Get employer
        EmployerEntity employer = employerRepository.findByUser(user);
        
        if (employer == null) {
            return "redirect:/profileemployer";
        }
        
        // Get internship and verify it belongs to this employer
        InternshipEntity internship = internshiprepository.findById(internshipId).orElse(null);
        
        if (internship == null || internship.getEmployer().getEmployerId() != employer.getEmployerId()) {
            return "redirect:/employerdashboard";
        }
        
        // Get applications for this specific internship
        List<InternshipApplicationEntity> applications = 
            internshipapplicationRepository.findByInternship_EmployerAndApplicationStatus(employer, "APPLIED");
        
        // Filter applications for this specific internship
        List<InternshipApplicationEntity> internshipApplications = applications.stream()
            .filter(app -> app.getInternship().getInternshipId().equals(internshipId))
            .collect(Collectors.toList());
        
        model.addAttribute("applications", internshipApplications);
        model.addAttribute("internship", internship);
        model.addAttribute("applicationsCount", internshipApplications.size());
        
        return "internshipApplications";
    }
 
   
    
    @GetMapping("/viewCoverLetter")
    @ResponseBody
    public Map<String, Object> viewCoverLetter(@RequestParam Integer applicationId) {

        Map<String, Object> response = new HashMap<>();

        InternshipApplicationEntity app = internshipapplicationRepository
                .findById(applicationId)
                .orElse(null);

        if (app != null && app.getCoverLetter() != null) {
            response.put("success", true);
            response.put("content", app.getCoverLetter());
        } else {
            response.put("success", false);
        }

        return response;
    }
    
}