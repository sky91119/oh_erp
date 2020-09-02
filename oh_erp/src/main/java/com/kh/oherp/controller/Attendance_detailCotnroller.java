package com.kh.oherp.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.redirectedUrl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.oherp.entity.Attendance_detailDto;


@Controller
@RequestMapping("/attendance")
public class Attendance_detailCotnroller {


	//@Autowired
	
	
	@GetMapping("/detail")
	public String detail() {
		return "attendance/detail";
	}
	
	@PostMapping("/detail")
	public String detail(
			@ModelAttribute Attendance_detailDto attendance_detailDto) {
	
			return "redirect:detail_finish";
	}
	
	@GetMapping("/detail_finish")
	public String detail_Finish() {
		return "attendance/detail";
	}
	
	
	@GetMapping("/create")
	public String create() {
		return "attendance/create";
	}
	
	@PostMapping("/create")
	public String create(
			@ModelAttribute Attendance_detailDto attendance_detailDto) {
		return "redirect:/attendance/create_finish";
	}
	
	
	@GetMapping("/create_finish")
	public String create_finish() {
		return "attendance/create_finish";
	}
	
	@PostMapping("/create_finish")
	public String create_finish(
			@ModelAttribute Attendance_detailDto attendance_detailDto) {
		return "redirect:/attendance/create_finish";//"attendance/redirect:create_finish";
	}
}
