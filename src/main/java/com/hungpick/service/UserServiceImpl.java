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

}
