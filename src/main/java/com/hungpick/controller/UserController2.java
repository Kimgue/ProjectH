package com.hungpick.controller;


import java.net.URLEncoder;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hungpick.dto.BrandDto;
import com.hungpick.dto.MenuDto;
import com.hungpick.dto.MenuVo;
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
	
	//브랜드 등록 페이지이동
	@RequestMapping("brandInsert")
	public String brandInsert() throws Exception {
		logger.info("brandInsert called ========");
		
		return "brandInsert";
	}
	
	//브랜드 등록
	@RequestMapping("insertBrand")
	public String insertBrand(BrandDto brandDto) throws Exception {
		logger.info("insertBrand called ========");
		brandService.insertBrand(brandDto);
	
		return "brandInsert";
	}
	
	//브랜드 삭제 페이지이동
	@RequestMapping("brandDelete")
	public String brandDelete(Model model) throws Exception {
		logger.info("brandDelete called ========");
		model.addAttribute("brand", brandService.sltMulti());
		return "brandDelete";
	}
	
	//브랜드 삭제 페이지이동
		@RequestMapping("deleteBrand")
		public String deleteBrand(@RequestParam String brandCode) throws Exception {
			logger.info("deleteBrand called ========");
			
			brandService.deleteBrand(brandCode);
			return "redirect:/brandDelete";
		}
		
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
	
	//상세리뷰 페이지
	@RequestMapping("reviewLookup")
	public void reviewLookup(
			@RequestParam String brandCode, 
			@RequestParam String menuCode,
			@RequestParam String reviewCode, 
			@RequestParam String memberCode, 
			Model model) throws Exception {

		logger.info("reviewLookup called =======");
		
		model.addAttribute("Lookup", reviewService.sltLookUp(brandCode, menuCode, reviewCode, memberCode));
	}
	
	//리뷰 작성 페이지 이동
	@RequestMapping("reviewWrite")
	public void reviewWrite(
			@RequestParam String brandCode, 
			@RequestParam String menuCode, 
			@RequestParam String menuName,
			HttpServletRequest request,
			Model model) throws Exception {
			
		logger.info("reviewWrite called ========");
		
		HttpSession session = request.getSession();
		if (session.getAttribute("memberCode") == null) {			
			
			String QueryString = request.getQueryString();
			String requestUri = "redirect:/" + "reviewWrite";
			String prevUrl = requestUri + "?" + QueryString;

			session.setAttribute("prevUrl", prevUrl);
		
			String msg = "리뷰 작성시 로그인이 필요합니다.";
			String url = "userLogin";
			model.addAttribute("msg", msg);
			model.addAttribute("url", url);
			
			logger.info("reviewWrite1 called ========");
			
			return;
		}
		
		model.addAttribute("brandCode", brandCode);
		model.addAttribute("menuCode", menuCode);
		model.addAttribute("menuName", menuName);
		
		logger.info("reviewWrite2 called ========");
		
	};
	

	//리뷰 작성 페이지
	@RequestMapping("reviewWriteSubmit")
	public String reviewWriteSubmit(
			@RequestParam String brandCode, 
			@RequestParam String menuCode, 
			@RequestParam String menuName,
			@RequestParam double reviewScore,
			@RequestParam String reviewContent, 
			@RequestParam(required = false) String reviewImg,
			HttpServletRequest request,
			Model model) throws Exception {
		
		HttpSession session = request.getSession();
		String memberCode = (String) session.getAttribute("memberCode");
		
		reviewService.insertReview(brandCode, menuCode, memberCode, reviewScore, reviewContent, reviewImg);

		logger.info("reviewWriteSubmit called =======");
		
		String menuNameEncoded = URLEncoder.encode(menuName, "UTF-8");
		
		
		return "redirect:/menuDetail" + "?brandCode=" + brandCode + "&menuCode=" + menuCode + "&menuName=" + menuNameEncoded;
	
	}
	
	//상세리뷰 페이지
	@RequestMapping("reviewConfirm")
	public void reviewConfirm(Model model) throws Exception {

		logger.info("reviewConfirm called =======");
		
		model.addAttribute("review", reviewService.sltReviewN());
	}
	
}