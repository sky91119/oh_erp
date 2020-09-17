package com.kh.oherp.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.oherp.entity.AttendanceRequestDto;
import com.kh.oherp.entity.MemberRequestDto;

@Repository
public class AttendanceRequestImpl implements AttendanceRequestDao{

	@Autowired
	private SqlSession sqlSession;
	
	//목록
	@Override
	public List<MemberRequestDto> getList(Map<String, Object> map) {
		List<MemberRequestDto>list=sqlSession.selectList("attendanceRequest.getList2",map);
		return list;
	}

	//승인 버튼만 구현
//	@Override
//	public void requestManageYes(int attendance_request_no) {
//		sqlSession.update("attendanceRequest.requestManageYes",attendance_request_no);		
//	}
	
	// 승인/거절
	@Override
	public void requestManage(Map<String,Object> param) {
		sqlSession.update("attendanceRequest.requestManage",param);
	}
	
	//게시글 수
	@Override
	public int listCnt(Map<String, Object> map) {
		int listCnt=sqlSession.selectOne("attendanceRequest.listCnt",map);
		return listCnt;
	}


	
}