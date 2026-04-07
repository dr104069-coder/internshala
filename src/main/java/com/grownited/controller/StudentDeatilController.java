package com.grownited.controller;

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
import com.grownited.entity.StudentDetailEntity;
import com.grownited.entity.UserEntity;
import com.grownited.repository.StudentDetailRepository;

import jakarta.servlet.http.HttpSession;

@Controller
public class StudentDeatilController {
	
	@Autowired
	StudentDetailRepository studentDetailRepository;
	
	 @Autowired
		Cloudinary cloudinary;
	
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


	// GET mapping to show edit form
	@GetMapping("/editStudent")
	public String editStudent(@RequestParam Integer studentDetailId, Model model) {
		
		
	    
	    StudentDetailEntity student = studentDetailRepository.findById(studentDetailId)
	            .orElseThrow(() -> new RuntimeException("Student not found"));
	    
	    model.addAttribute("student", student);
	    
	    return "editStudent";
	}

	// POST mapping to update student
	@PostMapping("/updateStudent")
	public String updateStudent(
	        @RequestParam Integer studentDetailId,
	        @RequestParam(required = false) String collegeName,
	        @RequestParam(required = false) String degree,
	        @RequestParam(required = false) Integer semester,
	        @RequestParam(required = false) Integer graduationYear,
	        @RequestParam(required = false) String tshirtSize,
	        @RequestParam(required = false) String city,
	        @RequestParam(required = false) String state,
	        @RequestParam(required = false) MultipartFile profilePic,
	        @RequestParam(required = false) MultipartFile resume) {
	    
	    // Get existing student record
	    StudentDetailEntity student = studentDetailRepository.findById(studentDetailId)
	            .orElseThrow(() -> new RuntimeException("Student not found"));
	    
	    // Update fields
	    student.setCollegeName(collegeName);
	    student.setDegree(degree);
	    student.setSemester(semester);
	    student.setGraduationYear(graduationYear);
	    student.setTshirtSize(tshirtSize);
	    student.setCity(city);
	    student.setState(state);
	    
	    // Handle profile picture upload (if you have Cloudinary configured)
	    if (profilePic != null && !profilePic.isEmpty()) {
	        try {
	            Map map = cloudinary.uploader().upload(profilePic.getBytes(), null);

	            // ✅ Store full URL (same as user)
	            student.setProfilePicPath(map.get("secure_url").toString());

	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
	    
	    // Handle resume upload
	    if (resume != null && !resume.isEmpty()) {
	        try {
	            student.setResumePath(resume.getOriginalFilename());
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
	    
	    studentDetailRepository.save(student);
	    
	    return "redirect:/viewStudent?studentDetailId=" + studentDetailId;
	}
	
	
}
