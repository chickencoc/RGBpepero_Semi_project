package com.example.mini.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.mini.model.Code;
import com.example.mini.model.Product;

@Mapper
public interface ProductMapper {

	//상품상세 
	Product selectProductInfo(HashMap<String, Object> map);
	
//	상품 리스트
	List<Product>selectProductList(HashMap<String, Object> map);
	
	int selectProductCnt(HashMap<String, Object> map);
	
//	카테고리 리스트
	List<Code>selectProductCategoryList(HashMap<String, Object> map);
	
	
}
