package com.example.mini.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.mini.mapper.BoardMapper;
import com.example.mini.model.Board;
@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	private BoardMapper boardMapper;

	@Override
	public HashMap<String, Object> searchBoardList(HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Board> board = boardMapper.selectBoardList(map);
		resultMap.put("result", "success");
		resultMap.put("board", board);
		return resultMap;
	}

	@Override
	public Board searchBoard(HashMap<String, Object> map) throws Exception {
		Board board = boardMapper.readBoard(map);
		if(board != null) {
//			boardMapper.updateCnt(map);
		}
		return board;
	}
	
	/*
	@Override
	public HashMap<String, Object> selectLogin(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int cnt = userMapper.selectUserCnt(map);
		if(cnt >0) {
			User user = userMapper.selectLogin(map); //아이디가 존재하는경우. 패스워드는 모름
			if(user != null) { //아이디와 패스와드가 모두 맞는 경우
				resultMap.put("user", user);
				resultMap.put("result", "success");
				resultMap.put("message", user.getuName()+"님 환영합니다.");
			} else {
				resultMap.put("result", "fail");
				resultMap.put("message", "패스워드를 다시 확인해주세요");
			}
		} else {
			resultMap.put("result", "fail");
			resultMap.put("message", "아이디가 존재하지 않습니다.");
		}
		User login = userMapper.selectLogin(map);
		resultMap.put("info", login);
		return resultMap;
	}
	@Override
	public int cntUser(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		int cnt = userMapper.selectUserCnt(map);
		return cnt;
	}
	@Override
	public void addUser(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		userMapper.insertUser(map);
		
		
		
	}
	*/

}
