package com.example.mini.dao;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.mini.mapper.SelectUserMapper;
import com.example.mini.mapper.UserMapper;
import com.example.mini.model.User;
@Service
public class UserSelectServiceImpl implements UserSelectService{

	@Autowired
	private SelectUserMapper selectUserMapper;

	@Override
	public User selectUser(HashMap<String, Object> map) {
//		 HashMap<String, Object> resultMap = new HashMap<String, Object>();
//		 User selectUser = selectUserMapper.selectUser(map);
	return selectUserMapper.selectUser(map);
		

	}
	

}
