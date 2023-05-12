package com.example.mini.dao;

import java.rmi.registry.Registry;
import java.util.HashMap;
import java.util.List;

public interface RegistryService {
	
	//레지스트리 목록
	List<Registry> registry(HashMap<String, Object> map);

	//옵션 팝업 연결
	void registryOption(HashMap<String, Object> map);
	//선물 팝업 연결
	void registryGift(HashMap<String, Object> map);
	//이미지 등록
	void registryBackImg(HashMap<String, Object> map);
}
