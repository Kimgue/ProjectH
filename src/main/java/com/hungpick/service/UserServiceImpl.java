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

	private static int memberCodeNum = 0;
	private static int holdPoint = 0;

	@Override
	public List<UserDto> sltMulti(UserDto Dto) {
		return userDao.sltMulti(Dto);
	}

	@Override
	public UserDto sltSearch(String memberCode) {
		return userDao.sltSearch(memberCode);
	}

	@Override
	@Transactional
	public String userRegist(UserDto Dto) throws Exception {
		Dto.setMemberCode(Integer.toString(memberCodeNum));
		String memberCode = Dto.getMemberCode();

		System.out.println("코드 중복 확인 전");
		UserDto checkDto = userDao.sltSearch(memberCode);

		while (true) {
			if (checkDto != null) {
				memberCodeNum++;
				memberCode = Integer.toString(memberCodeNum);
				System.out.println("확인 : " + memberCode);
				checkDto = userDao.sltSearch(memberCode);
			} else {
				break;
			}
		}
		System.out.println("코드 중복 확인 후");

		memberCode = Integer.toString(memberCodeNum);

		System.out.println("확인2 : " + memberCode);

		Dto.setMemberCode(memberCode);

		Dto.setHoldPoint(holdPoint);
		int holdPoint = Dto.getHoldPoint();

		String memberId = Dto.getMemberId();
		String memberPw = Dto.getMemberPw();
		String memberName = Dto.getMemberName();
		String memberNickname = Dto.getMemberNickname();
		String memberEmail = Dto.getMemberEmail();
		String memberNumber = Dto.getMemberNumber();
		Date memberDate = new Date();

		System.out.println("memberCode : " + memberCode);
		System.out.println("memberId : " + memberId);
		System.out.println("memberPw : " + memberPw);
		System.out.println("memberName : " + memberName);
		System.out.println("memberNickname : " + memberNickname);
		System.out.println("memberEmail : " + memberEmail);
		System.out.println("memberNumber : " + memberNumber);
		System.out.println("memberDate : " + memberDate);
		System.out.println("holdPoint : " + holdPoint);

		userDao.userRegist(Dto);
		userDaoHist.userRegistHist("Insert " + Dto.toString());

		return "redirect:/userView";
	}

	@Override

	public UserDto userLogin(String memberId, String memberPw , HttpSession session) throws Exception {
		
	return userDao.userLogin(memberId, memberPw, session);
	}
	public boolean userLogin(UserDto Dto, HttpSession session) throws Exception {
		boolean isLogin = isLogin(Dto.getMemberId());
		boolean result = true;
		if (!isLogin) {
			UserDto resultDto = userDao.userLogin(memberId, memberPw, session);

			if (resultDto == null) {
				result = false;
			}
			setSession(session, resultDto);
			return result;
		}
		return !isLogin;

	}
	
//	@Override
//	public boolean userLogin(UserDto Dto, HttpSession session) throws Exception {
//		boolean isLogin = isLogin(Dto.getMemberId());
//		boolean result = true;
//		if (!isLogin) {
//			Dto = userDao.userLogin(Dto);
//
//			if (Dto == null) {
//				result = false;
//			}
//			setSession(session, Dto);
//			System.out.println("DTO : " + Dto);
//			System.out.println("코드 : " + Dto.getMemberCode());
//			return result;
//		}
//		return !isLogin;
//	}

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

	@Override
	public String checkId(String memberId) {
		return userDao.checkId(memberId);
	}

	@Override
	public void userLogout(HttpSession session) throws Exception {
		loginUsers.remove(session.getId());
		session.invalidate(); 
	}

}
