/*package com.grownited.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.grownited.entity.UserEntity;
import com.grownited.repository.UserRepository;

@Controller
class SessionController {
	
	@Autowired
	UserRepository userRepository; 
	
	@GetMapping("/signup")
	public String opensignuppage() {
		return "Signup";
	}
	
	@GetMapping("/login")
	public String openLoginpage() {
		return "login";
	}
	
	@GetMapping("/forgetpassword")
	public String openForgetPassword() {
		return "forgetpassword";
	}
	
	@PostMapping("/register")
	public String register(UserEntity userEntity) {
	public String register(UserEntity userEntity, UserDetailEntity userDetailEntity) {
		System.out.println(userEntity.getFirstName());
		System.out.println(userEntity.getLastName());
		System.out.println("Processor => " + Runtime.getRuntime().availableProcessors());
		System.out.println(userDetailEntity.getCountry());
		System.out.println(userDetailEntity.getState());

		
		userEntity.setRole("PARTICIPANT");
		userEntity.setActive(true);
		userEntity.setCreatedAt(LocalDate.now());
		
		// users insert -> UserRepository
		// new -> X
		userRepository.save(userEntity);
		
		 
		return "Login";
	}
	
	/*@PostMapping("/register")
	
	public String register(String firstName,String lastName,String email,String phoneNumber,String password,String confirmPassword) {
		System.out.println(firstName);
		System.out.println(lastName);
		System.out.println(email);
		System.out.println(phoneNumber);
		System.out.println(password);
		System.out.println(confirmPassword);
		return "login";
	} 
	
	@PostMapping("/register")
	public String register(
	        String firstName,
	        String lastName,
	        String email,
	        String phoneNumber,
	        String password,
	        String confirmPassword) {

	    System.out.println("FIRST NAME: " + firstName);
	    System.out.println("LAST NAME: " + lastName);
	    System.out.println("EMAIL: " + email);
	    System.out.println("PHONE: " + phoneNumber);
	    System.out.println("PASSWORD: " + password);
	    System.out.println("CONFIRM: " + confirmPassword);
	
	

	    return "login";
	}

} */

package com.grownited.controller;

import java.io.IOException;
import java.time.Duration;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.cloudinary.Cloudinary;
import com.grownited.entity.EmployerEntity;
import com.grownited.entity.InternshipEntity;
import com.grownited.entity.StudentDetailEntity;
import com.grownited.entity.UserDetailEntity;
import com.grownited.entity.UserEntity;
import com.grownited.repository.EmployerRepository;
import com.grownited.repository.InternshipRepository;
import com.grownited.repository.StudentDetailRepository;
import com.grownited.repository.UserDetailRepository;
import com.grownited.repository.UserRepository;
import com.grownited.service.EmailService;

import jakarta.servlet.http.HttpSession;

@Controller
public class SessionController {

    @Autowired
    private UserRepository userRepository;
    
    @Autowired
	UserDetailRepository userDetailRepository;
    
    @Autowired
    StudentDetailRepository studentDetailRepository;

    @Autowired
    EmployerRepository employerRepository;
    
    @Autowired
    InternshipRepository internshipRepository;
    
    @Autowired
    private EmailService emailService;


    @Autowired
	PasswordEncoder passwordEncoder;
    
    @Autowired
	Cloudinary cloudinary;

    
    
	@GetMapping("/signup")
    public String openSignupPage() {
        return "Signup";
    }
    
   

    @GetMapping("/login")
    public String openLoginPage() {
        return "login";
    }
    
//    @PostMapping("/login")
//    public String login(String email, String password, HttpSession session) {
//
//        UserEntity user = userRepository.findByEmailAndPassword(email, password);
//
//        if (user != null) {
//
//            session.setAttribute("userId", user.getUserId());
//            session.setAttribute("role", user.getRole());
//
//            return "redirect:/dashboard";
//        }
//
//        return "login";
//    }
    
