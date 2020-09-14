package com.kh.oherp.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class BoardDto {
    private int board_no;   //게시글번호
    private int member_code;   // 사원번호
    private String board_type;  //분류
    private String board_title;  //제목
    private String board_content;  //내용
    private String board_view;  //조회수
    private String board_date;  // 날짜
	}