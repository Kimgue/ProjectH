package com.hungpick.Dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hungpick.dto.Criteria;
import com.hungpick.dto.Question;



public interface IDaoQuestion {
	Question select(@Param("memberCode")String memberCode,@Param("qstnCode")String qstnCode); // 단건조회

	List<Question> listPage(Criteria cri)throws Exception; // 회원 목록 조회

	void insert(Question qes); // 공지사항 입력

	void update(Question qes); // 회원정보 수정

	void delete(@Param("memberCode")String memberCode,@Param("qstnCode")String qstnCode); // 회원정보 삭제
	
	List<Question> first(@Param("memberCode")String memberCode);
	
	Question first1(@Param("memberCode")String memberCode);
	
	public int listCount()throws Exception;
	
	
	
}
