package com.hungpick.dao;

import java.util.List;

import com.hungpick.dto.GifticonDto;


public interface IGifticonDao {

	// 기프티콘 조회
	public List<GifticonDto> showGifticon(GifticonDto Dto) throws Exception;
	
	// 기프티콘 등록
	public void insertGifticon(GifticonDto Dto) throws Exception;
	
	// 기프티콘 삭제
	public void deleteGifticon(GifticonDto Dto) throws Exception;
	
	// 기프티콘 단건 조회
	public GifticonDto sltGifticon(String gifticonCode) throws Exception;
	
}
