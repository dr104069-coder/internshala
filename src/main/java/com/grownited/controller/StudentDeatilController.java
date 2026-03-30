package com.grownited.controller;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.grownited.entity.StudentDetailEntity;
import com.grownited.entity.UserEntity;
import com.grownited.repository.StudentDetailRepository;

import jakarta.servlet.http.HttpSession;

@Controller
public class StudentDeatilController {
	
	@Autowired
	StudentDetailRepository studentDetailRepository;
	
	
	
//	@GetMapping("/studentDashboard")
//    public String studentDashboard() {
//        return "studentDashboard";  
//        // means → studentDashboard.jsp
//    }
	
	@GetMapping("/addStudentInfo")
	public String addstudentinfo() {
		return "addStudentInfo";
	}
	
	
	@GetMapping("/completeProfile")
	public String completeProfile() {
	    return "completeProfile";
	}
	
//	@PostMapping("/saveInformation")
//	public String saveInformation(StudentDetailEntity studentDetailEntity) {
//
//	    studentDetailEntity.setCreatedAt(LocalDateTime.now());
//	    //studentDetailEntity.setActive(true);
//
//	    studentDetailRepository.save(studentDetailEntity);
//
//	    return "redirect:/studentDashboard";
//	}
	
	@PostMapping("/saveInformation")
	public String saveInformation(StudentDetailEntity studentDetailEntity,
	                              HttpSession session) {

	    UserEntity user = (UserEntity) session.getAttribute("user");

	    if (user == null) {
	        return "redirect:/login";
	    }

	    studentDetailEntity.setUser(user);   // 🔐 FK from session
	    studentDetailEntity.setCreatedAt(LocalDateTime.now());

	    studentDetailRepository.save(studentDetailEntity);

	    return "redirect:/listStudent";
	}
	
	@PostMapping("/saveStudentProfile")
	public String saveStudentProfile(StudentDetailEntity formData,
	                                 HttpSession session) {

	    UserEntity user = (UserEntity) session.getAttribute("user");

	    if (user == null) {
	        return "redirect:/login";
	    }

	    StudentDetailEntity existing =
	            studentDetailRepository.findByUser(user);

	    if (existing != null) {

	        existing.setCity(formData.getCity());
	        existing.setState(formData.getState());
	        existing.setCollegeName(formData.getCollegeName());
	        existing.setDegree(formData.getDegree());
	        existing.setSemester(formData.getSemester());
	        existing.setGraduationYear(formData.getGraduationYear());
	        existing.setTshirtSize(formData.getTshirtSize());

	        studentDetailRepository.save(existing);
	    }

	    return "redirect:/viewProfile";
	}
	
	@GetMapping("/listStudent")
	public String listStudent(Model model) {

	    List<StudentDetailEntity> studentList =
	            studentDetailRepository.findAll();

	    model.addAttribute("studentList", studentList);

	    return "listStudent";
	}
	
	@GetMapping("/viewStudent")
	public String viewStudent(@RequestParam Integer studentDetailId,
	                                Model model) {

	    StudentDetailEntity student =
	            studentDetailRepository
	                    .findById(studentDetailId)
	                    .orElse(null);

	    model.addAttribute("student", student);

	    return "viewStudent";
	}
	
	@GetMapping("/deleteStudent")
	public String deleteStudent(@RequestParam Integer studentDetailId) {

	    studentDetailRepository.deleteById(studentDetailId);

	    return "redirect:/listStudent";
	}



	
	
}
