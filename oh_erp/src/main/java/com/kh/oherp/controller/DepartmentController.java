package com.kh.oherp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/department")
public class DepartmentController {

	@GetMapping("/regist")
	public String regist(){		 
		return "department/regist";
	}
	
//	@PostMapping("/regist")
}
