package com.example.mini.dao;

import java.util.HashMap;

import com.example.mini.model.Product;

public interface ReturnService {


//	답례품 목록 출력
	HashMap<String, Object> searchReturnList(HashMap<String, Object> map)throws Exception;

	
//	보낸 답례품 각각 에서 보낸 게스트들 목록
	HashMap<String, Object> searchReturnGuestList(HashMap<String, Object> map)throws Exception;
	
}
