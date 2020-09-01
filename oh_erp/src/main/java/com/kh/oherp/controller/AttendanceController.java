package com.kh.oherp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/attendance")
public class AttendanceController {

	@GetMapping("/request")
	public String reqeust() {
		return"attendance/request";
	}
}
