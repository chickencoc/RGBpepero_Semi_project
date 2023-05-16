package com.example.mini.dao;

import java.util.HashMap;

import com.example.mini.model.Product;

public interface ProductService {

	// 프로덕트 정보 출력

	Product selectProduct(HashMap<String, Object> map); // 프로덕트 정보 출력

	
//	제품 리스트 출력
	HashMap<String, Object> searchProductList(HashMap<String, Object> map);
	
//	카테고리 리스트
	HashMap<String, Object> searchCategoryList(HashMap<String, Object> map);
	
}
