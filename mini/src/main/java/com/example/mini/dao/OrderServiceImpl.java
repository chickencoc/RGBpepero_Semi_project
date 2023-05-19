package com.example.mini.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.mini.mapper.OrderMapper;
import com.example.mini.model.Order;
@Service
public class OrderServiceImpl implements OrderService{
	
	@Autowired
	private OrderMapper orderMapper;
	@Override
	public Order searchProdOrder(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		Order prodOrder = orderMapper.selectProdOrder(map);
		resultMap.put("result", "sucess");
		resultMap.put("list", prodOrder);
		return prodOrder;
	}
	@Override
	public HashMap<String, Object> searchProdList(HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Order> order = orderMapper.selectProdList(map);
		int cnt = orderMapper.prodCardCnt(map);
		resultMap.put("result", "success");
		resultMap.put("list", order);
		resultMap.put("cnt", cnt);
		return resultMap;
	}
	@Override
	public HashMap<String, Object> searchCardInfo(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		Order order = orderMapper.selectCardInfo(map);
		resultMap.put("info", order);
		return resultMap;
	}
	@Override
	public void addCardContent(HashMap<String, Object> map) {
		orderMapper.insertCardContent(map);
		// TODO Auto-generated method stub
		
	}
	@Override
	public HashMap<String, Object> searchCardBackInfo(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		Order card = orderMapper.selectCardBackgroundInfo(map);
		resultMap.put("card", card);
		return resultMap;

	}
	@Override
	public void addGiftOrder(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		orderMapper.insertReturnGift(map);
		
	}

}
