package com.hungpick.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.hungpick.dao.IGifticonDao;
import com.hungpick.dto.GifticonDto;

@Service("gifticonService")
public class GifticonServiceImpl implements IGifticonService {

	@Autowired
	private IGifticonDao gifticonDao;
	
	// 기프티콘 단건 조회
	@Override
	public String sltGifticon(String gifticonCode, Model model) throws Exception {
		GifticonDto Dto = gifticonDao.sltGifticon(gifticonCode);
		model.addAttribute("gifticonList",Dto);
		
		return "gifticonUpdatePage";
	}
	
	// 기프티콘 다건 조회
	@Override
	public String showGifticon(GifticonDto Dto, Model model) throws Exception {
		
		List<GifticonDto> list = gifticonDao.showGifticon(Dto);
		model.addAttribute("gifticonList",list);
		
		return "gifticonList";
	}

	// 기프티콘 등록
	@Override
	public String insertGifticon(GifticonDto Dto) throws Exception {
		gifticonDao.insertGifticon(Dto);
		return "redirect:/gifticonInsert";
	}

	// 기프티콘 삭제
	@Override
	public String deleteGifticon(GifticonDto Dto) throws Exception {
		gifticonDao.deleteGifticon(Dto);
		return "redirect:/gifticonDelete";
	}


	// 기프티콘 수정
	@Override
	public String updateGifticon(GifticonDto Dto) throws Exception {
		gifticonDao.updateGifticon(Dto);
		return "redirect:/gifticonUpdate";
	}

	@Override
	public String sltGifticonBrand(GifticonDto Dto, Model model) throws Exception {
		List<GifticonDto> list = gifticonDao.sltGifticonBrand(Dto);
		model.addAttribute("gifticonList",list);
		
		return "gifticonList";
	}

	@Override
	public String sltGifticonBrandMenu(GifticonDto Dto, Model model) throws Exception {
		List<GifticonDto> list = gifticonDao.sltGifticonBrandMenu(Dto);
		model.addAttribute("gifticonList",list);
		
		return "gifticonList";
	}
	
}
