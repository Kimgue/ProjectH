package com.hungpick.service;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.ui.Model;

import com.hungpick.dto.UserDto;
import com.hungpick.dto.UserVo;

public interface IUserService {
	
	

	/*---------------- Parameter Type : DTO ----------------*/  
	
	// 다건조회
	public String sltMulti(UserDto Dto, Model model) throws Exception;
	
	// 회원가입
	public String registMember(UserDto Dto) throws Exception;
	
	
	/*---------------- Parameter Type : 그 외 ----------------*/
	
	//단건 조회
	public UserDto sltSearch(String memberCode) throws Exception;
	
	// 보유 기프티콘 단건 조회
	public String userGifticonOne(String memberCode, Model model) throws Exception;
	
	// 보유 기프티콘 다건 조회
	public String userGifticonMulti(UserVo Vo, Model model) throws Exception;
	
	// 로그아웃
	public String userLogout(HttpSession session) throws Exception;
	
	// 아이디 찾기
	public String findId(@Param("memberName") String memberName, @Param("memberEmail") String memberEmail, Model model) throws Exception;
	
	// 비밀번호 찾기
	public String findPw(String memberId, HttpSession session) throws Exception;
	
	// 비밀번호 변경
	public String userUpdatePw(@Param("memberName") String memberName, @Param("memberEmail") String memberEmail, HttpSession session) throws Exception;
	
	// 비밀번호 찾기 -> 비밀번호 변경
	public String updatePw(UserDto Dto, HttpSession session, HttpServletResponse response) throws Exception;
	
	// 로그인
	public String userLogin(@Param("memberId") String memberId, @Param("memberPw") String memberPw, HttpSession session) throws Exception;
	
	// 회원탈퇴
	public String deleteMember(UserDto Dto, HttpSession session) throws Exception;
	
	/*---------------- Ajax 사용 ----------------*/
	
	// 닉네임 변경
	public void updateNickname(UserDto Dto) throws Exception;
	
	// 이메일 변경
	public void updateEmail(UserDto Dto) throws Exception;
	
	// 전화번호 변경
	public void updateNumber(UserDto Dto) throws Exception;
	
	// 비밀번호 변경
	public void updatePw(UserDto Dto) throws Exception;
	
	// 포인트 변경
	public void updatePoint(UserDto Dto) throws Exception;
	
	// ID 중복검사
	public String checkId(String memberId) throws Exception;
		
	// PW 검사
//	public UserDto checkPw(@Param("inputPw") String inputPw) throws Exception;
		
	// 닉네임 중복검사
	public String checkNickname(String memberNickname) throws Exception;
	
	// 이메일 중복검사
	public String checkEmail(String memberEmail) throws Exception;
	
	// 전화번호 중복검사
	public String checkNumber(String memberNumber) throws Exception;

	// 전화번호 인증
	public void certifiedPhoneNumber(String userPhoneNumber, String key);
}