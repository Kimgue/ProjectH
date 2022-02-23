package com.hungpick.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hungpick.dto.GifticonDto;
import com.hungpick.service.IBrandService;
import com.hungpick.service.IGifticonService;
import com.hungpick.service.IMenuService;

@Controller
public class GifticonController {
	
	@Autowired
	private IBrandService brandService;
	
	@Autowired
	private IMenuService menuService;
	
	@Autowired
	private IGifticonService gifticonService;
	
	/*--------------------- 기프티콘 조회 ---------------------*/
	public void gifticonsltMulti(GifticonDto Dto, Model model) throws Exception {
		gifticonService.showGifticon(Dto, model);
	}
	
	/*--------------------- 기프티콘 단건 조회 ---------------------*/
	public void gifticonsltOne(String gifticonCode, Model model) throws Exception {
		gifticonService.sltGifticon(gifticonCode, model);
	}
	

	/*--------------------- 기프티콘 조회 페이지(관리자) ---------------------*/
	@RequestMapping("gifticonList")
	public void giftiConList(GifticonDto Dto, Model model) throws Exception {
		gifticonsltMulti(Dto, model);
	}
	
	/*--------------------- 기프티콘 조건 조회 (브랜드) ---------------------*/
	@RequestMapping("sltGifticonBrand")
	public String sltGifticonBrand(GifticonDto Dto, Model model) throws Exception {
		String view = gifticonService.sltGifticonBrand(Dto, model);
		return view;
	}
	
	/*--------------------- 기프티콘 조건 조회 (브랜드, 메뉴) ---------------------*/
	@RequestMapping("sltGifticonBrandMenu")
	public String sltGifticonBrandMenu(GifticonDto Dto, Model model) throws Exception {
		String view = gifticonService.sltGifticonBrandMenu(Dto, model);
		return view;
	}
	
	/*--------------------- 기프티콘 등록 페이지 ---------------------*/
	@RequestMapping("gifticonInsert")
	public void gifticonInsert(Model model) {
		model.addAttribute("brand", brandService.sltMulti());
		model.addAttribute("menu", menuService.sltMulti());
	}
	
	/*--------------------- 기프티콘 등록 완료 눌렀을 때 ---------------------*/
	@RequestMapping("gifticonInsertSubmit")
	public String gifticonInsertSubmit(GifticonDto Dto) throws Exception {
		String view = gifticonService.insertGifticon(Dto);
		return view;
	}
	
	/*--------------------- 기프티콘 수정 페이지 ---------------------*/
	@RequestMapping("gifticonUpdate")
	public void gifticonUpdate(GifticonDto Dto, Model model) throws Exception {
		gifticonsltMulti(Dto, model);
	}
	
	/*--------------------- 기프티콘 수정 눌렀을 때 ---------------------*/
	@RequestMapping("gifticonUpdatePage")
	public void gifticonUpdatePage(String gifticonCode, Model model) throws Exception{
		gifticonsltOne(gifticonCode, model);
	}
	
	/*--------------------- 기프티콘 수정 완료 눌렀을 때 ---------------------*/
	@RequestMapping("gifticonUpdateSubmit")
	public String gifticonUpdateSubmit(GifticonDto Dto) throws Exception {
		String view = gifticonService.updateGifticon(Dto);
		return view;
	}
	
	
	/*--------------------- 기프티콘 삭제 페이지 ---------------------*/
	@RequestMapping("gifticonDelete")
	public void gifticonDelete(GifticonDto Dto, Model model) throws Exception{
		gifticonsltMulti(Dto, model);
	}
	
	/*--------------------- 기프티콘 삭제 완료 눌렀을 때 ---------------------*/
	@RequestMapping("gifticonDeleteSubmit")
	public String gifticonDeleteSubmit(GifticonDto Dto) throws Exception {
		String view = gifticonService.deleteGifticon(Dto);
		return view;
	}
	
}
