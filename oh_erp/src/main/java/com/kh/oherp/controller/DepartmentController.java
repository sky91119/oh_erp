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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.oherp.entity.DepartmentDto;
import com.kh.oherp.repository.DepartmentDao;

@Controller
@RequestMapping("/department")
public class DepartmentController {

	@Autowired
	private DepartmentDao departmentDao;

	@PostMapping("/regist")
	public String regist(@ModelAttribute DepartmentDto departmentDto) {
		// DepartmentDto를 등록
		boolean result = departmentDao.regist(departmentDto);

		if (result) {
			return "redirect:list";
		} else {
			return "redirect:regist?error";
		}
	}

	@GetMapping("/list")
	public String list(Model model) {
		departmentDao.list(model);
		return "department/list";
	}

	// 파라미터 보이게하는 검색
//	@GetMapping("/search")
//	public String search(
//			@RequestParam String type,
//			@RequestParam String keyword,
//			Model model
//			) {
//		departmentDao.search(type, keyword, model);
////		Map<String, String> param = new HashMap<>();
////			param.put("type", type);
////			param.put("keyword", keyword);
////			
////		List<DepartmentDto> list = sqlSession.selectList("department.search", param);
////		model.addAttribute("list", list);
//			return "department/list";
//	}

	// 파라미터 안보이게하는검색
	@RequestMapping("/search")
	public String search(@RequestParam(required = false) String type, @RequestParam(required = false) String keyword,
			Model model) {
		departmentDao.search(type, keyword, model);

		return "department/list";
	}

	@GetMapping("/delete/{department_no}")
	public String delete(@PathVariable int department_no) {
		// @pathVariable URL 경로에 변수를 넣어주는 기능
		departmentDao.delete(department_no);
		return "redirect:/department/list";
	}

	@GetMapping("/update/{department_no}")
	public String modify(@PathVariable int department_no, Model model) {
		model.addAttribute("department_no", department_no);
		return "department/modify";
	}

	@PostMapping("/{department_no}")
	public String modify(@PathVariable int department_no, 
			@ModelAttribute DepartmentDto departmentDto) {
		departmentDao.modify(departmentDto);
		return "redirect:/department/list";
	}

//	@RequestMapping("/update")
//	public String update(
//			@ModelAttribute DepartmentDto departmentDto
//			) {
//		departmentDao.update(departmentDto);
//		return "redirect:/department/list";
}
