package com.kh.oherp.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.oherp.entity.ProjectDto;

@Repository
public class ProjectDaoImpl implements ProjectDao{

	@Autowired
	private SqlSession sqlSession;

	@Override
	public boolean regist(ProjectDto projectDto) {
		
//만약 프로젝트명을 꺼내와서 조회해본결과가 없으면 등록하고(true)
//있으면 false
		ProjectDto find = sqlSession.selectOne("project.get", projectDto.getProject_name());
		
		if(find == null) {
			sqlSession.insert("project.regist", projectDto);
			return true;
		} else {
			return false;
		}
	}

	
}
