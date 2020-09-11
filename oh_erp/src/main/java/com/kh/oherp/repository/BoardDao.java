package com.kh.oherp.repository;

import org.springframework.ui.Model;

import com.kh.oherp.entity.BoardDto;

public interface BoardDao {
	//글 등록 기능
	// - 필요데이터 : BoardDto
	// - 결과데이터 : 게시글 번호(int)
	int write(BoardDto boardDto);
	// 게시글 작성

BoardDto get(int board_no);
BoardDto read(int board_no);
	
}