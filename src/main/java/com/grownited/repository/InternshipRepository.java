package com.grownited.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.grownited.entity.InternshipEntity;

@Repository
public interface InternshipRepository extends JpaRepository<InternshipEntity,Integer> {
	
	List<InternshipEntity> findByStatus(String status);

}
