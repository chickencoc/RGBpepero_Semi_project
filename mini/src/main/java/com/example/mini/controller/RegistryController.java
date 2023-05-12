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
	@RequestMapping("/guestRegistry.do") 
    public String guestRegistry(Model model) throws Exception{

        return "guest_reg0";
    }	
	@RequestMapping("/registryOption.do") 
    public String registryOption(Model model) throws Exception{

        return "registry_options_popup";
    }	
	@RequestMapping("/registryGift.do") 
    public String registryGift(Model model) throws Exception{

        return "registry_gift_popup";
    }	
	@RequestMapping("/registryImg.do") 
    public String registryBackImg(Model model) throws Exception{

        return "myInfo_img";
    }	
}
