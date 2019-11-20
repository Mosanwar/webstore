package edu.mum.emarket.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.mum.emarket.domain.Product;
import edu.mum.emarket.repository.ProductRepository;
import edu.mum.emarket.service.ProductService;

@Service
@Transactional
public class ProductServiceImpl implements ProductService{

	@Autowired
	private ProductRepository productRepo;
	
	@Override
	public List<Product> getAllProducts() {
		return (List<Product>)productRepo.findAll();
	}

}
