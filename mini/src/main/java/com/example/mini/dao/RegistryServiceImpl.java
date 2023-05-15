package com.example.mini.dao;


import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.mini.mapper.RegistryMapper;
import com.example.mini.model.MyRegistry;
import com.example.mini.model.UserImage;

@Service
public class RegistryServiceImpl implements RegistryService{

	@Autowired
	RegistryMapper registryMapper;

	@Override
	public List<MyRegistry> selectUserRegistry(HashMap<String, Object> map){
		
		return registryMapper.selectUserRegistry(map);
	}
	

	@Override
	public void registryOption(HashMap<String, Object> map) {
		
		registryMapper.registryOption(map);
	}

	@Override
	public void registryGift(HashMap<String, Object> map) {
		
		registryMapper.registryGift(map);
	}


	@Override
	public List<UserImage> selectUserImage(HashMap<String, Object> map) {
		
		return registryMapper.selectUserImage(map);
	}
	
	@Override
	public void updateUserImg(HashMap<String, Object> map) {
		
		registryMapper.updateUserImg(map);
	}


	@Override
	public void saveUserImg(HashMap<String, Object> map) {
		
		registryMapper.saveUserImg(map);
	}


	@Override
	public void updateRegistryOption(HashMap<String, Object> map) {
		
		registryMapper.updateRegistryOption(map);
	}
	

}
