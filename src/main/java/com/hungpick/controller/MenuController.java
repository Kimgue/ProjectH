package com.hungpick.controller;


import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hungpick.dto.MenuDto;
import com.hungpick.dto.MenuVo;
import com.hungpick.service.IBrandService;
import com.hungpick.service.IMenuService;
import com.hungpick.service.IReviewService;

@Controller
public class MenuController {


	/*------------------------정진욱------------------------*/

	@Autowired
	private IMenuService menuService;
	
	@Autowired
	private IBrandService brandService;

	@Autowired
	private IReviewService reviewService;	

	private static final Logger logger = LoggerFactory.getLogger(MenuController.class);


	/*------------------------정진욱------------------------*/
		
	//메뉴 페이지
	@RequestMapping("menu")
	public void menu(Model model) throws Exception {
		logger.info("menu called ========");	
	
		model.addAttribute("menu", menuService.sltMulti());
		model.addAttribute("brand", brandService.sltMulti());
		model.addAttribute("menuIng", menuService.sltIngredients());
		model.addAttribute("reviewRanking", reviewService.sltReviewRanking());
	}
	
	//메뉴 조건검색한 페이지
	@RequestMapping("menuResult")
	public void menuVo(
			@RequestParam(required = false) String[] brandCode,
			@RequestParam(required = false) String menuPrice, 
			@RequestParam(required = false) String[] menuIngredients,
			@RequestParam(required = false) String menuName, 
			Model model) throws Exception {
		
		// 메뉴 result에서 값이 없어서 검색 조건에 안떠서 추가했음
		model.addAttribute("menu", menuService.sltMulti());
		model.addAttribute("brand", brandService.sltMulti());
		model.addAttribute("menuIng", menuService.sltIngredients());
		model.addAttribute("reviewRanking", reviewService.sltReviewRanking());
		// --------------------------------------------------------------------
		
		logger.info("menuVo called ========");
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
	
	//상품의 리뷰 페이지
	@RequestMapping("menuDetail")
	public void menuDetail(
			@RequestParam String brandCode, 
			@RequestParam String menuCode, 
			@RequestParam String menuName, 
			Model model)
			throws Exception {
		logger.info("menuDetail called ========");
		model.addAttribute("menu", menuService.sltOneMenu(brandCode, menuCode));
		model.addAttribute("review", reviewService.sltReviewList(brandCode, menuCode));
	}
	
	//메뉴등록 페이지
	@RequestMapping("menuInsert")
	public String menuInsert(Model model)	throws Exception {
		logger.info("menuInsert called ========");
		model.addAttribute("brand", brandService.sltMulti());
		
		return "menuInsert";
	}
	//메뉴등록하기
	@RequestMapping("insertMenu")
	public String insertMenu(MenuDto menuDto) throws Exception {
		logger.info("insertMenu called ========");
		menuService.insertMenu(menuDto);
		
		return "menuInsert";
	}
	
	//메뉴삭제 페이지
	@RequestMapping("menuDelete")
	public String menuDelete(Model model)	throws Exception {
		logger.info("menuDelete called ========");
		model.addAttribute("brand", brandService.sltEachBrand());
		
		return "menuDelete";
	}
	//메뉴삭제하기
	@RequestMapping("deleteMenu")
	public String deleteMenu(
			@RequestParam String brandCode, 
			@RequestParam String menuCode
			) throws Exception {
		logger.info("deleteMenu called ========");
		menuService.deleteMenu(brandCode, menuCode);
		
		return "redirect:/menuDelete";
	}

}