package com.kh.oherp.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class SalaryDto {

	private int salary_no;
	private String 
	salary_date,
	salary_sortation,
	salary_period_start,
	salary_period_finish,
	salary_payday,
	salary_name,
	salary_article,
	salary_member;
	
	private String 
	member_name,
	member_basic_pay,
	member_meal_pay,
	member_car_pay;
}