package com.hungpick.service;

import java.util.List;

import com.hungpick.dto.UserDto;

public interface IUserService {

	UserDto sltSearch(String memberCode);
	
	UserDto userLogin(String memberId, String memberPw);

	List<UserDto> sltMulti(UserDto Dto);

	String userRegist(UserDto Dto) throws Exception;
	
	String checkId(String memberId);
}
