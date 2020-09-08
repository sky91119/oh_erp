package com.kh.oherp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.oherp.entity.DepartmentDto;
import com.kh.oherp.entity.MemberDto;
import com.kh.oherp.repository.MemberDao;



@RequestMapping("/member")
@Controller
public class MemberController {

	@Autowired
	private MemberDao memberDao;
		
	@GetMapping("/regist")
	public String regist() {
		return "member/regist";
	}
	
	@PostMapping("/regist")
	public String regist2(
			@ModelAttribute MemberDto memberDto,
			@ModelAttribute DepartmentDto departmentDto
			) {
		boolean result = memberDao.regist(memberDto,departmentDto);
		if(result) {
			return "redirect:regist_finish";
		} else {
			return "redirect:regist?error";
		}
	}
}
