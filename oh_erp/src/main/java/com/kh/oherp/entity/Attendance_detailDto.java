package com.kh.oherp.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder

public class Attendance_detailDto {

	private int attendance_no;
	private int member_code;
	private String attendance_date;
	private String attendance_spot;
	private String attendance_in_time1;
	private String attendance_in_time2;
	private String attendance_in_time3;
	private String attendance_out_time1;
	private String attendance_out_time2;
	private String attendance_out_time3;
	private String attendance_note;
	private int attendance_total;
	
}
