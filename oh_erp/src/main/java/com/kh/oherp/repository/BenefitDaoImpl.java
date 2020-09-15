package com.kh.oherp.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.oherp.entity.BenefitDto;

@Repository
public class BenefitDaoImpl implements BenefitDao{

	@Autowired
	private SqlSession sqlSession;
	@Override
	public void regist(BenefitDto benefitDto) {
		sqlSession.insert("benefit.regist", benefitDto);
	}
	
}
