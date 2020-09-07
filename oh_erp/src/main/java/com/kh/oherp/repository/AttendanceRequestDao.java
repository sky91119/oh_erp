package com.kh.oherp.repository;

import java.util.List;
import java.util.Map;

import com.kh.oherp.entity.AttendanceRequestDto;

public interface AttendanceRequestDao {
	List<AttendanceRequestDto> getList(Map<String, Object> map);
	//void requestManageYes(int attendance_request_no);
	void requestManage(Map<String,Object> param);
}
