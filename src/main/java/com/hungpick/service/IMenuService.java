package com.hungpick.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hungpick.dto.MenuDto;
import com.hungpick.dto.MenuVo;

public interface IMenuService {
	
	List<MenuDto> sltMulti();

	List<MenuVo> sltSearch(
			@Param(value = "brandName") String brandName,
			@Param(value = "menuPrice") String menuPrice,
			@Param(value = "menuIngredients") String menuIngredients,
			@Param(value = "menuName") String menuName);
}

