package com.example.mini.dao;

import java.util.HashMap;

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
		Order prodOrder = orderMapper.selectProdOrder(map);
		return prodOrder;
	}

}
