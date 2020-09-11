package com.kh.oherp.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import com.kh.oherp.entity.DepartmentDto;
import com.kh.oherp.entity.MemberDto;
import com.kh.oherp.entity.MemberListVo;


@Repository
public class MemberDaolmpl implements MemberDao {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public boolean regist(MemberDto memberDto,
						DepartmentDto departmentDto) {
		DepartmentDto find = sqlSession.selectOne("member.get",departmentDto.getDepartment_no());
		if(find!=null) {
			sqlSession.insert("member.regist", memberDto);
			return true;
		} else {
			return false;
			
		}
		
	}


	@Override
	public List<MemberListVo> list(Model model) {
		List<MemberListVo> list = sqlSession.selectList("member.getList");
		model.addAttribute("list", list);
		return list;
	}

}
