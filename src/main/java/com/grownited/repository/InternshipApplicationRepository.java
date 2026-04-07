package com.grownited.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.grownited.entity.EmployerEntity;
import com.grownited.entity.InternshipApplicationEntity;
import com.grownited.entity.InternshipEntity;
import com.grownited.entity.UserEntity;

public interface InternshipApplicationRepository 
        extends JpaRepository<InternshipApplicationEntity, Integer>{
	
	List<InternshipApplicationEntity> findByStudent(UserEntity student);
	
	List<InternshipApplicationEntity> findByInternship_Employer(EmployerEntity employer);
	
	InternshipApplicationEntity findByStudentAndInternship(UserEntity student, InternshipEntity internship);
	
	
	List<InternshipApplicationEntity> 
	findByInternship_EmployerAndApplicationStatus(
	        EmployerEntity employer, String applicationStatus);
	
	 // FIXED: Count by application status
    @Query("SELECT a.applicationStatus, COUNT(a) FROM InternshipApplicationEntity a GROUP BY a.applicationStatus")
    List<Object[]> countByApplicationStatus();
    
    // FIXED: Top 5 internships by applications
    @Query("SELECT i.title, COUNT(a) FROM InternshipApplicationEntity a JOIN a.internship i GROUP BY i.internshipId ORDER BY COUNT(a) DESC LIMIT 5")
    List<Object[]> findTop5InternshipsByApplicationCount();

}