package edu.mum.emarket.service;


import edu.mum.emarket.domain.Product;

import java.util.List;

public interface ProductService {

	List<Product> getAllProducts();

	Product getProductById(long productID);
	
	Product getProductByProductId(String productID);

	List<Product> getProductsByCategory(String category);


	Product addProduct(Product product);
	
	Product editProduct(Product p);
}
