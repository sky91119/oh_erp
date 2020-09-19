package com.kh.oherp.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.kh.oherp.repository.Daily_workDao;

@Controller
@RequestMapping("/dailywork")
public class Daily_workController {
	
	@Autowired
	private SqlSession sqlSession;
	@Autowired
	private Daily_workDao daily_workDao;
	
	@PostMapping("/insert")
	public String insert(@ModelAttribute Daily_workDto daily_workDto,
							@RequestParam String daily_work_name,
							@RequestParam String daily_work_date) {
		Daily_workDto find=sqlSession.selectOne("dailywork.get",daily_workDto);
		
		return "redirect:dwlist";
			}
	
	@GetMapping("/dwlist")
	public String insertFinish(Model model){
		List<Daily_workDto> daily_salary= daily_workDao.daily_salary();
		List<MemberDto> member = daily_workDao.get_member();
		model.addAttribute("member",member);
		model.addAttribute("daily_salary",daily_salary);
		Map<String,Object>map=new HashMap<>();
		int dw_count = daily_workDao.dw_count(map);
		model.addAttribute("dw_count",dw_count);
		return "dailywork/dwlist";
	}
	
}
