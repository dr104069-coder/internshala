package com.grownited.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.grownited.entity.InternshipEnrollmentEntity;
import com.grownited.entity.InternshipEntity;

@Repository
public interface InternshipEnrollmentRepository extends JpaRepository<InternshipEnrollmentEntity,Integer> {

	
	List<InternshipEnrollmentEntity> findByStudentUserId(Integer userId);
	
	List<InternshipEnrollmentEntity> findByStatus(String status);
	
	
	  // Add this method
    List<InternshipEnrollmentEntity> findByInternship(InternshipEntity internship);
    
    // Optional: Get count of students by status
    long countByInternshipAndStatus(InternshipEntity internship, String status);
	
    @Query("SELECT e.status, COUNT(e) FROM InternshipEnrollmentEntity e GROUP BY e.status")
    List<Object[]> countByStatus();
    
}
