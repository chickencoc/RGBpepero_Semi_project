package com.example.mini.dao;

import java.util.HashMap;

import com.example.mini.model.User;

public interface GuestRegService {
	
	void writeGuestOrder(HashMap<String, Object> map); //게스트의 주문 정보 입력
	
	User selectUser(HashMap<String, Object> map); //레지스트리 목록 소유 사용자 정보 
	
	void writeGuestFunding(HashMap<String, Object> map); //게스트의 주문 정보 입력

}
