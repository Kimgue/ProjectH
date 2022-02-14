package com.hungpick.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hungpick.service.IGifticonExchangeService;

@Controller
public class GifticonExchangeController {
	
	@Autowired
	private IGifticonExchangeService gifticonExchangeService;
	
	@Autowired
	private GifticonController gifticonController;
	
	/*--------------------- 기프티콘 교환 페이지 ---------------------*/
	@RequestMapping("gifticonExchange")
	public void gifticonExchange(String gifticonCode, Model model) throws Exception {
		gifticonController.gifticonsltOne(gifticonCode, model);
	}
}
