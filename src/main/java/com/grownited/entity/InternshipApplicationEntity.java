package com.grownited.entity;

import java.time.LocalDateTime;

import jakarta.persistence.*;

@Entity
@Table(name = "internship_application")
public class InternshipApplicationEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer applicationId;

    // FK → Internship
    @ManyToOne
    @JoinColumn(name = "internship_id")
    private InternshipEntity internship;

    // FK → Student (User)
    @ManyToOne
    @JoinColumn(name = "student_id")
    private UserEntity student;

    private String coverLetter;

    private String resumeUrl;

    private String applicationStatus;

    private LocalDateTime appliedAt;

    public Integer getApplicationId() {
        return applicationId;
    }

    public void setApplicationId(Integer applicationId) {
        this.applicationId = applicationId;
    }

    public InternshipEntity getInternship() {
        return internship;
    }

    public void setInternship(InternshipEntity internship) {
        this.internship = internship;
    }

    public UserEntity getStudent() {
        return student;
    }

    public void setStudent(UserEntity student) {
        this.student = student;
    }

    public String getCoverLetter() {
        return coverLetter;
    }

    public void setCoverLetter(String coverLetter) {
        this.coverLetter = coverLetter;
    }

    public String getResumeUrl() {
        return resumeUrl;
    }

    public void setResumeUrl(String resumeUrl) {
        this.resumeUrl = resumeUrl;
    }

    public String getApplicationStatus() {
        return applicationStatus;
    }

    public void setApplicationStatus(String applicationStatus) {
        this.applicationStatus = applicationStatus;
    }

    public LocalDateTime getAppliedAt() {
        return appliedAt;
    }

    public void setAppliedAt(LocalDateTime appliedAt) {
        this.appliedAt = appliedAt;
    }
}