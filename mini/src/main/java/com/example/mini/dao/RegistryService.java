package com.example.mini.dao;


import java.util.HashMap;
import java.util.List;

import com.example.mini.model.MyRegistry;
import com.example.mini.model.UserImage;

public interface RegistryService {
	
	//레지스트리 목록
	List<MyRegistry> selectUserRegistry(HashMap<String, Object> map);

	//옵션 팝업 연결
	void registryOption(HashMap<String, Object> map);
	
	//옵션 변경
	void updateRegistryOption(HashMap<String, Object> map);
	
	//선물 팝업 연결
	void registryGift(HashMap<String, Object> map);
	
	//이미지 리스트 불러오기
	List<UserImage> selectUserImage(HashMap<String, Object> map);
	
	//이미지 처음
	void saveUserImg(HashMap<String, Object> map);
	
	//이미지 수정
	void updateUserImg(HashMap<String, Object> map);
}
