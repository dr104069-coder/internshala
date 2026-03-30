//package com.grownited.service;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.mail.SimpleMailMessage;
//import org.springframework.mail.javamail.JavaMailSender;
//import org.springframework.stereotype.Service;
//
//@Service
//public class EmailService {
//
//    @Autowired
//    private JavaMailSender mailSender;
//
//    public void sendOtpEmail(String toEmail, String subject, String body) {
//        SimpleMailMessage message = new SimpleMailMessage();
//        message.setTo(toEmail);
//        message.setSubject(subject);
//        message.setText(body);
//        mailSender.send(message);
//    }
//}

package com.grownited.service;

import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Paths;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import jakarta.mail.internet.MimeMessage;
import org.springframework.mail.javamail.MimeMessageHelper;


@Service
public class EmailService {

    @Autowired
    private JavaMailSender mailSender;
    
    public void sendWelcomeEmail(String toEmail, String name) {

        try {

            String template = new String(
                    java.nio.file.Files.readAllBytes(
                            java.nio.file.Paths.get("src/main/resources/templates/welcome-email.html")),
                    java.nio.charset.StandardCharsets.UTF_8);

            template = template.replace("{{name}}", name);

            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true);

            helper.setTo(toEmail);
            helper.setSubject("Welcome to SmartIntern 🎉");
            helper.setText(template, true);   // HTML email

            mailSender.send(message);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void sendOtpEmail(String toEmail, String subject, String name, String otp) {

        try {

            String template = new String(
                    Files.readAllBytes(
                            Paths.get("src/main/resources/templates/otp-email.html")),
                    StandardCharsets.UTF_8);

            template = template.replace("{{name}}", name);
            template = template.replace("{{otp}}", otp);

            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true);

            helper.setTo(toEmail);
            helper.setSubject(subject);
            helper.setText(template, true);   // true = HTML

            mailSender.send(message);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}