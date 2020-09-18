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
	private String attendance_in;
	private String attendance_out;
	private String attendance_note;
	private int attendance_total;
	
}
