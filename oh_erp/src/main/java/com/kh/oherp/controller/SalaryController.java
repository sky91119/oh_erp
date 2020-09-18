package com.kh.oherp.controller;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.oherp.entity.MemberDto;
import com.kh.oherp.entity.SalaryDto;
import com.kh.oherp.repository.SalaryDao;

@Controller
@RequestMapping("/salary")
public class SalaryController {
	
	@Autowired
	private SqlSession sqlSession;
	@Autowired
	private SalaryDao salaryDao;
	@GetMapping("/insert")
	public String insert(Model model) {
		List<MemberDto> member = salaryDao.get_member();
		model.addAttribute("member",member);
	return "salary/insert";
	
	}
	@PostMapping("/insert")
	public String insert(@ModelAttribute SalaryDto salaryDto,
			@RequestParam String salary_date) {
		//급여연월에 해당하는 급여계산대장이 있는지 조회
		//-있으면 정보가 나오고 없으면 null
		
		SalaryDto find =sqlSession.selectOne("salary.get", salaryDto);
//		salaryDao.insert(salaryDto);
		String date = salary_date;
		salaryDto.setSalary_date(salary_date+"-01");
		if(find==null) {
		salaryDao.insert(salaryDto);
			return "redirect:list";
		}
		else {
			
			return "redirect:insert?error";
		}
	}
	
	@GetMapping("/list")
	public String insertFinish(Model model){
		List<SalaryDto> member_salary = salaryDao.member_salary();
		model.addAttribute("member_salary",member_salary);
		return "salary/list";
	}
	
//	@PostMapping("/list")
//	public String  list(@ModelAttribute SalaryDto salaryDto) {
//	}
	
	
}