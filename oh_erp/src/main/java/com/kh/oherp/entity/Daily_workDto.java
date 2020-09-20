package com.kh.oherp.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class Daily_workDto {
	private int
	daily_work_code,
	daily_work_pay,
	daily_work_time;
	
	private String
	daily_work_date,
	daily_worker_name;

}
