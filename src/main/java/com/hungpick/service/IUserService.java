package com.hungpick.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.hungpick.dto.UserDto;

public interface IUserService {

	UserDto sltSearch(String memberCode);
	
	boolean userLogin(UserDto Dto, HttpSession session) throws Exception;
	
	void userLogout(HttpSession session) throws Exception;

	List<UserDto> sltMulti(UserDto Dto);

	String userRegist(UserDto Dto) throws Exception;
	
	String checkId(String memberId);
}
