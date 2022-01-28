package com.hungpick.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.hungpick.dao.IDaoAnswer;
import com.hungpick.dao.IDaoQuestion;
import com.hungpick.dto.AnswerDto;


public class AnswerServiceImpl implements IAnswerService {
	
	@Autowired
	private IDaoAnswer daoanswer;
	
	@Autowired
	private IDaoQuestion daoQes;
	
	private static final Logger logger = LoggerFactory.getLogger(QuesServiceImpl.class);
	@Override
	public AnswerDto selectOne(String memberCode, String qstnCode) {
		
		
		return daoanswer.selectOne(memberCode, qstnCode);
	}

	@Override
	@Transactional 
	public void insert(AnswerDto answer) throws Exception {
		
		AnswerDto check = daoanswer.selectOne(answer.getMemberCode(), answer.getQstnCode());
		if(check != null)
		{
			throw new Exception();
		}
		
		String membercode = answer.getMemberCode();
		String qstncode = answer.getQstnCode();
		int answercode = answer.getAnswerCode();
		String admincode =answer.getAdminCode();
		String answercontent = answer.getAnswerContent();
		String answerdate = answer.getAnswerDate();
		
		logger.info("insertUser Called ============");
		logger.info("입력한 CODE : {}", membercode);
		logger.info("입력한 NAME : {}", qstncode);
		logger.info("입력한 EMAIL : {}", answercode);
		logger.info("입력한 TEL : {}", admincode);
		logger.info("입력한 TEL : {}", answercontent);
		logger.info("입력한 WEIGHT : {}", answerdate);
	
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

}
