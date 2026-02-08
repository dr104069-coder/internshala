package com.grownited.controller;

import java.time.LocalDateTime;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.grownited.entity.StudentDetailEntity;
import com.grownited.repository.StudentDetailRepository;

@Controller
public class StudentDeatilController {
	
	@Autowired
	StudentDetailRepository studentDetailRepository;
	
	@GetMapping("/studentDashboard")
    public String studentDashboard() {
        return "studentDashboard";  
        // means → studentDashboard.jsp
    }
	
	@GetMapping("/addStudentInfo")
	public String addstudentinfo() {
		return "addStudentInfo";
	}
	
	@PostMapping("/saveInformation")
	public String saveInformation(StudentDetailEntity studentDetailEntity) {

	    studentDetailEntity.setCreatedAt(LocalDateTime.now());
	    //studentDetailEntity.setActive(true);

	    studentDetailRepository.save(studentDetailEntity);

	    return "redirect:/studentDashboard";
	}
}
