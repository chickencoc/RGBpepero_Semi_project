package com.example.mini.dao;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.mini.mapper.RegistryMapper;

@Service
public class MainServiceImpl implements MainService{

	@Autowired
	RegistryMapper registryMapper;

	@Override
	public void tripFundingAdd(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		registryMapper.registryAdd(map);
		registryMapper.registryAddFunding(map);
	}


}
