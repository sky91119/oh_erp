package com.kh.oherp.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import com.kh.oherp.entity.Attendance_detailDto;
import com.kh.oherp.entity.DepartmentDto;

@Repository
public class Attendance_detailDaolmpl implements Attendance_detailDao{

	@Autowired
	private SqlSession sqlSession;
	
	
	//근태상세
	@Override
	public boolean regist(Attendance_detailDto attendance_detailDto) {
		Attendance_detailDto find = sqlSession.selectOne("attendance_detail.onlycode", attendance_detailDto.getMember_code());
		
		if(find == null) {
			sqlSession.insert("attendance_detail.regist", attendance_detailDto);
			return true;
		}
		else {			
		
		return false;
	}
		
	}


	@Override
	public List<Attendance_detailDto> list(Model model) {
		List<Attendance_detailDto> admin_page = sqlSession.selectList("attendance_detail.list");
		model.addAttribute("list", admin_page);
		return admin_page;
	}
	


	
//	@Override
//	public int detail_regist(Attendance_detailDto attendance_detailDto) {
//		//관리표 번호 생성
//		int no = sqlSession.selectOne("attendance_detail.getSeq");
		
		//관리표 등록 
//		attendance_detailDto.setAttendance_no(no);
//		sqlSession.insert("attendance_detail.detail_regist", attendance_detailDto);
		
//		return no;
//	}
	
	
	


	//////////////////////////////////////////////////////

//	@Override
//	public int get(int attendance_no) {
//		int attendance_detailDto = sqlSession.selectOne("attendance.get", attendance_no );
//		return attendance_detailDto;
//	}


	



	//@Override
	//public int total(int attendance_total) {
	//	sqlSession.update("attendance.total", attendance_total);
	//	Attendance_detailDto attendance_detailDto = sqlSession.selectOne("attendance.total", attendance_total); 
	//	return attendance_detailDto;
	//}

	



}
