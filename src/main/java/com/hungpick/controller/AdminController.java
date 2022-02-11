package com.hungpick.controller;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hungpick.service.IAdminService;

@Controller
public class AdminController {	
	
	@Autowired
	private IAdminService adminService;
	
	/*--------------------- 로그인 시도했을 때 ---------------------*/
	@RequestMapping("adminLoginTry")
	public String adminLoginTry(@Param("adminId") String adminId, @Param("adminPw") String adminPw, String memberId, String memberPw, HttpSession session) throws Exception {
		String view = adminService.adminLogin(adminId, adminPw, memberId, memberPw, session);
		return view;
	}
	
	/*--------------------- 관리 페이지 ---------------------*/
	@RequestMapping("adminPage")
	public void adminPage() {
	}
}
