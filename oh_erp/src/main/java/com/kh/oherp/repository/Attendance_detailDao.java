package com.kh.oherp.repository;

import java.util.List;

import org.springframework.ui.Model;

import com.kh.oherp.entity.Attendance_detailDto;

public interface Attendance_detailDao {
// 근태상세 등록을 하겠뜸
	public boolean regist(Attendance_detailDto attendance_detailDto);
	
// 근태상세의 관리자만 조회가능한 페이지를 만들겠뜸
	 List<Attendance_detailDto> list(Model model);


//단일 조회를 만들거임
	//public int get(int attendance_no);
	
//합계 증가를 만들거임
//	public Attendance_detailDto total(int attendance_total);
}
