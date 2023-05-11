package com.example.mini.dao;

import java.rmi.registry.Registry;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.mini.mapper.MainMapper;
import com.example.mini.mapper.RegistryMapper;

@Service
public class RegistryServiceImpl implements RegistryService{

	@Autowired
	RegistryMapper registryMapper;

	@Override
	public List<Registry> registry(HashMap<String, Object> map){
		// TODO Auto-generated method stub
		return registryMapper.registry(map);
	}


}
