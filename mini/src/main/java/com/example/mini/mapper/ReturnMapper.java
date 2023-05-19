package com.example.mini.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;


import com.example.mini.model.Return;

@Mapper
public interface ReturnMapper {
	
//	답례품 목록
	List<Return> selectReturnList(HashMap<String, Object> map) throws Exception;
	
//	답례품 보내서 받은 게스트들 목록
	List<Return> selectReturnGuestList(HashMap<String, Object> map) throws Exception;

}
