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
			boardMapper.updateViewCnt(map);
			board = boardMapper.readBoard(map);
		}
		return board;
	}

	@Override
	public void addBoard(HashMap<String, Object> map) throws Exception {
		boardMapper.insertBoard(map);
		
	}

}
