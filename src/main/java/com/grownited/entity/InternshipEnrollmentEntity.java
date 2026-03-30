//package com.grownited.entity;
//
//import java.time.LocalDate;
//
//import jakarta.persistence.Entity;
//import jakarta.persistence.GeneratedValue;
//import jakarta.persistence.GenerationType;
//import jakarta.persistence.Id;
//import jakarta.persistence.Table;
//
//@Entity
//@Table(name="internshipenrollment")
//
//public class InternshipEnrollmentEntity {
//	
//	@Id
//	@GeneratedValue(strategy = GenerationType.IDENTITY)
//
//	private Integer internshipEnrollmentId;   // pk
//	private Integer studentId;      // fk = user
//	private Integer internshipId;   // fk = internship
//	private LocalDate joiningDate;
//	private LocalDate completionDate;
//	private Integer performanceRating;   // 1 to 5 or 1 to 10
//	private String status;   // ON_GOING, COMPLETED, DROPPED
//	public Integer getInternshipEnrollmentId() {
//		return internshipEnrollmentId;
//	}
//	public void setInternshipEnrollmentId(Integer internshipEnrollmentId) {
//		this.internshipEnrollmentId = internshipEnrollmentId;
//	}
//	public Integer getStudentId() {
//		return studentId;
//	}
//	public void setStudentId(Integer studentId) {
//		this.studentId = studentId;
//	}
//	public Integer getInternshipId() {
//		return internshipId;
//	}
//	public void setInternshipId(Integer internshipId) {
//		this.internshipId = internshipId;
//	}
//	public LocalDate getJoiningDate() {
//		return joiningDate;
//	}
//	public void setJoiningDate(LocalDate joiningDate) {
//		this.joiningDate = joiningDate;
//	}
//	public LocalDate getCompletionDate() {
//		return completionDate;
//	}
//	public void setCompletionDate(LocalDate completionDate) {
//		this.completionDate = completionDate;
//	}
//	public Integer getPerformanceRating() {
//		return performanceRating;
//	}
//	public void setPerformanceRating(Integer performanceRating) {
//		this.performanceRating = performanceRating;
//	}
//	public String getStatus() {
//		return status;
//	}
//	public void setStatus(String status) {
//		this.status = status;
//	}
//	



package com.grownited.entity;

import java.time.LocalDate;

import jakarta.persistence.*;

@Entity
@Table(name = "internshipenrollment")
public class InternshipEnrollmentEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer internshipEnrollmentId;

    // ⚙️ MANUAL FK (from InternshipApplication)
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "student_id", nullable = false)
    private UserEntity student;

    // ⚙️ MANUAL FK (from InternshipApplication)
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "internship_id", nullable = false)
    private InternshipEntity internship;

    private LocalDate joiningDate;
    private LocalDate completionDate;
    private Integer performanceRating;  
    private String status;  // ON_GOING, COMPLETED, DROPPED

    // Getters & Setters

    public Integer getInternshipEnrollmentId() {
        return internshipEnrollmentId;
    }

    public void setInternshipEnrollmentId(Integer internshipEnrollmentId) {
        this.internshipEnrollmentId = internshipEnrollmentId;
    }

    public UserEntity getStudent() {
        return student;
    }

    public void setStudent(UserEntity student) {
        this.student = student;
    }

    public InternshipEntity getInternship() {
        return internship;
    }

    public void setInternship(InternshipEntity internship) {
        this.internship = internship;
    }

    public LocalDate getJoiningDate() {
        return joiningDate;
    }

    public void setJoiningDate(LocalDate joiningDate) {
        this.joiningDate = joiningDate;
    }

    public LocalDate getCompletionDate() {
        return completionDate;
    }

    public void setCompletionDate(LocalDate completionDate) {
        this.completionDate = completionDate;
    }

    public Integer getPerformanceRating() {
        return performanceRating;
    }

    public void setPerformanceRating(Integer performanceRating) {
        this.performanceRating = performanceRating;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

	
}

