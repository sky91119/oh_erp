package com.kh.oherp.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class MemberDto {
private int member_code, member_account, member_basic_pay, member_meal_pay, member_car_pay;
private String member_name, member_resident_number, member_start_work, member_last_work, member_last_work_cause, member_position,
member_bank, member_bank_name, member_post, member_address;
	
}
