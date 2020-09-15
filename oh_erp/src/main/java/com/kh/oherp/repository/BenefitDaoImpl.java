package com.kh.oherp.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import com.kh.oherp.entity.BenefitDto;
import com.kh.oherp.entity.DepartmentDto;

@Repository
public class BenefitDaoImpl implements BenefitDao{

	@Autowired
	private SqlSession sqlSession;
	@Override
	public void regist(BenefitDto benefitDto) {
		sqlSession.insert("benefit.regist", benefitDto);
	}
	@Override
	public List<BenefitDto> list(Model model) {
		List<BenefitDto> list = sqlSession.selectList("benefit.getList");
		model.addAttribute("list", list);
		return list;
	}
	
}
