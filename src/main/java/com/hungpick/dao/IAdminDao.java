package com.hungpick.dao;

import org.apache.ibatis.annotations.Param;

import com.hungpick.dto.AdminDto;

public interface IAdminDao {

	/*------------------ 관리자 ------------------*/
	// 관리자 로그인
	public AdminDto adminLogin(@Param("adminId") String adminId, @Param("adminPw") String adminPw) throws Exception;
}
