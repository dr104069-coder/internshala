package com.grownited.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.cloudinary.Cloudinary;
import com.grownited.entity.UserDetailEntity;
import com.grownited.entity.UserEntity;
import com.grownited.repository.UserDetailRepository;
import com.grownited.repository.UserRepository;

import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {

	private static final String USER_ID2 = "userId";

	@Autowired
	UserRepository userRepository;

	@Autowired
	UserDetailRepository userDetailRepository;
	
	 @Autowired
		PasswordEncoder passwordEncoder;
	    
	    @Autowired
		Cloudinary cloudinary;
	
	
	

	@GetMapping("/listUser")
	public String listUser(Model model) {

		List<UserEntity> allUser = userRepository.findAll();
		model.addAttribute("userList", allUser);
		return "ListUser";
	}

	@GetMapping("/viewUser")
	public String viewUser(@RequestParam(USER_ID2) Integer userId, Model model) {

	    UserEntity user = userRepository.findById(userId)
	            .orElseThrow(() -> new RuntimeException("User not found"));

	    UserDetailEntity userDetail = userDetailRepository.findByUserId(userId);

	    model.addAttribute("user", user);
	    model.addAttribute("userDetail", userDetail);

	    return "ViewUser";
	}
	
	
	/*@GetMapping("/viewUser")
	public String viewUser(@RequestParam Integer userId, Model model) {

	    Optional<UserEntity> optionalUser = userRepository.findById(userId);

	    if (optionalUser.isPresent()) {
	        model.addAttribute("user", optionalUser.get());
	        return "ViewUser";
	    } else {
	        return "redirect:/listUser";   // or error page
	    }
	}}*/
	
	@GetMapping("/deleteUser")
	public String deleteuser(Integer userId) {
		userRepository.deleteById(userId);
		
		return "redirect:/listUser";//do not open jsp , open another url -> listHackathon
	}
	
	@PostMapping("/saveuser")
	public String saveUser(UserEntity userEntity, UserDetailEntity userDetailEntity, MultipartFile profilePic) {

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
	        Map map = cloudinary.uploader().upload(profilePic.getBytes(), null);
	        String profilePicURL = map.get("secure_url").toString();
	        System.out.println(profilePicURL);
	        userEntity.setProfilePicURL(profilePicURL);
	        
	    } catch (IOException e) {
	        // TODO Auto-generated catch block
	        e.printStackTrace();
	    }

	    userRepository.save(userEntity);
	    userDetailEntity.setUserId(userEntity.getUserId());
	    userDetailRepository.save(userDetailEntity);
	    
	    // Redirect to listUser instead of login
	    return "redirect:/listUser";
	}
	
	// GET mapping to show edit form
	@GetMapping("/editUser")
	public String editUser(@RequestParam Integer userId, Model model) {
	    UserEntity user = userRepository.findById(userId)
	            .orElseThrow(() -> new RuntimeException("User not found"));
	    UserDetailEntity userDetail = userDetailRepository.findByUserId(userId);
	    
	    model.addAttribute("user", user);
	    model.addAttribute("userDetail", userDetail);
	    
	    return "useredit";
	}

	// POST mapping to update user
	@PostMapping("/updateUser")
	public String updateUser(
	        @ModelAttribute UserEntity user,
	        @RequestParam(required = false) Integer userDetailId,
	        @RequestParam(required = false) String qualification,
	        @RequestParam(required = false) String city,
	        @RequestParam(required = false) String state,
	        @RequestParam(required = false) String country,
	        @RequestParam(required = false) MultipartFile profilePic) {
	    
	    // Get existing user from database
	    UserEntity existingUser = userRepository.findById(user.getUserId())
	            .orElseThrow(() -> new RuntimeException("User not found"));
	    
	    // Update fields (except password)
	    existingUser.setFirstName(user.getFirstName());
	    existingUser.setLastName(user.getLastName());
	    existingUser.setEmail(user.getEmail());
	    existingUser.setPhone(user.getPhone());
	    existingUser.setGender(user.getGender());
	    existingUser.setRole(user.getRole());
	    existingUser.setUsertype(user.getUsertype());
	    existingUser.setActive(user.getActive());
	    
	    // Handle profile picture
	    if (profilePic != null && !profilePic.isEmpty()) {
	        try {
	            Map map = cloudinary.uploader().upload(profilePic.getBytes(), null);
	            existingUser.setProfilePicURL(map.get("secure_url").toString());
	        } catch (IOException e) {
	            e.printStackTrace();
	        }
	    }
	    
	    userRepository.save(existingUser);
	    
	    // Update UserDetailEntity
	    UserDetailEntity userDetail = userDetailRepository.findByUserId(existingUser.getUserId());
	    if (userDetail == null) {
	        userDetail = new UserDetailEntity();
	        userDetail.setUserId(existingUser.getUserId());
	    }
	    
	    userDetail.setQualification(qualification);
	    userDetail.setCity(city);
	    userDetail.setState(state);
	    userDetail.setCountry(country);
	    
	    userDetailRepository.save(userDetail);
	    
	    return "redirect:/viewUser?userId=" + existingUser.getUserId();
	}

}