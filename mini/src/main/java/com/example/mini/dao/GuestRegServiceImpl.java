package com.example.mini.dao;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.mini.mapper.GuestRegMapper;
import com.example.mini.mapper.UserMapper;
import com.example.mini.model.User;

@Service
public class GuestRegServiceImpl implements GuestRegService{

	@Autowired
	private UserMapper UserMapper;

	@Override
	public User selectUser(HashMap<String, Object> map) {
//		 HashMap<String, Object> resultMap = new HashMap<String, Object>();
//		 User selectUser = selectUserMapper.selectUser(map);
	return UserMapper.selectUser(map);
	}
	
	@Autowired
	GuestRegMapper guestRegMapper;

	@Override
	public void writeGuestOrder(HashMap<String, Object> map) { //★★★★★★★★★★★★게스트가 목록에 있을 때 정보 추가 안하는 기능을 추가해야함.
		// TODO Auto-generated method stub
		guestRegMapper.insertGuestOrder(map);
		guestRegMapper.insertGuest(map);
	}
	
	@Override
	public void writeGuestFunding(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		guestRegMapper.insertGuestOrderF(map);
		guestRegMapper.insertGuestFunding(map);
		guestRegMapper.insertGuest(map);
	}
	


}
