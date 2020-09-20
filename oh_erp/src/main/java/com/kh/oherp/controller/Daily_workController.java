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
import com.kh.oherp.entity.Daily_workerDto;
import com.kh.oherp.entity.MemberDto;
import com.kh.oherp.repository.Daily_workDao;

@Controller
@RequestMapping("/dailywork")
public class Daily_workController {
	
	@Autowired
	private SqlSession sqlSession;
	@Autowired
	private Daily_workDao daily_workDao;
	
	@PostMapping("/dwinsert")
	public String dwinsert(@ModelAttribute Daily_workDto daily_workDto,
			@RequestParam String daily_work_date) {
		Daily_workDto find =sqlSession.selectOne("daily.get", daily_workDto);
		daily_workDto.setDaily_work_date(daily_work_date);
		if(find==null) {
		return "redirect:dwlist";
		}
		else {
			return "redirect:dwlist?error";
		}
	}
	
	@GetMapping("/dwlist")
	public String dwlist(Model model , HttpServletRequest request){
		Map<String,Object>map=new HashMap<>();
		String daily_worker_code =  request.getParameter("daily_worker_code");
		String daily_work_date= request.getParameter("daily_work_date");
		if(daily_worker_code != null && daily_worker_code.length() > 0) {
			map.put("daily_worker_code" ,daily_worker_code);
		}
		if(daily_work_date != null && daily_work_date.length() > 0 ) {
			map.put("daily_work_date" ,daily_work_date);
		}
		List daily_salary = daily_workDao.daily_salary();
		List daily_worker= daily_workDao.get_member();
		model.addAttribute("daily_worker",daily_worker);
		model.addAttribute("daily_salary",daily_salary);
		int daily_count = daily_workDao.dw_count(map);
		model.addAttribute("daily_count",daily_count);
		model.addAttribute("daily_worker_code",map.get("daily_worker_code"));
		model.addAttribute("daily_work_date",map.get("daily_work_date"));
		return "dailywork/dwlist";
	}

}
