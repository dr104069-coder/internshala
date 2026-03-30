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
    
    
    
    
    @PostMapping("/saveEmployer")
    public String saveEmployer(EmployerEntity employerEntity,
                               HttpSession session) {

        UserEntity user = (UserEntity) session.getAttribute("user");

        if (user == null) {
            return "redirect:/login";
        }

        String role = user.getRole().trim().toUpperCase();

        if (!role.equals("EMPLOYER") && !role.equals("ADMIN")) {
            return "redirect:/login";
        }
        employerEntity.setUser(user);   // 🔐 SESSION FK
        employerEntity.setCreatedAt(LocalDate.now());
        employerEntity.setCompanyVerified(false);

        employerRepository.save(employerEntity);

        return "redirect:/listEmployer";
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


}
