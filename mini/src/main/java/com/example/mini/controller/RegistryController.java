package com.example.mini.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RegistryController {

	
	@RequestMapping("/myRegistry.do") 
    public String registry(Model model) throws Exception{

        return "myInfo_reg";
    }
		
}
