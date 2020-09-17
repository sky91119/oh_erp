package com.kh.oherp.repository;

import java.util.List;
import java.util.Map;

import com.kh.oherp.entity.AttendanceRequestDto;
import com.kh.oherp.entity.MemberRequestDto;

public interface AttendanceRequestDao {
	List<MemberRequestDto> getList(Map<String, Object> map);
	//void requestManageYes(int attendance_request_no);
	void requestManage(Map<String,Object> param);
	int listCnt(Map<String, Object> map);
}