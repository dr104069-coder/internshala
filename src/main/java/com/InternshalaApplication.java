package com;

import java.util.HashMap;
import java.util.Map;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.cloudinary.Cloudinary;

@SpringBootApplication
public class InternshalaApplication {

	public static void main(String[] args) {
		SpringApplication.run(InternshalaApplication.class, args);
	}
	
	@Bean 
	PasswordEncoder	getPasswordEncoder(){
		return new BCryptPasswordEncoder();
	}	

	
	@Bean
    public Cloudinary cloudinary() {
        Map<String, String> config = new HashMap<>();
        config.put("cloud_name", "dtqbw1mxn");
        config.put("api_key", "967538472561391");
        config.put("api_secret", "HOgHzRAGYTwB7W92lmcbgPaUZrs");
        return new Cloudinary(config);
    }
}
