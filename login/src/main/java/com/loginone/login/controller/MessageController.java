package com.loginone.login.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("api/vi/Message")
public class MessageController {
    public String getMessage(){
        return"hello";

    }
}
