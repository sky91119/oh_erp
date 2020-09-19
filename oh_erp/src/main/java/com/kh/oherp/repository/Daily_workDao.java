package com.kh.oherp.repository;

import java.util.List;
import java.util.Map;

import com.kh.oherp.entity.Daily_workDto;
import com.kh.oherp.entity.MemberDto;

public interface Daily_workDao{
void insert(Daily_workDto daily_workDto);
	
	List<MemberDto> get_member();
	
	List<Daily_workDto> daily_salary();
	
	int dw_count(Map<String, Object> map); //게시글 수

}
