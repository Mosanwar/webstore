package edu.mum.emarket.service;

import java.util.List;

import edu.mum.emarket.domain.Person;
import edu.mum.emarket.domain.User;

public interface AdminService {
	
	List<User> getAllUser();
	
	List<User> getBlockedUsers();
	
	List<User> getReportedUsers();
	
	User findById(Long id);
	

	
	void deleteReportByUserId(Long UserId);
	
	User blockUser(Long id);
	
	User activeUser(Long id);
	
	
	

}