    @PostMapping("/authenticate")
	public String authenticate(String email, String password,Model model,HttpSession session) {
		Optional<UserEntity> op = userRepository.findByEmail(email);

		if (op.isPresent()) {
			UserEntity dbUser = op.get();
			session.setAttribute("user", dbUser);
			
			
			if (passwordEncoder.matches(password, dbUser.getPassword())) {
			//if (dbUser.getPassword().equals(password)) {
				if (dbUser.getRole().equals("ADMIN")) {
					return "redirect:/dashboard";// url '
				} else if (dbUser.getRole().equals("STUDENT")) {
					return "redirect:/studentDashboard";// url '
				} else if (dbUser.getRole().equals("EMPLOYER")) {
					return "redirect:/employerdashboard";
				}
			}
		}
		
		model.addAttribute("error","Invalid Credentials");
		return "login";
	}
   
   
    
    
//    @GetMapping("/studentDashboard")
//    public String studentDashboard(Model model) {
//        List<InternshipEntity> liveInternships = 
//                internshipRepository.findByStatus("OPEN");
//        
//        List<InternshipEntity> upcomingInternships = 
//                internshipRepository.findByStatus("UPCOMING");
//        
//        model.addAttribute("liveInternships", liveInternships);
//        model.addAttribute("upcomingInternships", upcomingInternships);
//        
//        return "studentDashboard";
//    }
    
    
    @GetMapping("/studentDashboard")
    public String studentDashboard(Model model) {

        LocalDate today = LocalDate.now();

        List<InternshipEntity> liveInternships =
                internshipRepository.findByStartDateLessThanEqualAndLastApplyDateGreaterThanEqual(today, today);

        List<InternshipEntity> upcomingInternships =
                internshipRepository.findByStartDateGreaterThan(today);

        model.addAttribute("liveInternships", liveInternships);
        model.addAttribute("upcomingInternships", upcomingInternships);

        model.addAttribute("liveInternshipsCount", liveInternships.size());
        model.addAttribute("upcomingInternshipsCount", upcomingInternships.size());
        
        LocalDate today1 = LocalDate.now();
        List<InternshipEntity> allInternships = internshipRepository.findAll();
        List<InternshipEntity> activeInternships1 = allInternships.stream()
            .filter(internship -> {
                String status = internship.getStatus();
                // Consider OPEN if lastApplyDate is today or future
                if ("OPEN".equals(status)) {
                    return !internship.getLastApplyDate().isBefore(today1);
                }
                // Consider UPCOMING if startDate is in future
                if ("UPCOMING".equals(status)) {
                    return internship.getStartDate().isAfter(today1);
                }
                return false;
            })
            .collect(Collectors.toList());
        
        List<String> uniqueLocations = internshipRepository.findDistinctLocations();
        
        model.addAttribute("activeInternships", activeInternships1);
        model.addAttribute("activeInternshipsCount", activeInternships1.size());
        model.addAttribute("uniqueLocations", uniqueLocations);
        model.addAttribute("stipendFilter", "all"); // Default filter

        return "studentDashboard";
    }
    
    
//    @GetMapping("/viewInternshipDetails")
//    public String viewInternshipDetails(@RequestParam("internshipId") Integer internshipId, Model model) {
//        InternshipEntity internship = internshipRepository.findById(internshipId).orElse(null);
//        model.addAttribute("internship", internship);
//        return "viewInternshipDetails";
//    }
    
    
    @GetMapping("/viewInternshipDetails")
    public String viewInternshipDetails(@RequestParam("internshipId") Integer internshipId, 
                                       HttpSession session, 
                                       Model model) {
        
        InternshipEntity internship = internshipRepository.findById(internshipId).orElse(null);
        
        if (internship != null) {
            LocalDate today = LocalDate.now();
            
            // Check if user has already applied (you need to implement this based on your application system)
            // For now, I'll assume you have a way to check this
            // Integer userId = (Integer) session.getAttribute("userId");
            // boolean hasApplied = applicationRepository.existsByInternshipIdAndUserId(internshipId, userId);
            boolean hasApplied = false; // Replace with actual check
            
            // Calculate internship status based on dates
            String calculatedStatus;
            boolean shouldShowApply = false;
            long daysUntilStart = 0;
            long hoursUntilStart = 0;
            long minutesUntilStart = 0;
            String timeRemainingText = "";
            
            if (internship.getStartDate().isAfter(today)) {
                calculatedStatus = "UPCOMING";
                
                // Calculate time remaining until start date
                daysUntilStart = ChronoUnit.DAYS.between(today, internship.getStartDate());
                
                // For more precise countdown, we can use LocalDateTime
                LocalDateTime now = LocalDateTime.now();
                LocalDateTime startDateTime = internship.getStartDate().atStartOfDay();
                
                Duration duration = Duration.between(now, startDateTime);
                long totalHours = duration.toHours();
                long totalMinutes = duration.toMinutes();
                
                daysUntilStart = totalHours / 24;
                hoursUntilStart = totalHours % 24;
                minutesUntilStart = totalMinutes % 60;
                
                // Create readable text
                if (daysUntilStart > 0) {
                    timeRemainingText = daysUntilStart + " day" + (daysUntilStart > 1 ? "s" : "");
                    if (hoursUntilStart > 0) {
                        timeRemainingText += " " + hoursUntilStart + " hour" + (hoursUntilStart > 1 ? "s" : "");
                    }
                } else if (hoursUntilStart > 0) {
                    timeRemainingText = hoursUntilStart + " hour" + (hoursUntilStart > 1 ? "s" : "");
                    if (minutesUntilStart > 0) {
                        timeRemainingText += " " + minutesUntilStart + " minute" + (minutesUntilStart > 1 ? "s" : "");
                    }
                } else if (minutesUntilStart > 0) {
                    timeRemainingText = minutesUntilStart + " minute" + (minutesUntilStart > 1 ? "s" : "");
                } else {
                    timeRemainingText = "Less than a minute";
                }
                
            } else if (internship.getLastApplyDate().isAfter(today) || 
                       internship.getLastApplyDate().isEqual(today)) {
                calculatedStatus = "OPEN";
                shouldShowApply = true;
            } else {
                calculatedStatus = "CLOSED";
            }
            
            model.addAttribute("internship", internship);
            model.addAttribute("calculatedStatus", calculatedStatus);
            model.addAttribute("hasApplied", hasApplied);
            model.addAttribute("shouldShowApply", shouldShowApply);
            model.addAttribute("daysUntilStart", daysUntilStart);
            model.addAttribute("hoursUntilStart", hoursUntilStart);
            model.addAttribute("minutesUntilStart", minutesUntilStart);
            model.addAttribute("timeRemainingText", timeRemainingText);
            
            // Add start date timestamp for JavaScript countdown
            model.addAttribute("startDateTime", internship.getStartDate().atStartOfDay().toString());
        }
        
        return "viewInternshipDetails";
    }
    
    
    @GetMapping("/internships")
    public String viewAllInternships(Model model) {
        // Get only OPEN and UPCOMING internships
        List<InternshipEntity> activeInternships = internshipRepository.findByStatusIn(
            Arrays.asList("OPEN", "UPCOMING")
        );
        
        // Or if you want to filter by dates as well
        LocalDate today = LocalDate.now();
        List<InternshipEntity> allInternships = internshipRepository.findAll();
        List<InternshipEntity> activeInternships1 = allInternships.stream()
            .filter(internship -> {
                String status = internship.getStatus();
                // Consider OPEN if lastApplyDate is today or future
                if ("OPEN".equals(status)) {
                    return !internship.getLastApplyDate().isBefore(today);
                }
                // Consider UPCOMING if startDate is in future
                if ("UPCOMING".equals(status)) {
                    return internship.getStartDate().isAfter(today);
                }
                return false;
            })
            .collect(Collectors.toList());
        
        List<String> uniqueLocations = internshipRepository.findDistinctLocations();
        
        model.addAttribute("activeInternships", activeInternships1);
        model.addAttribute("activeInternshipsCount", activeInternships1.size());
        model.addAttribute("uniqueLocations", uniqueLocations);
        model.addAttribute("stipendFilter", "all"); // Default filter
        
        return "internships";
    }
    
    
    
    
    @GetMapping("/employerdashboard")
    public String openemployerdashboard() {
        return "employerdashboard";
    }

