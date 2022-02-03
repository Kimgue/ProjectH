package com.hungpick.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hungpick.dto.AnswerDto;
import com.hungpick.dto.AnswerVo;

public interface IAnswerService {

	AnswerDto selectOne(String memberCode,String qstnCode);
	
	void insert(AnswerDto answer) throws Exception;
	
	void update(AnswerDto answer);
	
	void delete(@Param("memberCode")String memberCode,@Param("qstnCode")String qstnCode,
			@Param("answerCode")int answerCode, @Param("adminCode")String adminCode);
	
	List<AnswerVo> selectN();
	
}
