package com.hungpick.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hungpick.dao.IGifticonExchangeDao;
import com.hungpick.dto.GifticonExchangeDto;

@Service("gifticonExchangeService")
public class GifticonExchangeServiceImpl implements IGifticonExchangeService {

	@Autowired
	private IGifticonExchangeDao gifticonExchangeDao;

	@Override
	public String insertGifticonExchange(GifticonExchangeDto Dto) throws Exception {
		gifticonExchangeDao.insertGifticonExchange(Dto);
		return "redirect:/gifticonList";
	}
	
}
