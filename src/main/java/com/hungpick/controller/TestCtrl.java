package com.hungpick.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hungpick.dto.MenuVo;
import com.hungpick.service.IMenuService;

@Controller
public class TestCtrl {
	
	@Autowired
	private IMenuService menuService;
	
	//메뉴 조건검색한 페이지
	@RequestMapping("menuResultTest")
	public void menuVoTest(
			@RequestParam(required = false) String[] brandCode,
			@RequestParam(required = false) String menuPrice, 
			@RequestParam(required = false) String[] menuIngredients,
			@RequestParam(required = false) String menuName, 
			Model model) throws Exception {
		
		List<MenuVo> list = menuService.sltSearch(brandCode, menuPrice, menuIngredients, menuName);
		
		String ResultMsg;
		if (list.size() > 0) {
			ResultMsg = "정상 조회되었습니다.";
		} else {
			ResultMsg = "죄송합니다. 해당되는 상품이 없습니다.";
		}
		
		model.addAttribute("ResultMsg", ResultMsg);
		model.addAttribute("menuVo", menuService.sltSearch(brandCode, menuPrice, menuIngredients, menuName));
		
	}
}
