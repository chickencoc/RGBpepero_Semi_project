package com.example.mini.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.mini.dao.UserSelectService;
import com.example.mini.dao.UserService;
import com.example.mini.dao.UserUpdateService;
import com.example.mini.model.User;
import com.google.gson.Gson;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class InformationController {
	
	@Autowired
	private UserSelectService userSelectService;
	private UserUpdateService userUpdateService;
	@Autowired
	HttpSession session;

	
	@RequestMapping("/information.do") 
    public String infomation(HttpServletRequest request, Model model) throws Exception{
		request.setAttribute("sessionId", session.getAttribute("sessionId"));
		request.setAttribute("sessionName", session.getAttribute("sessionName"));
		request.setAttribute("sessionStatus", session.getAttribute("sessionStatus"));
        return "/myinfo_0";
    }
	//유저정보 마이페이지에 뿌리기
	 @RequestMapping(value = "/information.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String selectUserList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			User list = userSelectService.selectUser(map);
			resultMap.put("list", list);
			return new Gson().toJson(resultMap);
		}
	
	@RequestMapping("/informationmodify.do") 
    public String infomationModify(HttpServletRequest request, Model model) throws Exception{
		request.setAttribute("sessionId", session.getAttribute("sessionId"));
		request.setAttribute("sessionName", session.getAttribute("sessionName"));
		request.setAttribute("sessionStatus", session.getAttribute("sessionStatus"));
        return "/myinfo_1";
    }
	//유저정보 마이페이지(수정)에 뿌리기
	@RequestMapping(value = "/informationmodify.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String selectUserList2(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		User list = userSelectService.selectUser(map);
		resultMap.put("list", list);
		return new Gson().toJson(resultMap);
	}
	//유저정보 업데이트 
	@RequestMapping(value = "/information/edit.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String editInformation(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		userUpdateService.updateUser(map);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	
}
