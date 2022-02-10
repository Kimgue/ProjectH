package com.hungpick.service;

import org.springframework.ui.Model;

import com.hungpick.dto.GifticonDto;

public interface IGifticonService {

	public String showGifticon(GifticonDto Dto, Model model) throws Exception;
	
	
}
