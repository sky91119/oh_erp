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
	private String attendance_date;
	private String attendance_in_time1;
	private String attendance_in_time2;
	private String attendance_in_time3;
	private String attendance_out_time1;
	private String attendance_out_time2;
	private String attendance_out_time3;
	private String attendance_note;
	private int attendance_total;
	
	//사원이름이랑 사원번호랑 총 갯수 뭘하는사람의 총 갯수?
	
}
