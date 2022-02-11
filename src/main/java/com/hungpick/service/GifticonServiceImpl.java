package com.hungpick.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
		
		System.out.println("확인 : " + modelMap.get("gifticonImg"));
		System.out.println("파일 생성 후");
		gifticonDao.insertGifticon(Dto);
		
		return "adminPage";
	}
	
//	// 파일 업로드를 위한 경로 설정
//	private String getDestinationLocation() {
//		return "C:/2108KHS/Git/WebProject/src/main/webapp/resources/images/gifticon/";
//	}
//	
//	// 파일 업로드
//	@Override
//	public void fileUpload(@RequestParam("uploadfile") MultipartFile uploadfile, ModelMap modelMap) throws Exception {
//		OutputStream out = null;
//		PrintWriter printWriter = null;
//		
//		try {
//			// 파일명 얻기
//			String fileName = uploadfile.getOriginalFilename();
//			System.out.println("파일명 : " + fileName);
//			modelMap.addAttribute("gifticonImg",fileName);
//			// 파일의 바이트 정보 얻기
//			byte[] bytes = uploadfile.getBytes();
//			System.out.println("바이트 : " + bytes);
//			// 파일의 저장 경로 얻기
//			String uploadPath = getDestinationLocation() + fileName;
//			System.out.println("패스 : " + uploadPath);
//			// 파일 객체 생성
//			File file = new File(uploadPath);
//			// 상위 폴더 존재 여부 확인
//			if (!file.getParentFile().exists()) {
//				// 상위 폴더가 존재 하지 않는 경우 상위 폴더 생성
//				file.getParentFile().mkdirs();
//			}
//			// 파일 아웃풋 스트림 생성
//			out = new FileOutputStream(file);
//			// 파일 아웃풋 스트림에 파일의 바이트 쓰기
//			out.write(bytes);
//		} catch (IOException e) {
//			e.printStackTrace();
//		} finally {
//			try {
//				if (out != null) {
//					out.close();
//				}
//				if (printWriter != null) {
//					printWriter.close();
//				}
//			} catch (IOException e) {
//				e.printStackTrace();
//			}
//		}
//	}
	
	
	
	
	
//	@RequestMapping(value = "/file_upload_form.iot", method = RequestMethod.GET)
//	public String file_upload_form(ModelMap modelMap) {
//		return "adminPage";
//	}
	
	

//	@RequestMapping(value = "/file_upload_save.iot", method = RequestMethod.POST)
//	public String file_upload_save(@RequestParam("uploadfile") MultipartFile uploadfile, ModelMap modelMap) {
//		OutputStream out = null;
//		PrintWriter printWriter = null;
//		try {
//			// 파일명 얻기
//			String fileName = uploadfile.getOriginalFilename();
//			System.out.println("파일명 : " + fileName);
//			// 파일의 바이트 정보 얻기
//			byte[] bytes = uploadfile.getBytes();
//			System.out.println("바이트 : " + bytes);
//			// 파일의 저장 경로 얻기
//			String uploadPath = getDestinationLocation() + fileName;
//			System.out.println("패스 : " + uploadPath);
//			// 파일 객체 생성
//			File file = new File(uploadPath);
//			// 상위 폴더 존재 여부 확인
//			if (!file.getParentFile().exists()) {
//				// 상위 폴더가 존재 하지 않는 경우 상위 폴더 생성
//				file.getParentFile().mkdirs();
//			}
//			// 파일 아웃풋 스트림 생성
//			out = new FileOutputStream(file);
//			// 파일 아웃풋 스트림에 파일의 바이트 쓰기
//			out.write(bytes);
//		} catch (IOException e) {
//			e.printStackTrace();
//		} finally {
//			try {
//				if (out != null) {
//					out.close();
//				}
//				if (printWriter != null) {
//					printWriter.close();
//				}
//			} catch (IOException e) {
//				e.printStackTrace();
//			}
//		}
//		return "adminPage";
//	}
}
