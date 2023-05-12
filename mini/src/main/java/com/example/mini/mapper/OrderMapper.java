package com.example.mini.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.mini.model.Order;

@Mapper
public interface OrderMapper {
	Order selectProdOrder(HashMap<String, Object> map); //상품 정보 리스트
	
	
//	int selectUserCnt(HashMap<String, Object> map); //중복체크
//	
//	void insertUser(HashMap<String, Object> map); //회원가입
//	
//	User selectFindId(HashMap<String, Object> map);//아이디 찾기
//	
//	User selectFindPwd(HashMap<String, Object> map);//비밀번호 찾기
//	
//	void updatePwd(HashMap<String, Object> map);//비밀번호 변경

}
