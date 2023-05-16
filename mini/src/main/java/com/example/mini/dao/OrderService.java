package com.example.mini.dao;

import java.util.HashMap;

import com.example.mini.model.Order;

public interface OrderService {
	

	Order searchProdOrder(HashMap<String, Object> map); //
	
	HashMap<String, Object> searchProdList(HashMap<String, Object> map) throws Exception; //상품 리스트
	
	HashMap<String, Object> searchCardInfo(HashMap<String, Object> map);
	
//	int cntUser(HashMap<String, Object> map); //중복확인
//	
	void addCardContent(HashMap<String, Object> map); //카드 컨텐츠 추가
//	
//	HashMap<String, Object> selectFindId(HashMap<String, Object> map); //아이디 찾기
//	
//	HashMap<String, Object> selectFindPwd(HashMap<String, Object> map); //비밀번호 찾기
//	
//	void editPwd(HashMap<String, Object> map); //비밀번호 찾기
}
