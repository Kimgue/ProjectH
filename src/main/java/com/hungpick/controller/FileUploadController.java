<<<<<<< HEAD
package com.hungpick.controller;

import java.io.File;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class FileUploadController {
	
	// Ajax를 통한 파일 업로드
	@RequestMapping("fileUpload.do")
	public void fileUpload(@RequestParam("uploadFile") MultipartFile uploadFile, @RequestParam("uploadPath") String uploadPath, HttpServletResponse response) throws Exception {
		
		// 원본 파일명 설정
		String fileName = uploadFile.getOriginalFilename();
		
		// UUID 생성 후 원본 파일명에 덮어씌우기
		final String uuid = UUID.randomUUID().toString().replace("-", "");
		fileName = uuid + "_" + fileName;
		
		// 파일 생성
		File savefile = new File(uploadPath, fileName);
		uploadFile.transferTo(savefile);
		
		// ajax 데이터 수신용
		response.getWriter().print(fileName);
		
	}

	// Ajax를 통한 파일 삭제
	@RequestMapping("fileDelete.do")
	public void fileDelete(@RequestParam("fileName") String fileName, @RequestParam("filePath") String filePath, HttpServletResponse response) throws Exception {
		
		// 경로 상에 images/*/ <- 두개 지우고 파일명만 추출
		String[] cutFileName = fileName.split("/");
		
		// 추출된 3가지 문자열 중 파일명만 있는 문자열 이름으로 파일 생성 -> 파일 존재할 시 삭제
		File file = new File(filePath, cutFileName[2]);
		if (file.exists()) {
			file.delete();
		}
	}
	
}
=======
package com.hungpick.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class FileUploadController {
	
	@Autowired
	ServletContext sc;
	
	// Ajax를 통한 파일 업로드
	@RequestMapping("fileUpload.do")
	public void fileUpload(@RequestParam("uploadFile") MultipartFile uploadFile, @RequestParam("filePath") String filePath, HttpServletResponse response) throws IOException {
		
		// 서버상의 경로 설정
		String realPath = sc.getRealPath("/resources/images/" + filePath);
		
		// 원본 파일명
		String fileName = uploadFile.getOriginalFilename();
		
		// 파일의 크기
		byte bytes[] = uploadFile.getBytes();
		
		// UUID 설정
		final String uuid = UUID.randomUUID().toString().replace("-", "");
		fileName = uuid + "_" + fileName;
		
		// 파일 생성
		File file = new File(realPath, fileName);
		FileCopyUtils.copy(bytes, file);

		// 파일 생성
//		File savefile = new File(uploadPath, fileName);
//		uploadFile.transferTo(savefile);
		
		// ajax 데이터 수신용
		response.getWriter().print(fileName);
	}

	// Ajax를 통한 파일 삭제
	@RequestMapping("fileDelete.do")
	public void fileDelete(@RequestParam("fileName") String fileName, @RequestParam("filePath") String filePath, HttpServletResponse response) throws Exception {
		
		String realPath = sc.getRealPath("/resources/images/" + filePath);
		
		// 경로 상에 images/*/ <- 두개 지우고 파일명만 추출
		String[] cutFileName = fileName.split("/");
		
		// 추출된 3가지 문자열 중 파일명만 있는 문자열 이름으로 파일 생성 -> 파일 존재할 시 삭제
		File file = new File(realPath, cutFileName[2]);
		if (file.exists()) {
			file.delete();
		}
	}
	
}
>>>>>>> branch 'master' of https://github.com/Kimgue/WebProject.git
