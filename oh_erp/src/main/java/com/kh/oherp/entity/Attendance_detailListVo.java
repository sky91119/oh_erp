package com.kh.oherp.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class Attendance_detailListVo {

	private int attendance_no;
	private int member_code;
	private String member_name;
	private String attendance_in;
	private String attendance_out;
	private String attendance_note;
	private int attendance_total;
	
	//사원이름이랑 사원번호랑 총 갯수 뭘하는사람의 총 갯수?
	//너꺼 조회할거는 여기서 불러오면 돼 dto는 해당 테이블의 등록이랑 수정할때만
	// 이거는 조회할때 사용하면돼! 응 알았어용 여기에 name있잖아? 
	//그리고 너가 멤버테이블에 또필요한거 만들어서 쓰면돼 외래키로 연결되있기때문에 ㅇㅋ?ㅇㅋ
}
