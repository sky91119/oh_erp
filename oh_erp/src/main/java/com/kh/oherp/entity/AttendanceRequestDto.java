package com.kh.oherp.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class AttendanceRequestDto {
	private int attendance_request_no;
	private int member_code;
	private String attendance_request_type;
	private String attendance_request_content;
	private String attendance_request_cause;
	private String attendance_request_start;
	private String attendance_request_finish;
	private String attendance_request_management;
}
