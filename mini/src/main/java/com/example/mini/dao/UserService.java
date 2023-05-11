package com.example.mini.dao;

import java.util.HashMap;

public interface UserService {
	

	HashMap<String, Object> selectLogin(HashMap<String, Object> map); //로그인
	
	int cntUser(HashMap<String, Object> map); //중복확인
	
	void addUser(HashMap<String, Object> map); //회원가입
	
	HashMap<String, Object> selectFindId(HashMap<String, Object> map); //아이디 찾기
	
	HashMap<String, Object> selectFindPwd(HashMap<String, Object> map); //비밀번호 찾기
	
	void editPwd(HashMap<String, Object> map); //비밀번호 찾기
}
