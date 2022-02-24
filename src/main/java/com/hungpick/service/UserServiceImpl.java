package com.hungpick.service;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.hungpick.dao.IUserDao;
import com.hungpick.dao.IUserDaoHist;
import com.hungpick.dto.UserDto;
import com.hungpick.dto.UserVo;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service("userService")
public class UserServiceImpl implements IUserService {

	@Autowired
	private IUserDao userDao;

	@Autowired
	private IUserDaoHist userDaoHist;
	
	//단건 조회
	public UserDto sltSearch(String memberCode) throws Exception {
		
		return userDao.sltSearch(memberCode);
	}
		
	
	// 다건조회
	@Override
	public String sltMulti(UserDto Dto, Model model) throws Exception {
		List<UserDto> list = userDao.sltMulti(Dto);
		model.addAttribute("LIST", list);

		return "userInfo";
	}

	// 회원가입
	@Override
	@Transactional
	public String registMember(UserDto Dto) throws Exception {
		userDao.registMember(Dto);
		userDaoHist.userRegistHist("Insert " + Dto.toString());

		return "redirect:/main";
	}

	// 로그인
	@Override
	public String userLogin(String memberId, String memberPw, HttpSession session) throws Exception {
		
		UserDto Dto = userDao.userLogin(memberId, memberPw);
		
		Boolean loginBool = false;
		
		if (Dto != null) {
			loginBool = true;
			session.setAttribute("loginBool", loginBool);
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
			
			String prevUrl = (String) session.getAttribute("prevUrl");
			if(prevUrl != null ) {
				
				session.removeAttribute("prevUrl");
				return prevUrl;
			}
			
			
			return "redirect:/main";
			
		} else {
			session.setAttribute("loginNotice1", "아이디 또는 비밀번호가 잘못 입력 되었습니다");
			session.setAttribute("loginNotice2", "아이디와 비밀번호를 정확히 입력해 주세요");
			session.setMaxInactiveInterval(1);
	
			return "redirect:/userLogin";
		}
	}

	// 로그아웃
	@Override
	public String userLogout(HttpSession session) throws Exception {
		session.invalidate();
		return "redirect:/main";

	}

	/* ---------------------------- Ajax 사용 ---------------------------- */

	// 아이디 중복검사
	@Override
	public String checkId(String memberId) throws Exception {
		return userDao.checkId(memberId);
	}

	// 비밀번호 검사
//	@Override
//	public UserDto checkPw(String inputPw) throws Exception {
//		return userDao.checkPw(inputPw);
//	}

	// 닉네임 중복검사
	@Override
	public String checkNickname(String memberNickname) throws Exception {
		return userDao.checkNickname(memberNickname);
	}

	// 닉네임 수정
	@Override
	public void updateNickname(UserDto Dto) throws Exception {
		userDao.updateNickname(Dto);
	}

	// 이메일 수정
	@Override
	public void updateEmail(UserDto Dto) throws Exception {
		userDao.updateEmail(Dto);
	}
	
	// 전화번호 수정
	@Override
	public void updateNumber(UserDto Dto) throws Exception {
		userDao.updateNumber(Dto);
	}
	
	@Override
	public void updatePw(UserDto Dto) throws Exception {
		userDao.updatePw(Dto);
	}
	
	// 포인트 수정
	@Override
	public void updatePoint(UserDto Dto) throws Exception {
		userDao.updatePoint(Dto);
	}

	// 이메일 중복검사
	@Override
	public String checkEmail(String memberEmail) throws Exception {
		return userDao.checkEmail(memberEmail);
	}

	// 전화번호 중복검사
	@Override
	public String checkNumber(String memberNumber) throws Exception {
		return userDao.checkNumber(memberNumber);
	}

