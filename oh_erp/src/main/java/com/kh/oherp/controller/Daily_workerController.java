package com.kh.oherp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.oherp.entity.Daily_workerDto;
import com.kh.oherp.entity.DepartmentDto;
import com.kh.oherp.repository.Daily_workerDao;

@Controller
@RequestMapping("/daily_worker")
public class Daily_workerController {

	@Autowired
	private Daily_workerDao daily_workerDao;
	
	@GetMapping("/list")
	public String list(Model model) {
		daily_workerDao.list(model);
		return "daily_worker/list";
	}
	
	@PostMapping("/regist")
	public String regist(@ModelAttribute Daily_workerDto daily_workerDto) {
		boolean result = daily_workerDao.regist(daily_workerDto);

		if (result) {
			return "redirect:list";
		} else {
			return "redirect:regist?error";
		}
	}
}
