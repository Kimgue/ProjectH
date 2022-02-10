package com.hungpick.dao;

import java.util.List;

import com.hungpick.dto.GifticonDto;


public interface IGifticonDao {

	// 기프티콘 조회
	public List<GifticonDto> showGifticon(GifticonDto Dto) throws Exception;
}