	// 아이디 찾기
	@Override
	public String findId(String memberName, String memberEmail, Model model) throws Exception {
		UserDto Dto = userDao.findId(memberName, memberEmail);

		if (Dto == null) {
			model.addAttribute("userFindId", "입력한 정보에 일치하는 아이디가 존재하지 않습니다");
			return "userFindIdComplete";
		} else {
			model.addAttribute("userFindId", "회원님의 아이디는 " + Dto.getMemberId() + "입니다");
			return "userFindIdComplete";
		}
	}

	// 비밀번호 찾기
	@Override
	public String findPw(String memberId, HttpSession session) throws Exception {
		session.setAttribute("memberId", memberId);
		return "userFindPwChk";
		// 비밀번호 찾기 전 아이디를 먼저 검색함
	}

	// 비밀번호 변경
	@Override
	public String userUpdatePw(String memberName, String memberEmail, HttpSession session) throws Exception {
		UserDto Dto = userDao.findPw(memberName, memberEmail);
		if (Dto != null) {
			if (session.getAttribute("memberId").equals(Dto.getMemberId()) == true) {
				session.setAttribute("memberPw", Dto.getMemberPw());
				return "userFindPwComplete";
			} else {
				session.setAttribute("wrongNotice", "입력한 아이디와 정보가 일치하지 않습니다");
				session.setMaxInactiveInterval(1);
				return "redirect:/userFindPw";
			}
		} else {
			session.setAttribute("wrongNotice", "입력한 아이디와 정보가 일치하지 않습니다");
			session.setMaxInactiveInterval(1);
			return "redirect:/userFindPw";
		}
	}

	@Override
	public String updatePw(UserDto Dto, HttpSession session, HttpServletResponse response) throws Exception {
		String Id = (String) session.getAttribute("memberId");
		String Pw = (String) session.getAttribute("memberPw");

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		if (Pw.equals(Dto.getMemberPw()) != true) {
			Dto.setMemberId(Id);
			userDao.updatePw(Dto);
			session.invalidate();
			return "userLogin";
		} else {
			out.println("<script language='javascript'>");
			out.println("alert('변경하려는 비밀번호가 현재 비밀번호와 같습니다')");
			out.println("</script>");
			out.flush();
			return "userFindPwComplete";
		}

	}

	@Override
	public String deleteMember(UserDto Dto, HttpSession session) throws Exception {
		String Code = (String) session.getAttribute("memberCode");
		Dto.setMemberCode(Code);
		userDao.deleteMember(Dto);
		return "userDeleteComplete";
	}

	public void certifiedPhoneNumber(String userPhoneNumber, String key) { 
		String api_key = "NCSXZFNQ4Y99V4IZ"; 
		String api_secret = "KMUAYBBHM1AR5EMILYLHIQFLZSQDGSGJ";
		Message coolsms = new Message(api_key, api_secret); 
		HashMap<String, String> params = new HashMap<String, String>(); 
		params.put("to", userPhoneNumber); // 수신전화번호 
		params.put("from", "01066351927"); // 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨 
		params.put("type", "SMS"); 
		params.put("text", "인증번호는" + "["+key+"]" + "입니다."); 
		//문자 내용 입력 
		params.put("app_version", "test app 1.2"); 
		// application name and version 
		try { 
			JSONObject obj = (JSONObject) coolsms.send(params);
			System.out.println(obj.toString()); 
		} catch (CoolsmsException e) { 
			System.out.println(e.getMessage()); 
			System.out.println(e.getCode()); 
		} 
	}

	// 보유 기프티콘 단건 조회
	@Override
	public String userGifticonOne(String memberCode, Model model) throws Exception {
		UserDto Dto = userDao.userGifticonOne(memberCode);
		
		model.addAttribute("userGifticon",Dto);
		
		return "userGifticon";
	}

	// 보유 기프티콘 다건 조회
	@Override
	public String userGifticonMulti(UserVo Vo, Model model) throws Exception {

		List<UserVo> list = userDao.userGifticonMulti(Vo);
		model.addAttribute("userVo", list);
		
		return "userGifticon";
	}

}