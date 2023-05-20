package com.example.mini.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.mini.model.Order;

@Mapper
public interface OrderMapper {
	Order selectProdOrder(HashMap<String, Object> map); //상품 정보 리스트
	
	List<Order> selectProdList(HashMap<String, Object> map); //상품 리스트
	
	int prodCardCnt(HashMap<String, Object> map); //상품 페이징
	
	Order selectCardInfo(HashMap<String, Object> map);
	
	void insertCardContent(HashMap<String, Object> map); //카드 컨텐츠 추가
	
	Order selectCardBackgroundInfo(HashMap<String, Object> map); //카드 썸네일
	
	void insertReturnGift(HashMap<String, Object> map);
	
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
