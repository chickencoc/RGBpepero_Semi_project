package com.example.mini.dao;

import java.io.Console;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.mini.mapper.ProductTemporaryMapper;
import com.example.mini.model.PdImage;
import com.example.mini.model.Product;

@Service
public class ProductTemporaryServiceImpl implements ProductTemporaryService {

	@Autowired
	private ProductTemporaryMapper productTemporaryMapper;

	@Override
	public Product selectProduct(HashMap<String, Object> map) {
		return productTemporaryMapper.selectProductTemporaryInfo(map);
	}

	@Override
	public List<PdImage> selectProductImage(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", "success");
		return productTemporaryMapper.productImages(map);
	}

}
