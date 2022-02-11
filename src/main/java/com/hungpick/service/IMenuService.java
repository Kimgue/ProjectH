package com.hungpick.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hungpick.dto.MenuDto;
import com.hungpick.dto.MenuVo;

public interface IMenuService {
	
	//메뉴 전체 리스트 보기
	List<MenuDto> sltMulti();

	//메뉴 조건검색한 결과 보기
	List<MenuVo> sltSearch(
			@Param(value = "brandName") String[] brandName,
			@Param(value = "menuPrice") String menuPrice,
			@Param(value = "menuIngredients") String[] menuIngredients,
			@Param(value = "menuName") String menuName);
}

