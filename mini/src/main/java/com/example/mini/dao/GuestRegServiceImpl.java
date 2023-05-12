package com.example.mini.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.mini.mapper.MainMapper;

@Service
public class GuestRegServiceImpl implements MainService{

	@Autowired
	MainMapper mainMapper;


}
