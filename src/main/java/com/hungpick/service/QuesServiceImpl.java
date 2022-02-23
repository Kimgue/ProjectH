package com.hungpick.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hungpick.dao.IDaoQuestion;
import com.hungpick.dto.Criteria;
import com.hungpick.dto.Question;
import com.hungpick.dto.QuestionVo;



@Service("question")
public class QuesServiceImpl implements IQuestionSerivce{

	@Autowired
	private IDaoQuestion daoQes;
	
	
	private static final Logger logger = LoggerFactory.getLogger(QuesServiceImpl.class);
	
	/*---------단건조회---------------*/
	@Override
	public QuestionVo sltOne(String memberCode, String qstnCode) {
		
		QuestionVo hm = daoQes.sltOne(memberCode, qstnCode); 
		
		return hm;
	}
	/*--------한명의 회원이 올린 Q&A 리스트 ------------*/
	@Override
	public List<QuestionVo>  listPage(
			@Param("cri")Criteria cri,
			@Param("memberCode")String memberCode) throws Exception {
		
			
		/*if( memberCode == null )
		{
			return ;
		}
		else*/
			
		return daoQes.listPage(cri, memberCode);
	}

	/*-------------Q&A 입력  -----------------*/
	@Override
	@Transactional
	public void insert(Question qes) throws Exception {
		
		QuestionVo check = daoQes.sltOne(qes.getMemberCode(), qes.getQstnCode());
		
		if(check != null)
		{
			throw new Exception();
		}
			
		/*AnswerDto answer = new AnswerDto();*/
		
		String Acode = qes.getMemberCode();
		String Bcode = qes.getQstnCode();
		String titl = qes.getQstnTitle();
		String cn = qes.getQstnContent();
		String img = qes.getQstnImg();
		String date = qes.getQstnDate();
		String confirm = qes.getQstnConfirm();
		
		logger.info("insertUser Called ============");
		logger.info("입력한 CODE : {}", Acode);
		logger.info("입력한 NAME : {}", Bcode);
		logger.info("입력한 EMAIL : {}", titl);
		logger.info("입력한 TEL : {}", cn);
		logger.info("입력한 TEL : {}", img);
		logger.info("입력한 WEIGHT : {}", date);
		logger.info("입력한 confrim : {}", confirm);
		
		daoQes.insert(qes);
		
		
		return;
	}

	
	/*-----------------수정------------*/
	@Override
	public void update(Question qes)throws Exception {
		
		
		
		String Acode = qes.getMemberCode();
		String Bcode = qes.getQstnCode();
		String titl = qes.getQstnTitle();
		String cn = qes.getQstnContent();
		String img = qes.getQstnImg();
		String date = qes.getQstnDate();
		String confirm = qes.getQstnConfirm();
		
		logger.info("insertUser Called ============");
		logger.info("입력한 CODE : {}", Acode);
		logger.info("입력한 NAME : {}", Bcode);
		logger.info("입력한 EMAIL : {}", titl);
		logger.info("입력한 TEL : {}", cn);
		logger.info("입력한 TEL : {}", img);
		logger.info("입력한 WEIGHT : {}", date);
		logger.info("입력한 confrim : {}", confirm);
		
		

		daoQes.update(qes);
		
	}

	
	/*------------------게시물 삭제---------*/
	@Override
	public void delete(String memberCode, String qstnCode) throws Exception {
		
		logger.info("delete Called ============");
		logger.info("입력한 CODE : {}",  memberCode);
		logger.info("입력한 CODE : {}",  qstnCode);
		
		QuestionVo check = daoQes.sltOne(memberCode, qstnCode);
		
		if(check == null)
		{
			throw new Exception();
		}
		
		daoQes.delete(memberCode,qstnCode);
		
		
	}

	@Override
	public List<Question> OneMemberCode(String memberCode) {
		
		List<Question> list = daoQes.OneMemberCode(memberCode);
		
		return list;
	}

	@Override
	public Question MemberCode(String memberCode) {
		// TODO Auto-generated method stub
		Question as = daoQes.MemberCode(memberCode);
		
		return as;
	}

	@Override
	public int listCount(@Param("memberCode")String memberCode) throws Exception {
		
		return daoQes.listCount(memberCode);
	}

	@Override
	public List<Question> selectN(@Param("cri")Criteria cri) {
	
		return daoQes.selectN(cri);
	}

	@Override
	public int answerCount() {
		return daoQes.answerCount();
	}

	

	

}
