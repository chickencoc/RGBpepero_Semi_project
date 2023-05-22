package com.example.mini.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.mini.mapper.ProductMapper;
import com.example.mini.mapper.ReturnMapper;
import com.example.mini.model.Code;
import com.example.mini.model.Product;
import com.example.mini.model.Return;
@Service
public class ReturnServiceImpl implements ReturnService{

	@Autowired
	private ReturnMapper returnMapper;

	@Override
	public HashMap<String, Object> searchReturnList(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Return> returnList = returnMapper.selectReturnList(map);
		resultMap.put("result", "success");
		resultMap.put("returnList", returnList);
		return resultMap;
	}

//	@Override
//	public HashMap<String, Object> searchReturnGuestList(HashMap<String, Object> map) {
//		HashMap<String, Object> resultMap = new HashMap<String, Object>();
//		List<Return> returnGuestList = returnMapper.selectReturnGuestList(map);
//		
//		resultMap.put("result", "success");
//		resultMap.put("returnList", returnGuestList);
//		
//		return resultMap;
//	}
	@Override
	public HashMap<String, Object> searchReturnGuestList(HashMap<String, Object> map) {
	    HashMap<String, Object> resultMap = new HashMap<String, Object>();
	    List<Return> returnGuestList = returnMapper.selectReturnGuestList(map);
	    boolean guestFlg = true;
	    int cnt = returnMapper.cntReturnList(map);
	    for (Return returnItem : returnGuestList) {
	        returnItem.setGuestFlg(guestFlg); // 각 Return 항목에 대해 guestFlg 값을 설정합니다.
	    }
	    
	    resultMap.put("result", "success");
	    resultMap.put("returnList", returnGuestList);
	    resultMap.put("cnt", cnt);
	    return resultMap;
	}

	
	
	

}
