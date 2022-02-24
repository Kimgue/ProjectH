package com.hungpick.controller;

import java.util.Random;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.hungpick.dto.UserDto;
import com.hungpick.service.IMenuService;
import com.hungpick.service.IReviewService;
import com.hungpick.service.IUserService;

@Controller
public class AjaxController {

	@Autowired
	private JavaMailSender mailSender;

	@Autowired
	private IUserService userService;
	
	@Autowired
	private IMenuService menuService;
	
	@Autowired
	private IReviewService reviewService;

	private static final Logger logger = LoggerFactory.getLogger(AjaxController.class);

	
	/*--------------------- Ajax 사용 : 비밀번호 검사 ---------------------*/
/*	@RequestMapping("pwChkCtrl.do")
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
	}*/
	
	/*--- 중복검사 ---*/
	/*--------------------- 아이디 중복 검사 ---------------------*/
	@RequestMapping("chkId.do")
	@ResponseBody
	public String chkId(@ModelAttribute("id") String memberId) throws Exception {
		String chkId = userService.checkId(memberId);
		boolean result = false;
		if (chkId.equals("0")) {
			result = true;
		}

		JSONObject jsonObj = new JSONObject();
		jsonObj.put("result", result);
		String jsonOut = jsonObj.toString();

		return jsonOut;
	}

	/*--------------------- 전화번호 중복 검사 ---------------------*/
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
	
	/*--------------------- 이메일 중복 검사  ---------------------*/
	@RequestMapping("chkEmail.do")
	@ResponseBody
	public String chkEmail(@ModelAttribute("mail") String mail) throws Exception {
		String chkEmail = userService.checkEmail(mail);
		boolean result = false;
		if (chkEmail.equals("0")) {
			result = true;
		} 
		
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("result", result);
		String jsonOut = jsonObj.toString();

		return jsonOut;
	}
	
	/*--------------------- 닉네임 중복 검사 ---------------------*/
	@RequestMapping("chkNickname.do")
	@ResponseBody
	public String chkNickname(@ModelAttribute("nickname") String memberNickname) throws Exception {
		String chkNickname = userService.checkNickname(memberNickname);
		boolean result = false;
		if (chkNickname.equals("0")) {
			result = true;
		}

		JSONObject jsonObj = new JSONObject();
		jsonObj.put("result", result);
		String jsonOut = jsonObj.toString();

		return jsonOut;
	}
	

	/*--- 정보수정 ---*/
	/*--------------------- 닉네임 수정 ---------------------*/
	@RequestMapping("updateNickname.do")
	@ResponseBody
	public String updateNickname(@ModelAttribute("nickname") String memberNickname, UserDto Dto, HttpSession session) throws Exception {
		Dto = (UserDto) session.getAttribute("memberDTO");
		Dto.setMemberNickname(memberNickname);
		userService.updateNickname(Dto);
		
		JSONObject jsonObj = new JSONObject();
		String jsonOut = jsonObj.toString();

		return jsonOut;
	}
	
	/*--------------------- 이메일 수정 ---------------------*/
	@RequestMapping("updateEmail.do")
	@ResponseBody
	public String updateEmail(@ModelAttribute("email") String memberEmail, UserDto Dto, HttpSession session) throws Exception {
		Dto = (UserDto) session.getAttribute("memberDTO");

		Dto.setMemberEmail(memberEmail);
		userService.updateEmail(Dto);

		JSONObject jsonObj = new JSONObject();
		String jsonOut = jsonObj.toString();

		return jsonOut;
	}
	
	/*--------------------- 비밀번호 수정 ---------------------*/
	@RequestMapping("updatePw.do")
	@ResponseBody
	public String updatePw(@ModelAttribute("pw") String memberPw, UserDto Dto, HttpSession session) throws Exception {
		Dto = (UserDto) session.getAttribute("memberDTO");

		Dto.setMemberPw(memberPw);
		userService.updatePw(Dto);

		JSONObject jsonObj = new JSONObject();
		String jsonOut = jsonObj.toString();

		return jsonOut;
	}
	
	/*--------------------- 전화번호 수정 ---------------------*/
	@RequestMapping("updateNumber.do")
	@ResponseBody
	public String updateNumber(@ModelAttribute("number") String memberNumber, UserDto Dto, HttpSession session) throws Exception {
		Dto = (UserDto) session.getAttribute("memberDTO");

		Dto.setMemberNumber(memberNumber);
		userService.updateNumber(Dto);

		JSONObject jsonObj = new JSONObject();
		String jsonOut = jsonObj.toString();

		return jsonOut;
	}
	
