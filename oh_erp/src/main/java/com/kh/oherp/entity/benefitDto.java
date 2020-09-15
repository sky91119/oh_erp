package com.kh.oherp.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class benefitDto {
	private int benefit_code; //수당번호
	private String benefit_name; //수당항목명
	private int benefit_order; //표시순서
	private double benefit_rate; //배율
	private String benefit_calculate; //계산식 ex)야근수당: 시급수당(사원)*시간
	
}
