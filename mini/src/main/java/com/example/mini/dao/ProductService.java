package com.example.mini.dao;

import java.util.HashMap;

import com.example.mini.model.Product;

public interface ProductService {

	// 프로덕트 정보 출력

	Product selectProduct(HashMap<String, Object> map); // 프로덕트 정보 출력

}
