package com.kh.oherp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.oherp.entity.ProjectDto;
import com.kh.oherp.repository.ProjectDao;

@Controller
@RequestMapping("/project")
public class ProjectController {

	@GetMapping("/regist")
	public String regist() {
		return "project/regist";
	}
	
	@Autowired
	private ProjectDao projectDao;
	@PostMapping("/regist")
	public String regist(
			@ModelAttribute ProjectDto projectDto
			) {
		boolean result =projectDao.regist(projectDto);
		
		if(result) {
			return "redirect:regist";
		} else {
			return "redirect:regist?error";
		}
	}
	
}
