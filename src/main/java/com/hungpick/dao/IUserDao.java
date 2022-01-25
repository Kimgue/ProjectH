package com.hungpick.dao;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;

import com.hungpick.dto.UserDto;

public interface IUserDao {

	// 단건조회
	UserDto sltSearch(String memberCode) throws Exception;

	// 다건조회
	List<UserDto> sltMulti(UserDto Dto) throws Exception;

	// 로그인
	UserDto userLogin(@Param("memberId") String memberId, @Param("memberPw") String memberPw, HttpSession session) throws Exception;

	// 회원가입
	void userRegist(UserDto Dto) throws Exception;

	// ID 중복검사
	String checkId(String memberId) throws Exception;
	
	// PW 검사
	UserDto checkPw(@Param("inputPw") String inputPw) throws Exception;
	
	// 회원탈퇴
	void userDelete(@Param("memberId") String memberId, @Param("memberPw") String memberPw) throws Exception;
}
