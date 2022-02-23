package com.hungpick.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hungpick.dto.Criteria;
import com.hungpick.dto.Question;
import com.hungpick.dto.QuestionVo;



public interface IQuestionSerivce {
	
	QuestionVo sltOne(@Param("memberCode")String memberCode,@Param("qstnCode")String qstnCode); // 단건조회

	List<QuestionVo>  listPage(@Param("cri")Criteria cri
			,@Param("memberCode")String memberCode) throws Exception;/// 회원 목록 page

	void insert(Question qes) throws Exception; // Q&A 입력

	void update(Question qes)throws Exception; // Q&A 수정

	void delete(@Param("memberCode")String memberCode,@Param("qstnCode")String qstnCode) throws Exception; //  Q&A 수정 삭제
	
	List<Question> OneMemberCode(@Param("memberCode")String memberCode);	//회원 코드로 모든 컬럼 조회
	
	Question MemberCode(@Param("memberCode")String memberCode); // 회원코드로 회원코드만 조회
	
	public int listCount(@Param("memberCode")String memberCode)throws Exception;


	List<Question> selectN(@Param("cri")Criteria cri);

	public int answerCount();

	
}
