package com.example.mini.dao;

import java.rmi.registry.Registry;
import java.util.HashMap;
import java.util.List;

public interface RegistryService {
	
	//레지스트리 목록
	List<Registry> registry(HashMap<String, Object> map);

}
