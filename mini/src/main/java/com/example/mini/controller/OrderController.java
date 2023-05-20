package com.example.mini.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.mini.dao.OrderService;
import com.example.mini.model.Order;
import com.google.gson.Gson;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class OrderController {

	@Autowired
	private OrderService orderService;
	@Autowired
	HttpSession session;
	
	@RequestMapping("/myInfoGift9.do") 
    public String myInfoGift9(HttpServletRequest request, Model model) throws Exception{
		request.setAttribute("sessionId", session.getAttribute("sessionId"));
		request.setAttribute("sessionOrderNo", session.getAttribute("sessionOrderNo"));
		request.setAttribute("sessionDeliveryNo", session.getAttribute("sessionDeliveryNo"));
		
        return "/myInfo_gift9";
    }
	
	@RequestMapping(value = "/myInfoGift9.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String searchProdOrder(HttpServletRequest request, HttpServletResponse response,Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		request.setAttribute("map", map);
		Order order = orderService.searchProdOrder(map);
		resultMap.put("info", order);
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping("/myInfoGift1.do") 
    public String myInfoGift1(HttpServletRequest request, HttpServletResponse response, Model model,
    		@RequestParam HashMap<String, Object> map) throws Exception{
		request.setAttribute("map", map);
        return "/myInfo_gift1";
	}
	
	 @RequestMapping(value = "/myInfoGift1.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String searchProdList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			int startNum = Integer.parseInt(String.valueOf(map.get("startNum")));
			int lastNum = Integer.parseInt(String.valueOf(map.get("lastNum")));
			map.put("startNum", startNum);
			map.put("lastNum", lastNum);
			resultMap = orderService.searchProdList(map);
			return new Gson().toJson(resultMap);
		}
	 
	 @RequestMapping("/myInfoGift1Send.do") 
	    public String myInfoGift1Send(HttpServletRequest request, HttpServletResponse response, Model model,
	    		@RequestParam HashMap<String, Object> map) throws Exception{
		 request.setAttribute("map", map);
	        return "/myInfo_gift1_send";
		}
	 
	 @RequestMapping(value = "/myInfoGift1Send.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String searchCardInfo(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			
			resultMap = orderService.searchCardInfo(map);
			resultMap.put("message", "성공");
			return new Gson().toJson(resultMap);
		}
	 
	 @RequestMapping(value = "/addCardContent.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String addCardContent(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			orderService.addCardContent(map);
			resultMap.put("result", "success");
			return new Gson().toJson(resultMap);
		}
	 
	 @RequestMapping(value = "/myInfoGift1SendBackground.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String searchCardBackgroundInfo(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		 HashMap<String, Object> resultMap = new HashMap<String, Object>();
		 	resultMap = orderService.searchCardBackInfo(map);
			resultMap.put("message", "성공");
			return new Gson().toJson(resultMap);
		}
	 
	 
	 @RequestMapping("/myInfoGift8.do") 
	    public String myInfoGift8(HttpServletRequest request, HttpServletResponse response, Model model,
	    		@RequestParam HashMap<String, Object> map) throws Exception{
		 request.setAttribute("map", map);
	        return "/myInfo_gift8";
		}
	 
	 @RequestMapping(value = "/addGiftOrder.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String addGiftOrder(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			orderService.addGiftOrder(map);
			resultMap.put("result", "success");
			return new Gson().toJson(resultMap);
		}
}
