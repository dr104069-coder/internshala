package com.grownited.entity;

import java.time.LocalDate;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="employer")
public class EmployerEntity {
	
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	
	private Integer employerId;
	private String companyName;
	private String companyType;
	private String website;
	private String companyAddress;
	private String hrName;  
	private String hrMobile; //admin , participant , judge
	private Boolean companyVerified;
	private LocalDate createdAt;
	private Integer userId; //fk=users
	public Integer getEmployerId() {
		return employerId;
	}
	public void setEmployerId(Integer employerId) {
		this.employerId = employerId;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public String getCompanyType() {
		return companyType;
	}
	public void setCompanyType(String companyType) {
		this.companyType = companyType;
	}
	public String getWebsite() {
		return website;
	}
	public void setWebsite(String website) {
		this.website = website;
	}
	public String getCompanyAddress() {
		return companyAddress;
	}
	public void setCompanyAddress(String companyAddress) {
		this.companyAddress = companyAddress;
	}
	public String getHrName() {
		return hrName;
	}
	public void setHrName(String hrName) {
		this.hrName = hrName;
	}
	public String getHrMobile() {
		return hrMobile;
	}
	public void setHrMobile(String hrMobile) {
		this.hrMobile = hrMobile;
	}
	public Boolean getCompanyVerified() {
		return companyVerified;
	}
	public void setCompanyVerified(Boolean companyVerified) {
		this.companyVerified = companyVerified;
	}
	public LocalDate getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(LocalDate localDateTime) {
		this.createdAt = localDateTime;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	

	
	
}
