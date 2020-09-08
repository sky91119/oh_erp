package com.kh.oherp.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.oherp.entity.DepartmentDto;
import com.kh.oherp.repository.DepartmentDao;

@Controller
@RequestMapping("/department")
public class DepartmentController {

	@GetMapping("/regist")
	public String regist(){		 
		return "department/regist";
	}
	
	@Autowired
	private DepartmentDao departmentDao;
	
	@PostMapping("/regist")
	public String regist(@ModelAttribute DepartmentDto departmentDto) {
		//DepartmentDto를 등록
		boolean result = departmentDao.regist(departmentDto);

		if(result) {
			return "redirect:regist_finish";
		} else {
			return "redirect:regist?error";
		}
	}
	
	@GetMapping("/list")
	public String list(Model model) {
		departmentDao.getList(model);
		return "department/list";
	}
	
//	@PostMapping("/search")
	
}
