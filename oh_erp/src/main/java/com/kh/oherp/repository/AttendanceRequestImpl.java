package com.kh.oherp.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.oherp.entity.AttendanceRequestDto;

@Repository
public class AttendanceRequestImpl implements AttendanceRequestDao{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<AttendanceRequestDto> getList(Map<String, Object> map) {
		List<AttendanceRequestDto>list=sqlSession.selectList("attendanceRequest.getList",map);
		return list;
	}

	@Override
	public void requestManageYes(int attendance_request_no) {
		sqlSession.update("attendanceRequest.requestManageYes",attendance_request_no);		
	}


	
}
