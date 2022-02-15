package com.hungpick.service;

import com.hungpick.dto.GifticonExchangeDto;

public interface IGifticonExchangeService {
	
	// 기프티콘 교환
	public String insertGifticonExchange(GifticonExchangeDto Dto) throws Exception;
	
}
