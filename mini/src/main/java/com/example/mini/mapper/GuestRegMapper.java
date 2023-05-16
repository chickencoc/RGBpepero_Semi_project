package com.example.mini.mapper;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import com.example.mini.model.Guest;

@Mapper
public interface GuestRegMapper {

	void insertGuest(HashMap<String, Object> map); //게스트의 정보 입력
	Guest selectGuestInfo(HashMap<String, Object> map); //게스트의 정보 출력
	
	void insertGuestOrder(HashMap<String, Object> map); //게스트의 주문 정보 입력
	
	void insertGuestOrderF(HashMap<String, Object> map); //게스트의 펀딩 결제 정보 입력
	void insertGuestFunding(HashMap<String, Object> map); //게스트의 펀딩 기록 입력
	
}
