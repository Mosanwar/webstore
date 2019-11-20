package edu.mum.emarket.service.impl;

import edu.mum.emarket.domain.Authority;
import edu.mum.emarket.domain.User;
import edu.mum.emarket.repository.UserRepository;
import edu.mum.emarket.service.AuthorityService;
import edu.mum.emarket.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserRepository userRepository;

    @Autowired
    private AuthorityService authorityService;

    @Override
    public User registerUser(User user) {
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        String encodedPassword = encoder.encode(user.getPassword());
        user.setPassword(encodedPassword);
        user = getUserRepository().save(user);
        getAuthorityService().saveAuthority("ROLE_ADMIN", user.getEmail());
        return user;
    }

    //-----------------------setters and getters----------------

    public UserRepository getUserRepository() {
        return userRepository;
    }

    public void setUserRepository(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public AuthorityService getAuthorityService() {
        return authorityService;
    }

    public void setAuthorityService(AuthorityService authorityService) {
        this.authorityService = authorityService;
    }
}