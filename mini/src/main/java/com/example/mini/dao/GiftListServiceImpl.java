package com.example.mini.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.mini.mapper.GiftListMapper;

@Service
public class GiftListServiceImpl implements GiftListService {

	@Autowired
	GiftListMapper giftListMapper;
	
}
