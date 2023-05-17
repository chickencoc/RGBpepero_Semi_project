package com.example.mini.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.mini.dao.RegistryService;
import com.example.mini.model.MyRegistry;
import com.example.mini.model.UserImage;
import com.google.gson.Gson;

@Controller
public class RegistryController {

	@Autowired
	private RegistryService registryService;
	
	@RequestMapping("/myRegistry.do") 
    public String selectUserRegistry(Model model) throws Exception{

        return "myInfo_reg";
    }
	
	@RequestMapping(value = "/myRegistry.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String selectUserRegistry(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<MyRegistry> registry = registryService.selectUserRegistry(map);
		resultMap.put("registry", registry);
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/registryOption.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String updateRegistryOption(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		registryService.updateRegistryOption(map);
		resultMap.put("message", "성공");
		return new Gson().toJson(resultMap);
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
	@RequestMapping("/registryBackImg.do") 
    public String registryBackImg(Model model) throws Exception{

        return "myInfo_img_background";
    }	
	@RequestMapping("/registryProfileImg.do") 
    public String registryProfileImg(Model model) throws Exception{

        return "myInfo_img_profile";
    }
	@RequestMapping(value = "/registryImg.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String selectUserImage(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<UserImage> image = registryService.selectUserImage(map);
		resultMap.put("image", image);
		return new Gson().toJson(resultMap);
	}
	@RequestMapping(value = "/updateRegistryImg.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String UpdateUserImg(Model model, @RequestParam HashMap<String, Object> map ) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		registryService.updateUserImg(map);		
		resultMap.put("message", "성공");
		return new Gson().toJson(resultMap);
	}
	@RequestMapping(value = "/saveRegistryImg.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String saveUserImg(Model model, @RequestParam HashMap<String, Object> map ) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		registryService.saveUserImg(map);		
		resultMap.put("message", "성공");
		return new Gson().toJson(resultMap);
	}
}
