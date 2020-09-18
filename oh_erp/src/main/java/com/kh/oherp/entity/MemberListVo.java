package com.kh.oherp.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class MemberListVo {
	
	//사원
	private int member_code, 
	department_no,
	member_basic_pay, 
	member_meal_pay, 
	member_car_pay;

	private String 
	member_pw,
	member_account,
	member_name, 
	member_resident_number, 
	member_start_work, 
	member_last_work, 
	member_last_work_cause, 
	member_position,
	member_bank, 
	member_bank_name, 
	member_post, 
	member_address;
	
	//부서 등록됨
	private String 
	department_name, department_use;
	
	//프로젝트 아직 등록안함
	private String project_name;
	
	//수당  아직 등록안함
	private String benefit_name; //수당항목명
	private int benefit_order; //표시순서
	private double benefit_rate; //배율
	private String benefit_calculate; //계산식 ex)야근수당: 시급수당(사원)*시간
}
