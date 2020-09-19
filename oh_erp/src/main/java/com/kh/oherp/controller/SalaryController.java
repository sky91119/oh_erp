package com.kh.oherp.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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
	
//	@GetMapping("/insert")
//	public String insert(Model model) {
//		List<MemberDto> member = salaryDao.get_member();
//		model.addAttribute("member",member);
//	return "salary/insert";
//	
//	}
	
	@PostMapping("/insert_do")
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
			return "redirect:list?error";
		}
	}
	
	@GetMapping("/list")
	public String insertFinish(Model model , HttpServletRequest request){
		Map<String,Object>map=new HashMap<>();
		String member_code =  request.getParameter("member_code");
		String salary_date= request.getParameter("salary_date");
		if(member_code != null && member_code.length() > 0) {
			map.put("member_code" ,member_code);
		}
		if(salary_date != null && salary_date.length() > 0 ) {
			map.put("salary_date" ,salary_date);
		}
		
		List member_salary = salaryDao.member_salary(map);
		List<MemberDto> member = salaryDao.get_member();
		model.addAttribute("member",member);
		model.addAttribute("member_salary",member_salary);
		int salary_count = salaryDao.salary_count(map);
		model.addAttribute("salary_count",salary_count);
		model.addAttribute("member_code",map.get("member_code"));
		model.addAttribute("salary_date",map.get("salary_date"));
		return "salary/list";
	}
	
	
}