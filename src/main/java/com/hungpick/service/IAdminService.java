package com.hungpick.service;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;

public interface IAdminService {

	// 관리자 로그인
	public String adminLogin(@Param("adminId") String adminId, @Param("adminPw") String adminPw, String memberId, String memberPw, HttpSession session) throws Exception;
}
