package com.example.mini.dao;

import java.util.HashMap;

public interface MyInfoService {
	
	HashMap<String, Object> searchMyGiftList(HashMap<String, Object> map) throws Exception;
	
	HashMap<String, Object> searchReturnGiftList(HashMap<String, Object> map);
	
	HashMap<String, Object> searchReturnGiftInfo(HashMap<String, Object> map);
}
