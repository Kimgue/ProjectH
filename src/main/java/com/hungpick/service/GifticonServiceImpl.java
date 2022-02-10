package com.hungpick.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.hungpick.dao.IGifticonDao;
import com.hungpick.dto.GifticonDto;

@Service("gifticonService")
public class GifticonServiceImpl implements IGifticonService {

	@Autowired
	private IGifticonDao gifticonDao;

	@Override
	public String showGifticon(GifticonDto Dto, Model model) throws Exception {
		List<GifticonDto> list = gifticonDao.showGifticon(Dto);
		model.addAttribute("gifticonList",list);
		System.out.println("기프티콘 Svc");
		return "GifticonList";
	}

}
