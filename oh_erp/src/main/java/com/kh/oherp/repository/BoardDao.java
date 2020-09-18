package com.kh.oherp.repository;

import java.util.List;

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



	//board에 있는 데이터 삭제
	 public void delete(int board_no); //지우기
	 
	 //게시글 수정
	 public void update(BoardDto boardDto)throws Exception; //지우기


	int countBoard();





	
}