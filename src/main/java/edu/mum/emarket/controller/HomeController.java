package edu.mum.emarket.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.mum.emarket.service.productService;

@Controller
public class HomeController {

	@Autowired
	productService productService;
	@RequestMapping(value = {"/","/home"},method = RequestMethod.GET)
	public String home(Model model) {
		model.addAttribute("products", productService.getProducts());
		return "home";
	}
	
}
