package edu.mum.emarket.controller;

import edu.mum.emarket.domain.Category;
import edu.mum.emarket.domain.Product;
import edu.mum.emarket.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {

	@Autowired
	private ProductService productService;

	@RequestMapping(value = {"/","/home"},method = RequestMethod.GET)
	public String home() {
		System.out.println(">>>> get home page <<<<");
		return "home";
	}

	@RequestMapping("/product")
	public String getProductById(Model model) {
		//Product product = productService.getProductById(productId);
		model.addAttribute("greeting","Welcome to E-Market Store");
		Product product = productService.getProductById("P123");
		model.addAttribute("product", product);
		return "product";
	}
	
}
