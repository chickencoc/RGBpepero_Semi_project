package com.example.mini.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.mini.dao.ProductService;
import com.example.mini.dao.ReturnService;
import com.example.mini.dao.UserService;
import com.example.mini.model.Product;
import com.example.mini.model.User;
import com.google.gson.Gson;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class ReturnController {
	@Autowired
	private ReturnService returnService;
	@Autowired
	HttpSession session;


	@RequestMapping(value = "/returnList.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String searchReturnList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int startNum = Integer.parseInt(String.valueOf(map.get("startNum")));
		int lastNum = Integer.parseInt(String.valueOf(map.get("lastNum")));
		map.put("startNum", startNum);
		map.put("lastNum", lastNum);

		resultMap = returnService.searchReturnList(map);
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/returnGuestList.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String searchReturnGuestList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
//		int startNum = Integer.parseInt(String.valueOf(map.get("startNum")));
//		int lastNum = Integer.parseInt(String.valueOf(map.get("lastNum")));
//		map.put("startNum", startNum);
//		map.put("lastNum", lastNum);
	
		resultMap = returnService.searchReturnGuestList(map);
		
		return new Gson().toJson(resultMap);
	}
	
	

}
