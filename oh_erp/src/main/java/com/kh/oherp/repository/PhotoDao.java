package com.kh.oherp.repository;

import com.kh.oherp.entity.PhotoDto;

public interface PhotoDao {

	int add(PhotoDto photoDto); //phtoDto줄테니까 들어갔는지 확인하게 번호를 내놔라
}
