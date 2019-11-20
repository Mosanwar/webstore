package edu.mum.emarket.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.mum.emarket.domain.Offer;

@Controller
public class OfferController {

	@RequestMapping(value = "/offers",method = RequestMethod.GET)
	public String home() {
		System.out.println(">>>> get offers page <<<<");
		return "offers";
	}
	
	@RequestMapping(value = "/addOffer",method = RequestMethod.GET)
	public String displayAddOffer(@ModelAttribute("offer") Offer offer) {
		return "addOffer";
	}
}
