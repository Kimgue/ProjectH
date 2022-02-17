package com.hungpick.service;

import org.springframework.ui.Model;

import com.hungpick.dto.GifticonDto;

public interface IGifticonService {
	
	// 기프티콘 단건 조회
	public String sltGifticon(String gifticonCode, Model model) throws Exception;

	// 기프티콘 다건 조회
	public String showGifticon(GifticonDto Dto, Model model) throws Exception;
	
	// 기프티콘 등록
	public String insertGifticon(GifticonDto Dto) throws Exception;
	
	// 기프티콘 삭제
	public String deleteGifticon(GifticonDto Dto) throws Exception;
	
	// 기프티콘 수정
	public String updateGifticon(GifticonDto Dto) throws Exception;
	
	// 기프티콘 조건 조회 (브랜드)
	public String sltGifticonBrand(GifticonDto Dto, Model model) throws Exception;

	// 기프티콘 조건 조회 (브랜드, 메뉴)
	public String sltGifticonBrandMenu(GifticonDto Dto, Model model) throws Exception;	
}