package com.kh.oherp.repository;

import java.util.List;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.oherp.entity.DepartmentDto;
import com.kh.oherp.entity.MemberDto;
import com.kh.oherp.entity.MemberListVo;

public interface MemberDao {

	//사원등록 기능
	boolean regist(MemberDto memberDto,
					DepartmentDto departmentDto);
	
	//사원리스트 조회기능 부서명도 불러와야됨.
	List<MemberListVo> list(Model model);

	List<MemberListVo> search(
			@RequestParam(required = false) String type,
			@RequestParam (required = false) String keyword,
			Model model
			);
	
}
