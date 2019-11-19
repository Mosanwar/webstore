package edu.mum.emarket.service;

import java.util.List;

import edu.mum.emarket.domain.Offer;

public interface OfferService {

	List<Offer> getAllOffers();

	Offer getOfferById(long id);

	Offer addOffer(Offer offer);
}
