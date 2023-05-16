package com.example.mini.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.mini.dao.ProdSubService;
import com.google.gson.Gson;

@Controller
public class WeddingRecommendController {
	@Autowired
	private ProdSubService prodSubService;
	
	@RequestMapping("/weddingrecommend.do") 
    public String mainPage(Model model) throws Exception{
		
        return "/prod5_sub0";
    }
	
	@RequestMapping(value = "/prodSubWedding.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String searchWeddingList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int startNum = Integer.parseInt(String.valueOf(map.get("startNum")));
		int lastNum = Integer.parseInt(String.valueOf(map.get("lastNum")));
		map.put("startNum", startNum);
		map.put("lastNum", lastNum);
		resultMap = prodSubService.searchWeddingList(map);
		resultMap.put("message", "성공");
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/weddingRecommend.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String searchWeddingRList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = prodSubService.serachWeddingRList(map);
		resultMap.put("message", "성공");
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping("/tripRecommend.do") 
    public String tripPage(Model model) throws Exception{
		
        return "/prod6_sub0";
    }
	
	@RequestMapping(value = "/tripRecommend.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String searchtripList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int startNum = Integer.parseInt(String.valueOf(map.get("startNum")));
		int lastNum = Integer.parseInt(String.valueOf(map.get("lastNum")));
		map.put("startNum", startNum);
		map.put("lastNum", lastNum);
		resultMap = prodSubService.searchTripList(map);
		resultMap.put("message", "성공");
		return new Gson().toJson(resultMap);
	}
}
