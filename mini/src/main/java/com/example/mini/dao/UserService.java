package com.example.mini.dao;

import java.util.HashMap;

public interface UserService {
	

	HashMap<String, Object> selectLogin(HashMap<String, Object> map);
	
	int cntUser(HashMap<String, Object> map);
	
	void addUser(HashMap<String, Object> map);
}
