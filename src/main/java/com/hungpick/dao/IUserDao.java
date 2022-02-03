package com.hungpick.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hungpick.dto.UserDto;

public interface IUserDao {
	
	/*---------------- Parameter Type : DTO ----------------*/  
	
	// 다건조회
	List<UserDto> sltMulti(UserDto Dto) throws Exception;
	
	// 정보수정
	String userUpdate(UserDto Dto) throws Exception;
	
	// 회원가입
	void userRegist(UserDto Dto) throws Exception;

	
	/*---------------- Parameter Type : 그 외 ----------------*/
	
	// 아이디 찾기
	UserDto findId(@Param("memberName") String memberName, @Param("memberEmail") String memberEmail) throws Exception;
	
	// 비밀번호 찾기
	UserDto findPw(String memberId) throws Exception;
	
	// 비밀번호 찾는게 본인인지 확인
	UserDto findPwCertification(@Param("memberName") String memberName, @Param("memberEmail") String memberEmail) throws Exception;

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

	// 회원탈퇴
	void userDelete(@Param("memberId") String memberId, @Param("memberPw") String memberPw) throws Exception;
}