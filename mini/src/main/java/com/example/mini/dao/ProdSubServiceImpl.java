package com.example.mini.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.mini.mapper.ProdSubMapper;
import com.example.mini.model.Trip;
import com.example.mini.model.Wedding;
@Service
public class ProdSubServiceImpl implements ProdSubService{
	@Autowired
	private ProdSubMapper prodSubMapper;
	@Override
	public HashMap<String, Object> searchWeddingList(HashMap<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Wedding> wedding = prodSubMapper.selectWeddingList(map);
		
		int cnt = prodSubMapper.selectWeddingCnt(map);
		resultMap.put("result", "success");
		resultMap.put("list", wedding);
		resultMap.put("cnt", cnt);
		
		return resultMap;
	}
	@Override
	public HashMap<String, Object> serachWeddingRList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Wedding> weddingRe = prodSubMapper.selectWeddingRecommendList(map);
		resultMap.put("result", "success");
		resultMap.put("rList", weddingRe);
		return resultMap;
	}
	@Override
	public HashMap<String, Object> searchTripList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Trip> trip = prodSubMapper.selectTripList(map);
		int cnt = prodSubMapper.selectTripCnt(map);
		resultMap.put("result", "success");
		resultMap.put("list", trip);
		resultMap.put("cnt", cnt);
		return resultMap;
	}
	@Override
	public void addWedding(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		prodSubMapper.insertWedding(map);
		
	}
	@Override
	public void addImg(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		prodSubMapper.insertWeddingImg(map);
		
	}
	@Override
	public void removeWeddding(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		prodSubMapper.deleteWedding(map);
		
	}
	@Override
	public void editWedding(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		prodSubMapper.updateWedding(map);
	}
	@Override
	public HashMap<String, Object> searchWeddingInfo(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		Wedding wedding = prodSubMapper.selectWeddingInfo(map);
		resultMap.put("info", wedding);
		return resultMap;
	}
	
	@Override
	public HashMap<String, Object> searchTripInfo(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		Trip tripInfo = prodSubMapper.selectTripInfo(map);
		resultMap.put("info", tripInfo);
		return resultMap;
	}
	@Override
	public HashMap<String, Object> searchTripImgList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Trip> tripImg = prodSubMapper.selectTripImgList(map);

		resultMap.put("result", "success");
		resultMap.put("list", tripImg);
		return resultMap;
	}
	@Override
	public void removeTrip(HashMap<String, Object> map) {
		
		prodSubMapper.deleteTrip(map);
		// TODO Auto-generated method stub
		
	}
	@Override
	public void addTrip(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		prodSubMapper.insertTrip(map);
		
	}
	
}
