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

	// 회원조회
	@RequestMapping("userView")
	public String userView(UserDto Dto, Model model) throws Exception {
		String view = userService.sltMulti(Dto, model);
		return view;
	}

	// 아이디 찾기
	@RequestMapping("userFindId")
	public void userFindId() {
	}

	// 아이디 찾기 결과
	@RequestMapping("userFindIdResult")
	public void userFindIdResult() {
	}

	// 비밀번호 찾기
	@RequestMapping("userFindPw")
	public void userFindPw() {
	}

	// 비밀번호 찾기 결과
	@RequestMapping("userFindPwResult")
	public void userFindPwResult() {
	}

	// 마이 페이지
	@RequestMapping("userPage")
	public void userPage() {
	}

	// 로그아웃
	@RequestMapping("userLogout")
	public String userLogout(HttpSession session) throws Exception {
		String view = userService.userLogout(session);
		return view;
	}
	
	// 회원가입
	@RequestMapping("userRegist")
	public void userRegist() {
	}

	// 회원가입 완료
	@RequestMapping("userRegistSubmit")
	public String userRegistSubmit(UserDto Dto) throws Exception {
		String view = userService.userRegist(Dto);
		return view;
	}

	// 아이디 찾기
	@RequestMapping("FindIdSubmit")
	public String userFindId(@Param("memberName") String memberName, @Param("memberEmail") String memberEmail,
			Model model) throws Exception {
		UserDto Dto = userService.findId(memberName, memberEmail);
		model.addAttribute("findId", Dto.getMemberId());

		return "userFindIdResult";
	}

	// 비밀번호 찾기
	@RequestMapping("FindPwSubmit")
	public String userFindPwSubmit(String memberId, Model model) throws Exception {
		UserDto Dto = userService.findPw(memberId);
		System.out.println("확인 : " + Dto);
		return "userFindPwResult";
	}

	// 로그인 페이지
	@RequestMapping("userLogin")
	public void userLogin() {
	}

	// 로그인
	@RequestMapping("userLoginTry")
	public String userLoginTry(@Param("memberId") String memberId, @Param("memberPw") String memberPw, HttpSession session) throws Exception {
		String view = userService.userLogin(memberId, memberPw, session);
		return view;
	}


	// 회원탈퇴
	@RequestMapping("userDelete")
	public String userDelete(@Param("memberId") String memberId, @Param("memberPw") String memberPw) throws Exception {
		String view = userService.userDelete(memberId, memberPw);
		return view;
	}
}