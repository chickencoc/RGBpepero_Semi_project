package com.example.mini.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.mini.dao.MainService;
import com.google.gson.Gson;

@Controller
public class TripPageController {

	
	@Autowired
	private MainService mainService;
	
	@RequestMapping("/trippage.do") 
    public String trip(Model model) throws Exception{
        return "/prod6_sub1";
    }
	@RequestMapping("/triprecommend.do") 
    public String tripRecommend(Model model) throws Exception{
        return "/prod6_sub0";
    }
	
	//여행 펀딩 레지스트리 추가
	@RequestMapping(value = "/tripFundingAdd.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String tripFundingAdd(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		mainService.tripFundingAdd(map);
		resultMap.put("message", "성공");
		return new Gson().toJson(resultMap);
	}
	
}
