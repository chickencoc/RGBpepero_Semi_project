package com.example.mini.dao;

import java.util.HashMap;

import com.example.mini.model.Order;

public interface ProdSubService {
	

	HashMap<String, Object> searchWeddingList(HashMap<String, Object> map) throws Exception; 
	
	HashMap<String, Object> serachWeddingRList(HashMap<String, Object> map);
	
	HashMap<String, Object> searchTripList(HashMap<String, Object> map);
	
	HashMap<String, Object> searchWeddingInfo(HashMap<String, Object> map);
	
	HashMap<String, Object> searchTripInfo(HashMap<String, Object> map);
	
	HashMap<String, Object> searchTripImgList(HashMap<String, Object> map);
	
	void addWedding(HashMap<String, Object> map);
	
	void addImg(HashMap<String, Object> map);
	
	void addTrip(HashMap<String, Object> map);
	
	void addTripImg(HashMap<String, Object> map);
	
	void addTripImgList(HashMap<String, Object> map);
	
	void removeWeddding(HashMap<String, Object> map);
	
	void removeTrip(HashMap<String, Object> map);	
	
	void editWedding(HashMap<String, Object> map);
	
	void editTrip(HashMap<String, Object> map);
	//
//	
//	
//	HashMap<String, Object> selectFindId(HashMap<String, Object> map); //아이디 찾기
//	
//	HashMap<String, Object> selectFindPwd(HashMap<String, Object> map); //비밀번호 찾기
//	
//	void editPwd(HashMap<String, Object> map); //비밀번호 찾기
}
