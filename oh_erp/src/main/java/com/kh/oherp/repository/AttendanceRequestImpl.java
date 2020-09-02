package com.kh.oherp.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.kh.oherp.entity.AttendanceRequestDto;

public class AttendanceRequestImpl implements AttendanceRequestDao{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<AttendanceRequestDto> getList(Map<String, Object> map) {
		List<AttendanceRequestDto>list=sqlSession.selectList("attendanceRequest.getList",map);
		return list;
	}

	
}
