package edu.mum.emarket.interceptor;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class ExceptionsHandler {

    @ExceptionHandler(ForbiddenExceptionHandler.class)
    public String handleForbiddenException(ForbiddenExceptionHandler e, Model model){
        model.addAttribute("message", e.getMessage());
        return "error-forbidden";
    }
}
