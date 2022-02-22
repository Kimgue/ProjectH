package com.hungpick.controller;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hungpick.dto.BrandDto;
import com.hungpick.service.IBrandService;

@Controller
public class BrandContorller {


	/*------------------------정진욱------------------------*/
	@Autowired
	private IBrandService brandService;

	
	private static final Logger logger = LoggerFactory.getLogger(BrandContorller.class);


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
		
}