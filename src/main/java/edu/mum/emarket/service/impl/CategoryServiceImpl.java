package edu.mum.emarket.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.mum.emarket.domain.Category;
import edu.mum.emarket.repository.CategoryRepository;
import edu.mum.emarket.service.CategoryService;

@Transactional
@Service
public class CategoryServiceImpl implements CategoryService{

	@Autowired
	CategoryRepository categoryRepository;
	
	@Override
	public List<Category> getAllCategories() {
		// TODO Auto-generated method stub
		return (List<Category>) categoryRepository.findAll();
		
	}
	
}
