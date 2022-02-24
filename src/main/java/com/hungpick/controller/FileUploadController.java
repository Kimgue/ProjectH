package com.hungpick.controller;

import java.io.File;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
		
        if ( ! new File(realPath).exists()) {
            new File(realPath).mkdirs();
        }
		
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
	
	// 다중 파일업로드 
	@ResponseBody
	@RequestMapping(value = "file-upload", method = RequestMethod.POST)
	public String fileUpload(
			@RequestParam("article_file") List<MultipartFile> multipartFile
			, HttpServletRequest request, HttpServletResponse response) {
		
		String strResult = "{ \"result\":\"FAIL\" }";
		String contextRoot = sc.getRealPath("/resources/images/");
		String fileRoot;
		//2는 최대 이미지 개수
		int totalImgCount = 2;
		String[] fileName = new String[totalImgCount];
		
		try {
			// 파일이 있을때 탄다.
			if(multipartFile.size() > 0 && !multipartFile.get(0).getOriginalFilename().equals("")) {
				
				int i = 0;
				
				strResult = "{ \"result\":\"OK\", \"reviewImg\":";
				
				for(MultipartFile file:multipartFile) {
					fileRoot = contextRoot + "review/";
					
					
					String originalFileName = file.getOriginalFilename();	//오리지날 파일명
					String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
					String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
					
					fileName[i] = savedFileName;
					
					if(i!=0) {
						strResult = strResult + "," + fileName[i];
					} else {
					
					strResult = strResult + "\"" + fileName[i] +"";
					}
					
					File targetFile = new File(fileRoot + savedFileName);	
					try {
						InputStream fileStream = file.getInputStream();
						FileUtils.copyInputStreamToFile(fileStream, targetFile); //파일 저장
						
					} catch (Exception e) {
						//파일삭제
						FileUtils.deleteQuietly(targetFile);	//저장된 현재 파일 삭제
						e.printStackTrace();
						break;
					}
					i++;
				}
				
				strResult = strResult + "\"}";
			
				
			}
			// 파일 아무것도 첨부 안했을때 탄다.(게시판일때, 업로드 없이 글을 등록하는경우)
			else
				strResult = "{ \"result\":\"OK\" }";
		}catch(Exception e){
			e.printStackTrace();
		}
		return strResult;
	}
}
