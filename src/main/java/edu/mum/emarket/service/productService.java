package edu.mum.emarket.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import edu.mum.emarket.domain.Product;

public interface productService {
	
	Product addProduct(Product p);
	
	List<Product> getProducts();
	
	Product getProductById(long id);
	
	Product editProduct(Product p);
}
