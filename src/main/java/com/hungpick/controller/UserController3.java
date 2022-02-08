package com.hungpick.controller;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hungpick.dto.UserDto;
import com.hungpick.service.IUserService;

@Controller
public class UserController3 {

	@Autowired
	private IUserService userService;

	/*--------------------- 아이디 찾기 페이지로 이동 ---------------------*/
	@RequestMapping("userFindId")
	public void userFindId() {
	}

	/*--------------------- 아이디 찾은 결과 페이지로 이동 ---------------------*/
	@RequestMapping("userFindIdResult")
	public void userFindIdResult() {
	}

	/*--------------------- 비밀번호 찾기 페이지로 이동 ---------------------*/
	@RequestMapping("userFindPw")
	public void userFindPw() {
	}

	/*--------------------- 비밀번호 찾기 결과 페이지로 이동 ---------------------*/
	@RequestMapping("userFindPwResult")
	public void userFindPwResult() {
	}

	/*--------------------- 내 정보 페이지로 이동 ---------------------*/
	@RequestMapping("userPage")
	public void userPage() {
	}
	
	/*--------------------- 회원가입 페이지로 이동 ---------------------*/
	@RequestMapping("userRegist")
	public void userRegist() {
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
	@RequestMapping("userDeleteFinish")
	public void userDeleteFinish() {
	}
	
	
	
	
	/*--------------------- 회원 조회 페이지로 이동 ---------------------*/
	@RequestMapping("userView")
	public String userView(UserDto Dto, Model model) throws Exception {
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
	@RequestMapping("userRegistSubmit")
	public String userRegistSubmit(UserDto Dto) throws Exception {
		String view = userService.userRegist(Dto);
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
		String view = userService.userDelete(Dto, session);
		return view;
	}
	
	/*--------------------- 아이디 찾기 눌렀을 때 ---------------------*/
	@RequestMapping("FindIdSubmit")
	public String userFindId(@Param("memberName") String memberName, @Param("memberEmail") String memberEmail, Model model) throws Exception {
		String view = userService.findId(memberName, memberEmail, model);
		return view;
	}

	/*--------------------- 비밀번호 찾기 (아이디 확인) ---------------------*/
	@RequestMapping("FindPwSubmit")
	public String userFindPwSubmit(String memberId, HttpSession session) throws Exception {
		String view = userService.findPw(memberId, session);
		return view;
	}
	
	/*--------------------- 비밀번호 찾기 (이름과 이메일 확인) ---------------------*/
	@RequestMapping("FindPwUpdate")
	public String userFindPwUpdate(String memberName, String memberEmail, HttpSession session) throws Exception {
		String view = userService.userUpdatePw(memberName, memberEmail, session);
		return view;
	}
	
	/*--------------------- 비밀번호 찾기 (비밀번호 변경) ---------------------*/
	@RequestMapping("ChangePw")
	public String ChangePw(UserDto Dto, HttpSession session) throws Exception {
		String view = userService.ChangePw(Dto, session);
		return view;
	}
}