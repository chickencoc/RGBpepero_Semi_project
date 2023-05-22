package com.example.mini.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.mini.model.Return;

@Mapper
public interface ReturnMapper {
	List <Return> selectReturnList(HashMap<String, Object> map);
	List <Return> selectReturnGuestList(HashMap<String, Object> map);
	
	int cntReturnList(HashMap<String, Object> map);
	
}
