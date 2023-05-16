package com.example.mini.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.mini.mapper.ProductMapper;
import com.example.mini.model.Code;
import com.example.mini.model.Product;
@Service
public class ProductServiceImpl implements ProductService{

	@Autowired
	private ProductMapper productMapper;
	@Override
	public Product selectProduct(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return productMapper.selectProductInfo(map);
	}
	@Override
	public HashMap<String, Object> searchProductList(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Product> product = productMapper.selectProductList(map);
		int cnt = productMapper.selectProductCnt(map);
		resultMap.put("result", "success");
		resultMap.put("product", product);
		resultMap.put("cnt", cnt);
		return resultMap;
	}
	@Override
	public HashMap<String, Object> searchCategoryList(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Code> code = productMapper.selectProductCategoryList(map);
		resultMap.put("result", "success");
		resultMap.put("code", code);
		return resultMap;
	}

	
	
	

}
