package edu.mum.emarket.service.impl;

import edu.mum.emarket.domain.Authority;
import edu.mum.emarket.repository.AuthorityRepository;
import edu.mum.emarket.service.AuthorityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AuthorityServiceImpl implements AuthorityService {
    @Autowired
    private AuthorityRepository authorityRepository;

    @Override
    public Authority saveAuthority(Authority authority) {
        return getAuthorityRepository().save(authority);
    }

    @Override
    public Authority saveAuthority(String authority, String email) {
        Authority auth = new Authority(authority, email);
        return saveAuthority(auth);
    }

    //-----------------------setters and getters----------------

    public AuthorityRepository getAuthorityRepository() {
        return authorityRepository;
    }

    public void setAuthorityRepository(AuthorityRepository authorityRepository) {
        this.authorityRepository = authorityRepository;
    }
}