    @GetMapping("/forgetpassword")
    public String openForgetPassword() {
        return "forgetpassword";
    }
    
//    @PostMapping("/ResetPassword")
//    public String openResetPassword() {
//        return "ResetPassword";
//    }
    
    @GetMapping("/dashboard")
    public String openDashboard() {
        return "dashboard"; 
    }

    @PostMapping("/register")
    public String register(UserEntity userEntity,UserDetailEntity userDetailEntity,MultipartFile profilePic) {

        System.out.println(userEntity.getFirstName());
        System.out.println(userEntity.getLastName());
        System.out.println("Processor => " + Runtime.getRuntime().availableProcessors());
        System.out.println(userDetailEntity.getCountry());
		System.out.println(userDetailEntity.getState());
		
        //userEntity.setRole("INTERN");
        userEntity.setActive(true);
        userEntity.setCreatedAt(LocalDate.now());
        
     // encode password
     		String encodedPassword = passwordEncoder.encode(userEntity.getPassword());
     		System.out.println(encodedPassword);
     		userEntity.setPassword(encodedPassword);
     		
     	// file uploading
    		System.out.println(profilePic.getOriginalFilename());
    		
    		try {
    			Map  map = 	cloudinary.uploader().upload(profilePic.getBytes(), null);
    			String profilePicURL = map.get("secure_url").toString();
    			System.out.println(profilePicURL);
    			userEntity.setProfilePicURL(profilePicURL);
    			
    		} catch (IOException e) {
    			// TODO Auto-generated catch block
    			e.printStackTrace();
    		}

        userRepository.save(userEntity);
        
        String role = userEntity.getRole();

        if ("STUDENT".equalsIgnoreCase(role)) {

            StudentDetailEntity student = new StudentDetailEntity();
            student.setUser(userEntity);
            student.setCreatedAt(LocalDateTime.now());

            studentDetailRepository.save(student);
        }

        if ("EMPLOYER".equalsIgnoreCase(role)) {

            EmployerEntity employer = new EmployerEntity();
            employer.setUser(userEntity);
            employer.setCreatedAt(LocalDate.now());
            employer.setCompanyVerified(false);

            employerRepository.save(employer);
        }
        
        userDetailEntity.setUserId(userEntity.getUserId());
		userDetailRepository.save(userDetailEntity);
		emailService.sendWelcomeEmail(
		        userEntity.getEmail(),
		        userEntity.getFirstName()
		);
		
		
        return "login";
    }
    
  
    @PostMapping("/sendOtp")
    public String sendOtp(String email, Model model, HttpSession session) {
        Optional<UserEntity> userOpt = userRepository.findByEmail(email);
        
        if (userOpt.isEmpty()) {
            model.addAttribute("error", "Email not registered");
            return "ForgotPassword";
        }

        UserEntity user = userOpt.get();

        // Generate 6-digit OTP
        String otp = String.valueOf(100000 + (int)(Math.random() * 900000));
        System.out.println("Generated OTP: " + otp);
        user.setOtp(otp);
        userRepository.save(user);

        // Store user id in session for reset password
        session.setAttribute("resetUserId", user.getUserId());

        // Send OTP via email
        String subject = "SmartIntern Password Reset OTP";
        emailService.sendOtpEmail(
                user.getEmail(),
                subject,
                user.getFirstName(),
                otp
        );

        model.addAttribute("success", "OTP sent to your email");
        return "ResetPassword";  // JSP page
    }
    
    
    @PostMapping("/verifyOtp")
    public String verifyOtp(String otp, String newPassword, String confirmPassword, HttpSession session, Model model) {
        Integer userId = (Integer) session.getAttribute("resetUserId");
        if (userId == null) {
            model.addAttribute("error", "Session expired. Try again.");
            return "ForgotPassword";
        }

        Optional<UserEntity> userOpt = userRepository.findById(userId);
        if (userOpt.isEmpty()) {
            model.addAttribute("error", "User not found");
            return "ForgotPassword";
        }

        UserEntity user = userOpt.get();

        if (!user.getOtp().equals(otp)) {
            model.addAttribute("error", "Invalid OTP");
            return "ResetPassword";
        }

        if (!newPassword.equals(confirmPassword)) {
            model.addAttribute("error", "Passwords do not match");
            return "ResetPassword";
        }

        // Update password and clear OTP
       // user.setPassword(newPassword);  // Ideally, hash the password
        user.setPassword(passwordEncoder.encode(newPassword));
        user.setOtp(null);
        userRepository.save(user);

        model.addAttribute("success", "Password reset successfully. Login now.");
        return "login";
    }
    
//    @PostMapping("/saveuser")
//    public String saveuser(UserEntity userEntity,UserDetailEntity userDetailEntity,MultipartFile profilePic) {
//
//        System.out.println(userEntity.getFirstName());
//        System.out.println(userEntity.getLastName());
//        System.out.println("Processor => " + Runtime.getRuntime().availableProcessors());
//        System.out.println(userDetailEntity.getCountry());
//		System.out.println(userDetailEntity.getState());
//		
//        //userEntity.setRole("INTERN");
//        userEntity.setActive(true);
//        userEntity.setCreatedAt(LocalDate.now());
//        
//     // encode password
//     		String encodedPassword = passwordEncoder.encode(userEntity.getPassword());
//     		System.out.println(encodedPassword);
//     		userEntity.setPassword(encodedPassword);
//     		
//     	// file uploading
//    		System.out.println(profilePic.getOriginalFilename());
//    		
//    		try {
//    			Map  map = 	cloudinary.uploader().upload(profilePic.getBytes(), null);
//    			String profilePicURL = map.get("secure_url").toString();
//    			System.out.println(profilePicURL);
//    			userEntity.setProfilePicURL(profilePicURL);
//    			
//    		} catch (IOException e) {
//    			// TODO Auto-generated catch block
//    			e.printStackTrace();
//    		}
//
//        userRepository.save(userEntity);
//        userDetailEntity.setUserId(userEntity.getUserId());
//		userDetailRepository.save(userDetailEntity);
//		emailService.sendWelcomeEmail(
//		        userEntity.getEmail(),
//		        userEntity.getFirstName()
//		);
//		
//		
//        return "listUser";
//    } 
    
    @GetMapping("/viewProfile")
    public String viewProfile(HttpSession session, Model model) {

        UserEntity user = (UserEntity) session.getAttribute("user");

        // ✅ Safety check
        if (user == null) {
            return "redirect:/login";
        }

        // ✅ Student Detail
        StudentDetailEntity studentDetail =
                studentDetailRepository.findByUser(user);

        // ✅ User Detail (SAFE)
        UserDetailEntity userDetail = null;

        if (user.getUserId() != null) {
            userDetail = userDetailRepository.findByUserId(user.getUserId());
        }

        boolean isProfileComplete = false;

        if (studentDetail != null &&
            studentDetail.getCollegeName() != null &&
            !studentDetail.getCollegeName().isEmpty() &&
            studentDetail.getCity() != null &&
            !studentDetail.getCity().isEmpty() &&
            studentDetail.getDegree() != null) {

            isProfileComplete = true;
        }

        model.addAttribute("user", user);
        model.addAttribute("studentDetail", studentDetail);
        model.addAttribute("userDetail", userDetail);
        model.addAttribute("isProfileComplete", isProfileComplete);

        return "viewprofile";
    }
   
    
    @GetMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate(); 
		return "Login";
	}
}




