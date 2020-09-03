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
	private String attendance_in_time;
	private String attendance_out_time;
	private String attendance_record;
	
}
