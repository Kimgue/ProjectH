package com.hungpick.Service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hungpick.Dto.Criteria;
import com.hungpick.Dto.Question;

public interface IQuestionSerivce {
	
	Question select(@Param("memberCode")String memberCode,@Param("qstnCode")String qstnCode); // 단건조회

	List<Question> listPage(Criteria cri) throws Exception; // 회원 목록 조회

	void insert(Question qes) throws Exception; // 공지사항 입력

	void update(Question qes)throws Exception; // 회원정보 수정

	void delete(@Param("memberCode")String memberCode,@Param("qstnCode")String qstnCode) throws Exception; // 회원정보 삭제
	
	List<Question> first(@Param("memberCode")String memberCode);
	
	Question first1(@Param("memberCode")String memberCode);
	
	public int listCount()throws Exception;
}
