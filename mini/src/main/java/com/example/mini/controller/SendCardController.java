package com.example.mini.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SendCardController {

	
	@RequestMapping("/sendcard.do") 
    public String gift1(Model model) throws Exception{
        return "/myInfo_gift1_send";
    }
	
	@RequestMapping("/returngoods.do")
    public String gift2(Model model) throws Exception{
        return "/myInfo_gift2";
    }
	
}
