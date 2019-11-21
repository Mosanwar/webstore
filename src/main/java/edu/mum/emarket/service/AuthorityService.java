package edu.mum.emarket.service;

import edu.mum.emarket.domain.Authority;

public interface AuthorityService {
    Authority saveAuthority(Authority authority);

    Authority saveAuthority(String authority, String email);
}
