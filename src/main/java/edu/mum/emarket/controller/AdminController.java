package edu.mum.emarket.controller;

import java.util.List;

import edu.mum.emarket.service.UserService;
import org.apache.taglibs.standard.lang.jstl.test.beans.PublicBean1;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.mum.emarket.domain.Person;
import edu.mum.emarket.domain.Product;
import edu.mum.emarket.domain.User;
import edu.mum.emarket.service.AdminService;
import edu.mum.emarket.service.ProductService;

@Controller
public class AdminController {
	@Autowired
	AdminService adminService;
	
	@Autowired
	ProductService productService;

	@Autowired
	UserService userService;
	
	@RequestMapping(value = "/admin",method = RequestMethod.GET)
	public String adminHome(Model model ) {
		model.addAttribute("User", (User)userService.getLoggedInPerson());
		model.addAttribute("NoAllUsers", adminService.getAllUser().size());
		model.addAttribute("NoBlockedUsers", adminService.getBlockedUsers().size());
		model.addAttribute("NoReportedUsers", adminService.getReportedUsers().size());
		model.addAttribute("NoAllProducts", productService.getAllProducts().size());
		return "adminHome";
	}
	
	@RequestMapping(value = "/reportedUsers",method = RequestMethod.GET)
	public String reportedUsers(Model model)
	{
		List<User> users=adminService.getReportedUsers();
		model.addAttribute("Users",users);
		return "reportedUsers";
	}
	
	
	@RequestMapping(value = "/blockUser",method = RequestMethod.GET)
	public String blockUser(@RequestParam("id")Long userId , Model model)
	{
		 adminService.blockUser(userId);
		model.addAttribute("Users", adminService.getReportedUsers());
		return "reportedUsers";
	}

	@RequestMapping(value = "/ignoreUser",method = RequestMethod.GET)
	public String ignoreUser(@RequestParam("id")Long userId , Model model)
	{

		adminService.deleteReportByUserId(userId);
		model.addAttribute("Users", adminService.getReportedUsers());
		return "reportedUsers";
	}
	
	
	
	
	@RequestMapping(value = "/manageUsers", method =RequestMethod.GET)
	public String manageUsers(Model model)
	{
		model.addAttribute("BlockedUsers", adminService.getBlockedUsers());
		return "manageUsers";
	}
	
	@RequestMapping(value = "/activeUser",method = RequestMethod.GET)
	public String activeUser(@RequestParam("id")Long userId , Model model)
	{
		adminService.activeUser(userId);
		model.addAttribute("BlockedUsers", adminService.getBlockedUsers());
		return "manageUsers";
	}
	
	@RequestMapping(value = "/showAllProducts",method = RequestMethod.GET)
	public @ResponseBody List<Product> showAllProducts(){
		System.out.println(">>>show all products");
		List<Product> pp =  productService.getAllProducts();
		for (Product p : pp) {
			p.setUser(null);
			p.setOffers(null);
		}
		return pp;
	}

}
