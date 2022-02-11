package com.hungpick.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.multipart.MultipartFile;

import com.hungpick.controller.FileUploadController;
import com.hungpick.dao.IGifticonDao;
import com.hungpick.dto.GifticonDto;

@Service("gifticonService")
public class GifticonServiceImpl implements IGifticonService {

	@Autowired
	private IGifticonDao gifticonDao;
	
	@Autowired
	private FileUploadController fileUpload; 

	// 기프티콘 조회
	@Override
	public String showGifticon(GifticonDto Dto, Model model) throws Exception {
		List<GifticonDto> list = gifticonDao.showGifticon(Dto);
		model.addAttribute("gifticonList",list);
		return "gifticonList";
	}

	// 기프티콘 등록
	@Override
	public String insertGifticon(GifticonDto Dto, MultipartFile uploadfile, ModelMap modelMap) throws Exception {
		
		System.out.println("파일 생성 전");
		fileUpload.fileUpload(uploadfile, modelMap);
		Dto.setGifticonImg((String) "images/gifticon/" + modelMap.get("gifticonImg"));
		System.out.println("확인 : " + modelMap.get("gifticonImg"));
		System.out.println("파일 생성 후");
		gifticonDao.insertGifticon(Dto);
		System.out.println("DTO : " + Dto);
		
		return "adminPage";
	}
	
}
