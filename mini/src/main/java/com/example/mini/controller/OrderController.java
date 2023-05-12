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

import com.example.mini.dao.OrderService;
import com.example.mini.model.Order;
import com.google.gson.Gson;

import jakarta.servlet.http.HttpServletRequest;
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
	public String searchProdOrder(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		Order order = orderService.searchProdOrder(map);
		resultMap.put("info", order);
		return new Gson().toJson(resultMap);
	}
	
}
