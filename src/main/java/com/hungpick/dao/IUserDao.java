package com.hungpick.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hungpick.dto.UserDto;

public interface IUserDao {
	
	
	/*------------------ Create ------------------*/
	
	
	// 회원가입
	void userRegist(UserDto Dto) throws Exception;
	
	
	/*------------------ Read ------------------*/
	
	
	// 아이디 찾기
	UserDto findId(@Param("memberName") String memberName, @Param("memberEmail") String memberEmail) throws Exception;
	
	// 다건조회
	List<UserDto> sltMulti(UserDto Dto) throws Exception;
	
	// 비밀번호 찾기
	UserDto findPw(@Param("memberName") String memberName, @Param("memberEmail") String memberEmail) throws Exception;
	
	// 로그인
	UserDto userLogin(@Param("memberId") String memberId, @Param("memberPw") String memberPw) throws Exception;

	// PW 검사
	UserDto checkPw(@Param("inputPw") String inputPw) throws Exception;
	
	// ID 중복검사
	String checkId(String memberId) throws Exception;
	
	// 닉네임 중복검사
	String checkNickname(String memberNickname) throws Exception;
	
	// 이메일 중복검사
	String checkEmail(String memberEmail) throws Exception;
	
	// 전화번호 중복검사
	String checkNumber(String memberNumber) throws Exception;
	
	
	/*------------------ Update ------------------*/
	
	
	// 정보수정
	void userUpdate(UserDto Dto) throws Exception;
	
	// 비밀번호 변경
	void ChangePw(UserDto Dto) throws Exception;
	
	// 이메일 변경
	void ChangeEmail(UserDto Dto) throws Exception;
	
		
	/*------------------ Delete ------------------*/
	
	
	// 회원탈퇴
	void userDelete(UserDto Dto) throws Exception;

}