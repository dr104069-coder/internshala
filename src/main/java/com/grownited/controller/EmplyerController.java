package com.grownited.controller;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.grownited.entity.EmployerEntity;
import com.grownited.entity.UserEntity;
import com.grownited.repository.EmployerRepository;

import jakarta.servlet.http.HttpSession;

@Controller
public class EmplyerController {

    @Autowired
    EmployerRepository employerRepository;

    @GetMapping("/employer")
    public String openEmployerPage() {
        return "employer";  // employer.jsp
    }
    
   
    
    @GetMapping("/profileemployer")
    public String employerProfile(HttpSession session, Model model) {

        UserEntity user = (UserEntity) session.getAttribute("user");

        if (user == null) {
            return "redirect:/login";
        }

        EmployerEntity employer = employerRepository.findByUser(user);

        model.addAttribute("user", user);
        model.addAttribute("employer", employer);

        return "profileemployer";
    }
    
    
    @GetMapping("/viewemployerProfile")
    public String viewEmployerProfile(HttpSession session, Model model) {

        UserEntity user = (UserEntity) session.getAttribute("user");

        if (user == null) {
            return "redirect:/login";
        }

        EmployerEntity employer = employerRepository.findByUser(user);

        boolean isProfileComplete = false;

        if (employer != null &&
            employer.getCompanyName() != null && !employer.getCompanyName().isEmpty() &&
            employer.getCompanyType() != null && !employer.getCompanyType().isEmpty() &&
            employer.getHrName() != null && !employer.getHrName().isEmpty() &&
            employer.getHrMobile() != null && !employer.getHrMobile().isEmpty()) {

            isProfileComplete = true;
        }

        model.addAttribute("user", user);
        model.addAttribute("employer", employer);
        model.addAttribute("isProfileComplete", isProfileComplete);

        return "viewemployerProfile";
    }
    
    
    @PostMapping("/saveEmployer")
    public String saveEmployer(EmployerEntity formData,
                               HttpSession session) {

        UserEntity user = (UserEntity) session.getAttribute("user");

        if (user == null) {
            return "redirect:/login";
        }

        EmployerEntity existing = employerRepository.findByUser(user);

        if (existing != null) {

            // 🔄 UPDATE
            existing.setCompanyName(formData.getCompanyName());
            existing.setCompanyType(formData.getCompanyType());
            existing.setWebsite(formData.getWebsite());
            existing.setCompanyAddress(formData.getCompanyAddress());
            existing.setHrName(formData.getHrName());
            existing.setHrMobile(formData.getHrMobile());

            employerRepository.save(existing);

        } else {

            // 🆕 INSERT
            formData.setUser(user);   // 🔐 SESSION FK
            formData.setCreatedAt(LocalDate.now());
            formData.setCompanyVerified(false);

            employerRepository.save(formData);
        }

        return "redirect:/viewemployerProfile";
    }

//    @PostMapping("/saveEmployer")
//    public String saveEmployer(EmployerEntity employerEntity) {
//
//        employerEntity.setCreatedAt(LocalDate.now());
//        employerEntity.setCompanyVerified(false);
//
//        employerRepository.save(employerEntity);
//
//        return "redirect:/employerdashboard";
//    }
    
  /*  @PostMapping("/saveEmployer")
    public String saveEmployer(EmployerEntity employerEntity, HttpSession session) {

        Integer userId = (Integer) session.getAttribute("userId");

        if (userId == null) {
            return "redirect:/login";
        }

        employerEntity.setUserId(userId);
        employerEntity.setCreatedAt(LocalDate.now());
        employerEntity.setCompanyVerified(false);

        employerRepository.save(employerEntity);

        return "redirect:/dashboard";
    }*/
    
    @GetMapping("/listEmployer")
    public String listEmployer(Model model) {

        List<EmployerEntity> employerList = employerRepository.findAll();

        model.addAttribute("employerList", employerList);

        return "listEmployer";
    }
    
    
    @GetMapping("/viewEmployer")
    public String viewEmployer(@RequestParam Integer employerId, Model model) {

        EmployerEntity employer = employerRepository
                .findById(employerId)
                .orElse(null);

        model.addAttribute("employer", employer);

        return "viewEmployer";
    }
    
    @GetMapping("/deleteEmployer")
    public String deleteEmployer(Integer employerId) {

        employerRepository.deleteById(employerId);

        return "redirect:/listEmployer";
    }

    
    @GetMapping("/editemployer")
    public String editEmployer(@RequestParam(value = "employerId", required = false) Integer employerId, 
                               Model model) {
        
        // If no employerId provided, redirect to list
        if (employerId == null) {
            return "redirect:/listEmployer";
        }
        
        EmployerEntity employer = employerRepository.findById(employerId).orElse(null);
        
        if (employer == null) {
            model.addAttribute("error", "Employer not found with ID: " + employerId);
            return "redirect:/listEmployer";
        }
        
        model.addAttribute("employer", employer);
        return "editemployer";
    }
    
    
    @PostMapping("/updateEmployer")
    public String updateEmployer(EmployerEntity updatedEmployer, Model model) {

        // Fetch existing employer from database
        EmployerEntity existing = employerRepository
                .findById(updatedEmployer.getEmployerId())
                .orElse(null);

        if (existing == null) {
            model.addAttribute("error", "Employer not found!");
            return "editemployer";
        }

        // Update only allowed fields (preserve user, createdAt, etc.)
        existing.setCompanyName(updatedEmployer.getCompanyName());
        existing.setCompanyType(updatedEmployer.getCompanyType());
        existing.setWebsite(updatedEmployer.getWebsite());
        existing.setCompanyAddress(updatedEmployer.getCompanyAddress());
        existing.setHrName(updatedEmployer.getHrName());
        existing.setHrMobile(updatedEmployer.getHrMobile());
        existing.setCompanyVerified(updatedEmployer.getCompanyVerified());

        employerRepository.save(existing);

        model.addAttribute("success", "Employer details updated successfully!");
        model.addAttribute("employer", existing);

        return "viewEmployer";
    }
    

}
