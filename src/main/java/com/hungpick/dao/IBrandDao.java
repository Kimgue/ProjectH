package com.hungpick.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hungpick.dto.BrandDto;

public interface IBrandDao {
	
	//브랜드 전체 리스트 보기
	List<BrandDto> sltMulti();

	//브랜드 등록
	void insertBrand(BrandDto brandDto);
	
	//브랜드 수정
	void updateBrand(BrandDto brandDto);
	
	//브랜드 삭제
	void deleteBrand(@Param("brandCode") String brandCode);
}
