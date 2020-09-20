package com.kh.oherp.repository;

import java.util.List;
import java.util.Map;

import com.kh.oherp.entity.Daily_workDto;
import com.kh.oherp.entity.Daily_workerDto;

public interface Daily_workDao{
void dwinsert(Daily_workDto daily_workDto);
	
	List<Daily_workDto> get_member();
	
	List<Daily_workDto> daily_salary();
	
	int dw_count(Map<String, Object> map); //게시글 수
		

}
