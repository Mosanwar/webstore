package edu.mum.emarket.controller;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import java.util.stream.Collectors;

@Controller
@SessionAttributes("loggedInUser")
public class HomeController {

	@RequestMapping(value = {"/","/home"},method = RequestMethod.GET)
	public String home(Model model) {
//		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
//		if(checkRole(principal, "USER_ROLE")){
//			model.addAttribute("loggedInUser", SecurityContextHolder.getContext().getAuthentication().getPrincipal());
//		}
//		System.out.println("Current user: "+ SecurityContextHolder.getContext().getAuthentication().getPrincipal());
		System.out.println(">>>> get home page <<<<");
		return "home";
	}

	private boolean checkRole(Object principal, String role) {
		return principal instanceof User && !((User) principal).getAuthorities().stream().filter(g -> g.getAuthority().contains(role)).collect(Collectors.toList()).isEmpty();
	}

}
