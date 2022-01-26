package com.hungpick.service;

import java.util.List;

import com.hungpick.dto.BrandDto;

public interface IBrandService {
	
	//브랜드 전체 리스트 보기
	List<BrandDto> sltMulti();
	
}
