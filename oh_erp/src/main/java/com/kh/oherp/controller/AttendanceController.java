package com.kh.oherp.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.oherp.entity.AttendanceRequestDto;
import com.kh.oherp.repository.AttendanceRequestDao;

@Controller
@RequestMapping("/attendance")
public class AttendanceController {
	
	@Autowired
	private AttendanceRequestDao attendanceRequestDao;
	
	@Autowired
	private SqlSession sqlSession;
	
	
	
	
	@RequestMapping("/request")
	public String reqeust(
				@RequestParam(required=false,defaultValue="모든 요청들") String type,
				@RequestParam(required=false)String startDate,
				@RequestParam(required=false)String finishDate,
				Model model) {
		
		Map<String,Object>map=new HashMap<>();
		map.put("type",type);
		map.put("startDate",startDate);
		map.put("finishDate",finishDate);
		
		List<AttendanceRequestDto>list=attendanceRequestDao.getList(map);
		model.addAttribute("list",list);
		model.addAttribute("map",map);
		
		//게시글 수
		int listCnt = attendanceRequestDao.listCnt(map);
		model.addAttribute("listCnt",listCnt);
		
		return"attendance/request";
	}
	
//	@GetMapping("/request_data")
//	@ResponseBody
//	public List<AttendanceRequestDto> listData(Model model) {
//		List<AttendanceRequestDto> list = sqlSession.selectList("attendanceRequest.getList");
//		return list;
//	}
	
	
	
	
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