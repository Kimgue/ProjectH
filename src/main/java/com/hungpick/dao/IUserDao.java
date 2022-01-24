package com.hungpick.dao;

import java.util.List;

import com.hungpick.dto.UserDto;

public interface IUserDao {

	UserDto sltSearch(String memberCode);

	UserDto userLogin(String memberId, String memberPw);

	List<UserDto> sltMulti(UserDto Dto);

	void userRegist(UserDto Dto);

	String checkId(String memberId);
}
