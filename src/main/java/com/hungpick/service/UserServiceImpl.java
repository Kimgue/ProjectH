package com.hungpick.service;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.hungpick.dao.IUserDao;
import com.hungpick.dao.IUserDaoHist;
import com.hungpick.dto.UserDto;

@Service("userService")
public class UserServiceImpl implements IUserService {

	@Autowired
	private IUserDao userDao;

	@Autowired
	private IUserDaoHist userDaoHist;
	
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
	public String userRegist(UserDto Dto) throws Exception {
		userDao.userRegist(Dto);
		userDaoHist.userRegistHist("Insert " + Dto.toString());
		
		return "redirect:/main.jsp";
	}
	

	// 로그인
	@Override
	public String userLogin(String memberId, String memberPw, HttpSession session) throws Exception {
		UserDto Dto = userDao.userLogin(memberId, memberPw);
		
		if(Dto != null) {
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
			return "redirect:/main.jsp";
		} else {
			session.setAttribute("loginNotice", "아이디 또는 비밀번호가 잘못 입력 되었습니다.\r\n" + 
					"아이디와 비밀번호를 정확히 입력해 주세요.");
			session.setMaxInactiveInterval(1);
			return "redirect:/userLogin";		
		}
	}
	
	// 로그아웃
	@Override
	public String userLogout(HttpSession session) throws Exception {
		session.invalidate();
		return "redirect:/main.jsp";
		
	}
	
	/* ---------------------------- Ajax 사용 ---------------------------- */
	
	// 아이디 중복검사
	@Override
	public String checkId(String memberId) throws Exception {
		return userDao.checkId(memberId);
	}

	// 비밀번호 검사
	@Override
	public UserDto checkPw(String inputPw) throws Exception {
		return userDao.checkPw(inputPw);
	}

	// 닉네임 중복검사
	@Override
	public String checkNickname(String memberNickname) throws Exception {
		return userDao.checkNickname(memberNickname);
	}
	
	// 닉네임 수정
	@Override
	public void userUpdate(UserDto Dto) throws Exception {
		userDao.userUpdate(Dto); 
	}
	
	// 이메일 수정
	@Override
	public void ChangeEmail(UserDto Dto) throws Exception {
		userDao.ChangeEmail(Dto);
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
		
		if(Dto == null) {
			model.addAttribute("userFindId","입력한 정보에 일치하는 아이디가 존재하지 않습니다");
			return "userFindIdComplete";
		} else {
			model.addAttribute("userFindId","입력한 정보에 일치하는 아이디는 " + Dto.getMemberId() + " 입니다");
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
		if(Dto != null) {
			if(session.getAttribute("memberId").equals(Dto.getMemberId()) == true) {
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
	public String ChangePw(UserDto Dto, HttpSession session, HttpServletResponse response) throws Exception {
		String Id = (String) session.getAttribute("memberId");
		String Pw = (String) session.getAttribute("memberPw");
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		if(Pw.equals(Dto.getMemberPw()) != true) {
			Dto.setMemberId(Id);
			userDao.ChangePw(Dto);
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
	public String userDelete(UserDto Dto, HttpSession session) throws Exception {
		String Code = (String) session.getAttribute("memberCode");
		Dto.setMemberCode(Code);
		userDao.userDelete(Dto);
		return "userDeleteComplete";
	}




}