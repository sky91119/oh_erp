package com.kh.oherp.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Attendance_countDto {

	//통계를 위해 만든 뷰(Attendance_count_page에 )를 저장하기 위한 DTO

	private String in_time;
	private int cnt;
	private int member_code;
	private String member_name;
}