	/*--------------------- 포인트 수정 ---------------------*/
	@RequestMapping("updatePoint.do")
	@ResponseBody
	public String updatePoint(@ModelAttribute("point") int holdPoint, UserDto Dto, HttpSession session) throws Exception {
		Dto = (UserDto) session.getAttribute("memberDTO");

		Dto.setHoldPoint(holdPoint);
		userService.updatePoint(Dto);

		JSONObject jsonObj = new JSONObject();
		String jsonOut = jsonObj.toString();

		return jsonOut;
	}

	/*--- 인증번호 ---*/
	/*--------------------- 이메일 전송 및 인증  ---------------------*/
	@RequestMapping("sendEmail.do")
	@ResponseBody
	public String sendEmail(@ModelAttribute("mail") String mail) throws Exception {
		JSONObject jsonObj = new JSONObject();
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
		String jsonOut = jsonObj.toString();
		return jsonOut;
	}
	
	/*--------------------- 문자 전송 및 인증  ---------------------*/
	@RequestMapping(value = "/phoneCheck", method = RequestMethod.GET) 
	@ResponseBody 
	public String sendSMS(@RequestParam("phone") String userPhoneNumber) {
		Random random = new Random();
		String key = "";
		int numIndex = random.nextInt(899999) + 100000;
		key += numIndex;
		userService.certifiedPhoneNumber(userPhoneNumber, key); 
		return key; 
	}
	
	/*--------------------- 메뉴 가격 높은순  ---------------------*/
	@RequestMapping("menuPriceHigh.do")
	public ModelAndView menuPriceHigh() throws Exception {
		logger.info("menuPriceHigh called ========");	
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("menuPrice");
		mv.addObject("menu", menuService.sltMenuHighPrice());
		
		return mv;
	}
	
	/*--------------------- 메뉴 가격 낮은순  ---------------------*/
	@RequestMapping("menuPriceLow.do")
	public ModelAndView menuPriceLow() throws Exception {
		logger.info("menuPriceLow called ========");	
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("menuPrice");
		mv.addObject("menu", menuService.sltMenuLowPrice());
		
		return mv;
	}
	
	/*--------------------- 브랜드에 맞는 메뉴  ---------------------*/
	@RequestMapping(value = "brandMenu.do", produces = "application/text; charset=utf8")
	@ResponseBody
	public String brandMenu(String brandCode) throws Exception {
		logger.info("brandMenu called ========");	
		
		System.out.println(brandCode);
		
		ObjectMapper mapper = new ObjectMapper();
		String jsonStr = mapper.writeValueAsString(menuService.sltBrandMenu(brandCode));		
		
		return jsonStr;
	}
	
	/*--------------------- 리뷰 승인하기  ---------------------*/
	@RequestMapping(value = "confirmReview.do", produces = "application/text; charset=utf8" )
	@ResponseBody
	public String confirmReview(
			@RequestParam String brandCode,
			@RequestParam String menuCode,
			@RequestParam String reviewCode,
			@RequestParam String memberCode
			) throws Exception{
		
		logger.info("confirmReview called ======");		
				
		reviewService.updateReviewY(brandCode, menuCode, reviewCode, memberCode);
		reviewService.updateHoldPoint(memberCode);
		
		ObjectMapper mapper = new ObjectMapper();
		String jsonStr = mapper.writeValueAsString(userService.sltSearch(memberCode));		
		
		return jsonStr;
	}

	/*--------------------- 리뷰 불승인하기  ---------------------*/
	@RequestMapping(value = "confirmNoReview.do", produces = "application/text; charset=utf8" )
	@ResponseBody
	public String confirmNoReview(
			@RequestParam String brandCode,
			@RequestParam String menuCode,
			@RequestParam String reviewCode,
			@RequestParam String memberCode
			) throws Exception{
		
		logger.info("confirmReview called ======");		
				
		reviewService.deleteReview(brandCode, menuCode, reviewCode, memberCode);
		
		ObjectMapper mapper = new ObjectMapper();
		String jsonStr = mapper.writeValueAsString(userService.sltSearch(memberCode));		
		
		return jsonStr;
	}
	
}

