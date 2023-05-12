package com.example.mini.dao;

import java.util.HashMap;

import com.example.mini.model.User;

public interface UserSelectService {
	

	User selectUser(HashMap<String, Object> map);
	
	
}
