package com.kh.oherp.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.redirectedUrl;

import java.util.List;

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

import com.kh.oherp.entity.Attendance_detailDto;
import com.kh.oherp.entity.Attendance_detailListVo;
import com.kh.oherp.repository.Attendance_detailDao;
import com.kh.oherp.repository.Attendance_detailListVoDao;


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
   //   return "redirect:attendance?attendance_no="+no;
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
    public String admin_page(Model model,
          @RequestParam (required = false, defaultValue = "member_code") String col, //defaultValue =기본값 설정을 member_code라고 주겠다. 
                                                              
           @RequestParam (required = false, defaultValue= "asc") String order //너가 아무말도 없으면 내가 코드를 오름차순으로 보여주겠다. 
           ){ //나는 col과 order라는 값을 추가로 받겠다. 

       List<Attendance_detailListVo> list = attendance_detailDao.list(col, order);
        model.addAttribute("list", list);
   
        return "/attendance_detail/admin_page";
 }
   
//   @GetMapping("/admin_page")
 //   public String admin_page(Model model,
//   
//         ){ 
    //  model.addAttribute("list", list);
//      attendance_detailDao.list(model);
//      return "attendance_detail/admin_page";
//}

  // @GetMapping("/admin_edit")
 //  public String admin_edit(@RequestParam int member_code, Model model){
//   Attendance_detailListVo attendance_detailListVo = attendance_detailListVo.edit(member_code);
   
   //   model.addAttribute("attendance_detailListVo", attendance_detailListVo);
   //   return "attendance_detail/admin_edit";
  // }

@GetMapping("/admin_delete/{member_code}")
public String admin_delete(@PathVariable int member_code) {
	attendance_detailDao.delete(member_code);
   return"redirect:/attendance_detail/admin_page";
  
}
   
//관리자만 볼 수 있는 조회페이지
//@PostMapping("/admin_page")
//public String admin_page(
//List<Attendance_detailDto> admin_page = attendance_detailDao.
      
      
//@ModelAttribute Attendance_detailDto attendance_detailDto) {
//String no = attendance_detailDao.admin_page(attendance_detailDto);
//   
//         return "redirect:attendance/admin_page";
//   }
   
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
   //   return "/
   //}
   


//   @GetMapping("/create")
//   public String create() {
//      return "attendance/create";
//   }
//   
//   @PostMapping("/create")
//   public String create(
//         @ModelAttribute Attendance_detailDto attendance_detailDto) {
//      return "redirect:/attendance/create_finish";
//   }
//   
//   
//   @GetMapping("/create_finish")
//   public String create_finish() {
//      return "attendance/create_finish";
//   }
//   
//   @PostMapping("/create_finish")
//   public String create_finish(
//         @ModelAttribute Attendance_detailDto attendance_detailDto) {
//      return "redirect:/attendance/create_finish";//"attendance/redirect:create_finish";
//   }
}