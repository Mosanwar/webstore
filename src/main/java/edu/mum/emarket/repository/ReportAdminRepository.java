package edu.mum.emarket.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import edu.mum.emarket.domain.Report;
import edu.mum.emarket.domain.User;

@Repository
public interface ReportAdminRepository extends CrudRepository<Report, Long> {
	
	@Modifying
	@Query("delete from Report r where r.reported.id=:id")
	public void deleteReportByUserId(@Param("id") Long Id);

}
