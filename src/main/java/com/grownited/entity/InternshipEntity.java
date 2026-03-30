package com.grownited.entity;

import java.time.LocalDate;
import java.time.LocalDateTime;

import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name="internship")
public class InternshipEntity {
	
	 @Id
	    @GeneratedValue(strategy = GenerationType.IDENTITY)
	    private Integer internshipId;

	    @ManyToOne(fetch = FetchType.EAGER)
	    @JoinColumn(name = "employer_id", nullable = false)
	    private EmployerEntity employer;

	    private String title;
	    private String description;
	    private String internshipType;
	    private Integer durationMonths;
	    private Double stipend;
	    private String location;
	    private String skillsRequired;
	    private Integer openings;
	    private LocalDate startDate;
	    private LocalDate endDate;
	    private LocalDate lastApplyDate;
	    private Boolean isPaid;
	    private String status;
	    private String posterUrl;
	    private LocalDateTime createdAt;
		public Integer getInternshipId() {
			return internshipId;
		}
		public void setInternshipId(Integer internshipId) {
			this.internshipId = internshipId;
		}
		public EmployerEntity getEmployer() {
			return employer;
		}
		public void setEmployer(EmployerEntity employer) {
			this.employer = employer;
		}
		public String getTitle() {
			return title;
		}
		public void setTitle(String title) {
			this.title = title;
		}
		public String getDescription() {
			return description;
		}
		public void setDescription(String description) {
			this.description = description;
		}
		public String getInternshipType() {
			return internshipType;
		}
		public void setInternshipType(String internshipType) {
			this.internshipType = internshipType;
		}
		public Integer getDurationMonths() {
			return durationMonths;
		}
		public void setDurationMonths(Integer durationMonths) {
			this.durationMonths = durationMonths;
		}
		public Double getStipend() {
			return stipend;
		}
		public void setStipend(Double stipend) {
			this.stipend = stipend;
		}
		public String getSkillsRequired() {
			return skillsRequired;
		}
		public void setSkillsRequired(String skillsRequired) {
			this.skillsRequired = skillsRequired;
		}
		public Integer getOpenings() {
			return openings;
		}
		public void setOpenings(Integer openings) {
			this.openings = openings;
		}
		public LocalDate getStartDate() {
			return startDate;
		}
		public void setStartDate(LocalDate startDate) {
			this.startDate = startDate;
		}
		public LocalDate getEndDate() {
			return endDate;
		}
		public void setEndDate(LocalDate endDate) {
			this.endDate = endDate;
		}
		public LocalDate getLastApplyDate() {
			return lastApplyDate;
		}
		public void setLastApplyDate(LocalDate lastApplyDate) {
			this.lastApplyDate = lastApplyDate;
		}
		public Boolean getIsPaid() {
			return isPaid;
		}
		public void setIsPaid(Boolean isPaid) {
			this.isPaid = isPaid;
		}
		public String getStatus() {
			return status;
		}
		public void setStatus(String status) {
			this.status = status;
		}
		public LocalDateTime getCreatedAt() {
			return createdAt;
		}
		public void setCreatedAt(LocalDateTime createdAt) {
			this.createdAt = createdAt;
		}
		public String getLocation() {
			return location;
		}
		public void setLocation(String location) {
			this.location = location;
		}
		public String getPosterUrl() {
			return posterUrl;
		}
		public void setPosterUrl(String posterUrl) {
			this.posterUrl = posterUrl;
		}
	
		
	    
	    
	
//	private Integer internshipId;
//	@ManyToOne
//	@JoinColumn(name = "employer_id", nullable = false)
//	private EmployerEntity employer;
//	private String title;
//	private String description;
//	private String internshipType;   // REMOTE, ONSITE, HYBRID
//	private Integer durationMonths;
//	private Double stipend;
//	private String skillsRequired;
//	private Integer openings;
//	private LocalDate startDate;
//	private LocalDate endDate;
//	private LocalDate lastApplyDate;
//	private Boolean isPaid;
//	private String status;   // OPEN, CLOSED
//	private LocalDateTime createdAt;
//	
//	@Id
//	@GeneratedValue(strategy = GenerationType.IDENTITY) // auto increment
//	public Integer getInternshipId() {
//		return internshipId;
//	}
//	public void setInternshipId(Integer internshipId) {
//		this.internshipId = internshipId;
//	}
//	
//	public EmployerEntity getEmployer() {
//		return employer;
//	}
//	public void setEmployer(EmployerEntity employer) {
//		this.employer = employer;
//	}
//	public String getTitle() {
//		return title;
//	}
//	public void setTitle(String title) {
//		this.title = title;
//	}
//	public String getDescription() {
//		return description;
//	}
//	public void setDescription(String description) {
//		this.description = description;
//	}
//	public String getInternshipType() {
//		return internshipType;
//	}
//	public void setInternshipType(String internshipType) {
//		this.internshipType = internshipType;
//	}
//	public Integer getDurationMonths() {
//		return durationMonths;
//	}
//	public void setDurationMonths(Integer durationMonths) {
//		this.durationMonths = durationMonths;
//	}
//	public Double getStipend() {
//		return stipend;
//	}
//	public void setStipend(Double stipend) {
//		this.stipend = stipend;
//	}
//	public String getSkillsRequired() {
//		return skillsRequired;
//	}
//	public void setSkillsRequired(String skillsRequired) {
//		this.skillsRequired = skillsRequired;
//	}
//	public Integer getOpenings() {
//		return openings;
//	}
//	public void setOpenings(Integer openings) {
//		this.openings = openings;
//	}
//	public LocalDate getStartDate() {
//		return startDate;
//	}
//	public void setStartDate(LocalDate startDate) {
//		this.startDate = startDate;
//	}
//	public LocalDate getEndDate() {
//		return endDate;
//	}
//	public void setEndDate(LocalDate endDate) {
//		this.endDate = endDate;
//	}
//	public LocalDate getLastApplyDate() {
//		return lastApplyDate;
//	}
//	public void setLastApplyDate(LocalDate lastApplyDate) {
//		this.lastApplyDate = lastApplyDate;
//	}
//	public Boolean getIsPaid() {
//		return isPaid;
//	}
//	public void setIsPaid(Boolean isPaid) {
//		this.isPaid = isPaid;
//	}
//	public String getStatus() {
//		return status;
//	}
//	public void setStatus(String status) {
//		this.status = status;
//	}
//	public LocalDateTime getCreatedAt() {
//		return createdAt;
//	}
//	public void setCreatedAt(LocalDateTime createdAt) {
//		this.createdAt = createdAt;
//	}

	
	
}
