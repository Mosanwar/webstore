package edu.mum.emarket.repository;

import edu.mum.emarket.domain.Cart;
import edu.mum.emarket.domain.Product;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;
import java.util.Set;
@Repository
public interface ProductRepository  extends CrudRepository<Product,Long> {

	Product getProductByProductId(String productId);

	List<Product> getProductsByCategory(String category);


}
