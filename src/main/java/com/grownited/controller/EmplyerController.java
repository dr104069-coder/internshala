package com.grownited.controller;

import java.time.LocalDate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

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

}
