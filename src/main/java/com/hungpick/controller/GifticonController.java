package com.hungpick.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.hungpick.dto.GifticonDto;
import com.hungpick.service.IGifticonService;

@Controller
public class GifticonController {
	
	@Autowired
	private IGifticonService gifticonService;
	
	@Autowired
	private ProjectTestController testctrl;
	
	/*--------------------- 기프티콘 조회 ---------------------*/
	@RequestMapping("gifticonList")
	public String giftiConList(GifticonDto Dto, Model model) throws Exception {
		String view = gifticonService.showGifticon(Dto, model);
		return view;
	}
	
	/*--------------------- 기프티콘 등록 페이지 ---------------------*/
	@RequestMapping("gifticonInsert")
	public void gifticonInsert() {
	}
	
	/*--------------------- 기프티콘 등록 완료 눌렀을 때 ---------------------*/
	@RequestMapping("gifticonInsertSubmit")
	public String gifticonInsertSubmit(GifticonDto Dto, MultipartFile uploadfile, ModelMap modelMap) throws Exception {
		
		String view = gifticonService.insertGifticon(Dto,uploadfile,modelMap);
		return view;
	}

}
