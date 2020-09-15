package com.kh.oherp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/benefit")
public class BenefitController {

	@GetMapping("/regist")
	public String regist() {
		return "benefit/regist";
	}
	
}
