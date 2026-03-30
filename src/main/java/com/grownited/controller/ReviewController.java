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


//package com.grownited.controller;
//
//import java.time.LocalDate;
//import java.util.List;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//
//import com.grownited.entity.ReviewEntity;
//import com.grownited.repository.ReviewRepository;
//
//import jakarta.servlet.http.HttpSession;
//import org.springframework.ui.Model;
//
//@Controller
//public class ReviewController {
//
//    @Autowired
//    ReviewRepository reviewRepository;
//
//    // Open review page; internshipId can be null
//    @GetMapping("/review")
//    public String openReviewPage(
//            @RequestParam(name="internshipId", required=false) Integer internshipId,
//            HttpSession session,
//            Model model) {
//
//        // Store in session if present
//        if (internshipId != null) {
//            session.setAttribute("internshipId", internshipId);
//        }
//
//        // Pass to JSP (optional)
//        model.addAttribute("internshipId", session.getAttribute("internshipId"));
//        // Assume studentId is stored in session
//        model.addAttribute("studentId", session.getAttribute("userId")); 
//
//        return "review"; // review.jsp
//    }
//
//    // Save review
//    @PostMapping("/saveReview")
//    public String saveReview(
//            ReviewEntity reviewEntity,
//            HttpSession session) {
//
//        // Get internshipId from session if not passed
//        if (reviewEntity.getInternshipId() == null) {
//            Object internshipId = session.getAttribute("internshipId");
//            if (internshipId != null) {
//                reviewEntity.setInternshipId((Integer) internshipId);
//            }
//        }
//
//        // Get studentId from session if not passed
//        if (reviewEntity.getStudentId() == null) {
//            Object studentId = session.getAttribute("userId");
//            if (studentId != null) {
//                reviewEntity.setStudentId((Integer) studentId);
//            }
//        }
//
//        reviewEntity.setCreatedAt(LocalDate.now());
//        reviewRepository.save(reviewEntity);
//
//        return "redirect:/dashboard";
//    }
//    
//    @GetMapping("/listReview")
//    public String listReview(Model model) {
//        List<ReviewEntity> reviews = reviewRepository.findAll();
//        model.addAttribute("reviews", reviews);
//        return "listReview";
//    }
//
//    // View a single review
//    @GetMapping("/viewReview")
//    public String viewReview(@RequestParam Integer reviewId, Model model) {
//        ReviewEntity review = reviewRepository.findById(reviewId).orElse(null);
//        model.addAttribute("review", review);
//        return "viewReview";
//    }
//
//    // Delete a review
//    @GetMapping("/deleteReview")
//    public String deleteReview(@RequestParam Integer reviewId) {
//        reviewRepository.deleteById(reviewId);
//        return "redirect:/listReview";
//    }
//}