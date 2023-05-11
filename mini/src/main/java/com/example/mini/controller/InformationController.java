package com.example.mini.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class InformationController {

	
	@RequestMapping("/information.do") 
    public String infomation(Model model) throws Exception{
        return "/myinfo_0";
    }
	
	@RequestMapping("/informationmodify.do") 
    public String infomationModify(Model model) throws Exception{
        return "/myinfo_1";
    }
	
}
