package edu.mum.emarket.controller;

import edu.mum.emarket.domain.User;
import edu.mum.emarket.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@Controller
public class AuthenticationController {

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/login")
    public String login(Model model){
        return "login";
    }

    @RequestMapping("/loginfailed")
    public String loginfailed(Model model){
        model.addAttribute("error", "true");
        return "login";
    }

    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public String registerForm(@ModelAttribute User user){
        return "register";
    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String register(@Valid @ModelAttribute User user, BindingResult result){

        if (result.hasErrors()) {
            return "/register";
        }

        getUserService().registerUser(user);
        return "redirect:/";
    }

    @RequestMapping("/emp") 
    public String emp(){
        SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        return "/home";
    }

    @RequestMapping("/logout")
    public String logout(){
        return "redirect:/home";
    }

    //----------------------setters and getters-----------------

    public UserService getUserService() {
        return userService;
    }

    public void setUserService(UserService userService) {
        this.userService = userService;
    }
}
