package com.kh.oherp.repository;

import java.util.List;
import java.util.Map;

import com.kh.oherp.entity.AttendanceRequestDto;
import com.kh.oherp.entity.MemberRequestDto;

public interface AttendanceRequestDao {
	List<MemberRequestDto> getList(Map<String, Object> map); //요청관리글목록
	//void requestManageYes(int attendance_request_no);
	void requestManage(Map<String,Object> param); //승인,거절버튼
	int listCnt(Map<String, Object> map); //게시글 수
	void request(Map<String,Object> map);
}