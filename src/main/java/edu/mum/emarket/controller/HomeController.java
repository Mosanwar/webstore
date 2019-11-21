package edu.mum.emarket.controller;

import org.springframework.beans.factory.annotation.Autowired;
import edu.mum.emarket.domain.Category;
import edu.mum.emarket.domain.Product;
import edu.mum.emarket.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import java.util.stream.Collectors;

import edu.mum.emarket.service.*;

@Controller
@SessionAttributes("loggedInUser")
public class HomeController {

	@Autowired
	ProductService productService;
	@RequestMapping(value = {"/","/home"},method = RequestMethod.GET)
	public String home(Model model) {
		model.addAttribute("products", productService.getAllProducts());

//		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
//		if(checkRole(principal, "USER_ROLE")){
//			model.addAttribute("loggedInUser", SecurityContextHolder.getContext().getAuthentication().getPrincipal());
//		}
//		System.out.println("Current user: "+ SecurityContextHolder.getContext().getAuthentication().getPrincipal());
		return "home";
	}

	private boolean checkRole(Object principal, String role) {
		return principal instanceof User && !((User) principal).getAuthorities().stream().filter(g -> g.getAuthority().contains(role)).collect(Collectors.toList()).isEmpty();
	}

}
