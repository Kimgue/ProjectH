package com.hungpick.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hungpick.dao.IMenuDao;
import com.hungpick.dto.MenuDto;
import com.hungpick.dto.MenuVo;

@Service("menuService")
public class MenuServiceImpl implements IMenuService {
	
	@Autowired
	private IMenuDao menuDao;
	
	private static final Logger logger = LoggerFactory.getLogger(MenuServiceImpl.class);

	//메뉴 전체 리스트 보기
	@Override
	public List<MenuDto> sltMulti() {
		logger.info("Menu sltMulti called =========");
		
		return menuDao.sltMulti();
	}
	
	//메뉴 조건검색한 결과 보기
	@Override
	public List<MenuVo> sltSearch(
			@Param(value = "brandName") String brandName,
			@Param(value = "menuPrice") String menuPrice,
			@Param(value = "menuIngredients") String menuIngredients,
			@Param(value = "menuName") String menuName) {
		
		
		return menuDao.sltSearch(brandName, menuPrice, menuIngredients, menuName);
	}


	
}