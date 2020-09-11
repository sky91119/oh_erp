package com.kh.oherp.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class MemberListVo {
	private int member_code;
	private String member_name,department_name,member_start_work;
}
