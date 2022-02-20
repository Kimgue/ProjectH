package com.hungpick.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hungpick.dto.BrandDto;

public interface IBrandService {
	
	//브랜드 전체 리스트 보기
	List<BrandDto> sltMulti();
	
	//각 브랜드 이름과 코드
	List<BrandDto> sltEachBrand();
	
	//브랜드 등록
	void insertBrand(BrandDto brandDto);
	
	//브랜드 수정
	void updateBrand(BrandDto brandDto);
	
	//브랜드 삭제
	void deleteBrand(@Param("brandCode") String brandCode);
}
