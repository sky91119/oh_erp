package com.kh.oherp.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.oherp.entity.Attendance_detailDto;
import com.kh.oherp.entity.Attendance_detailListVo;
import com.kh.oherp.entity.Attendance_countDto;
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
	public List<Attendance_detailListVo> list(Model model) {
		List<Attendance_detailListVo> list = sqlSession.selectList("attendance_detail.list");
		model.addAttribute("list", list);
		return list;
	}


	@Override
public void delete(int attendance_no) {
	sqlSession.delete("attendance_detail.del", attendance_no);
		
	}

	@Override
	public List<Attendance_detailListVo> list(String col, String order) {
		Map<String, Object> map = new HashMap<>();
		map.put("col", col);
		map.put("order", order);
		List<Attendance_detailListVo> list = sqlSession.selectList("attendance_detail.list2", map);
		return list;
	}

	@Override
	public List<Attendance_detailListVo> search(String type, String keyword, Model model) {
	Map<String, String> map= new HashMap<>();
	map.put("type", type);
	map.put("keyword", keyword);
	List<Attendance_detailListVo> list = sqlSession.selectList("attendance_detail.search", map);
	model.addAttribute("list",list);
		return list;
	}

//	@Override
//	public List<Attendance_countDto> count(Model model){
//		List<Attendance_countDto> count = sqlSession.selectList("attendance_detail.count");
//		model.addAttribute("count", count);
//		return count;
//	}

//	@Override
//	public List<Attendance_detailListVo> in_null(Model model) {
//		List<Attendance_detailListVo> in = sqlSession.selectList("attendance_detail.in_null");
//		model.addAttribute("in", in);
//		return in;
//	}

//	@Override
//	public List<Attendance_detailListVo> out_null(Model model) {
//		List<Attendance_detailListVo> out = sqlSession.selectList("attendance_detail.out_null");
//		model.addAttribute("out", out);
//		return out;
//	}

///	@Override
//	public List<Attendance_detailListVo> list(Model model) {
//		List<Attendance_detailListVo> list = sqlSession.selectList("attendance_detail.list");
//		model.addAttribute("list", list);
//		return list;
//	}
	
//	@Override
//	public List<Attendance_countDto> rank_page(Model model) {
//		List<Attendance_countDto> rank_page = sqlSession.selectList("attendance_detail.rank_page");
//		model.addAttribute("rank_page", rank_page);
//		return rank_page;
//	}


	

	//@Override
	//public List<Attendance_detailListVo>list(String col, String order) {
	//Map<String, Object> map = new HashMap<>();
	//map.put(col, col);
	//map.put(order, order);
	// List<Attendance_detailListVo> list = sqlSession.selectList(attendance_detail.list2, map);
	//	return null;
	//}

	
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
