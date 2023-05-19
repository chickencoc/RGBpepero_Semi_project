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

	// 레지스트리 추가 - 상점 페이지에서
	@Override
	public void registryAdd(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		
		if(map.get("fundYn").equals("Y")) { //펀딩일 때
			registryMapper.registryAdd(map);
			registryMapper.registryAddFunding(map);
		} else { //펀딩이 아닐 때
			registryMapper.registryAdd(map);
		}
	}
	
	// 레지스트리 삭제
	@Override
	public void registryDel(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		
		if(map.get("fundYn").equals("Y")) { //펀딩일 때
			registryMapper.registryDel(map);
			registryMapper.registryDelFund(map);
		} else { //펀딩이 아닐 때
			registryMapper.registryDel(map);
		}
	}
	

}
