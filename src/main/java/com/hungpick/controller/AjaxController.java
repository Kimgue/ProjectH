package com.hungpick.controller;

import java.util.Random;


import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hungpick.dto.UserDto;
import com.hungpick.service.IUserService;

@Controller
public class AjaxController {

	@Autowired
	private JavaMailSender mailSender;

	@Autowired
	private IUserService userService;

	/*--------------------- Ajax 사용 : 비밀번호 검사 ---------------------*/
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

	/*--------------------- Ajax 사용 : 아이디 중복 검사 ---------------------*/
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

	/*--------------------- Ajax 사용 : 전화번호 중복 검사 ---------------------*/
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

	/*--------------------- Ajax 사용 : 이메일 중복 검사 및 이메일 전송과 인증 ---------------------*/
	@RequestMapping("CheckMail.do")
	@ResponseBody
	public String SendMail(@ModelAttribute("mail") String mail) throws Exception {
		String chkEmail = userService.checkEmail(mail);

		boolean chkEmailBool = false;
		JSONObject jsonObj = new JSONObject();

		if (chkEmail.equals("0")) {
			chkEmailBool = true;
			Random random = new Random();
			String key = "";

			SimpleMailMessage message = new SimpleMailMessage();

			message.setTo(mail);

			int numIndex = random.nextInt(899999) + 100000;
			key += numIndex;

			message.setSubject("인증번호 입력을 위한 메일 전송");
			message.setText("인증 번호 : " + key);

			mailSender.send(message);

			jsonObj.put("key", key);
			jsonObj.put("result", chkEmailBool);
			String jsonOut = jsonObj.toString();
			return jsonOut;
		} else {
			jsonObj.put("result", chkEmailBool);
			String jsonOut = jsonObj.toString();
			return jsonOut;
		}
	}
	
	/*--------------------- Ajax 사용 : 이메일 수정 ---------------------*/
	@RequestMapping("updateEmail.do")
	@ResponseBody
	public String updateEmail(@ModelAttribute("email") String memberEmail, UserDto Dto, HttpSession session)
			throws Exception {
		Dto = (UserDto) session.getAttribute("memberDTO");

		Dto.setMemberEmail(memberEmail);
		userService.ChangeEmail(Dto);

		JSONObject jsonObj = new JSONObject();
		String jsonOut = jsonObj.toString();

		return jsonOut;
	}
	
	/*--------------------- Ajax 사용 : 전화번호 수정 ---------------------*/
	@RequestMapping("updateNumber.do")
	@ResponseBody
	public String updateNumber(@ModelAttribute("number") String memberNumber, UserDto Dto, HttpSession session)
			throws Exception {
		Dto = (UserDto) session.getAttribute("memberDTO");

		Dto.setMemberNumber(memberNumber);
		userService.ChangeNumber(Dto);

		JSONObject jsonObj = new JSONObject();
		String jsonOut = jsonObj.toString();

		return jsonOut;
	}

	/*--------------------- Ajax 사용 : 닉네임 중복 확인 및 닉네임 수정 ---------------------*/
	@RequestMapping("chkNickname.do")
	@ResponseBody
	public String chkNickname(@ModelAttribute("nickname") String memberNickname, UserDto Dto, HttpSession session)
			throws Exception {
		String chkNickname = userService.checkNickname(memberNickname);

		boolean result = false;

		Dto = (UserDto) session.getAttribute("memberDTO");

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

	@RequestMapping("FindIdSendMail.do")
	@ResponseBody
	public String FindIdSendMail(@ModelAttribute("mail") String mail) throws Exception {

		JSONObject jsonObj = new JSONObject();
		Random random = new Random();
		String key = "";

		SimpleMailMessage message = new SimpleMailMessage();

		message.setTo(mail); // 스크립트에서 보낸 메일을 받을 사용자 이메일 주소

		// 입력 키를 위한 코드
		int numIndex = random.nextInt(899999) + 100000;
		key += numIndex;

		message.setSubject("인증번호 입력을 위한 메일 전송");
		message.setText("인증 번호 : " + key);

		mailSender.send(message);

		jsonObj.put("key", key);
		String jsonOut = jsonObj.toString();
		return jsonOut;
	}

	
	@RequestMapping(value = "/phoneCheck", method = RequestMethod.GET) 
	@ResponseBody 
	public String sendSMS(@RequestParam("phone") String userPhoneNumber) {
		Random random = new Random();
		String key = "";
		int numIndex = random.nextInt(899999) + 100000;
		key += numIndex;
		userService.certifiedPhoneNumber(userPhoneNumber, key); 
		return Integer.toString(numIndex); 
	}
}

