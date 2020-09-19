package com.kh.oherp.repository;

import java.util.List;
import java.util.Map;

import com.kh.oherp.entity.Daily_workDto;
import com.kh.oherp.entity.MemberDto;
import com.kh.oherp.entity.SalaryDto;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
@Repository
public class Daily_workDaoImpl implements Daily_workDao{
	@Autowired
	private SqlSession sqlSession;
	@Override
	public void insert(Daily_workDto daily_workDto) {
		sqlSession.insert("dailywork.insert",daily_workDto);
	}

	@Override
	public List<MemberDto> get_member() {
		List<MemberDto> member = sqlSession.selectList("salary.get_member");
		return member;
	}

	@Override
	public List<Daily_workDto> daily_salary() {
		List<Daily_workDto> daily_salary = sqlSession.selectList("salary.member_salary");
		return daily_salary;
	}

	@Override
	public int dw_count(Map<String, Object> map) {
		int daily_count=sqlSession.selectOne("daily.daily_count",map);
		return daily_count;
	}

}
