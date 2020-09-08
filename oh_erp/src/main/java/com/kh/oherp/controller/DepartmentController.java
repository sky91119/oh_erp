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

import com.kh.oherp.entity.DepartmentDto;
import com.kh.oherp.repository.DepartmentDao;

@Controller
@RequestMapping("/department")
public class DepartmentController {

	@GetMapping("/regist")
	public String regist(){		 
		return "department/regist";
	}
	
	@Autowired
	private DepartmentDao departmentDao;
	
	@PostMapping("/regist")
	public String regist(@ModelAttribute DepartmentDto departmentDto) {
		//DepartmentDto를 등록
		boolean result = departmentDao.regist(departmentDto);
				
		if(result) {
			return "redirect:regist_finish";
		} else {
			return "redirect:regist?error";
		}
	}
	
	
	@GetMapping("/list")
	public String list(Model model) {
		departmentDao.list(model);
		return "department/list";
	}
	
	
	//파라미터 보이게하는 검색
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

	//파라미터 안보이게하는검색
	@RequestMapping("/search")
	public String search(
			@RequestParam(required = false) String type,
			@RequestParam (required = false) String keyword,
			Model model
			) {
		departmentDao.search(type, keyword, model);
		
		return "department/list";
	}
		
	
}
