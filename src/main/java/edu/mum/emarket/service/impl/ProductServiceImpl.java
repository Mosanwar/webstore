package edu.mum.emarket.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.mum.emarket.domain.Product;
import edu.mum.emarket.repository.ProductRepository;
import edu.mum.emarket.service.productService;
@Transactional
@Service
public class ProductServiceImpl implements productService {

	@Autowired
	private ProductRepository productRepository;
	@Override
	public Product addProduct(Product p) {
		// TODO Auto-generated method stub
		return productRepository.save(p);
	}

	@Override
	public List<Product> getProducts() {
		// TODO Auto-generated method stub
		return (List<Product>) productRepository.findAll();
	}

	@Override
	public Product getProductById(long id) {
		// TODO Auto-generated method stub
		return productRepository.findOne(id);
	}

	@Override
	public Product editProduct(Product p) {
		// TODO Auto-generated method stub
		return productRepository.save(p);
	}
	
}
