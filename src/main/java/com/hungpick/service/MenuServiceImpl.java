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
	
	//상품 재료 종류 보기
	@Override
	public List<MenuDto> sltIngredients() {
		
		return menuDao.sltIngredients();
	}
	
	//상품 높은 가격순
	@Override
	public List<MenuDto> sltMenuHighPrice() {
	
		return menuDao.sltMenuHighPrice();
	}
	
	//상품 낮은 가격순
	@Override
	public List<MenuDto> sltMenuLowPrice() {
		
		return menuDao.sltMenuLowPrice();
	}
	
	@Override
	public List<MenuDto> sltBrandMenu(
			@Param(value = "brandCode") String brandCode
			) {
		return menuDao.sltBrandMenu(brandCode);
	}
	
	//한 상품 보기
	@Override
	public MenuDto sltOneMenu(
			@Param(value = "brandCode") String brandCode,
			@Param(value = "menuCode") String menuCode
			) {
		
		return menuDao.sltOneMenu(brandCode, menuCode);
	}

	//메뉴 조건검색한 결과 보기
	@Override
	public List<MenuVo> sltSearch(
			@Param(value = "brandCode") String[] brandCode,
			@Param(value = "menuPrice") String menuPrice,
			@Param(value = "menuIngredients") String[] menuIngredients,
			@Param(value = "menuName") String menuName) {
		
		return menuDao.sltSearch(brandCode, menuPrice, menuIngredients, menuName);
	}
	
	//메뉴 등록
	@Override
	public void insertMenu(MenuDto menuDto) {
	
		menuDao.insertMenu(menuDto);
		
	}

	@Override
	public void deleteMenu(
			@Param(value = "brandCode") String brandCode,
			@Param(value = "menuCode") String menuCode
			) {
	
		menuDao.deleteMenu(brandCode, menuCode);
		
	}

	
	
}