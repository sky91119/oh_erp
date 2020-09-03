package com.kh.oherp.repository;

import java.util.List;

import org.springframework.ui.Model;

import com.kh.oherp.entity.DepartmentDto;

public interface DepartmentDao {

	//부서등록 기능
	boolean regist(DepartmentDto departmentDto);
		
	//부서목록 기능
	List<DepartmentDto> getList(Model model);
	
	//부서검색
	
}


	
