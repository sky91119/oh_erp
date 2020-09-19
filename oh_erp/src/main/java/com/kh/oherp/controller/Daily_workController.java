package com.kh.oherp.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.oherp.entity.Daily_workDto;
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
		
		return "redirect:list";
			}

}
