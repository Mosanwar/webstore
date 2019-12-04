package edu.mum.emarket.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Service;

import edu.mum.emarket.domain.Product;
import edu.mum.emarket.repository.ProductRepository;
import edu.mum.emarket.service.ProductService;

@Transactional
@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductRepository productRepository;

	@Override
	@PreAuthorize("hasAnyRole('ROLE_USER', 'ROLE_ADMIN')")
	public Product addProduct(Product product) {
		// TODO Auto-generated method stub
		return productRepository.save(product);
	}

	@Override
	public List<Product> getAllProducts() {
		// TODO Auto-generated method stub
		return (List<Product>) productRepository.findAll();
	}

	@Override
	public Product getProductById(long id) {
		// TODO Auto-generated method stub
		return productRepository.findOne(id);
	}

	@Override
	public List<Product> getProductsByCategory(String category) {
		return productRepository.getProductsByCategory(category);
	}

	@Override
	@PreAuthorize("hasAnyRole('ROLE_USER', 'ROLE_ADMIN')")
	public Product editProduct(Product p) {
		// TODO Auto-generated method stub
		return productRepository.save(p);
	}

	@Override
	public Product getProductByProductId(String productID) {
		// TODO Auto-generated method stub
		return productRepository.getProductByProductId(productID);
	}

	@Override
	public Product getProductById(String productID) {
		// TODO Auto-generated method stub
		return null;
	}

}
