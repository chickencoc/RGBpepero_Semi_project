package com.example.mini.dao;

import java.io.Console;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.mini.mapper.ProductMapper;
import com.example.mini.mapper.UserMapper;
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

	
	
	

}
