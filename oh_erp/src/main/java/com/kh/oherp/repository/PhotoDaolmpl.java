package com.kh.oherp.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.oherp.entity.PhotoDto;

@Repository
public class PhotoDaolmpl implements PhotoDao{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int add(PhotoDto photoDto) {
		int no = sqlSession.selectOne("photo.seq");
		photoDto.setPhoto_no(no);
		sqlSession.insert("photo.add", photoDto);
		return no;
	}

}
