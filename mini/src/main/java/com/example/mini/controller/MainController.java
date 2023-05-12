package com.example.mini.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class MainController {

	
	@Autowired
	HttpSession session;
	
	@RequestMapping("/main.do") 
    public String mainPage(HttpServletRequest request, Model model) throws Exception{
		request.setAttribute("sessionId", session.getAttribute("sessionId"));
		request.setAttribute("sessionName", session.getAttribute("sessionName"));
		request.setAttribute("sessionStatus", session.getAttribute("sessionStatus"));
		
        return "/main";
    }
	
	@RequestMapping("/login.do") 
    public String userLogin(Model model) throws Exception{

        return "/userLogin";
    }
	
	
}
