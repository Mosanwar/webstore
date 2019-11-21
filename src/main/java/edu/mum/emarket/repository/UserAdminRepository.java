package edu.mum.emarket.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import edu.mum.emarket.domain.Person;
import edu.mum.emarket.domain.User;

@Repository
public interface UserAdminRepository extends CrudRepository<User, Long> {

	@Query("select DISTINCT u from  User u where blocked = true")
	public List<User> getBlockedUsers();
	
	//@Query("select u from User u  WHERE u.hasReports IS NOT EMPTY  ")
	@Query("select DISTINCT u from User u INNER JOIN FETCH  u.hasReports h")
	public List<User> getReportedUsers();
}
