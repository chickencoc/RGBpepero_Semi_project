package com.example.mini.dao;

import java.io.Console;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.mini.mapper.UserMapper;
import com.example.mini.model.User;
@Service
public class UserServiceImpl implements UserService{

	@Autowired
	private UserMapper userMapper;
	@Override
	public HashMap<String, Object> selectLogin(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int cnt = userMapper.selectUserCnt(map);
		if(cnt >0) {
			User user = userMapper.selectLogin(map); //아이디가 존재하는경우. 패스워드는 모름
			if(user != null) { //아이디와 패스와드가 모두 맞는 경우
				resultMap.put("user", user);
				resultMap.put("result", "success");
				resultMap.put("message", user.getuName()+"님 환영합니다.");
			} else {
				resultMap.put("result", "fail");
				resultMap.put("message", "패스워드를 다시 확인해주세요");
			}
		} else {
			resultMap.put("result", "fail");
			resultMap.put("message", "아이디가 존재하지 않습니다.");
		}
		User login = userMapper.selectLogin(map);
		resultMap.put("info", login);
		return resultMap;
	}
	@Override
	public int cntUser(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		int cnt = userMapper.selectUserCnt(map);
		return cnt;
	}
	@Override
	public void addUser(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		userMapper.insertUser(map);
		
	}
	@Override
	public HashMap<String, Object> selectFindId(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		User user = userMapper.selectFindId(map); 
		if(user != null) { 
			resultMap.put("user", user);
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		User findId = userMapper.selectFindId(map);
		resultMap.put("info", findId);
		
		return resultMap;
	}
	@Override
	public HashMap<String, Object> selectFindPwd(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		User user = userMapper.selectFindPwd(map); 
		if(user != null) { 
			resultMap.put("user", user);
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		User findPwd = userMapper.selectFindPwd(map);
		resultMap.put("info", findPwd);
		
		return resultMap;
	}
	@Override
	public void editPwd(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		userMapper.updatePwd(map);
	}
	
	
	// mypage 회원정보 출력 및 수정
	
	
	

}
