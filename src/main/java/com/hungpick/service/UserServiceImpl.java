package com.hungpick.service;

import java.util.Date;
import java.util.Enumeration;
import java.util.Hashtable;
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

	@Autowired
	private static Hashtable<String, String> loginUsers = new Hashtable<String, String>();

	// 멤버 코드 처음부터 검색하기 위한 초기 설정
	private static int memberCodeNum = 0;

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

		@SuppressWarnings("unused")
		String memberId, memberPw, memberName, memberNickname, memberEmail, memberNumber, memberCode;

		@SuppressWarnings("unused")
		Date memberDate = new Date();
		int holdPoint = 0;

		// 멤버 코드 검색 전 멤버 코드 값 초기 설정
		Dto.setMemberCode(Integer.toString(memberCodeNum));
		memberCode = Dto.getMemberCode();

		// while문 작성을 위한 초기 다건조회
		UserDto checkDto = userDao.sltSearch(memberCode);

		// 멤버 코드 처음부터 검색 후 결과 없을 시 while 탈출
		while (true) {
			if (checkDto != null) {
				memberCodeNum++;
				memberCode = Integer.toString(memberCodeNum);
				checkDto = userDao.sltSearch(memberCode);
			} else {
				memberCode = Integer.toString(memberCodeNum);
				Dto.setMemberCode(memberCode);
				Dto.setHoldPoint(holdPoint);
				break;
			}
		}

		memberCode = Dto.getMemberCode();
		memberId = Dto.getMemberId();
		memberPw = Dto.getMemberPw();
		memberName = Dto.getMemberName();
		memberNickname = Dto.getMemberNickname();
		memberEmail = Dto.getMemberEmail();
		memberNumber = Dto.getMemberNumber();
		memberDate = new Date();
		holdPoint = Dto.getHoldPoint();

		userDao.userRegist(Dto);
		userDaoHist.userRegistHist("Insert " + Dto.toString());

		return "redirect:/userView";
	}

	@Override
	public UserDto userLogin(String memberId, String memberPw, HttpSession session) throws Exception {
		return userDao.userLogin(memberId, memberPw, session);
	}

	// 로그인이 되어있는지 확인
	public boolean isLogin(String id) {
		boolean isLogin = false;
		Enumeration<String> e = loginUsers.keys();
		String key = "";
		while (e.hasMoreElements()) {
			key = (String) e.nextElement();
			if (id.equals(loginUsers.get(key)))
				isLogin = true;
		}
		return isLogin;
	}

	public boolean isUsing(String sessionId) {
		boolean isUsing = false;
		Enumeration<String> e = loginUsers.keys();
		String key = "";
		while (e.hasMoreElements()) {
			key = (String) e.nextElement();
			if (sessionId.equals(loginUsers.get(key)))
				isUsing = true;
		}
		return isUsing;
	}

	public void setSession(HttpSession session, UserDto Dto) {
		loginUsers.put(session.getId(), Dto.getMemberId());
		session.setAttribute("id", Dto.getMemberId());
	}

	// ID 중복검사
	@Override
	public String checkId(String memberId) throws Exception {
		return userDao.checkId(memberId);
	}

	// 로그아웃
	@Override
	public void userLogout(HttpSession session) throws Exception {
		loginUsers.remove(session.getId());
		session.invalidate();
	}
}
