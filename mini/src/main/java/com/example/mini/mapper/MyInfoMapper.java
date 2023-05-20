package com.example.mini.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.mini.model.Order;

@Mapper
public interface MyInfoMapper {

	List<Order> selectMyInfoGiftList(HashMap<String, Object> map);
	
	int cntMyInfoGift(HashMap<String, Object> map);

	void selectInfo(HashMap<String, Object> map);
}
