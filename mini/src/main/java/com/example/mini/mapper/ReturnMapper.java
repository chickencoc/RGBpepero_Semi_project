package com.example.mini.mapper;

import java.rmi.registry.Registry;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.mini.model.PdImage;
import com.example.mini.model.Product;
import com.example.mini.model.Return;
import com.example.mini.model.UserImage;

@Mapper
public interface ReturnMapper {
	List <Return> selectReturnList(HashMap<String, Object> map);
	List <Return> selectReturnGuestList(HashMap<String, Object> map);

	
}
