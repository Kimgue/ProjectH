package com.hungpick.dao;

import java.util.List;


import org.apache.ibatis.annotations.Param;

import com.hungpick.dto.MenuDto;
import com.hungpick.dto.MenuVo;


public interface IMenuDao {
	
	//메뉴 전체 리스트 보기
	List<MenuDto> sltMulti();
	
	//상품 재료 종류 보기
	List<MenuDto> sltIngredients();
	
	//상품 높은 가격순
	List<MenuDto> sltMenuHighPrice();
	
	//상품 낮은 가격순
	List<MenuDto> sltMenuLowPrice();
	
	//브랜드코드로 브랜드별 메뉴 찾기
	List<MenuDto> sltBrandMenu(
			@Param(value = "brandCode") String brandCode
			);
	
	//한 상품 보기
	MenuDto sltOneMenu(
			@Param(value = "brandCode") String brandCode,
			@Param(value = "menuCode") String menuCode
			);
	
	//메뉴 조건검색한 결과 보기
	List<MenuVo> sltSearch(
			@Param(value = "brandCode") String[] brandCode,
			@Param(value = "menuPrice") String menuPrice,
			@Param(value = "menuIngredients") String[] menuIngredients,
			@Param(value = "menuName") String menuName);
	
	//메뉴 등록
	void insertMenu(MenuDto menuDto);
	
	//메뉴 삭제
	void deleteMenu(
			@Param(value = "brandCode") String brandCode,
			@Param(value = "menuCode") String menuCode
			);
	
}