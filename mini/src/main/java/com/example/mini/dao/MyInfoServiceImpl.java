package com.example.mini.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.mini.mapper.MyInfoMapper;

@Service
public class MyInfoServiceImpl implements MainService{

	@Autowired
	MyInfoMapper myInfoMapper;


}
