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

import com.example.mini.dao.MyInfoService;
import com.google.gson.Gson;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class MyInfoController {
	@Autowired
	private MyInfoService myInfoService;
	@Autowired
	HttpSession session;
	
	@RequestMapping("/mygift.do") 
    public String mainPage(HttpServletRequest request, Model model) throws Exception{
		request.setAttribute("sessionId", session.getAttribute("sessionId"));
		request.setAttribute("sessionOrderNo", session.getAttribute("sessionOrderNo"));
        return "/myInfo_gift0";
    }
	
	@RequestMapping(value = "/myInfoGift0.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String searchGiftList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int startNum = Integer.parseInt(String.valueOf(map.get("startNum")));
		int lastNum = Integer.parseInt(String.valueOf(map.get("lastNum")));
		map.put("startNum", startNum);
		map.put("lastNum", lastNum);
		resultMap = myInfoService.searchMyGiftList(map);
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping("/myInfoGift2List.do") 
    public String giftList(HttpServletRequest request, HttpServletResponse response, Model model,
    		@RequestParam HashMap<String, Object> map) throws Exception{
		request.setAttribute("map", map);
		
        return "/myInfo_gift2_list";
    }
	
	 @RequestMapping(value = "/myInfoGift2List.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String searchProdList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			int startNum = Integer.parseInt(String.valueOf(map.get("startNum")));
			int lastNum = Integer.parseInt(String.valueOf(map.get("lastNum")));
			map.put("startNum", startNum);
			map.put("lastNum", lastNum);
			resultMap = myInfoService.searchReturnGiftList(map);
			return new Gson().toJson(resultMap);
		}
	 
	 @RequestMapping("/myInfoGift2Send.do") 
	    public String giftSend(HttpServletRequest request, HttpServletResponse response, Model model,
	    		@RequestParam HashMap<String, Object> map) throws Exception{
			request.setAttribute("map", map);
			
	        return "/myInfo_gift2_send";
	    }
	 
	 @RequestMapping(value = "/myInfoGift2Send.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String searchGiftInfo(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			
			resultMap = myInfoService.searchReturnGiftInfo(map);
			resultMap.put("message", "성공");
			return new Gson().toJson(resultMap);
		}
}
