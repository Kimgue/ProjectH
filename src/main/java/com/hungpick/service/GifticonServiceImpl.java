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
	public String insertGifticon(GifticonDto Dto, MultipartFile uploadfile, String fileLoc, ModelMap modelMap) throws Exception {
		fileLoc = "C:/2108KHS/Git/WebProject/src/main/webapp/resources/images/gifticon"; 
		fileUpload.fileUpload(uploadfile, fileLoc, modelMap);
		Dto.setGifticonImg("images/gifticon/" + modelMap.get("fileName"));
		gifticonDao.insertGifticon(Dto);
		return "redirect:/gifticonInsert";
	}

	// 기프티콘 삭제
	@Override
	public String deleteGifticon(GifticonDto Dto, ModelMap modelMap, String fileLoc) throws Exception {
		fileLoc = "C:/2108KHS/Git/WebProject/src/main/webapp/resources/images/gifticon";
		modelMap.addAttribute("fileName",Dto.getGifticonImg());
		
		gifticonDao.deleteGifticon(Dto);
		fileUpload.fileDelete(modelMap, fileLoc);
		
		return "redirect:/gifticonDelete";
	}
	
}
