package edu.mum.emarket.service.impl;

import edu.mum.emarket.domain.Authority;
import edu.mum.emarket.domain.Credentials;
import edu.mum.emarket.domain.User;
import edu.mum.emarket.repository.CredentialsRepository;
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

    @Autowired
    private CredentialsRepository credentialsRepository;

    @Override
    public User registerUser(User user) {
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        String encodedPassword = encoder.encode(user.getPassword());

        Credentials credentials = new Credentials(user.getEmail(), encodedPassword, true);
        credentials = getCredentialsRepository().save(credentials);

        user.setPassword(encodedPassword);
        user = getUserRepository().save(user);

        getAuthorityService().saveAuthority("USER_ROLE", user.getEmail());
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

    public CredentialsRepository getCredentialsRepository() {
        return credentialsRepository;
    }

    public void setCredentialsRepository(CredentialsRepository credentialsRepository) {
        this.credentialsRepository = credentialsRepository;
    }
}
