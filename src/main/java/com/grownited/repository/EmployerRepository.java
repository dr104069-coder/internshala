package com.grownited.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.grownited.entity.EmployerEntity;
import com.grownited.entity.UserEntity;

@Repository
public interface EmployerRepository extends JpaRepository<EmployerEntity, Integer> {
	
	 
	// EmployerEntity findByUser(UserEntity user);
	
	  List<EmployerEntity> findAllByUser(UserEntity user);

}
