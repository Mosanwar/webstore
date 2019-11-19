package edu.mum.emarket.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import edu.mum.emarket.domain.Offer;

@Repository
public interface OfferRepository extends CrudRepository<Offer, Long>{

}
