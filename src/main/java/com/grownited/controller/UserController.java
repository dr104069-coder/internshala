package com.grownited.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.grownited.entity.UserDetailEntity;
import com.grownited.entity.UserEntity;
import com.grownited.repository.UserDetailRepository;
import com.grownited.repository.UserRepository;

@Controller
public class UserController {

	private static final String USER_ID2 = "userId";

	@Autowired
	UserRepository userRepository;

	@Autowired
	UserDetailRepository userDetailRepository;

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

}