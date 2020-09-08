package com.kh.oherp.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.oherp.entity.DepartmentDto;
import com.kh.oherp.entity.MemberDto;

@Repository
public class MemberDaolmpl implements MemberDao {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public boolean regist(MemberDto memberDto,
						DepartmentDto departmentDto) {
		MemberDto find = sqlSession.selectOne("member.get",departmentDto.getDepartment_no());
		if(find!=null) {
			sqlSession.insert("member.regist", memberDto);
			return true;
		} else {
			return false;
			
		}
		
	}

}
