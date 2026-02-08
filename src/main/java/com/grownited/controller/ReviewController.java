package com.grownited.controller;

import java.time.LocalDate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.grownited.entity.ReviewEntity;
import com.grownited.repository.ReviewRepository;

@Controller
public class ReviewController {

	@Autowired
	ReviewRepository reviewrepository;
	@GetMapping("/review")
	public String openreviewPage() {
		return "review"; // jsp name
	}
	
	@PostMapping("/saveReview")
	public String saveReview(ReviewEntity reviewentity) {

	    reviewentity.setCreatedAt(LocalDate.now());

	    reviewrepository.save(reviewentity);

	    return "redirect:/review";
	}
}
