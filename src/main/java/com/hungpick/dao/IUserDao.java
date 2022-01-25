package com.hungpick.dao;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;

import com.hungpick.dto.UserDto;

public interface IUserDao {

	UserDto sltSearch(String memberCode);
	
	UserDto userLogin(@Param("memberId") String memberId, @Param("memberPw")String memberPw , HttpSession session) throws Exception;

	List<UserDto> sltMulti(UserDto Dto);

	void userRegist(UserDto Dto);

	String checkId(String memberId);
}
