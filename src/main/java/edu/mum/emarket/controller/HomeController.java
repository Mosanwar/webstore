package edu.mum.emarket.controller;

import org.springframework.beans.factory.annotation.Autowired;
import edu.mum.emarket.domain.Category;
import edu.mum.emarket.domain.Product;
import edu.mum.emarket.service.ProductService;
import edu.mum.emarket.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import java.util.stream.Collectors;

import edu.mum.emarket.service.*;

@Controller
@SessionAttributes("loggedInUser")
public class HomeController {

	@Autowired
	private ProductService productService;

	@Autowired
	private UserService userService;

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

	@RequestMapping(value= {"/product"})
	public String getProductById(Model model) {
		//Product product = productService.getProductById(productId);
		model.addAttribute("greeting","Welcome to E-Market Store");
		Product product = productService.getProductByProductId("P123");
		model.addAttribute("product", product);
		return "product";
	}

	@RequestMapping(value = "/profile", method = RequestMethod.GET)
	public String getProfile(@ModelAttribute("user") edu.mum.emarket.domain.User user, Model model){
		user = (edu.mum.emarket.domain.User) getUserService().getLoggedInPerson();
		model.addAttribute("user", user);

		return "profile";
	}

	private boolean checkRole(Object principal, String role) {
		return principal instanceof User && !((User) principal).getAuthorities().stream().filter(g -> g.getAuthority().contains(role)).collect(Collectors.toList()).isEmpty();
	}

	//---------------------setters and getters---------------------------

	public ProductService getProductService() {
		return productService;
	}

	public void setProductService(ProductService productService) {
		this.productService = productService;
	}

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}
}
