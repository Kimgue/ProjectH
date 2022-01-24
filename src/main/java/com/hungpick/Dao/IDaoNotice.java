package com.hungpick.Dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hungpick.dto.Criteria;
import com.hungpick.dto.Notice;

public interface IDaoNotice {

	Notice select(@Param("adminCode")String adminCode,@Param("noticeCode")String noticeCode); // 단건조회

	List<Notice> listPage(Criteria cri)throws Exception;
	
	void insert(Notice noti); // 공지사항 입력

	void update(Notice noti); // 공지사항 수정

	void delete(@Param("adminCode")String adminCode,@Param("noticeCode")String noticeCode); // 공지사항 삭제
	
	Notice sltone(@Param("adminCode")String adminCode); //관리자 코드로 작성

	public int listCount()throws Exception;

}
