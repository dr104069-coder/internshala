package com.grownited.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.grownited.entity.UserEntity;

@Repository
public interface UserRepository extends JpaRepository<UserEntity , Integer>{

	UserEntity findByEmailAndPassword(String email, String password);

	Optional<UserEntity> findByEmail(String email);

	@Query("SELECT u.role, COUNT(u) FROM UserEntity u GROUP BY u.role")
    List<Object[]> countUsersByRole();
    
    // FIXED: Get last 6 months registrations using NATIVE QUERY
    @Query(value = "SELECT MONTH(created_at) as month, COUNT(*) FROM users WHERE created_at >= DATE_SUB(CURDATE(), INTERVAL 5 MONTH) GROUP BY MONTH(created_at) ORDER BY created_at ASC", nativeQuery = true)
    List<Object[]> getLast6MonthsRegistrations();

}
