package com.grownited.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.grownited.entity.StudentDetailEntity;
import com.grownited.entity.UserEntity;

@Repository
public interface StudentDetailRepository extends JpaRepository<StudentDetailEntity, Integer>  {
	
	
	StudentDetailEntity findByUser(UserEntity user);

}
