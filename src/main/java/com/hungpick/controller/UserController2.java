
package com.hungpick.controller;


import java.io.File;
import java.io.InputStream;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

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

	//메뉴 페이지
	@RequestMapping("menu")
	public void menu(Model model) throws Exception {
		logger.info("menu called ========");
		model.addAttribute("menu", menuService.sltMulti());
		List<ReviewRankingVo> list = reviewService.sltReviewRanking();
		
		model.addAttribute("reviewRanking", list);
	}
	
	//메뉴 조건검색한 페이지
	@RequestMapping("menuResult")
	public void menuVo(
			@RequestParam(required = false) String brandName,
			@RequestParam(required = false) String menuPrice, 
			@RequestParam(required = false) String menuIngredients,
			@RequestParam(required = false) String menuName, 
			Model model) throws Exception {
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
	
	//상품의 리뷰 페이지
	@RequestMapping("review")
	public void review(
			@RequestParam String brandCode, 
			@RequestParam String menuCode, 
			String menuName, 
			Model model)
			throws Exception {
		logger.info("review called ========");
		model.addAttribute("menuName", menuName);
		model.addAttribute("review", reviewService.sltReviewList(brandCode, menuCode));
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
	
	@RequestMapping("reviewWrite")
	public void reviewWrite(
			@RequestParam String brandCode, 
			@RequestParam String menuCode, 
			@RequestParam String menuName,
			Model model) throws Exception {
		
		logger.info("reviewWrite called ========");
		model.addAttribute("brandCode", brandCode);
		model.addAttribute("menuCode", menuCode);
		model.addAttribute("menuName", menuName);

	}
	
	//리뷰 작성 페이지
	@RequestMapping("reviewWriteSubmit")
	public String reviewWriteSubmit(
			@RequestParam String brandCode, 
			@RequestParam String menuCode, 
			@RequestParam double reviewScore,
			@RequestParam String reviewContent, 
			@RequestParam String reviewImg1,
			@RequestParam String reviewImg2, 
			HttpServletRequest request,
			Model model) throws Exception {
		
		HttpSession session = request.getSession();
		String memberCode = (String) session.getAttribute("memberCode");
		
		reviewService.insertReview(brandCode, menuCode, memberCode, reviewScore, reviewContent, reviewImg1, reviewImg2);

		logger.info("reviewWrite called =======");
		
		
		return "review";
	}
	
	@ResponseBody
	@RequestMapping(value = "/file-upload", method = RequestMethod.POST)
	public String fileUpload(
			@RequestParam("article_file") List<MultipartFile> multipartFile
			, HttpServletRequest request) {
		
		String strResult = "{ \"result\":\"FAIL\" }";
		String contextRoot = "/";
		String fileRoot;
		try {
			// 파일이 있을때 탄다.
			if(multipartFile.size() > 0 && !multipartFile.get(0).getOriginalFilename().equals("")) {
				
				for(MultipartFile file:multipartFile) {
					fileRoot = contextRoot + "resources/images/";
					System.out.println(fileRoot);
					
					String originalFileName = file.getOriginalFilename();	//오리지날 파일명
					String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
					String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
					
					File targetFile = new File(fileRoot + savedFileName);	
					try {
						InputStream fileStream = file.getInputStream();
						FileUtils.copyInputStreamToFile(fileStream, targetFile); //파일 저장
						
					} catch (Exception e) {
						//파일삭제
						FileUtils.deleteQuietly(targetFile);	//저장된 현재 파일 삭제
						e.printStackTrace();
						break;
					}
				}
				strResult = "{ \"result\":\"OK\" }";
			}
			// 파일 아무것도 첨부 안했을때 탄다.(게시판일때, 업로드 없이 글을 등록하는경우)
			else
				strResult = "{ \"result\":\"OK\" }";
		}catch(Exception e){
			e.printStackTrace();
		}
		return strResult;
	}
	
}