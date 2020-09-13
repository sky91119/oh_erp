package com.kh.oherp.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class PhotoDto {

	private int photo_no;
	private String photo_name;
	private long photo_size;
	private String photo_type;
	private int member_code;
}

