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
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Set;
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
import com.grownited.entity.CertificateEntity;
import com.grownited.entity.EmployerEntity;
import com.grownited.entity.InternshipApplicationEntity;
import com.grownited.entity.InternshipEnrollmentEntity;
import com.grownited.entity.InternshipEntity;
import com.grownited.entity.StudentDetailEntity;
import com.grownited.entity.UserDetailEntity;
import com.grownited.entity.UserEntity;
import com.grownited.repository.CertificateRepository;
import com.grownited.repository.EmployerRepository;
import com.grownited.repository.InternshipApplicationRepository;
import com.grownited.repository.InternshipEnrollmentRepository;
import com.grownited.repository.InternshipRepository;
import com.grownited.repository.StudentDetailRepository;
import com.grownited.repository.UserDetailRepository;
import com.grownited.repository.UserRepository;
import com.grownited.service.EmailService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import tools.jackson.databind.ObjectMapper;

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
    InternshipApplicationRepository internshipApplicationRepository;
    
    @Autowired
    private InternshipEnrollmentRepository internshipEnrollmentRepository;
    
    @Autowired
	CertificateRepository certificaterepository;
    
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
			
			
			
			if (passwordEncoder.matches(password, dbUser.getPassword())) {
				
				session.setAttribute("user", dbUser);
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
    public String studentDashboard(HttpSession session, Model model) {

        UserEntity user = (UserEntity) session.getAttribute("user");
        
        if (user == null) {
            return "redirect:/login";
        }

        LocalDate today = LocalDate.now();

        // Use the new repository methods for better accuracy
        List<InternshipEntity> liveInternships = internshipRepository.findLiveInternships();
        List<InternshipEntity> upcomingInternships = internshipRepository.findUpcomingInternshipsByApplyDate();
        
        // Fallback for legacy data - if no upcoming found with startApplyDate, use startDate
        if (upcomingInternships.isEmpty()) {
            List<InternshipEntity> legacyUpcoming = internshipRepository.findByStartDateGreaterThan(today);
            // Filter out any that have startApplyDate in the past (they should be live, not upcoming)
            legacyUpcoming.removeIf(internship -> 
                internship.getStartApplyDate() != null && !internship.getStartApplyDate().isAfter(today)
            );
            upcomingInternships = legacyUpcoming;
        }

        // IMPORTANT: Add current date for JSP comparisons
        model.addAttribute("currentDate", today);
        
        model.addAttribute("liveInternships", liveInternships);
        model.addAttribute("upcomingInternships", upcomingInternships);
        model.addAttribute("liveInternshipsCount", liveInternships.size());
        model.addAttribute("upcomingInternshipsCount", upcomingInternships.size());
        
        // Active internships (for filter/search functionality)
        List<InternshipEntity> allInternships = internshipRepository.findAllActiveInternships();
        
        List<String> uniqueLocations = internshipRepository.findDistinctLocations();
        
        model.addAttribute("activeInternships", allInternships);
        model.addAttribute("activeInternshipsCount", allInternships.size());
        model.addAttribute("uniqueLocations", uniqueLocations);
        model.addAttribute("stipendFilter", "all");
        
        // Get applied internships and their status for current student
        List<InternshipApplicationEntity> appliedApplications = 
            internshipApplicationRepository.findByStudent(user);
        
        Set<Integer> appliedInternshipIds = new HashSet<>();
        Map<Integer, String> applicationStatusMap = new HashMap<>();
        
        for (InternshipApplicationEntity app : appliedApplications) {
            if (app.getInternship() != null) {
                appliedInternshipIds.add(app.getInternship().getInternshipId());
                applicationStatusMap.put(app.getInternship().getInternshipId(), app.getApplicationStatus());
            }
        }
        
        model.addAttribute("appliedInternshipIds", appliedInternshipIds);
        model.addAttribute("applicationStatusMap", applicationStatusMap);
        
        // Calculate profile completion percentage
        int profileCompletion = calculateProfileCompletion(user);
        model.addAttribute("profileCompletion", profileCompletion);
        
        return "studentDashboard";
    }

    // Helper method to calculate profile completion
    private int calculateProfileCompletion(UserEntity user) {
        int completion = 0;
        if (user.getFirstName() != null && !user.getFirstName().isEmpty()) completion += 20;
        if (user.getLastName() != null && !user.getLastName().isEmpty()) completion += 20;
        if (user.getEmail() != null && !user.getEmail().isEmpty()) completion += 20;
        if (user.getPhone() != null && !user.getPhone().isEmpty()) completion += 20;
        if (user.getProfilePicURL() != null && !user.getProfilePicURL().isEmpty()) completion += 20;
       
        return completion;
    }
    
    
//    @GetMapping("/viewInternshipDetails")
//    public String viewInternshipDetails(@RequestParam("internshipId") Integer internshipId, Model model) {
//        InternshipEntity internship = internshipRepository.findById(internshipId).orElse(null);
//        model.addAttribute("internship", internship);
//        return "viewInternshipDetails";
//    }
    
    
    @GetMapping("/viewInternshipDetails")
    public String viewInternshipDetails(@RequestParam Integer internshipId,HttpServletRequest request, 
                                         HttpSession session, 
                                         Model model) {

        UserEntity user = (UserEntity) session.getAttribute("user");
        
        if (user == null) {
            return "redirect:/login";
        }
        
        
        // ADD THIS LINE - Get the previous page URL
        String referer = request.getHeader("referer");
        model.addAttribute("previousPage", referer != null ? referer : "/studentDashboard");

        InternshipEntity internship = internshipRepository.findById(internshipId).orElse(null);
        
        if (internship == null) {
            return "redirect:/studentDashboard";
        }
        
        model.addAttribute("internship", internship);
        
        // Check existing application
        InternshipApplicationEntity existingApplication = 
            internshipApplicationRepository.findByStudentAndInternship(user, internship);
        
        boolean hasApplied = false;
        String applicationStatus = null;
        
        if (existingApplication != null) {
            hasApplied = true;
            applicationStatus = existingApplication.getApplicationStatus();
        }
        
        model.addAttribute("hasApplied", hasApplied);
        model.addAttribute("applicationStatus", applicationStatus);
        
        // Calculate status based on dates
        LocalDate today = LocalDate.now();
        String calculatedStatus = "CLOSED";
        boolean showCountdown = false;
        long countdownTimestamp = 0;
        long startDateTimestamp = 0;
        String countdownLabel = "";
        
        // Always set startDateTimestamp for backward compatibility
        if (internship.getStartDate() != null) {
            startDateTimestamp = internship.getStartDate()
                .atStartOfDay(java.time.ZoneId.systemDefault())
                .toEpochSecond() * 1000;
        }
        
        // Check if startApplyDate exists and is in the future (UPCOMING)
        if (internship.getStartApplyDate() != null && internship.getStartApplyDate().isAfter(today)) {
            calculatedStatus = "UPCOMING";
            showCountdown = true;
            countdownTimestamp = internship.getStartApplyDate()
                .atStartOfDay(java.time.ZoneId.systemDefault())
                .toEpochSecond() * 1000;
            countdownLabel = "Applications open in";
        }
        // Check if applications are open (OPEN)
        else if (internship.getLastApplyDate() != null && !internship.getLastApplyDate().isBefore(today)) {
            if (internship.getStartApplyDate() == null || !internship.getStartApplyDate().isAfter(today)) {
                calculatedStatus = "OPEN";
                
                // Show countdown to start date if applicable
                if (internship.getStartDate() != null && internship.getStartDate().isAfter(today)) {
                    showCountdown = true;
                    countdownTimestamp = startDateTimestamp;
                    countdownLabel = "Internship starts in";
                }
            }
        }
        // Check if internship hasn't started yet
        else if (internship.getStartDate() != null && internship.getStartDate().isAfter(today)) {
            calculatedStatus = "UPCOMING";
            showCountdown = true;
            
            if (internship.getStartApplyDate() != null && internship.getStartApplyDate().isAfter(today)) {
                countdownTimestamp = internship.getStartApplyDate()
                    .atStartOfDay(java.time.ZoneId.systemDefault())
                    .toEpochSecond() * 1000;
                countdownLabel = "Applications open in";
            } else {
                countdownTimestamp = startDateTimestamp;
                countdownLabel = "Internship starts in";
            }
        }
        
        boolean shouldShowApply = calculatedStatus.equals("OPEN") && !hasApplied;
        
        // Add all attributes to model
        model.addAttribute("calculatedStatus", calculatedStatus);
        model.addAttribute("shouldShowApply", shouldShowApply);
        model.addAttribute("showCountdown", showCountdown);
        model.addAttribute("countdownTimestamp", countdownTimestamp);
        model.addAttribute("startDateTimestamp", startDateTimestamp);
        model.addAttribute("countdownLabel", countdownLabel);
        
        // Add current date for comparison in JSP
        model.addAttribute("currentDate", today);
        
        return "viewInternshipDetails";
    }
    
    
    @GetMapping("/internships")
    public String viewAllInternships(HttpSession session, Model model) {
        
        UserEntity user = (UserEntity) session.getAttribute("user");
        
        if (user == null) {
            return "redirect:/login";
        }
        
        LocalDate today = LocalDate.now();
        
        // Get all active internships using the new query
        List<InternshipEntity> activeInternships = internshipRepository.findAllActiveInternships();
        
        // If no active internships found with new logic, fallback to legacy filtering
        if (activeInternships.isEmpty()) {
            List<InternshipEntity> allInternships = internshipRepository.findAll();
            activeInternships = allInternships.stream()
                .filter(internship -> {
                    // Include if not expired
                    boolean notExpired = internship.getLastApplyDate() == null || 
                                        !internship.getLastApplyDate().isBefore(today);
                    
                    // Include if startApplyDate is future or null/expired
                    boolean applicationsNotStarted = internship.getStartApplyDate() == null || 
                                                    internship.getStartApplyDate().isAfter(today) ||
                                                    !internship.getStartApplyDate().isBefore(today);
                    
                    return notExpired || applicationsNotStarted;
                })
                .collect(Collectors.toList());
        }
        
        // Get applied internships for current student
        List<InternshipApplicationEntity> appliedApplications = 
            internshipApplicationRepository.findByStudent(user);
        
        Set<Integer> appliedInternshipIds = new HashSet<>();
        Map<Integer, String> applicationStatusMap = new HashMap<>();
        
        for (InternshipApplicationEntity app : appliedApplications) {
            if (app.getInternship() != null) {
                appliedInternshipIds.add(app.getInternship().getInternshipId());
                applicationStatusMap.put(app.getInternship().getInternshipId(), app.getApplicationStatus());
            }
        }
        
        // Get unique locations from active internships
        List<String> uniqueLocations = activeInternships.stream()
            .map(InternshipEntity::getLocation)
            .filter(location -> location != null && !location.trim().isEmpty())
            .distinct()
            .collect(Collectors.toList());
        
        model.addAttribute("user", user);
        model.addAttribute("activeInternships", activeInternships);
        model.addAttribute("activeInternshipsCount", activeInternships.size());
        model.addAttribute("uniqueLocations", uniqueLocations);
        model.addAttribute("stipendFilter", "all");
        model.addAttribute("appliedInternshipIds", appliedInternshipIds);
        model.addAttribute("applicationStatusMap", applicationStatusMap);
        
        return "internships";
    }
    
    
    @GetMapping("/myinternships")
    public String myEnrolledInternships(HttpSession session, Model model) {

        UserEntity user = (UserEntity) session.getAttribute("user");
        
        if (user == null) {
            return "redirect:/login";
        }
        
        // Get enrollments for this student
        List<InternshipEnrollmentEntity> enrollments = 
            internshipEnrollmentRepository.findByStudentUserId(user.getUserId());
        
        // Calculate counts
        long ongoingCount = enrollments.stream()
            .filter(e -> "ON_GOING".equals(e.getStatus()))
            .count();
        long completedCount = enrollments.stream()
            .filter(e -> "COMPLETED".equals(e.getStatus()))
            .count();
        
        // Get unique locations from enrolled internships
        List<String> uniqueLocations = enrollments.stream()
            .map(e -> e.getInternship())
            .filter(i -> i != null && i.getLocation() != null)
            .map(InternshipEntity::getLocation)
            .distinct()
            .collect(Collectors.toList());
        
        model.addAttribute("user", user);
        model.addAttribute("enrollments", enrollments);
        model.addAttribute("enrollmentsCount", enrollments.size());
        model.addAttribute("ongoingCount", ongoingCount);
        model.addAttribute("completedCount", completedCount);
        model.addAttribute("uniqueLocations", uniqueLocations);
        
        return "myinternships";
    }
    
    
    
    @GetMapping("/employerdashboard")
    public String openemployerdashboard(HttpSession session, Model model) {
        // Get logged-in user
        UserEntity user = (UserEntity) session.getAttribute("user");
        
        if (user == null) {
            return "redirect:/login";
        }
        
        // Get employer entity
        List<EmployerEntity> employers = employerRepository.findAllByUser(user);
        
        if (employers.isEmpty()) {
            // No employer profile yet
            model.addAttribute("internships", List.of());
            return "employerdashboard";
        }
        
        EmployerEntity employer = employers.get(0);
        
        // Get internships ordered by createdAt DESC (newest first)
        List<InternshipEntity> internships = internshipRepository.findByEmployerOrderByCreatedAtDesc(employer);
        
        // 🔥 FIXED: Auto-complete ONLY when endDate has passed
        LocalDate today = LocalDate.now();
        boolean statusChanged = false;
        
        for (InternshipEntity internship : internships) {
            String currentStatus = internship.getStatus();
            LocalDate endDate = internship.getEndDate();
            
            // Only mark as COMPLETED if:
            // 1. Status is ACTIVE
            // 2. endDate exists
            // 3. endDate is before today
            if ("ACTIVE".equals(currentStatus) && endDate != null && endDate.isBefore(today)) {
                internship.setStatus("COMPLETED");
                statusChanged = true;
                System.out.println("Auto-completing internship: " + internship.getTitle() + " (Ended on: " + endDate + ")");
            }
        }
        
        // Save all status changes to database
        if (statusChanged) {
            internshipRepository.saveAll(internships);
            // Refresh the list to get updated statuses
            internships = internshipRepository.findByEmployerOrderByCreatedAtDesc(employer);
        }
        
        // Add to model
        model.addAttribute("internships", internships);
        model.addAttribute("employer", employer);
        model.addAttribute("today", today);
        
        List<InternshipApplicationEntity> applications =
                internshipApplicationRepository
                .findByInternship_EmployerAndApplicationStatus(employer, "APPLIED");

        model.addAttribute("applications", applications);
        
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
    public String openDashboard(Model model, HttpSession session) {
        
        UserEntity user = (UserEntity) session.getAttribute("user");
        if (user == null || !"ADMIN".equals(user.getRole())) {
            return "redirect:/login";
        }
        
        // ========== 1. USER ROLE DISTRIBUTION ==========
        List<UserEntity> allUsers = userRepository.findAll();
        long studentCount = allUsers.stream().filter(u -> "STUDENT".equals(u.getRole())).count();
        long employerCount = allUsers.stream().filter(u -> "EMPLOYER".equals(u.getRole())).count();
        long adminCount = allUsers.stream().filter(u -> "ADMIN".equals(u.getRole())).count();
        
        model.addAttribute("roleLabels", new String[]{"STUDENT", "EMPLOYER", "ADMIN"});
        model.addAttribute("roleValues", new Long[]{studentCount, employerCount, adminCount});
        
        // ========== 2. MONTHLY REGISTRATIONS ==========
        List<String> months = new ArrayList<>();
        List<Long> monthlyCounts = new ArrayList<>();
        LocalDate now = LocalDate.now();
        
        for (int i = 5; i >= 0; i--) {
            LocalDate monthStart = now.minusMonths(i).withDayOfMonth(1);
            months.add(monthStart.getMonth().toString().substring(0, 3));
            
            long count = allUsers.stream()
                .filter(u -> u.getCreatedAt() != null)
                .filter(u -> u.getCreatedAt().getYear() == monthStart.getYear() && 
                            u.getCreatedAt().getMonthValue() == monthStart.getMonthValue())
                .count();
            monthlyCounts.add(count);
        }
        model.addAttribute("monthlyLabels", months.toArray(new String[0]));
        model.addAttribute("monthlyValues", monthlyCounts.toArray(new Long[0]));
        
        // ========== 3. INTERNSHIP STATUS ==========
        List<InternshipEntity> allInternships = internshipRepository.findAll();
        long openCount = allInternships.stream().filter(i -> "OPEN".equals(i.getStatus())).count();
        long activeCount = allInternships.stream().filter(i -> "ACTIVE".equals(i.getStatus())).count();
        long completedCount = allInternships.stream().filter(i -> "COMPLETED".equals(i.getStatus())).count();
        long upcomingCount = allInternships.stream().filter(i -> "UPCOMING".equals(i.getStatus())).count();
        
        model.addAttribute("statusLabels", new String[]{"OPEN", "ACTIVE", "COMPLETED", "UPCOMING"});
        model.addAttribute("statusValues", new Long[]{openCount, activeCount, completedCount, upcomingCount});
        
        // ========== 4. APPLICATION STATUS ==========
        List<InternshipApplicationEntity> allApps = internshipApplicationRepository.findAll();
        long appliedCount = allApps.stream().filter(a -> "APPLIED".equals(a.getApplicationStatus())).count();
        long acceptedCount = allApps.stream().filter(a -> "ACCEPTED".equals(a.getApplicationStatus())).count();
        long rejectedCount = allApps.stream().filter(a -> "REJECTED".equals(a.getApplicationStatus())).count();
        
        model.addAttribute("appLabels", new String[]{"APPLIED", "ACCEPTED", "REJECTED"});
        model.addAttribute("appValues", new Long[]{appliedCount, acceptedCount, rejectedCount});
        
        // ========== 5. TOP 5 INTERNSHIPS ==========
        Map<String, Long> appCountByInternship = new HashMap<>();
        for (InternshipApplicationEntity app : allApps) {
            if (app.getInternship() != null && app.getInternship().getTitle() != null) {
                String title = app.getInternship().getTitle();
                appCountByInternship.put(title, appCountByInternship.getOrDefault(title, 0L) + 1);
            }
        }
        
        List<Map.Entry<String, Long>> sorted = new ArrayList<>(appCountByInternship.entrySet());
        sorted.sort((a, b) -> b.getValue().compareTo(a.getValue()));
        
        List<String> topTitles = new ArrayList<>();
        List<Long> topCounts = new ArrayList<>();
        for (int i = 0; i < Math.min(5, sorted.size()); i++) {
            topTitles.add(sorted.get(i).getKey());
            topCounts.add(sorted.get(i).getValue());
        }
        model.addAttribute("topTitles", topTitles.toArray(new String[0]));
        model.addAttribute("topCounts", topCounts.toArray(new Long[0]));
        
        // ========== 6. ENROLLMENT STATUS ==========
        List<InternshipEnrollmentEntity> allEnrollments = internshipEnrollmentRepository.findAll();
        long ongoingCount = allEnrollments.stream().filter(e -> "ON_GOING".equals(e.getStatus())).count();
        long completedEnrollCount = allEnrollments.stream().filter(e -> "COMPLETED".equals(e.getStatus())).count();
        long droppedCount = allEnrollments.stream().filter(e -> "DROPPED".equals(e.getStatus())).count();
        
        model.addAttribute("enrollLabels", new String[]{"ON_GOING", "COMPLETED", "DROPPED"});
        model.addAttribute("enrollValues", new Long[]{ongoingCount, completedEnrollCount, droppedCount});
        
        // ========== 7. CERTIFICATES MONTHLY ==========
        List<CertificateEntity> allCertificates = certificaterepository.findAll();
        List<String> certMonths = new ArrayList<>();
        List<Long> certCounts = new ArrayList<>();
        
        for (int i = 5; i >= 0; i--) {
            LocalDate monthStart = now.minusMonths(i).withDayOfMonth(1);
            certMonths.add(monthStart.getMonth().toString().substring(0, 3));
            
            long count = allCertificates.stream()
                .filter(c -> c.getIssuedDate() != null)
                .filter(c -> c.getIssuedDate().getYear() == monthStart.getYear() && 
                            c.getIssuedDate().getMonthValue() == monthStart.getMonthValue())
                .count();
            certCounts.add(count);
        }
        model.addAttribute("certMonths", certMonths.toArray(new String[0]));
        model.addAttribute("certCounts", certCounts.toArray(new Long[0]));
        
        // ========== METRICS ==========
        model.addAttribute("totalUsers", allUsers.size());
        model.addAttribute("totalInternships", allInternships.size());
        model.addAttribute("totalApplications", allApps.size());
        model.addAttribute("totalEnrollments", allEnrollments.size());
        
        ObjectMapper mapper = new ObjectMapper();

        model.addAttribute("roleLabelsJson", mapper.writeValueAsString(model.getAttribute("roleLabels")));
        model.addAttribute("roleValuesJson", mapper.writeValueAsString(model.getAttribute("roleValues")));
        model.addAttribute("monthlyLabelsJson", mapper.writeValueAsString(model.getAttribute("monthlyLabels")));
        model.addAttribute("monthlyValuesJson", mapper.writeValueAsString(model.getAttribute("monthlyValues")));
        model.addAttribute("statusLabelsJson", mapper.writeValueAsString(model.getAttribute("statusLabels")));
        model.addAttribute("statusValuesJson", mapper.writeValueAsString(model.getAttribute("statusValues")));
        model.addAttribute("appLabelsJson", mapper.writeValueAsString(model.getAttribute("appLabels")));
        model.addAttribute("appValuesJson", mapper.writeValueAsString(model.getAttribute("appValues")));
        model.addAttribute("topTitlesJson", mapper.writeValueAsString(model.getAttribute("topTitles")));
        model.addAttribute("topCountsJson", mapper.writeValueAsString(model.getAttribute("topCounts")));
        model.addAttribute("enrollLabelsJson", mapper.writeValueAsString(model.getAttribute("enrollLabels")));
        model.addAttribute("enrollValuesJson", mapper.writeValueAsString(model.getAttribute("enrollValues")));
        model.addAttribute("certMonthsJson", mapper.writeValueAsString(model.getAttribute("certMonths")));
        model.addAttribute("certCountsJson", mapper.writeValueAsString(model.getAttribute("certCounts")));
        
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
    public String viewProfile(HttpSession session,HttpServletRequest request, Model model) {

        UserEntity user = (UserEntity) session.getAttribute("user");

        // ✅ Safety check
        if (user == null) {
            return "redirect:/login";
        }
        
        
        // ✅ Fetch only logged-in user applications
        List<InternshipApplicationEntity> applications =
                internshipApplicationRepository.findByStudent(user);
        
        // Get all certificates for this student
	    List<CertificateEntity> certificates = certificaterepository.findByEnrollment_Student_UserId(user.getUserId());
        
        String referer = request.getHeader("referer");
        model.addAttribute("previousPage", referer != null ? referer : "/studentDashboard");

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
        
        model.addAttribute("applications", applications);
        model.addAttribute("certificates", certificates);
        // Calculate profile completion percentage
        int profileCompletion = calculateProfileCompletion(user);
        model.addAttribute("profileCompletion", profileCompletion);

        return "viewprofile";
    }
    
   
    
    @GetMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate(); 
		return "login";
	}
}




