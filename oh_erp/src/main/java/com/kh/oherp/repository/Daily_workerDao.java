package com.kh.oherp.repository;

import java.util.List;

import org.springframework.ui.Model;

import com.kh.oherp.entity.Daily_workerDto;

public interface Daily_workerDao {

	//등록 기능
	boolean regist(Daily_workerDto daily_workerDto);

	//리스트 기능
	List<Daily_workerDto> list(Model model);
}
