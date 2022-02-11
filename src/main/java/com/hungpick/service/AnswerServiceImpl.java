package com.hungpick.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hungpick.dao.IDaoAnswer;
import com.hungpick.dao.IDaoQuestion;
import com.hungpick.dto.AnswerDto;
import com.hungpick.dto.AnswerVo;
import com.hungpick.dto.Criteria;

@Service("answer")
public class AnswerServiceImpl implements IAnswerService {
	
	@Autowired
	private IDaoAnswer daoanswer;
	
	@Autowired
	private IDaoQuestion daoQes;
	
	private static final Logger logger = LoggerFactory.getLogger(QuesServiceImpl.class);
	
	@Override
	public AnswerVo selectQuestionview(String memberCode, String qstnCode) {
		// TODO Auto-generated method stub
		return daoanswer.selectQuestionview(memberCode, qstnCode);
	}
	
	@Override
	public AnswerDto selectOne(@Param("memberCode")String memberCode, @Param("qstnCode")String qstnCode) {
		
		
		return daoanswer.selectOne(memberCode, qstnCode);
	}
	

	@Override
	@Transactional 
	public void insert(AnswerDto answer) throws Exception {
		logger.info("insert성공333");
		
	
		logger.info("insert성공222");
		String membercode = answer.getMemberCode();
		String qstncode = answer.getQstnCode();
		String answercode = answer.getAnswerCode();
		String admincode = answer.getAdminCode();
		String answercontent = answer.getAnswerContent();
		String answerdate = answer.getAnswerDate();
		
		logger.info("insertUser Called ============");
		logger.info("입력한 CODE : {}", membercode);
		logger.info("입력한 NAME : {}", qstncode);
		logger.info("입력한 EMAIL : {}", answercode);
		logger.info("입력한 TEL : {}", admincode);
		logger.info("입력한 TEL : {}", answercontent);
		logger.info("입력한 WEIGHT : {}", answerdate);
		logger.info("insert성공11");
		
		daoanswer.insert(answer);
		daoQes.updateanswer(answer.getMemberCode(), answer.getQstnCode());
	}

	@Override
	public void update(AnswerDto answer) {
		// TODO Auto-generated method stub

	}

	@Override
	public void delete(String memberCode, String qstnCode, int answerCode, String adminCode) {
		// TODO Auto-generated method stub

	}


	@Override
	public List<AnswerVo> selectN(Criteria cri) {
		
		return daoanswer.selectN(cri);
	}


	

}
