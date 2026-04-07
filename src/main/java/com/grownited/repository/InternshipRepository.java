//package com.grownited.repository;
//
//import java.time.LocalDate;
//import java.util.List;
//
//import org.springframework.data.jpa.repository.JpaRepository;
//import org.springframework.stereotype.Repository;
//
//import com.grownited.entity.InternshipEntity;
//import com.grownited.entity.UserEntity;
//
//@Repository
//public interface InternshipRepository extends JpaRepository<InternshipEntity,Integer> {
//	
//	List<InternshipEntity> findByStatus(String status);
//	
//	//List<InternshipEntity> findByStartDateAfter(LocalDate date);
//
//	List<InternshipEntity> findAllByEmployer_User(UserEntity user);
//
//	
//	
//	
//	
//}

package com.grownited.repository;

import java.time.LocalDate;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.grownited.entity.EmployerEntity;
import com.grownited.entity.InternshipEntity;
import com.grownited.entity.UserEntity;

@Repository
public interface InternshipRepository extends JpaRepository<InternshipEntity,Integer> {

    List<InternshipEntity> findByStatus(String status);

    List<InternshipEntity> findAllByEmployer_User(UserEntity user);

    // LIVE internships (applications are open)
    List<InternshipEntity> findByStartDateLessThanEqualAndLastApplyDateGreaterThanEqual(LocalDate today, LocalDate today2);

    // UPCOMING internships (based on startDate only - legacy)
    List<InternshipEntity> findByStartDateGreaterThan(LocalDate today);

    @Query("SELECT DISTINCT i.location FROM InternshipEntity i WHERE i.location IS NOT NULL AND i.location != '' ORDER BY i.location")
    List<String> findDistinctLocations();
    
    List<InternshipEntity> findByStatusIn(List<String> statuses);
    
    // NEW: Find LIVE internships based on startApplyDate and lastApplyDate
    @Query("SELECT i FROM InternshipEntity i WHERE " +
           "i.lastApplyDate >= CURRENT_DATE AND " +
           "(i.startApplyDate IS NULL OR i.startApplyDate <= CURRENT_DATE)")
    List<InternshipEntity> findLiveInternships();
    
    // NEW: Find UPCOMING internships based on startApplyDate
    @Query("SELECT i FROM InternshipEntity i WHERE " +
           "i.startApplyDate IS NOT NULL AND i.startApplyDate > CURRENT_DATE")
    List<InternshipEntity> findUpcomingInternshipsByApplyDate();
    
    // NEW: Find all active internships (both live and upcoming)
    @Query("SELECT i FROM InternshipEntity i WHERE " +
           "i.lastApplyDate >= CURRENT_DATE OR " +
           "(i.startApplyDate IS NOT NULL AND i.startApplyDate > CURRENT_DATE)")
    List<InternshipEntity> findAllActiveInternships();
    
    // NEW: Check if applications are open for an internship
    @Query("SELECT CASE WHEN COUNT(i) > 0 THEN true ELSE false END FROM InternshipEntity i " +
           "WHERE i.internshipId = :internshipId " +
           "AND i.lastApplyDate >= CURRENT_DATE " +
           "AND (i.startApplyDate IS NULL OR i.startApplyDate <= CURRENT_DATE)")
    boolean isApplicationsOpen(@Param("internshipId") Integer internshipId);
    
    // NEW: Check if internship is upcoming
    @Query("SELECT CASE WHEN COUNT(i) > 0 THEN true ELSE false END FROM InternshipEntity i " +
           "WHERE i.internshipId = :internshipId " +
           "AND i.startApplyDate IS NOT NULL AND i.startApplyDate > CURRENT_DATE")
    boolean isUpcomingInternship(@Param("internshipId") Integer internshipId);
    
 // In InternshipRepository.java
    List<InternshipEntity> findByEmployerOrderByCreatedAtDesc(EmployerEntity employer);
    
 // FIXED: Count by status
    @Query("SELECT i.status, COUNT(i) FROM InternshipEntity i GROUP BY i.status")
    List<Object[]> countByStatus();
    
}
