package edu.mum.emarket.service.impl;

import edu.mum.emarket.domain.Product;
import edu.mum.emarket.repository.ProductRepository;
import edu.mum.emarket.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.Set;

@Service
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	private ProductRepository productRepository;

	public List<Product> getAllProducts() {
		return (List<Product>) productRepository.findAll();
	}

	public Product getProductById(String productID) {
		return productRepository.getProductByProductId(productID);
	}

	public List<Product> getProductsByCategory(String category) {
		return productRepository.getProductsByCategory(category);
	}


	public void addProduct(Product product) {
		   productRepository.save(product);
	}

}
