package edu.mum.emarket.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import edu.mum.emarket.domain.Product;

@Repository
public interface ProductRepository extends CrudRepository<Product, Long>{

}
