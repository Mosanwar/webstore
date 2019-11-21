package edu.mum.emarket.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.mum.emarket.domain.Offer;
import edu.mum.emarket.repository.OfferRepository;
import edu.mum.emarket.service.OfferService;

@Service
@Transactional
public class OfferServiceImpl implements OfferService {

//	@Autowired
//	private SimpMessagingTemplate template;

	@Autowired
	private OfferRepository offerRepo;

	@Override
	public List<Offer> getAllOffers() {
		return (List<Offer>) offerRepo.findAll();
	}

	@Override
	public Offer getOfferById(long id) {
		return offerRepo.findOne(id);
	}

	@Override
	public Offer addOffer(Offer offer) {
//		this.template.convertAndSend("/topic/offer", offer);
		return offerRepo.save(offer);
	}

}
