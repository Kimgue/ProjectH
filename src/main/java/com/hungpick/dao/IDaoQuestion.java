package com.hungpick.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hungpick.dto.Criteria;
import com.hungpick.dto.Question;
import com.hungpick.dto.QuestionVo;




public interface IDaoQuestion {
	QuestionVo sltOne(@Param("memberCode")String memberCode,@Param("qstnCode")String qstnCode); // 단건조회

	List<QuestionVo> listPage(@Param("cri")Criteria cri,@Param("memberCode")String memberCode)throws Exception; // 회원 목록 조회

	void insert(Question qes); // 공지사항 입력

	void update(Question qes); // 회원정보 수정

	void delete(@Param("memberCode")String memberCode,@Param("qstnCode")String qstnCode); // 회원정보 삭제
	
	List<Question> OneMemberCode(@Param("memberCode")String memberCode);
	
	Question MemberCode(@Param("memberCode")String memberCode);
	
	public int listCount(@Param("memberCode")String memberCode)throws Exception;
	
	void updateanswer(@Param("memberCode")String memberCode,@Param("qstnCode")String qstnCode);
	
	List<Question> selectN(Criteria cri);
	
	public int answerCount();
}
