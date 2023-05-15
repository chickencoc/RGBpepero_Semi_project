package com.example.mini.dao;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.mini.mapper.UpdateUserMapper;
@Service
public class UserUpdateServiceImpl implements UserUpdateService{

	@Autowired
	private UpdateUserMapper updateUserMapper;

	@Override
	public void updateUser(HashMap<String, Object> map) {
		updateUserMapper.updateUser(map);
	}
	

}
