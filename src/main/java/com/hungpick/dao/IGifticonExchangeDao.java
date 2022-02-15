package com.hungpick.dao;

import com.hungpick.dto.GifticonExchangeDto;

public interface IGifticonExchangeDao {
	
	// 기프티콘 교환
	public void insertGifticonExchange(GifticonExchangeDto Dto) throws Exception;
	
}
