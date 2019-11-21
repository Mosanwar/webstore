package edu.mum.emarket.interceptor;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(value = HttpStatus.FORBIDDEN, reason = "This page is not allowed for you")
public class ForbiddenExceptionHandler extends RuntimeException {
    private String message;

    public ForbiddenExceptionHandler(String message) {
        this.message = message;
    }

    @Override
    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
