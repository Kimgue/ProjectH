package com.hungpick.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hungpick.dao.IAdminDao;
import com.hungpick.dto.AdminDto;

@Service("adminService")
public class AdminServiceImpl implements IAdminService{
	
	@Autowired
	private IAdminDao adminDao;

	@Override
	public String adminLogin(String adminId, String adminPw, String memberId, String memberPw, HttpSession session) throws Exception {
		adminId = memberId;
		adminPw = memberPw;
		Boolean loginBool = false;
		AdminDto Dto = adminDao.adminLogin(adminId, adminPw);
		
		if(Dto != null) {
			loginBool = true;
			session.setAttribute("loginBool", loginBool);
			session.setAttribute("adminDTO", Dto);
			session.setAttribute("adminCode", Dto.getAdminCode());
			session.setAttribute("adminId", Dto.getAdminId());
			session.setAttribute("adminPw", Dto.getAdminPw());
			session.setAttribute("adminName", Dto.getAdminName());
		}
		
		return "redirect:/main";
		
		
		
	}

}
