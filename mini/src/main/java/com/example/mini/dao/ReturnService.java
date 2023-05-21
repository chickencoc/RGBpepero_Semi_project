package com.example.mini.dao;

import java.util.HashMap;

import com.example.mini.model.Product;

public interface ReturnService {



	HashMap<String, Object> searchReturnList(HashMap<String, Object> map);

	HashMap<String, Object> searchReturnGuestList(HashMap<String, Object> map);
	
}
