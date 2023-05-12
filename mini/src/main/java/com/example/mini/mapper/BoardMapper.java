package com.example.mini.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.mini.model.Board;

@Mapper
public interface BoardMapper {
	
//	게시물 하나씩 읽기
	Board readBoard(HashMap<String, Object> map) throws Exception;
	
//	게시글 목록 읽기
	List<Board> selectBoardList(HashMap<String, Object> map) throws Exception;
	
//	게시글 조회수 증가
	void updateViewCnt(HashMap<String, Object> map) throws Exception;
	
	void insertBoard(HashMap<String, Object> map) throws Exception;
	
	/*
	User selectLogin(HashMap<String, Object> map); //로그인
	
	int selectUserCnt(HashMap<String, Object> map); //중복체크
	
	void insertUser(HashMap<String, Object> map); //회원가입
	*/

}
