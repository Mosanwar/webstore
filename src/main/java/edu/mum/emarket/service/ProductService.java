package edu.mum.emarket.service;


import edu.mum.emarket.domain.Product;

import java.util.List;
import java.util.Map;
import java.util.Set;

public interface ProductService {

	List<Product> getAllProducts();

	Product getProductById(String productID);

	List<Product> getProductsByCategory(String category);


	void addProduct(Product product);
}
