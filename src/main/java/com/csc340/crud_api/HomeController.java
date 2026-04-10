package com.csc340.crud_api;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

    @GetMapping("/")
    public String home() {
        return "redirect:/characters";
    }

    @GetMapping("/about")
    public String about() {
        return "about";
    }
}