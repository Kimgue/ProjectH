package com.hungpick.controller;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.hungpick.dto.GifticonDto;
import com.hungpick.service.IGifticonService;

@Controller
public class GifticonController {
	
	@Autowired
	private IGifticonService gifticonService;
	
	/*--------------------- 기프티콘 조회 ---------------------*/
	@RequestMapping("gifticonList")
	public String giftiConList(GifticonDto Dto, Model model) throws Exception {
		String view = gifticonService.showGifticon(Dto, model);
		return view;
	}
	
	/*--------------------- 기프티콘 등록 페이지 ---------------------*/
//	@RequestMapping("gifticonInsert")
//	public void gifticonInsert() {
//	}
	
	
	/*--------------------- 기프티콘 등록 페이지 ---------------------*/
	@RequestMapping("gifticonInsert")
	public String gifticonInsert() {
		return "gifticonInsert.tiles";
	}
		
	
	
	
	/*--------------------- 기프티콘 등록 완료 눌렀을 때 ---------------------*/
	@RequestMapping("gifticonInsertSubmit")
	public String gifticonInsertSubmit(GifticonDto Dto, MultipartFile uploadfile, ModelMap modelMap) throws Exception {
		
		String view = gifticonService.insertGifticon(Dto,uploadfile,modelMap);
		return view;
	}
	
	/* 타일즈 적용 */
	@RequestMapping(value = "index.do", method = RequestMethod.GET)
	public String test(Locale locale, Model model) {
		
		return "home.tiles";
	}
	
	
	/* 타일즈 미적용 */	
//	@RequestMapping(value = "index.do", method = RequestMethod.GET)
//	public String test1(Locale locale, Model model) {
//		
//		return "home.jsp";
//	}

}
