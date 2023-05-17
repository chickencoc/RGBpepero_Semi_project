package com.example.mini.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.mini.dao.ProductService;
import com.example.mini.dao.UserService;
import com.example.mini.model.Product;
import com.example.mini.model.User;
import com.google.gson.Gson;

import jakarta.servlet.http.HttpSession;

@Controller
public class ProductController {
	@Autowired
	private ProductService productService;
	@Autowired
	HttpSession session;

	//상품상세페이지
	@RequestMapping("/productinfo.do")
	public String productInfo(Model model) throws Exception {
		return "/prod4_sub0";
	}

	//상품상세페이지
	@RequestMapping("/product.do")
	public String product1(Model model) throws Exception {
		return "/prod0";
	}
//	상품 상세 페이지 정보 넘겨주기
	@RequestMapping(value = "/productList.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String searchProductList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int startNum = Integer.parseInt(String.valueOf(map.get("startNum")));
		int lastNum = Integer.parseInt(String.valueOf(map.get("lastNum")));
		map.put("startNum", startNum);
		map.put("lastNum", lastNum);
		resultMap = productService.searchProductList(map);
		return new Gson().toJson(resultMap);
	}
//	상품 상세 페이지 정보 넘겨주기
	@RequestMapping(value = "/categoryList.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String searchCategoryList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = productService.searchCategoryList(map);
		return new Gson().toJson(resultMap);
	}	
	
	
	// 상품정보 뿌리기
	@RequestMapping(value = "/productinfo.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String selectUserList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		Product list = productService.selectProduct(map);
		resultMap.put("list", list);
		return new Gson().toJson(resultMap);
	}
	
	
	
	//상품수정페이지
	@RequestMapping("/productmodify.do")
	public String productModify(Model model) throws Exception {
		return "/prod4";
	}
	
	
	
	

}
