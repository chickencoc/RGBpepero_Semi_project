package com.example.mini.mapper;

import java.rmi.registry.Registry;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.mini.model.Product;
import com.example.mini.model.UserImage;

@Mapper
public interface ProductMapper {

	//상품상세 
	Product selectProductInfo(HashMap<String, Object> map);
	
	
}
