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
import com.kh.oherp.repository.DepartmentDao;
import com.kh.oherp.repository.MemberDao;



@RequestMapping("/member")
@Controller
public class MemberController {

	@Autowired
	private DepartmentDao departmentDao;
	@Autowired
	private MemberDao memberDao;
	
	@GetMapping("/regist")
	public String regist(Model model) {
			departmentDao.list(model);
		
		return "member/regist";
	}
	
	@PostMapping("/regist")
	public String regist(
			@ModelAttribute MemberDto memberDto,
			@ModelAttribute DepartmentDto departmentDto
			) {
		boolean result = memberDao.regist(memberDto,departmentDto);
		if(result) {
			return "redirect:list";
		} else {
			return "redirect:regist?error";
		}
	}

	@GetMapping("/list")
	public String list(Model model) {
		memberDao.list(model);
		return "member/list";
	}
}
