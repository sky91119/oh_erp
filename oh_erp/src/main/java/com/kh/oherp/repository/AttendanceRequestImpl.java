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
		List<AttendanceRequestDto>list=sqlSession.selectList("attendanceRequest.getList2",map);
		return list;
	}

	//승인 버튼만 구현
//	@Override
//	public void requestManageYes(int attendance_request_no) {
//		sqlSession.update("attendanceRequest.requestManageYes",attendance_request_no);		
//	}

	@Override
	public void requestManage(Map<String,Object> param) {
		sqlSession.update("attendanceRequest.requestManage",param);
	}

	@Override
	public int listCnt() {
		int listCnt=sqlSession.selectOne("attendanceRequest.listCnt");
		return listCnt;
	}


	
}