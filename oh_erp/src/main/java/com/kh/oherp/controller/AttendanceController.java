package com.kh.oherp.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.Session;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.oherp.entity.AttendanceRequestDto;
import com.kh.oherp.entity.MemberDto;
import com.kh.oherp.entity.MemberRequestDto;
import com.kh.oherp.repository.AttendanceRequestDao;

@Controller
@RequestMapping("/attendance")
public class AttendanceController {
	
	@Autowired
	private AttendanceRequestDao attendanceRequestDao;
	
	//관리자일경우 요청관리 목록
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
		
		List<MemberRequestDto>list=attendanceRequestDao.getList(map);
		model.addAttribute("list",list);
		model.addAttribute("map",map);
		
		//게시글 수
		int listCnt = attendanceRequestDao.listCnt(map);
		model.addAttribute("listCnt",listCnt);
		
		return"attendance/request";
	}
	
	//관리자가 아닐경우 요청내역 페이지 목록
	@RequestMapping("/myrequest")
	public String myrequest(
				@RequestParam(required=false,defaultValue="모든 요청들") String type,
				@RequestParam(required=false)String startDate,
				@RequestParam(required=false)String finishDate,
				@RequestParam(required=false)int no,
				Model model) {
		
		Map<String,Object>map=new HashMap<>();
		map.put("type",type);
		map.put("startDate",startDate);
		map.put("finishDate",finishDate);
		map.put("no",no);
		
		List<MemberRequestDto>list=attendanceRequestDao.getMyList(map);
		model.addAttribute("list",list);
		model.addAttribute("map",map);
		
		//게시글 수
		int listCnt = attendanceRequestDao.listCnt(map);
		model.addAttribute("listCnt",listCnt);
		
		return "attendance/myrequest";
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
	
	//요청관리 생성
	@PostMapping("/request_do")
	public String request_do(
				@RequestParam(required=false) String requtype,
//				@RequestParam int writer,
				@RequestParam(required=false) String cause,
				@RequestParam(required=false) String restartDate,
				@RequestParam(required=false) String refinishDate,
				HttpSession session
			) {
		MemberDto memberDto = (MemberDto)session.getAttribute("userinfo");
		int writer = memberDto.getMember_code();
		
		Map<String,Object>map=new HashMap<>();
		map.put("requtype", requtype);
		map.put("writer", writer);
		map.put("cause", cause);
		map.put("restartDate", restartDate);
		map.put("refinishDate", refinishDate);
		attendanceRequestDao.request(map);
		
		return"redirect:myrequest?no="+writer;
	}
	
}