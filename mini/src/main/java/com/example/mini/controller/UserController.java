package com.example.mini.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.mini.dao.UserService;
import com.example.mini.model.User;
import com.google.gson.Gson;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {

	@Autowired
	private UserService userService;
	
	@Autowired
	HttpSession session;
	
	@RequestMapping("/userSignup.do") 
	public String regist(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		request.setAttribute("map", map);
        return "/userSignup";
    }
	
	@RequestMapping(value = "/userSignup.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String addUser(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		userService.addUser(map);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/idCheck.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public int idCheck (Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		
		int cnt = userService.cntUser(map);
		return cnt;
	}
	
	
	@RequestMapping("/userLogin.do") 
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
		return "/userLogin"; 
    }
	@RequestMapping(value = "/userLogin.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String selectLogin(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = userService.selectLogin(map);
		String result = (String)resultMap.get("result"); //String으로 강제형변환(다운캐스팅)
		if(result.equals("success")) {
			User user = (User) resultMap.get("user");
			//user.getName(); //이름을 알고 싶을 때
			//user.setName(); //이름을 바꾸고 싶을 때
			session.setAttribute("sessionId", user.getUserid());
			session.setAttribute("sessionName", user.getuName());
			session.setAttribute("sessionStatus", user.getStatus());
		}
		
		
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping("/userFindId.do") 
	public String findId(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		request.setAttribute("map", map);

        return "/userFind1";
    }
	@RequestMapping(value = "/userFindId.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String selectFindId(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = userService.selectFindId(map);
		String result = (String)resultMap.get("result"); //String으로 강제형변환(다운캐스팅)
		if(result.equals("success")) {
			User user = (User) resultMap.get("user");
			
			session.setAttribute("sessionId", user.getUserid());
			session.setAttribute("sessionName", user.getuName());
			session.setAttribute("sessionStatus", user.getStatus());
			session.setAttribute("sessionEmail", user.getuEmail());
		}

		return new Gson().toJson(resultMap);
	}
	
	
	@RequestMapping("/userFindPwd.do") 
    public String findPwd(Model model) throws Exception{

        return "/userFind2";
    }
	
	@RequestMapping(value = "/userFindPwd.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String selectFindPwd(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = userService.selectFindId(map);
		String result = (String)resultMap.get("result"); //String으로 강제형변환(다운캐스팅)
		if(result.equals("success")) {
			User user = (User) resultMap.get("user");
			
			session.setAttribute("sessionId", user.getUserid());
			session.setAttribute("sessionName", user.getuName());
			session.setAttribute("sessionStatus", user.getStatus());
			session.setAttribute("sessionEmail", user.getuEmail());
		}

		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "editPwd.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String edit(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		userService.editPwd(map);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	
	
	
	
	
	
	
	
}
