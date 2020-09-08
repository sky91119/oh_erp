package com.kh.oherp.repository;

import com.kh.oherp.entity.DepartmentDto;
import com.kh.oherp.entity.MemberDto;

public interface MemberDao {

	//사원등록 기능
	boolean regist(MemberDto memberDto,
					DepartmentDto departmentDto);
}
