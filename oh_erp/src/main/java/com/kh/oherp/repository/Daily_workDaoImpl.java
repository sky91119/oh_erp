package com.kh.oherp.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.oherp.entity.Daily_workDto;
import com.kh.oherp.entity.Daily_workerDto;
@Repository
public class Daily_workDaoImpl implements Daily_workDao{
	@Autowired
	private SqlSession sqlSession;
	@Override
	public void dwinsert(Daily_workDto daily_workDto) {
		sqlSession.insert("daily.dwinsert",daily_workDto);
	}
	@Override
	public List<Daily_workDto> get_member() {
		List<Daily_workDto> daily_work= sqlSession.selectList("daily_work.get_member");
		return daily_work;
	}

	
	@Override
	public List<Daily_workDto> daily_salary() {
		List<Daily_workDto> daily_salary = sqlSession.selectList("salary.member_salary");
		return daily_salary;
	}

	@Override
	public int dw_count(Map<String, Object> map) {
		int dw_count=sqlSession.selectOne("daily_work.dw_count",map);
		return dw_count;
	}

}
