package com.kh.oherp.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.redirectedUrl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.oherp.entity.Attendance_detailDto;
import com.kh.oherp.repository.Attendance_detailDao;


@Controller
@RequestMapping("/attendance_detail")
public class Attendance_detailController {

	@Autowired
	private Attendance_detailDao attendance_detailDao; 
	
	@GetMapping("/regist")
	public String regist() {
		return "attendance_detail/regist";
	} 

	@PostMapping("/regist")
	public String regist(
			@ModelAttribute Attendance_detailDto attendance_detailDto) {
	//String no = attendance_detailDao.detail_regist(attendance_detailDto);
	//	return "redirect:attendance?attendance_no="+no;
	boolean result = attendance_detailDao.regist(attendance_detailDto);
	if(result) {
		return "redirect:admin_page";	
	}	
	else {
		return "redirect:regist?error";	
	}
	}
	////////////////////////////////////////////////////////////////////////////
   @GetMapping("/admin_page")
    public String admin_page(Model model) {
//	   List<Attendance_detailDto> admin_page = SqlSession.selectList("attendance_detail.list");
//	   model.addAttribute("admin_page", admin_page);
	   attendance_detailDao.list(model);
		return "attendance_detail/admin_page";
}

   
//관리자만 볼 수 있는 조회페이지
//@PostMapping("/admin_page")
//public String admin_page(
//List<Attendance_detailDto> admin_page = attendance_detailDao.
		
		
//@ModelAttribute Attendance_detailDto attendance_detailDto) {
//String no = attendance_detailDao.admin_page(attendance_detailDto);
//	
//			return "redirect:attendance/admin_page";
//	}
	
	//@GetMapping("/detail_content")
	//public String detail_content(
			//@RequestParam int attendance_no,
			//Model model) {
		//Attendance_detailDto attendance_detailDto = sqlSession.selectOne("attendance.get", attendance_no);
		//Attendance_detailDto attendance_detailDto= attendance_detailDao.get(attendance_no);
		//model.addAttribute("attendance_detailDto", attendance_detailDto);
		//return "attendance/detail_content";
	//}
	
	//@PostMapping("/detail_content")
	//public String detail_content(@RequestParam int attendance_no) {
	//	return "/
	//}
	


//	@GetMapping("/create")
//	public String create() {
//		return "attendance/create";
//	}
//	
//	@PostMapping("/create")
//	public String create(
//			@ModelAttribute Attendance_detailDto attendance_detailDto) {
//		return "redirect:/attendance/create_finish";
//	}
//	
//	
//	@GetMapping("/create_finish")
//	public String create_finish() {
//		return "attendance/create_finish";
//	}
//	
//	@PostMapping("/create_finish")
//	public String create_finish(
//			@ModelAttribute Attendance_detailDto attendance_detailDto) {
//		return "redirect:/attendance/create_finish";//"attendance/redirect:create_finish";
//	}
}
