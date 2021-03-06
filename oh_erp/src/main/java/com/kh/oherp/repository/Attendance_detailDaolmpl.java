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
		List<Attendance_detailListVo> list = sqlSession.selectList("attendance_detail.list", map);
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

	@Override
	public void edit(Attendance_detailDto attendance_detailDto) {
		sqlSession.update("attendance_detail.update", attendance_detailDto);
	}



	//출근누락조회
	@Override
	public List<Attendance_detailListVo> in(Model model) {
	List<Attendance_detailListVo> list = sqlSession.selectList("attendance_detail.in");
	model.addAttribute("list", list);	
	return list;
	}

	//퇴근 누락조회
	@Override
	public List<Attendance_detailListVo> out(Model model) {
		List<Attendance_detailListVo> list = sqlSession.selectList("attendance_detail.out");
		model.addAttribute("list", list);
		return list;
	}

	




}
