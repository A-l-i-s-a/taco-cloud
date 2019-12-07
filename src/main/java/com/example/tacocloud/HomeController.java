package com.example.tacocloud;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import javax.validation.constraints.Size;

@Controller
public class HomeController {
    @GetMapping("/")
    public String home() {
        return "home";
    }
}
