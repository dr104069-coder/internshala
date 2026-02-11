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
import com.grownited.repository.EmployerRepository;

@Controller
public class EmplyerController {

    @Autowired
    EmployerRepository employerRepository;

    @GetMapping("/employer")
    public String openEmployerPage() {
        return "employer";  // employer.jsp
    }

    @PostMapping("/saveEmployer")
    public String saveEmployer(EmployerEntity employerEntity) {

        employerEntity.setCreatedAt(LocalDate.now());
        employerEntity.setCompanyVerified(false);

        employerRepository.save(employerEntity);

        return "redirect:/studentDashboard";
    }
    
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
