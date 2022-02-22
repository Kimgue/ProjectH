package com.hungpick.controller;


import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hungpick.service.IReviewService;

@Controller
public class ReviewController {


	/*------------------------정진욱------------------------*/

	@Autowired
	private IReviewService reviewService;
	
	private static final Logger logger = LoggerFactory.getLogger(ReviewController.class);


	/*------------------------정진욱------------------------*/
	
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