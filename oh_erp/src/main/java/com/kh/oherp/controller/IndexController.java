package com.kh.oherp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/template") // 첫주소
public class IndexController {

	@Autowired
	private IndexController IndexController;

	@GetMapping("/index")
	public String index() {
		return "template/index";
		
	}

	
}
