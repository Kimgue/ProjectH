
package com.hungpick.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hungpick.dto.MenuVo;
import com.hungpick.dto.ReviewRankingVo;
import com.hungpick.service.IBrandService;
import com.hungpick.service.IMenuService;
import com.hungpick.service.IReviewService;

@Controller
public class UserController2 {


	/*------------------------정진욱------------------------*/
	@Autowired
	private IBrandService brandService;

	@Autowired
	private IMenuService menuService;

	@Autowired
	private IReviewService reviewService;


	private static final Logger logger = LoggerFactory.getLogger(UserController2.class);


	/*------------------------정진욱------------------------*/
	@RequestMapping("brand")
	public void brand(Model model) throws Exception {
		logger.info("brand called ========");
		model.addAttribute("brand", brandService.sltMulti());
	}

	@RequestMapping("menu")
	public void menu(Model model) throws Exception {
		logger.info("menu called ========");
		model.addAttribute("menu", menuService.sltMulti());
		List<ReviewRankingVo> list = reviewService.sltReviewRanking();
		
		model.addAttribute("reviewRanking", list);
	}

	@RequestMapping("menuResult")
	public void menuVo(@RequestParam(required = false) String brandName,
			@RequestParam(required = false) String menuPrice, @RequestParam(required = false) String menuIngredients,
			@RequestParam(required = false) String menuName, Model model) throws Exception {
		logger.info("menuVo called ========");
		List<MenuVo> list = menuService.sltSearch(brandName, menuPrice, menuIngredients, menuName);
		String ResultMsg;
		if (list.size() > 0) {
			ResultMsg = "정상 조회되었습니다.";
		} else {
			ResultMsg = "죄송합니다. 해당되는 상품이 없습니다.";
		}
		model.addAttribute("ResultMsg", ResultMsg);
		model.addAttribute("menuVo", menuService.sltSearch(brandName, menuPrice, menuIngredients, menuName));
	}

	@RequestMapping("review")
	public void review(@RequestParam String brandCode, @RequestParam String menuCode, String menuName, Model model)
			throws Exception {
		logger.info("review called ========");
		model.addAttribute("menuName", menuName);
		model.addAttribute("review", reviewService.sltReviewList(brandCode, menuCode));
	}

	@RequestMapping("reviewLookup")
	public void reviewLookup(@RequestParam String brandCode, @RequestParam String menuCode,
			@RequestParam String reviewCode, @RequestParam String memberCode, Model model) throws Exception {

		logger.info("reviewLookup called =======");
		model.addAttribute("Lookup", reviewService.sltLookUp(brandCode, menuCode, reviewCode, memberCode));
	}

}