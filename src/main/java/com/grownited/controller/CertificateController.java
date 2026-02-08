package com.grownited.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.grownited.entity.CertificateEntity;
import com.grownited.repository.CertificateRepository;

@Controller
public class CertificateController {

	@Autowired
	CertificateRepository certificaterepository;
	
	@GetMapping("/certificate")
	public String opencertificatePage() {
		return "certificate"; // jsp name
	}
	
	@PostMapping("/saveCertificate")
	public String saveCertificate(CertificateEntity certificate) {

	    // Generate unique verification code
	    String code = "SI" + System.currentTimeMillis();
	    certificate.setVerificationCode(code);

	    certificaterepository.save(certificate);

	    return "redirect:/certificate";
	}
}
