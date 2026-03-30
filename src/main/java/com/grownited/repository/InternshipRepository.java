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
import org.springframework.stereotype.Repository;

import com.grownited.entity.InternshipEntity;
import com.grownited.entity.UserEntity;

@Repository
public interface InternshipRepository extends JpaRepository<InternshipEntity,Integer> {

    List<InternshipEntity> findByStatus(String status);

    List<InternshipEntity> findAllByEmployer_User(UserEntity user);

    // LIVE internships
    List<InternshipEntity> findByStartDateLessThanEqualAndLastApplyDateGreaterThanEqual(LocalDate today, LocalDate today2);

    // UPCOMING internships
    List<InternshipEntity> findByStartDateGreaterThan(LocalDate today);

    @Query("SELECT DISTINCT i.location FROM InternshipEntity i WHERE i.location IS NOT NULL AND i.location != '' ORDER BY i.location")
    List<String> findDistinctLocations();
    
    List<InternshipEntity> findByStatusIn(List<String> statuses);

}
