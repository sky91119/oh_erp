package com.kh.oherp.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.oherp.entity.SalaryDto;

@Controller
@RequestMapping("/salary")
public class SalaryController {
	
	@Autowired
	private SqlSession sqlSession;
	@GetMapping("/insert")
	public String insert() {
	return "salary/insert";
	
	}
	@PostMapping("/insert")
	public String insert(@ModelAttribute SalaryDto salaryDto) {
		//급여연월에 해당하는 급여계산대장이 있는지 조회
		//-있으면 정보가 나오고 없으면 null
		SalaryDto find =sqlSession.selectOne("salary.get", salaryDto.getSalary_date());
		
		if(find==null) {
			sqlSession.insert("salary.insert",salaryDto);
			return "redirect:list";
		}
		else {
			return "redirect:insert?error";
		}
	}
	
	@GetMapping("/list")
	public String insertFinish(){
		return "salary/list";
	}
	
//	@PostMapping("/list")
//	public String  list(@ModelAttribute SalaryDto salaryDto) {
//	}
	
	
}