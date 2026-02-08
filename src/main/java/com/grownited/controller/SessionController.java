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

import java.time.LocalDate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.grownited.entity.UserEntity;
import com.grownited.repository.UserRepository;

@Controller
public class SessionController {

    @Autowired
    private UserRepository userRepository;

    @GetMapping("/signup")
    public String openSignupPage() {
        return "Signup";
    }

    @GetMapping("/login")
    public String openLoginPage() {
        return "login";
    }

    @GetMapping("/forgetpassword")
    public String openForgetPassword() {
        return "forgetpassword";
    }
    
    @GetMapping("/dashboard")
    public String openDashboard() {
        return "dashboard"; 
    }

    @PostMapping("/register")
    public String register(UserEntity userEntity) {

        System.out.println(userEntity.getFirstName());
        System.out.println(userEntity.getLastName());
        System.out.println("Processor => " + Runtime.getRuntime().availableProcessors());

        userEntity.setRole("INTERN");
        userEntity.setActive(true);
        userEntity.setCreatedAt(LocalDate.now());

        userRepository.save(userEntity);

        return "login";
    }
}

