package edu.mum.emarket.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import edu.mum.emarket.domain.Offer;

@Repository
public interface OfferRepository extends CrudRepository<Offer, Long>{

	@Query("select o from Offer o")
	List<Offer> getOffers();
}
