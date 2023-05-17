package com.example.mini.dao;

import java.util.HashMap;

import com.example.mini.model.Order;

public interface ProdSubService {
	

	HashMap<String, Object> searchWeddingList(HashMap<String, Object> map) throws Exception; 
	
	HashMap<String, Object> serachWeddingRList(HashMap<String, Object> map);
	
	HashMap<String, Object> searchTripList(HashMap<String, Object> map);
	
//	
//	
//	HashMap<String, Object> selectFindId(HashMap<String, Object> map); //아이디 찾기
//	
//	HashMap<String, Object> selectFindPwd(HashMap<String, Object> map); //비밀번호 찾기
//	
//	void editPwd(HashMap<String, Object> map); //비밀번호 찾기
}
