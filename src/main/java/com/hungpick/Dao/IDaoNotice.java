package com.hungpick.Dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hungpick.Dto.Notice;

public interface IDaoNotice {

	Notice select(@Param("adminCode")String adminCode,@Param("noticeCode")String noticeCode); // 단건조회



	List<Notice> selectAll();
	
	void insert(Notice noti); // 공지사항 입력

	void update(Notice noti); // 회원정보 수정

	void delete(@Param("adminCode")String adminCode,@Param("noticeCode")String noticeCode); // 회원정보 삭제
	
	Notice sltone(@Param("adminCode")String adminCode);
}
