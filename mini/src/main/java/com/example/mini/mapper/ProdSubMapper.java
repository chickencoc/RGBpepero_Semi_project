package com.example.mini.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.mini.model.Trip;
import com.example.mini.model.Wedding;

@Mapper
public interface ProdSubMapper {
	List<Wedding> selectWeddingList(HashMap<String, Object> map); //상품 리스트
	
	int selectWeddingCnt(HashMap<String, Object> map);
	
	List<Wedding> selectWeddingRecommendList(HashMap<String, Object> map);
	
	List<Trip> selectTripList(HashMap<String, Object> map);
	
	Wedding selectWeddingInfo(HashMap<String, Object> map);
	
	int selectTripCnt(HashMap<String, Object> map);
	
	void insertWedding(HashMap<String, Object> map);
	
	void insertWeddingImg(HashMap<String, Object> map);
	
	void deleteWedding(HashMap<String, Object> map);
	
	void updateWedding(HashMap<String, Object> map);
}
