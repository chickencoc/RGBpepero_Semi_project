package com.example.mini.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ReviewController {

	
	@RequestMapping("/review.do") 
    public String reviewCreat(Model model) throws Exception{
        return "/prod70";
    }
	
	@RequestMapping("/reviewmodify.do") 
    public String reviewModify(Model model) throws Exception{
        return "/prod71";
    }
	
}
