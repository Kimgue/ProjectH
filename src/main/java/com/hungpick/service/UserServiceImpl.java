package com.hungpick.service;

import java.util.List;

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
		
		return "userView";
	}

	// 회원가입
	@Override
	@Transactional
	public String userRegist(UserDto Dto) throws Exception {
		userDao.userRegist(Dto);
		userDaoHist.userRegistHist("Insert " + Dto.toString());
		
		return "userRegistSubmit";
	}
	
	// 회원탈퇴
	@Override
	public String userDelete(String memberId, String memberPw) throws Exception {
		userDao.userDelete(memberId, memberPw);
		
		return "userDelete";
	}

	// 로그인
	@Override
	public String userLogin(String memberId, String memberPw, HttpSession session) throws Exception {
		UserDto Dto = userDao.userLogin(memberId, memberPw);
		
		if(Dto != null) {
			session.setAttribute("memberDTO", Dto);
//			session.setAttribute("memberCode", Dto.getMemberCode());
//			session.setAttribute("memberId", Dto.getMemberId());
//			session.setAttribute("memberPw", Dto.getMemberPw());
//			session.setAttribute("memberName", Dto.getMemberName());
//			session.setAttribute("memberNickname", Dto.getMemberNickname());
//			session.setAttribute("memberNumber", Dto.getMemberNumber());
//			session.setAttribute("memberEmail", Dto.getMemberEmail());
//			session.setAttribute("memberDate", Dto.getMemberDate());
//			session.setAttribute("holdPoint", Dto.getHoldPoint());
			return "redirect:/main.jsp";
		} else {
			return "userLogin";			
		}
	}
	
	// 로그아웃
	@Override
	public String userLogout(HttpSession session) throws Exception {
		session.invalidate();
		return "redirect:/main.jsp";
		
	}
	
	// 아이디 찾기
	@Override
	public UserDto findId(String memberName, String memberEmail) throws Exception {
		return userDao.findId(memberName, memberEmail);
	}

	// 비밀번호 찾기
	@Override
	public UserDto findPw(String memberId) throws Exception {
		return userDao.findPw(memberId);
	}

	
	
	/* ---------------------------- Ajax 사용 ---------------------------- */
	
	// ID 중복검사
	@Override
	public String checkId(String memberId) throws Exception {
		return userDao.checkId(memberId);
	}

	// PW 검사
	@Override
	public UserDto checkPw(String inputPw) throws Exception {
		return userDao.checkPw(inputPw);
	}

	// 정보수정
	@Override
	public String userUpdate(UserDto Dto) throws Exception {

		return userDao.userUpdate(Dto); 
	}

	// 닉네임 중복검사
	@Override
	public String checkNickname(String memberNickname) throws Exception {
		return userDao.checkNickname(memberNickname);
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



}