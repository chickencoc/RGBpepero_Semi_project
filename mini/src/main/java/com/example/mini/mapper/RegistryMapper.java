package com.example.mini.mapper;

import java.rmi.registry.Registry;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface RegistryMapper {

	//레지스트리 목록
	List<Registry> registry(HashMap<String, Object> map);
	
}
