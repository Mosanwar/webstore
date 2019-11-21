package edu.mum.emarket.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import edu.mum.emarket.domain.Category;

@Repository
public interface CategoryRepository extends CrudRepository<Category, Long> {

}
