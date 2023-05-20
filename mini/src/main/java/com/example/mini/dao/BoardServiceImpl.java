package com.example.mini.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.mini.mapper.BoardMapper;
import com.example.mini.model.Board;
import com.example.mini.model.BrdImg;
import com.example.mini.model.BrdReply;
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
		Board board = boardMapper.selectBoard(map);
		if(board != null) {
			boardMapper.updateViewCnt(map);
			board = boardMapper.selectBoard(map);
		}
		return board;
	}

	@Override
	public void addBoard(HashMap<String, Object> map) throws Exception {
		boardMapper.insertBoard(map);
		
	}

	@Override
	public void delBoard(HashMap<String, Object> map) throws Exception {
		boardMapper.deleteBoard(map);
		
	}

	@Override
	public void editBoard(HashMap<String, Object> map) throws Exception {
		boardMapper.updateBoard(map);
		
	}

	@Override
	public void addBoardImg(HashMap<String, Object> map) throws Exception {
		boardMapper.insertBoardImg(map);
		
	}

	@Override
	public HashMap<String, Object> searchBrdImgList(HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<BrdImg> brdImg = boardMapper.selectBoardImg(map);
		resultMap.put("result", "success");
		resultMap.put("brdImg", brdImg);
		return resultMap;
	}

	@Override
	public BrdReply searchBrdReply(HashMap<String, Object> map) throws Exception {
		BrdReply brdReply = boardMapper.selectBrdReply(map);
		return brdReply;
	}

	@Override
	public void addBrdReply(HashMap<String, Object> map) throws Exception {
		boardMapper.insertBrdReply(map);
		boardMapper.updateBrdWhenReply(map);
		
	}

	@Override
	public void editBrdReply(HashMap<String, Object> map) throws Exception {
		boardMapper.updateBrdReply(map);
		
	}

	@Override
	public void delBrdReply(HashMap<String, Object> map) throws Exception {
		boardMapper.deleteBrdReply(map);
		boardMapper.updateBrdWhenDelReply(map);
		
	}


}
