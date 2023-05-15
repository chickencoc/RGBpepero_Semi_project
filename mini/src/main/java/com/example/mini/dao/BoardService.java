package com.example.mini.dao;

import java.util.HashMap;

import com.example.mini.model.Board;
import com.example.mini.model.BrdImg;

public interface BoardService {
	
//	게시글 목록 조회
	HashMap<String, Object> searchBoardList(HashMap<String, Object> map) throws Exception;
	
//	게시글 하나 조회
	Board searchBoard(HashMap<String, Object> map) throws Exception;
	
//	게시글 추가
	void addBoard(HashMap<String, Object> map) throws Exception;
	
//	게시글 삭제
	void delBoard(HashMap<String, Object> map) throws Exception;
	
//	게시글 수정
	void editBoard(HashMap<String, Object> map) throws Exception;
	
//	게시글 이미지 추가
	void addBoardImg(HashMap<String, Object> map) throws Exception;
	
//	게시글 이미지 조회
	HashMap<String, Object> searchBrdImgList(HashMap<String, Object> map) throws Exception;
}
