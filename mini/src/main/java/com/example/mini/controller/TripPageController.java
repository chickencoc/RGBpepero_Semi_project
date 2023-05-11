package com.example.mini.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TripPageController {

	
	@RequestMapping("/trippage.do") 
    public String trip(Model model) throws Exception{
        return "/prod6_sub1";
    }
	@RequestMapping("/triprecommend.do") 
    public String tripRecommend(Model model) throws Exception{
        return "/prod6_sub0";
    }
	
	
}
