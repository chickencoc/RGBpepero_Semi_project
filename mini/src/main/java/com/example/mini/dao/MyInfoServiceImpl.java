package com.example.mini.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.mini.mapper.MyInfoMapper;
import com.example.mini.model.Order;

@Service
public class MyInfoServiceImpl implements MyInfoService{

	@Autowired
	MyInfoMapper myInfoMapper;

	@Override
	public HashMap<String, Object> searchMyGiftList(HashMap<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Order> gift = myInfoMapper.selectMyInfoGiftList(map);
		int cnt = myInfoMapper.cntMyInfoGift(map);
		resultMap.put("result", "success");
		resultMap.put("list", gift);
		resultMap.put("cnt", cnt);
		return resultMap;
	}


}
