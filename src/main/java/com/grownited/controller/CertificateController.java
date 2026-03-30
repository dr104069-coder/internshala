package com.grownited.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.grownited.entity.CertificateEntity;
import com.grownited.entity.InternshipEnrollmentEntity;
import com.grownited.repository.CertificateRepository;
import com.grownited.repository.InternshipEnrollmentRepository;

@Controller
public class CertificateController {

	private static final String ENROLLMENT_ID = "enrollmentId";

	@Autowired
	CertificateRepository certificaterepository;
	
	@Autowired
	InternshipEnrollmentRepository internshipEnrollmentRepository;
	
//	@GetMapping("/certificate")
//	public String opencertificatePage() {
//		return "certificate"; // jsp name
//	}
	
	@GetMapping("/certificate")
	public String opencertificatePage(Model model) {

	    List<InternshipEnrollmentEntity> enrollments =
	            internshipEnrollmentRepository.findByStatus("COMPLETED");

	    model.addAttribute("enrollments", enrollments);

	    return "certificate";
	}
	
//	@PostMapping("/saveCertificate")
//	public String saveCertificate(CertificateEntity certificate) {
//
//	    // Generate unique verification code
//	    String code = "SI" + System.currentTimeMillis();
//	    certificate.setVerificationCode(code);
//
//	    certificaterepository.save(certificate);
//
//	    return "redirect:/certificate";
//	}
	
	
	
	@PostMapping("/saveCertificate")
	public String saveCertificate(
	        @RequestParam(ENROLLMENT_ID) Integer enrollmentId,
	        CertificateEntity certificate) {

	    // 1️⃣ Fetch Enrollment Object
	    InternshipEnrollmentEntity enrollment =
	            internshipEnrollmentRepository
	            .findById(enrollmentId)
	            .orElse(null);

	    // 2️⃣ Set Enrollment FK
	    certificate.setEnrollment(enrollment);

	    // 3️⃣ Generate verification code
	    String code = "SI" + System.currentTimeMillis();
	    certificate.setVerificationCode(code);

	    // 4️⃣ Save
	    certificaterepository.save(certificate);

	    return "redirect:/listCertificate";
	}
	
	
	@GetMapping("/listCertificate")
	public String listCertificate(Model model) {

	    List<CertificateEntity> certificateList = certificaterepository.findAll();

	    model.addAttribute("certificateList", certificateList);

	    return "listCertificate";
	}
	
	@GetMapping("/viewCertificate")
	public String viewCertificate(@RequestParam Integer certificateId, Model model) {

	    CertificateEntity certificate = certificaterepository
	            .findById(certificateId)
	            .orElse(null);

	    model.addAttribute("certificate", certificate);

	    return "viewCertificate";
	}
	
	
	@GetMapping("/deleteCertificate")
	public String deleteCertificate(@RequestParam Integer certificateId) {

	    certificaterepository.deleteById(certificateId);

	    return "redirect:/listCertificate";
	}
}
