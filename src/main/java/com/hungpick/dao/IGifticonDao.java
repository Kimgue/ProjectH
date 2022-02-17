package com.hungpick.dao;

import java.util.List;

import com.hungpick.dto.GifticonDto;


public interface IGifticonDao {
	
	// 기프티콘 단건 조회
	public GifticonDto sltGifticon(String gifticonCode) throws Exception;

	// 기프티콘 다건 조회
	public List<GifticonDto> showGifticon(GifticonDto Dto) throws Exception;
	
	// 기프티콘 등록
	public void insertGifticon(GifticonDto Dto) throws Exception;
	
	// 기프티콘 삭제
	public void deleteGifticon(GifticonDto Dto) throws Exception;

	// 기프티콘 수정
	public void updateGifticon(GifticonDto Dto) throws Exception;
	
	// 기프티콘 조건 조회(브랜드)
	public List<GifticonDto> sltGifticonBrand(GifticonDto Dto) throws Exception;
	
	// 기프티콘 조건 조회(브랜드, 메뉴)
	public List<GifticonDto> sltGifticonBrandMenu(GifticonDto Dto) throws Exception;
	
		
}
