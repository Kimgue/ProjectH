package com.hungpick.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hungpick.dao.IGifticonExchangeDao;

@Service("gifticonExchangeService")
public class GifticonExchangeServiceImpl implements IGifticonExchangeService {

	@Autowired
	private IGifticonExchangeDao gifticonExchangeDao;
	
}
