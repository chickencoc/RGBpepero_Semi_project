package com.example.mini.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {

	@RequestMapping("/marrimo.do") 
    public String mainPage(Model model) throws Exception{
		return "/main";
	}
		
	
	
}
