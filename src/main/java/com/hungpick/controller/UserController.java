package com.hungpick.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hungpick.dto.UserDto;
import com.hungpick.dto.UserVo;
import com.hungpick.service.IUserService;

@Controller
public class UserController {

	@Autowired
	private IUserService userService;

	/*--------------------- 아이디 찾기 페이지로 이동 ---------------------*/
	@RequestMapping("userFindId")
	public void userFindId() {
	}

	/*--------------------- 아이디 찾은 결과 페이지로 이동 ---------------------*/
	@RequestMapping("userFindIdComplete")
	public void userFindIdComplete() {
	}

	/*--------------------- 비밀번호 찾기 페이지로 이동 ---------------------*/
	@RequestMapping("userFindPw")
	public void userFindPw() {
	}

	/*--------------------- 비밀번호 찾기 결과 페이지로 이동 ---------------------*/
	@RequestMapping("userFindPwComplete")
	public void userFindPwComplete() {
	}

	/*--------------------- 내 정보 페이지로 이동 ---------------------*/
	@RequestMapping("userMyInfo")
	public void userMyInfo() {
	}
	
	/*--------------------- 회원가입 페이지로 이동 ---------------------*/
	@RequestMapping("userSignUp")
	public void userSignUp() {
	}
	
	/*--------------------- 로그인 페이지로 이동 ---------------------*/
	@RequestMapping("userLogin")
	public void userLogin() {
	}
	
	/*--------------------- 회원탈퇴 페이지로 이동 ---------------------*/
	@RequestMapping("userDelete")
	public void userDelete() {
	}
	
	/*--------------------- 회원탈퇴완료 페이지로 이동 ---------------------*/
	@RequestMapping("userDeleteComplete")
	public void userDeleteComplete() {
	}
	
	/*--------------------- 보유 기프티콘 페이지로 이동 ---------------------*/
	@RequestMapping("userGifticon")
	public void userGifticon(UserVo Vo, Model model) throws Exception {
		userService.userGifticonMulti(Vo, model);
	}
	
	/*--------------------- 회원 조회 페이지로 이동 ---------------------*/
	@RequestMapping("userInfo")
	public String userInfo(UserDto Dto, Model model) throws Exception {
		String view = userService.sltMulti(Dto, model);
		return view;
	}

	/*--------------------- 로그아웃 기능 ---------------------*/
	@RequestMapping("userLogout")
	public String userLogout(HttpSession session) throws Exception {
		String view = userService.userLogout(session);
		return view;
	}

	/*--------------------- 회원가입 완료 눌렀을 때 ---------------------*/
	@RequestMapping("userSignUpSubmit")
	public String userSignUp(UserDto Dto, Model model) throws Exception {
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		Date date = new Date();
		String time1 = format1.format(date);
		
		Dto.setMemberDate(time1);

		String view = userService.registMember(Dto);
		return view;
	}

	/*--------------------- 로그인 시도했을 때 ---------------------*/
	@RequestMapping("userLoginTry")
	public String userLoginTry(@Param("memberId") String memberId, @Param("memberPw") String memberPw, HttpSession session) throws Exception {
		String view = userService.userLogin(memberId, memberPw, session);
		return view;
	}

	/*--------------------- 회원탈퇴 시도했을 때 ---------------------*/
	@RequestMapping("userDeleteSubmit")
	public String userDeleteSubmit(UserDto Dto, HttpSession session) throws Exception {
		String view = userService.deleteMember(Dto, session);
		session.invalidate();
		return view;
	}
	
	/*--------------------- 아이디 찾기 눌렀을 때 ---------------------*/
	@RequestMapping("userFindIdSubmit")
	public String userFindIdSubmit(@Param("memberName") String memberName, @Param("memberEmail") String memberEmail, Model model) throws Exception {
		String view = userService.findId(memberName, memberEmail, model);
		return view;
	}

	/*--------------------- 비밀번호 찾기 (아이디 확인) ---------------------*/
	@RequestMapping("userFindPwSubmit")
	public String userFindPwSubmit(String memberId, HttpSession session) throws Exception {
		String view = userService.findPw(memberId, session);
		return view;
	}
	
	/*--------------------- 비밀번호 찾기 (이름과 이메일 확인) ---------------------*/
	@RequestMapping("userFindPwChk")
	public String userFindPwChk(String memberName, String memberEmail, HttpSession session) throws Exception {
		String view = userService.userUpdatePw(memberName, memberEmail, session);
		return view;
	}
	
	/*--------------------- 비밀번호 찾기 (비밀번호 변경) ---------------------*/
	@RequestMapping("userFindPwUpdate")
	public String userFindPwUpdate(UserDto Dto, HttpSession session, HttpServletResponse response) throws Exception {
		String view = userService.updatePw(Dto, session, response);
		return view;
	}
}