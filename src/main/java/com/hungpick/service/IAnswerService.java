package com.hungpick.service;

import org.apache.ibatis.annotations.Param;

import com.hungpick.dto.AnswerDto;

public interface IAnswerService {

AnswerDto selectOne(String memberCode,String qstnCode);
	
	void insert(AnswerDto answer) throws Exception;
	
	void update(AnswerDto answer);
	
	void delete(@Param("memberCode")String memberCode,@Param("qstnCode")String qstnCode,
			@Param("answerCode")int answerCode, @Param("adminCode")String adminCode);

	
	
}
