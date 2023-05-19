package com.example.mini.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.mini.dao.GuestRegService;
import com.example.mini.model.User;
import com.google.gson.Gson;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class GuestRegController {

	@Autowired
	GuestRegService guestRegService;
	
	@Autowired
	HttpSession sessGuest;
	
	@Autowired
	HttpServletRequest requestItem;

	@RequestMapping("/guest.do")
    public String guestInfo(Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		requestItem.setAttribute("item", map);
        return "/guest_reg1";
    }
	
	@RequestMapping(value = "/guest/info.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String add(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		sessGuest.setAttribute("name", map.get("name"));
		sessGuest.setAttribute("postcode", map.get("postcode"));
		sessGuest.setAttribute("address", map.get("address"));
		sessGuest.setAttribute("addrDetail", map.get("addrDetail"));
		sessGuest.setAttribute("phone", map.get("phone"));
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping("/guestNormal.do")
    public String payNormal(HttpServletRequest request, Model model) throws Exception{
		request.setAttribute("gname", sessGuest.getAttribute("name"));
		request.setAttribute("phone", sessGuest.getAttribute("phone"));
		request.setAttribute("address", "(" + sessGuest.getAttribute("postcode") + ") " + sessGuest.getAttribute("address") + " " + sessGuest.getAttribute("addrDetail"));
//		/requestItem.setAttribute("item", map);
        return "/guest_reg2";
    }
	
	@RequestMapping(value = "/guest/userInfo.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String guestUserInfo(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		User info = guestRegService.selectUser(map);
		resultMap.put("info", info);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/guest/order.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String guestInput(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		map.put("gname", sessGuest.getAttribute("name"));
		map.put("gphone", sessGuest.getAttribute("phone"));
		map.put("gpostcode", sessGuest.getAttribute("postcode"));
		map.put("gaddress", sessGuest.getAttribute("address"));
		map.put("gaddrDetail", sessGuest.getAttribute("addrDetail"));
		
		guestRegService.writeGuestOrder(map);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	
	
	@RequestMapping("/guestFunding.do")
    public String payFunding(HttpServletRequest request, Model model) throws Exception{
		request.setAttribute("gname", sessGuest.getAttribute("name"));
		request.setAttribute("phone", sessGuest.getAttribute("phone"));
		request.setAttribute("address", "(" + sessGuest.getAttribute("postcode") + ") " + sessGuest.getAttribute("address") + " " + sessGuest.getAttribute("addrDetail"));
        return "/guest_reg3";
    }
	
	@RequestMapping(value = "/guest/orderF.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String guestInputF(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		map.put("gname", sessGuest.getAttribute("name"));
		map.put("gphone", sessGuest.getAttribute("phone"));
		map.put("gpostcode", sessGuest.getAttribute("postcode"));
		map.put("gaddress", sessGuest.getAttribute("address"));
		map.put("gaddrDetail", sessGuest.getAttribute("addrDetail"));
		
		guestRegService.writeGuestOrder(map);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	
}
