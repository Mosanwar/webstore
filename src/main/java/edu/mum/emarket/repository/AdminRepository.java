package edu.mum.emarket.repository;

import edu.mum.emarket.domain.Admin;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AdminRepository extends CrudRepository<Admin, Long> {
    Admin findByEmail(String email);
}
