package edu.mum.emarket.service.impl;

import edu.mum.emarket.domain.Credentials;
import edu.mum.emarket.domain.Person;
import edu.mum.emarket.domain.User;
import edu.mum.emarket.repository.AdminRepository;
import edu.mum.emarket.repository.CredentialsRepository;
import edu.mum.emarket.repository.UserRepository;
import edu.mum.emarket.service.AuthorityService;
import edu.mum.emarket.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.stream.Collectors;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserRepository userRepository;

    @Autowired
    private AuthorityService authorityService;

    @Autowired
    private CredentialsRepository credentialsRepository;

    @Autowired
    private AdminRepository adminRepository;

    @Override
    public User registerUser(User user) {
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        String encodedPassword = encoder.encode(user.getPassword());

        Credentials credentials = new Credentials(user.getEmail(), encodedPassword, true);
        credentials = getCredentialsRepository().save(credentials);

        user.setPassword(encodedPassword);
        user = getUserRepository().save(user);

        getAuthorityService().saveAuthority("ROLE_USER", user.getEmail());
        return user;
    }

    @Override
    public Person getLoggedInPerson() {
        Object obj = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if(checkRole(obj, "ROLE_USER")){
            return getUserRepository().findByEmail(((org.springframework.security.core.userdetails.User)obj).getUsername());
        } else if (checkRole(obj, "ROLE_ADMIN")){
            return getAdminRepository().findByEmail(((org.springframework.security.core.userdetails.User)obj).getUsername());
        }
        return null;
    }

    private boolean checkRole(Object principal, String role) {
        return principal instanceof org.springframework.security.core.userdetails.User && !((org.springframework.security.core.userdetails.User) principal).getAuthorities().stream().filter(g -> g.getAuthority().contains(role)).collect(Collectors.toList()).isEmpty();
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

    public AdminRepository getAdminRepository() {
        return adminRepository;
    }

    public void setAdminRepository(AdminRepository adminRepository) {
        this.adminRepository = adminRepository;
    }
}
