package edu.mum.emarket.repository;


import edu.mum.emarket.domain.Cart;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CartRepository extends CrudRepository<Cart,String> {


}
