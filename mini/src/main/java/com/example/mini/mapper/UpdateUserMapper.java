package com.example.mini.mapper;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UpdateUserMapper {
	
	void updateUser(HashMap<String, Object> map); //회원정보수정 	


}
