package com.kh.oherp.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import com.kh.oherp.entity.Daily_workerDto;
import com.kh.oherp.entity.DepartmentDto;

@Repository
public class Daily_workerDaoImpl implements Daily_workerDao{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public boolean regist(Daily_workerDto daily_workerDto) {
		Daily_workerDto find = sqlSession.selectOne("department.get", daily_workerDto.getDaily_worker_resident_number());
		
		if(find == null) {
			sqlSession.insert("daily_worker.regist", daily_workerDto);
			return true;
		}
		else {			
			return false;
		}
	}

	@Override
	public List<Daily_workerDto> list(Model model) {
		List<Daily_workerDto> list = sqlSession.selectList("daily_worker.getList");
		model.addAttribute("list", list);
		return list;
	}

}
