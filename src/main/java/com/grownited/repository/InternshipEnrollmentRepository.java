package com.grownited.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.grownited.entity.InternshipEnrollmentEntity;

@Repository
public interface InternshipEnrollmentRepository extends JpaRepository<InternshipEnrollmentEntity,Integer> {

	
	List<InternshipEnrollmentEntity> findByStudentUserId(Integer userId);
	
	List<InternshipEnrollmentEntity> findByStatus(String status);
}
