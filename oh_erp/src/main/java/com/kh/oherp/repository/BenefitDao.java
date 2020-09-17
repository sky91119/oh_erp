package com.kh.oherp.repository;

import java.util.List;

import org.springframework.ui.Model;

import com.kh.oherp.entity.BenefitDto;
import com.kh.oherp.entity.DepartmentDto;

public interface BenefitDao {

	//수당등록
	void regist(BenefitDto benefitDto);
	
	//수당목록조회
	List<BenefitDto> list(Model model);
}

