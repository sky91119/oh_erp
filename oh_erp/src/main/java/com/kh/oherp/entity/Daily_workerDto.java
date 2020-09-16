package com.kh.oherp.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class Daily_workerDto {
	private int daily_worker_code;
	private String daily_worker_name, daily_worker_resident_number ;
}
