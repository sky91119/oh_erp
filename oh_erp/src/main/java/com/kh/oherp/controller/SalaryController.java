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

import com.kh.oherp.entity.Daily_workDto;
import com.kh.oherp.entity.MemberDto;
import com.kh.oherp.entity.SalaryDto;
import com.kh.oherp.repository.Daily_workDao;
import com.kh.oherp.repository.SalaryDao;

@Controller
@RequestMapping("/salary")
public class SalaryController {
	
	private static final String Daily_workDto = null;
	@Autowired
	private SqlSession sqlSession;
	@Autowired
	private SalaryDao salaryDao;
	@Autowired
	private Daily_workDao daily_workDao;
	
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
	
//	@PostMapping("/dwinsert")
//	public String dwinsert(@ModelAttribute Daily_workDto daily_workDto,
//			@RequestParam String daily_work_date) {
//		Daily_workDto find =sqlSession.selectOne("daily.get", daily_workDto);
//		daily_workDto.setDaily_work_date(Daily_workDto);
//		
//		if(find==null) {
//		return "redirect:dwlist";
//		}
//		else {
//			return "redirect:dwlist?error";
//		}
//	}
//	
//	@GetMapping("/dwlist")
//	public String dwlist(Model model , HttpServletRequest request){
//		Map<String,Object>map=new HashMap<>();
//		String daily_worker_code =  request.getParameter("daily_worker_code");
//		String daily_work_date= request.getParameter("daily_work_date");
//		if(daily_worker_code != null && daily_worker_code.length() > 0) {
//			map.put("daily_worker_code" ,daily_worker_code);
//		}
//		if(daily_work_date != null && daily_work_date.length() > 0 ) {
//			map.put("daily_work_date" ,daily_work_date);
//		}
//		List daily_salary = daily_workDao.daily_salary();
//		List<MemberDto> member = salaryDao.get_member();
//		model.addAttribute("member",member);
//		model.addAttribute("daily_salary",daily_salary);
//		int daily_count = daily_workDao.dw_count(map);
//		model.addAttribute("daily_count",daily_count);
//		model.addAttribute("daily_worker",map.get("daily_worker"));
//		model.addAttribute("daily_work_date",map.get("daily_work_date"));
//		return "salary/dwlist";
//	}
	
	
	
	@GetMapping("/all")
	public String all(Model model, HttpServletRequest request) {
		Map<String,Object>map =new HashMap<>();
		String member_code = request.getParameter("member_code");
		String salary_date = request.getParameter("salary_date");
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
		return "salary/all";
	}
	
}