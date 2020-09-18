package com.kh.oherp.repository;

import java.util.List;

import com.kh.oherp.entity.MemberDto;
import com.kh.oherp.entity.SalaryDto;

public interface SalaryDao {
	void insert(SalaryDto salaryDto);
	
	List<MemberDto> get_member();
	
	List<SalaryDto> member_salary();
}

