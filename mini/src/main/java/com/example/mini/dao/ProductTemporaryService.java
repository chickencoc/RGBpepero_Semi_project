package com.example.mini.dao;

import java.util.HashMap;
import java.util.List;

import com.example.mini.model.PdImage;
import com.example.mini.model.Product;
import com.example.mini.model.UserImage;

public interface ProductTemporaryService {


	Product selectProduct(HashMap<String, Object> map); // 프로덕트 정보 출력
	Product selectProductImg(HashMap<String, Object> map); // 프로덕트 정보 출력
	
	List<PdImage> selectProductImage(HashMap<String, Object> map); //프로덕트 이미지들 출력

	
	void editProduct(HashMap<String, Object> map);
	
	void addProduct(HashMap<String, Object> map);
	
}
