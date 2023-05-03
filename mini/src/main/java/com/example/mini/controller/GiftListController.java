package com.example.mini.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class GiftListController {

	@RequestMapping("/giftlist.do") 
    public String giftlist(Model model) throws Exception{
		return "/giftlist";
	}
		
	
	
}
