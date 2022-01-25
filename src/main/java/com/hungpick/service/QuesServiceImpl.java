package com.hungpick.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hungpick.dao.IDaoQuestion;
import com.hungpick.dto.Criteria;
import com.hungpick.dto.Question;



@Service("question")
public class QuesServiceImpl implements IQuestionSerivce{

	@Autowired
	private IDaoQuestion daoQes;
	
	private static final Logger logger = LoggerFactory.getLogger(QuesServiceImpl.class);
	
	@Override
	public Question sltOne(String memberCode, String qstnCode) {
		
		Question hm = daoQes.sltOne(memberCode, qstnCode);
		
		return hm;
	}

	@Override
	public List<Question> listPage(@Param("cri")Criteria cri,@Param("memberCode")String memberCode) throws Exception {
		
		List<Question> list = daoQes.listPage(cri,memberCode);
		
		return list;
	}

	@Override
	public void insert(Question qes) throws Exception {
		
		Question check = daoQes.sltOne(qes.getMemberCode(), qes.getQstnCode());
		
		if(check != null)
		{
			throw new Exception();
		}
		
		String Acode = qes.getMemberCode();
		String Bcode = qes.getQstnCode();
		String titl = qes.getQstnTitle();
		String cn = qes.getQstnContent();
		String date = qes.getQstnDate();
		String confirm = qes.getQstnConfirm();
		
		

		logger.info("insertUser Called ============");
		logger.info("입력한 CODE : {}", Acode);
		logger.info("입력한 NAME : {}", Bcode);
		logger.info("입력한 EMAIL : {}", titl);
		logger.info("입력한 TEL : {}", cn);
		logger.info("입력한 WEIGHT : {}", date);
		logger.info("입력한 confrim : {}", confirm);
		
		daoQes.insert(qes);
	
		return;
	}

	@Override
	public void update(Question qes)throws Exception {
		
		
		
		String Acode = qes.getMemberCode();
		String Bcode = qes.getQstnCode();
		String titl = qes.getQstnTitle();
		String cn = qes.getQstnContent();
		String date = qes.getQstnDate();
		String confirm = qes.getQstnConfirm();
		
		logger.info("insertUser Called ============");
		logger.info("입력한 CODE : {}", Acode);
		logger.info("입력한 NAME : {}", Bcode);
		logger.info("입력한 EMAIL : {}", titl);
		logger.info("입력한 TEL : {}", cn);
		logger.info("입력한 WEIGHT : {}", date);
		logger.info("입력한 confrim : {}", confirm);
		
		

		daoQes.update(qes);
		
	}

	@Override
	public void delete(String memberCode, String qstnCode) throws Exception {
		
		logger.info("delete Called ============");
		logger.info("입력한 CODE : {}",  memberCode);
		logger.info("입력한 CODE : {}",  qstnCode);
		
		Question check = daoQes.sltOne(memberCode, qstnCode);
		
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
	public int listCount() throws Exception {
		
		return daoQes.listCount();
	}

	

}
