package com.kh.oherp.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.oherp.entity.AttendanceRequestDto;
import com.kh.oherp.repository.AttendanceRequestDao;

@Controller
@RequestMapping("/attendance")
public class AttendanceController {
	
	@Autowired
	private AttendanceRequestDao attendanceRequestDao;
	
	@GetMapping("/request")
	public String reqeust(
				@RequestParam(required = false) String type,
				@RequestParam(required = false) String keyword,
				Model model) {
		
		Map<String,Object>map=new HashMap<>();
		map.put("type",type);
		map.put("keyword",keyword);
		
		List<AttendanceRequestDto>list=attendanceRequestDao.getList(map);
		model.addAttribute("list",list);
		
		return"attendance/request";
	}
	
// 승인 버튼만 구현	
//	@PostMapping("/request_yes")
//	public String request_yes(
//				@RequestParam int attendance_request_no
//			) {
//		attendanceRequestDao.requestManageYes(attendance_request_no);
//		return "redirect:request";
//	}
	
	@PostMapping("/request_manage")
	public String request_manage(
			@RequestParam int attendance_request_no,
			@RequestParam String management
			) {
		Map<String,Object>param=new HashMap<>();
		param.put("attendance_request_no", attendance_request_no);
		param.put("management", management);
		attendanceRequestDao.requestManage(param);
		
		return"redirect:request";
	}
	
}
