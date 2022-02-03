package com.hungpick.controller;

import java.util.List;


import java.util.Random;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.mail.SimpleMailMessage;
//import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hungpick.dto.UserDto;
import com.hungpick.service.IUserService;

@Controller
public class UserController3 {

//	@Autowired
//	private JavaMailSender mailSender;

	@Autowired
	private IUserService userService;

	// 회원조회
	@RequestMapping("userView")
	public void userView(UserDto Dto, Model model) throws Exception {
		List<UserDto> list = userService.sltMulti(Dto);
		model.addAttribute("LIST", list);
	}

	// 회원가입 페이지
	@RequestMapping("userRegist")
	public void userRegist() {
	}

	// 마이 페이지
	@RequestMapping("userPage")
	public void userPage() {
	}

	// 로그아웃
	@RequestMapping("userLogout")
	public String userLogout(HttpSession session) throws Exception {
		userService.userLogout(session);
		return "redirect:/main.jsp";
	}

	// 회원가입
	@RequestMapping("userRegistSubmit")
	public String userRegistSubmit(UserDto Dto) throws Exception {
		userService.userRegist(Dto);
		return "redirect:/main.jsp";
	}

	// 로그인 페이지
	@RequestMapping("userLogin")
	public void userLogin() {
	}

	// 로그인
	@RequestMapping("userLoginTry")
	public ModelAndView userLoginTry(@Param("memberId") String memberId, @Param("memberPw") String memberPw,
			HttpSession session) throws Exception {
		ModelAndView mav = new ModelAndView();
		UserDto Dto = userService.userLogin(memberId, memberPw);

		if (Dto != null) {
			session.setAttribute("memberDTO", Dto);
			session.setAttribute("memberCode", Dto.getMemberCode());
			session.setAttribute("memberId", Dto.getMemberId());
			session.setAttribute("memberPw", Dto.getMemberPw());
			session.setAttribute("memberName", Dto.getMemberName());
			session.setAttribute("memberNickname", Dto.getMemberNickname());
			session.setAttribute("memberNumber", Dto.getMemberNumber());
			session.setAttribute("memberEmail", Dto.getMemberEmail());
			session.setAttribute("memberDate", Dto.getMemberDate());
			session.setAttribute("holdPoint", Dto.getHoldPoint());
			mav.setViewName("redirect:/main.jsp");
			return mav;
		} else {
			session.setAttribute("loginNotice", "올바른 아이디 혹은 비밀번호를 입력해주세요");
			mav.setViewName("redirect:/userLogin");
			session.setMaxInactiveInterval(1);

			return mav;
		}
	}

	// PW 검사
	@RequestMapping("pwChkCtrl.do")
	@ResponseBody
	public String pwChk(@ModelAttribute("inputPw") @Param("inputPw") String inputPw, HttpSession session)
			throws Exception {
		boolean result = false;
		if (inputPw.equals(session.getAttribute("memberPw"))) {
			result = true;
		} else {
			result = false;
		}

		JSONObject jsonObj = new JSONObject();
		jsonObj.put("result", result);
		String jsonOut = jsonObj.toString();

		return jsonOut;
	}

	// ID 중복검사
	@RequestMapping("idChkCtrl.do")
	@ResponseBody
	public String idChk(@ModelAttribute("id") String memberId) throws Exception {
		String idChk = userService.checkId(memberId);
		boolean result = false;
		if (idChk.equals("0")) {
			result = true;
		}

		JSONObject jsonObj = new JSONObject();
		jsonObj.put("result", result);
		String jsonOut = jsonObj.toString();

		return jsonOut;
	}

	// ID 중복검사
	@RequestMapping("chkNumber.do")
	@ResponseBody
	public String chkNumber(@ModelAttribute("number") String memberNumber) throws Exception {
		String chkNumber = userService.checkNumber(memberNumber);
		boolean result = false;
		if (chkNumber.equals("0")) {
			result = true;
		}

		JSONObject jsonObj = new JSONObject();
		jsonObj.put("result", result);
		String jsonOut = jsonObj.toString();

		return jsonOut;
	}

	public void userDelete(@Param("memberId") String memberId, @Param("memberPw") String memberPw) throws Exception {
		userService.userDelete(memberId, memberPw);
	}

	// 정보수정
	@RequestMapping("chkNickname.do")
	@ResponseBody
	public String chkNickname(@ModelAttribute("nickname") String memberNickname, UserDto Dto, HttpSession session)
			throws Exception {
		System.out.println("닉네임 중복 확인 시작");
		String chkNickname = userService.checkNickname(memberNickname);
		System.out.println("닉네임 중복 확인 완료");
		System.out.println("결과 : " + chkNickname);

		boolean result = false;

		Dto = (UserDto) session.getAttribute("memberDTO");
		System.out.println("현재 로그인 상태 : " + Dto);

		if (chkNickname.equals("0")) {
			if (Dto != null) {
				Dto.setMemberNickname(memberNickname);
				userService.userUpdate(Dto);
			} else {

			}
			result = true;
		}

		JSONObject jsonObj = new JSONObject();
		jsonObj.put("result", result);
		String jsonOut = jsonObj.toString();

		return jsonOut;
	}

//	@RequestMapping("CheckMail.do")
//	@ResponseBody
//	public String SendMail(@ModelAttribute("mail") String mail, HttpSession session) throws Exception {
//		System.out.println("확인전");
//		String chkEmail = userService.checkEmail(mail);
//		System.out.println("확인 결과 : " + chkEmail);
//
//		boolean chkEmailBool = false;
//		JSONObject jsonObj = new JSONObject();
//
//		if (chkEmail.equals("0")) {
//			chkEmailBool = true;
//			Random random = new Random();
//			String key = "";
//
//			SimpleMailMessage message = new SimpleMailMessage();
//
//			message.setTo(mail); // 스크립트에서 보낸 메일을 받을 사용자 이메일 주소
//
//			// 입력 키를 위한 코드
//			int numIndex = random.nextInt(899999) + 100000;
//			key += numIndex;
//
//			message.setSubject("인증번호 입력을 위한 메일 전송");
//			message.setText("인증 번호 : " + key);
//
//			mailSender.send(message);
//
//			jsonObj.put("key", key);
//			jsonObj.put("result", chkEmailBool);
//			String jsonOut = jsonObj.toString();
//			return jsonOut;
//		} else {
//			jsonObj.put("result", chkEmailBool);
//			String jsonOut = jsonObj.toString();
//			return jsonOut;
//		}
//
//	}
}