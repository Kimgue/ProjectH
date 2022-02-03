package com.hungpick.service;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.ui.Model;

import com.hungpick.dto.UserDto;

public interface IUserService {
	
	

	/*---------------- Parameter Type : DTO ----------------*/  
	
	// 다건조회
	public String sltMulti(UserDto Dto, Model model) throws Exception;
	
	// 회원가입
	public String userRegist(UserDto Dto) throws Exception;
	
	
	/*---------------- Parameter Type : 그 외 ----------------*/
	
	// 로그아웃
	public String userLogout(HttpSession session) throws Exception;
	
	// 아이디 찾기
	public UserDto findId(@Param("memberName") String memberName, @Param("memberEmail") String memberEmail) throws Exception;
	
	// 비밀번호 찾기
	public UserDto findPw(String memberId) throws Exception;

	// 로그인
	public String userLogin(@Param("memberId") String memberId, @Param("memberPw") String memberPw, HttpSession session) throws Exception;
	
	// 회원탈퇴
	public String userDelete(@Param("memberId") String memberId, @Param("memberPw") String memberPw) throws Exception;
	
	
	
	
	
	
	
	
	
	
	/*---------------- Ajax 사용 ----------------*/
	
	// 정보수정
	public void userUpdate(UserDto Dto) throws Exception;
	
	// ID 중복검사
	public String checkId(String memberId) throws Exception;
		
	// PW 검사
	public UserDto checkPw(@Param("inputPw") String inputPw) throws Exception;
		
	// 닉네임 중복검사
	public String checkNickname(String memberNickname) throws Exception;
	
	// 이메일 중복검사
	public String checkEmail(String memberEmail) throws Exception;
	
	// 전화번호 중복검사
	public String checkNumber(String memberNumber) throws Exception;
}