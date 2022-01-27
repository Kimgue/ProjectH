package com.hungpick.service;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hungpick.dao.IUserDao;
import com.hungpick.dao.IUserDaoHist;
import com.hungpick.dto.UserDto;

@Service("userService")
public class UserServiceImpl implements IUserService {

	@Autowired
	private IUserDao userDao;

	@Autowired
	private IUserDaoHist userDaoHist;

	// 단건조회
	@Override
	public UserDto sltSearch(String memberCode) throws Exception {
		return userDao.sltSearch(memberCode);
	}

	// 다건조회
	@Override
	public List<UserDto> sltMulti(UserDto Dto) throws Exception {
		return userDao.sltMulti(Dto);
	}

	// 회원가입
	@Override
	@Transactional
	public String userRegist(UserDto Dto) throws Exception {
		userDao.userRegist(Dto);
		userDaoHist.userRegistHist("Insert " + Dto.toString());
		return "redirect:/userView";
	}

	@Override
	public UserDto userLogin(String memberId, String memberPw) throws Exception {
		return userDao.userLogin(memberId, memberPw);
	}

	// ID 중복검사
	@Override
	public String checkId(String memberId) throws Exception {
		return userDao.checkId(memberId);
	}

	// 로그아웃
	@Override
	public void userLogout(HttpSession session) throws Exception {
		session.invalidate();
	}

	// 회원탈퇴
	@Override
	public void userDelete(String memberId, String memberPw) throws Exception {
		userDao.userDelete(memberId, memberPw);
	}

	// PW 검사
	@Override
	public UserDto checkPw(String inputPw) throws Exception {
		return userDao.checkPw(inputPw);
	}

	// 정보수정
	@Override
	public void userUpdate(UserDto Dto) throws Exception {
		userDao.userUpdate(Dto);
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

	@Override
	public String checkNumber(String memberNumber) throws Exception {
		return userDao.checkNumber(memberNumber);
	}

}