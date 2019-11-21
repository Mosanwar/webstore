package edu.mum.emarket.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.mum.emarket.domain.Person;
import edu.mum.emarket.domain.User;
import edu.mum.emarket.repository.ReportAdminRepository;
import edu.mum.emarket.repository.UserAdminRepository;
import edu.mum.emarket.service.AdminService;

@Service
@Transactional

public class AdminServiceImpl implements AdminService {

	@Autowired
	private UserAdminRepository userDRepository;
	
	@Autowired
	private ReportAdminRepository reportAdminRepository;
	
	@Override
	public List<User> getAllUser(){
		return (List<User>) userDRepository.findAll();
	}
	
	@Override
    public List<User> getBlockedUsers(){
	   List<User> users =userDRepository.getBlockedUsers();
	  
		return	users;
	}
	
	@Override
	public List<User> getReportedUsers(){
		List<User> users = userDRepository.getReportedUsers();
		return users;
	}
	
	@Override
	public User findById(Long id) {
		return userDRepository.findOne(id);
	}
	

	
	@Override
	public void deleteReportByUserId(Long UserId) {
		reportAdminRepository.deleteReportByUserId(UserId);
	}
	
	@Override
	public User blockUser(Long id) {
		User user=userDRepository.findOne(id);
		user.setBlocked(true);
		userDRepository.save(user);
		reportAdminRepository.deleteReportByUserId(id);
		return user;
		
	}
	
	@Override
	public User activeUser(Long id)
	{
		User user=userDRepository.findOne(id);
		user.setBlocked(false);
		userDRepository.save(user);
		return user;
	}
}
