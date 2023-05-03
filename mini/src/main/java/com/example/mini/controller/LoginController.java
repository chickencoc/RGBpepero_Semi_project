package com.example.mini.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.example.mini.dao.LoginService;

@Controller
public class LoginController {

	@Autowired
	LoginService loginService;
	
}
