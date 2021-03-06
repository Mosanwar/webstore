package edu.mum.emarket.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.mum.emarket.domain.Offer;
import edu.mum.emarket.domain.Product;
import edu.mum.emarket.service.OfferService;
import edu.mum.emarket.service.ProductService;

@Controller
public class OfferController {

	@Autowired
	private ProductService productService;

	@Autowired
	private OfferService offerService;
	
	@Autowired
	private SimpMessagingTemplate template;

	@RequestMapping(value = "/offers", method = RequestMethod.GET)
	public String home(Model model) {
		System.out.println(">>>> get offers page <<<<");
		model.addAttribute("offers", offerService.getAllOffers());
		return "offers";
	}

	@RequestMapping(value = "/addOffer", method = RequestMethod.GET)
	public String displayAddOffer(@ModelAttribute("offer") Offer offer, Model model) {
		List<Product> products = productService.getAllProducts();
		System.out.println(">>> products: "+products.size());
		model.addAttribute("products", productService.getAllProducts());
		return "addOffer";
	}

	@RequestMapping(value = "/addOffer", method = RequestMethod.POST)
	public @ResponseBody Offer addOffer(@Valid @RequestBody Offer offer) {
		System.out.println(">>> save offer");
		Offer response = offerService.addOffer(offer);
		System.out.println(">>>>> send to broker: /topic/offer");
		this.template.convertAndSend("/offer", response);
		return response;
	}

	@RequestMapping(value = "/offer", method = RequestMethod.GET)
	public String getOffer(@RequestParam("id") long id, Model model) {
		model.addAttribute("offer", offerService.getOfferById(id));
		return "offerDetails";
	}
}
