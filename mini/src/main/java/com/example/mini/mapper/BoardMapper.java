package com.example.mini.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.mini.model.Board;
import com.example.mini.model.BrdImg;

@Mapper
public interface BoardMapper {
	
//	게시물 하나씩 읽기
	Board readBoard(HashMap<String, Object> map) throws Exception;
	
//	게시글 목록 읽기
	List<Board> selectBoardList(HashMap<String, Object> map) throws Exception;
	
//	게시글 조회수 증가
	void updateViewCnt(HashMap<String, Object> map) throws Exception;
	
//	게시글 추가
	void insertBoard(HashMap<String, Object> map) throws Exception;
	
//	게시글 삭제
	void deleteBoard(HashMap<String, Object> map) throws Exception;
	
//	게시글 수정
	void updateBoard(HashMap<String, Object> map) throws Exception;

//	게시글 이미지 추가
	void insertBoardImg(HashMap<String, Object> map) throws Exception;
	
//	게시글 이미지 조회
	List<BrdImg> readBoardImg(HashMap<String, Object> map) throws Exception;

}
