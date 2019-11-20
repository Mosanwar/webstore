package edu.mum.emarket.service;

import edu.mum.emarket.domain.Person;
import edu.mum.emarket.domain.User;

public interface UserService {

    User registerUser(User user);

    Person getLoggedInPerson();
}
