package com.example.mini.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class MainController {

	
	@Autowired
	HttpSession session;
	
	// 로그인 했을 때 세션 값 가져오기
	@RequestMapping("/main.do") 
    public String mainPage(HttpServletRequest request, Model model) throws Exception{
		request.setAttribute("sessionId", session.getAttribute("sessionId"));
		request.setAttribute("sessionName", session.getAttribute("sessionName"));
		request.setAttribute("sessionStatus", session.getAttribute("sessionStatus"));
        return "/main";
    }
	
	// 로그아웃
	@RequestMapping("/logout.do") 
    public String login(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		String id = (String) session.getAttribute("sessionId");
		String name = (String) session.getAttribute("sessionName");
		String status = (String) session.getAttribute("sessionStatus");
		String email = (String) session.getAttribute("ssesionEmail");
		
		session.removeAttribute(id);
		session.removeAttribute(name);
		session.removeAttribute(status);
		session.removeAttribute(email);
		session.invalidate();
		return "/main"; 
    }
	
}
