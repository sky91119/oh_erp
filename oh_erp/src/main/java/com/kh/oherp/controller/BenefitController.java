package com.kh.oherp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.oherp.entity.BenefitDto;
import com.kh.oherp.repository.BenefitDao;

@Controller
@RequestMapping("/benefit")
public class BenefitController {

	@GetMapping("/regist")
	public String regist() {
		return "benefit/regist";
	}	
	
	@Autowired
	private BenefitDao benefitDao;
	@PostMapping("/regist")
	public void regist(
			@ModelAttribute BenefitDto benefitDto
			) {
		benefitDao.regist(benefitDto);
//		return "redirect:
	}
	
	
	
	
//	public String regist(			
//			) {		
//	}
}
