package com.example.mini.mapper;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import com.example.mini.model.User;

@Mapper
public interface UserMapper {
	User selectLogin(HashMap<String, Object> map); //로그인
	
	int selectUserCnt(HashMap<String, Object> map); //중복체크
	
	void insertUser(HashMap<String, Object> map); //회원가입
	
	User selectFindId(HashMap<String, Object> map);//아이디 찾기
	
	User selectFindPwd(HashMap<String, Object> map);//비밀번호 찾기
	
	void updatePwd(HashMap<String, Object> map);//비밀번호 변경
	
	//마이페이지
	
	User selectUser(HashMap<String, Object> map); //마이페이지 회원정보 
	
	void updateUser(HashMap<String, Object> map); //마이페이지 회원정보수정 

}
