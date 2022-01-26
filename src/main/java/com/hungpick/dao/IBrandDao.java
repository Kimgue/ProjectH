package com.hungpick.dao;

import java.util.List;

import com.hungpick.dto.BrandDto;

public interface IBrandDao {
	
	//브랜드 전체 리스트 보기
	List<BrandDto> sltMulti();
	
}
