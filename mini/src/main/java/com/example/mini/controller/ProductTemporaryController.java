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

import com.example.mini.dao.ProductService;
import com.example.mini.dao.ProductTemporaryService;
import com.example.mini.dao.UserService;
import com.example.mini.model.PdImage;
import com.example.mini.model.Product;
import com.example.mini.model.User;
import com.example.mini.model.UserImage;
import com.google.gson.Gson;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class ProductTemporaryController {
	@Autowired
	private ProductTemporaryService productTemporaryService;
	
	@Autowired
	HttpSession session;

	//상품상세페이지
	@RequestMapping("/producttemporaryinfo.do")
	public String productTemporaryInfo(HttpServletRequest request,Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		request.setAttribute("map", map);
		request.setAttribute("sessionId", session.getAttribute("sessionId"));
		request.setAttribute("sessionName", session.getAttribute("sessionName"));
		request.setAttribute("sessionStatus", session.getAttribute("sessionStatus"));
		return "/prod4_sub0";
	}

	// 상품정보 뿌리기
	@RequestMapping(value = "/producttemporaryinfo.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String selectTemporaryProduct(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		Product list = productTemporaryService.selectProduct(map);
		resultMap.put("list", list);
		return new Gson().toJson(resultMap);
	}
	
	//상품수정 페이지
	@RequestMapping("/productmodifytemporary.do")
	public String productModify(HttpServletRequest request,Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		request.setAttribute("map", map);
		return "/prod4_sub01";
	}

	@RequestMapping(value = "productAdd.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String insertProduct(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		productTemporaryService.addProduct(map);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	@RequestMapping(value = "productUpdate.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String updateProduct(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		productTemporaryService.editProduct(map);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	@RequestMapping(value = "selectProductImg.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String selectProductImg(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		productTemporaryService.selectProductImg(map);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/producttemporaryinfoImg.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String selectTemporaryProductImgInfo(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		Product imgInfo = productTemporaryService.selectProductImgInfo(map);
		resultMap.put("imgInfo", imgInfo);
		return new Gson().toJson(resultMap);
	}
				

}
