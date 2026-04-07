package com.grownited.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.grownited.entity.CertificateEntity;
import com.grownited.entity.InternshipEnrollmentEntity;

@Repository
public interface CertificateRepository extends JpaRepository<CertificateEntity, Integer> {
	
	 CertificateEntity findByEnrollment(InternshipEnrollmentEntity enrollment);
	    Optional<CertificateEntity> findByVerificationCode(String verificationCode);
	    
	    
	    List<CertificateEntity> findByEnrollment_Student_UserId(Integer userId);
	    
	    @Query(value = "SELECT MONTH(issued_date) as month, COUNT(*) FROM certificates WHERE issued_date >= DATE_SUB(CURDATE(), INTERVAL 5 MONTH) GROUP BY MONTH(issued_date) ORDER BY issued_date ASC", nativeQuery = true)
	    List<Object[]> getLast6MonthsCertificates();
	    
}
