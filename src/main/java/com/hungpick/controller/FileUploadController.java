package com.hungpick.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.UUID;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class FileUploadController {
	
	// 파일 업로드를 위한 경로 설정
	private String getDestinationLocation() {
		return "C:/KHS/Git/WebProject/src/main/webapp/resources/images/gifticon/";
	}

	// 파일 업로드
	public void fileUpload(@RequestParam("uploadfile") MultipartFile uploadfile, ModelMap modelMap) throws Exception {
		OutputStream out = null;
		PrintWriter printWriter = null;
		
		try {
			// 파일명 얻기
			String fileName = uploadfile.getOriginalFilename();
			modelMap.addAttribute("gifticonImg", fileName);
			// 파일의 바이트 정보 얻기
			byte[] bytes = uploadfile.getBytes();
			// 파일의 저장 경로 얻기
			String uploadPath = getDestinationLocation();
			System.out.println("확인 : " + fileName);
			
			// UUID 생성 후 지정
			UUID uuid = UUID.randomUUID();
			fileName = uuid.toString() + "_" + fileName;
			
			// 파일 객체 생성
			File file = new File(uploadPath,fileName);
			
			// 상위 폴더 존재 여부 확인
			if (!file.getParentFile().exists()) {
				// 상위 폴더가 존재 하지 않는 경우 상위 폴더 생성
				file.getParentFile().mkdirs();
			}
			// 파일 아웃풋 스트림 생성
			out = new FileOutputStream(file);
			// 파일 아웃풋 스트림에 파일의 바이트 쓰기
			out.write(bytes);
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if (out != null) {
					out.close();
				}
				if (printWriter != null) {
					printWriter.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
}
