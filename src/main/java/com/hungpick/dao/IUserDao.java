package com.hungpick.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hungpick.dto.UserDto;
import com.hungpick.dto.UserVo;

public interface IUserDao {
	
	
	/*------------------ Create ------------------*/
	
	// 회원가입
	public void registMember(UserDto Dto) throws Exception;
	
	/*------------------ Read ------------------*/
	
	// 보유 기프티콘 조회
	public UserDto userGifticonOne(String memberCode) throws Exception; 
	
	// 보유 기프티콘 조회
	public List<UserVo> userGifticonMulti(UserVo Vo) throws Exception;
	
	//단건 조회
	public UserDto sltSearch(String memberCode) throws Exception;
	
	// 다건조회
	public List<UserDto> sltMulti(UserDto Dto) throws Exception;
	
	// 아이디 찾기
	public UserDto findId(@Param("memberName") String memberName, @Param("memberEmail") String memberEmail) throws Exception;
	
	// 비밀번호 찾기
	public UserDto findPw(@Param("memberName") String memberName, @Param("memberEmail") String memberEmail) throws Exception;
	
	// 로그인
	public UserDto userLogin(@Param("memberId") String memberId, @Param("memberPw") String memberPw) throws Exception;

	// PW 검사
//	public UserDto checkPw(@Param("inputPw") String inputPw) throws Exception;
	
	// ID 중복검사
	public String checkId(String memberId) throws Exception;
	
	// 닉네임 중복검사
	public String checkNickname(String memberNickname) throws Exception;
	
	// 이메일 중복검사
	public String checkEmail(String memberEmail) throws Exception;
	
	// 전화번호 중복검사
	public String checkNumber(String memberNumber) throws Exception;
	
	
	/*------------------ Update ------------------*/
	
	// 닉네임 변경
	public void updateNickname(UserDto Dto) throws Exception;
	
	// 비밀번호 변경
	public void updatePw(UserDto Dto) throws Exception;
	
	// 이메일 변경
	public void updateEmail(UserDto Dto) throws Exception;
	
	// 전화번호 변경
	public void updateNumber(UserDto Dto) throws Exception;
	
	// 포인트 변경
	public void updatePoint(UserDto Dto) throws Exception;
	
		
	/*------------------ Delete ------------------*/
	
	// 회원탈퇴
	public void deleteMember(UserDto Dto) throws Exception;
		
	

}