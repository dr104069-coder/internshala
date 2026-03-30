package com.grownited.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.grownited.entity.InternshipApplicationEntity;
import com.grownited.entity.UserEntity;

public interface InternshipApplicationRepository 
        extends JpaRepository<InternshipApplicationEntity, Integer>{
	
	List<InternshipApplicationEntity> findByStudent(UserEntity student);

}