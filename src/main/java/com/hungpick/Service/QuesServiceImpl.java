package com.hungpick.Service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hungpick.Dao.IDaoQuestion;
import com.hungpick.Dto.Criteria;
import com.hungpick.Dto.Question;



@Service("question")
public class QuesServiceImpl implements IQuestionSerivce{

	@Autowired
	private IDaoQuestion daoQes;
	
	private static final Logger logger = LoggerFactory.getLogger(QuesServiceImpl.class);
	
	@Override
	public Question select(String memberCode, String qstnCode) {
		
		Question hm = daoQes.select(memberCode, qstnCode);
		
		return hm;
	}

	@Override
	public List<Question> listPage(Criteria cri) throws Exception {
		
		List<Question> list = daoQes.listPage(cri);
		
		return list;
	}

	@Override
	public void insert(Question qes) throws Exception {
		
		Question check = daoQes.select(qes.getMemberCode(), qes.getQstnCode());
		
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
		
		Question check = daoQes.select(qes.getMemberCode(), qes.getQstnCode());
		
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
		
		

		daoQes.update(qes);
		
	}

	@Override
	public void delete(String memberCode, String qstnCode) throws Exception {
		
		logger.info("delete Called ============");
		logger.info("입력한 CODE : {}",  memberCode);
		logger.info("입력한 CODE : {}",  qstnCode);
		
		Question check = daoQes.select(memberCode, qstnCode);
		
		if(check == null)
		{
			throw new Exception();
		}
		
		daoQes.delete(memberCode,qstnCode);
		
		
	}

	@Override
	public List<Question> first(String memberCode) {
		
		List<Question> list = daoQes.first(memberCode);
		
		return list;
	}

	@Override
	public Question first1(String memberCode) {
		// TODO Auto-generated method stub
		Question as = daoQes.first1(memberCode);
		
		return as;
	}

	@Override
	public int listCount() throws Exception {
		
		return daoQes.listCount();
	}

	

}
