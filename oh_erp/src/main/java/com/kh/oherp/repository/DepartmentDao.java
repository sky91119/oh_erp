package com.kh.oherp.repository;

import java.util.List;

import org.springframework.ui.Model;import org.springframework.web.bind.annotation.RequestParam;

import com.kh.oherp.entity.DepartmentDto;

public interface DepartmentDao {

	//부서등록 기능
	boolean regist(DepartmentDto departmentDto);
		
	//부서목록 기능
	List<DepartmentDto> list(Model model);
		
	//부서검색 기능
//	List<DepartmentDto> search(
//			@RequestParam String type,
//			@RequestParam String keyword,
//			Model model);

	//파라미터 안보이게하는검색
	List<DepartmentDto> search(
			@RequestParam(required = false) String type,
			@RequestParam (required = false) String keyword,
			Model model
			);
	
	void delete(int department_no);

	void modify(DepartmentDto departmentDto);

	
}


	
