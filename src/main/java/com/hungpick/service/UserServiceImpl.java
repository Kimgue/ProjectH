package com.hungpick.service;

import java.util.Date;
import java.util.List;

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

		System.out.println("등록전");
		userDao.userRegist(Dto);
		userDaoHist.userRegistHist("Insert " + Dto.toString());
		System.out.println("등록후");

		return "redirect:/userView";
	}

	@Override
	public UserDto userLogin(String memberId, String memberPw) {
		System.out.println("3");
		return userDao.userLogin(memberId, memberPw);
	}

	@Override
	public String checkId(String memberId) {
		return userDao.checkId(memberId);
	}
}
