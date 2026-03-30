package com.grownited.controller;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import org.springframework.web.multipart.MultipartFile;

import com.grownited.entity.InternshipApplicationEntity;
import com.grownited.entity.InternshipEntity;
import com.grownited.entity.UserEntity;
import com.grownited.repository.InternshipApplicationRepository;

import jakarta.servlet.http.HttpSession;

@Controller
public class InternshipApplicationController {

    @Autowired
    InternshipApplicationRepository internshipapplicationRepository;

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
        application.setResumeUrl(resumeFile.getOriginalFilename());
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
}