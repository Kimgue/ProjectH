package com.hungpick.Service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hungpick.Dto.Criteria;
import com.hungpick.Dto.Notice;


public interface INoticeService {

	Notice select(@Param("adminCode") String adminCode,@Param("noticeCode")String noticeCode); //  단건 조회

	void insert(Notice noti) throws Exception; // 공지사항입력 후 hist에 값 넣고 트랜잭션 처리

	void update(Notice noti) throws Exception; // 공지사항수정 후 hist에 값 넣고 트랜잭션 처리

	void delete(@Param("adminCode")String adminCode,@Param("noticeCode")String noticeCode) throws Exception; // 회원정보 삭제 후 hist에 값 넣고 트랜잭션 처리
	
	List<Notice> listPage(Criteria cri) throws Exception;

	Notice sltone(@Param("adminCode")String adminCode);


	public int listCount()throws Exception;
}
