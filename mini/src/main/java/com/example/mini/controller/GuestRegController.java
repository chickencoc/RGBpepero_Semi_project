package com.example.mini.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class GuestRegController {

	
	@Autowired
	HttpSession sessGuest;

	@RequestMapping("/guest.do")
    public String guestInfo(Model model) throws Exception{

        return "/guest_reg1";
    }
	
	@RequestMapping(value = "/guest/info.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String add(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		sessGuest.setAttribute("gname", map.get("gname"));
		sessGuest.setAttribute("postcode", map.get("postcode"));
		sessGuest.setAttribute("address", map.get("address"));
		sessGuest.setAttribute("addrDetail", map.get("addrDetail"));
		sessGuest.setAttribute("phone", map.get("phone"));
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping("/guestNomal.do")
    public String payNormal(HttpServletRequest request, Model model) throws Exception{
		request.setAttribute("gname", sessGuest.getAttribute("name"));
		request.setAttribute("phone", sessGuest.getAttribute("phone"));
		request.setAttribute("address", "(" + sessGuest.getAttribute("postcode") + ") " + sessGuest.getAttribute("address") + " " + sessGuest.getAttribute("addrDetail"));
        return "/guest_reg2";
    }
	
	@RequestMapping("/guestFunding.do")
    public String payFunding(HttpServletRequest request, Model model) throws Exception{
		request.setAttribute("gname", sessGuest.getAttribute("name"));
		request.setAttribute("phone", sessGuest.getAttribute("phone"));
		request.setAttribute("address", "(" + sessGuest.getAttribute("postcode") + ") " + sessGuest.getAttribute("address") + " " + sessGuest.getAttribute("addrDetail"));
        return "/guest_reg3";
    }
	
	@RequestMapping(value = "/guest/get.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String guestInput(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		

		return new Gson().toJson(resultMap);
	}
	
}
