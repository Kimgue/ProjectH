package com.hungpick.Service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hungpick.Dao.IDaoNotice;
import com.hungpick.Dto.Notice;


@Service("notice")
public class NoticeServiceImpl implements INoticeService {

	@Autowired
	private IDaoNotice daoNotice;

	private static final Logger logger = LoggerFactory.getLogger(NoticeServiceImpl.class);

	
	public Notice sltone(String adminCode) {
		// TODO Auto-generated method stub
		return daoNotice.sltone(adminCode);
	}
	
	@Override
	public List<Notice> selectAll() throws Exception {
		
		List<Notice> list = daoNotice.selectAll();
		
		return list;
	}

	
	@Override
	public void insert(Notice noti) throws Exception {

		
		
		Notice check = daoNotice.select(noti.getAdminCode(), noti.getNoticeCode());
		
		if(check != null)
		{
			throw new Exception();
		}
		String Acode = noti.getAdminCode();
		String Bcode = noti.getNoticeCode();
		String titl = noti.getNoticeTitle();
		String cn = noti.getNoticeContent();
		String date = noti.getNoticeDate();

		logger.info("insertUser Called ============");
		logger.info("입력한 CODE : {}", Acode);
		logger.info("입력한 NAME : {}", Bcode);
		logger.info("입력한 EMAIL : {}", titl);
		logger.info("입력한 TEL : {}", cn);
		logger.info("입력한 WEIGHT : {}", date);
		
		daoNotice.insert(noti);
		

		return;
	}

	@Override
	public void update(Notice noti) throws Exception {

		

		Notice check = daoNotice.select(noti.getAdminCode(), noti.getNoticeCode());
		
		if(check != null)
		{
			throw new Exception();
		}
		String Acode = noti.getAdminCode();
		String Bcode = noti.getNoticeCode();
		String titl = noti.getNoticeTitle();
		String cn = noti.getNoticeContent();
		String date = noti.getNoticeDate();

		logger.info("insertUser Called ============");
		logger.info("입력한 CODE : {}", Acode);
		logger.info("입력한 NAME : {}", Bcode);
		logger.info("입력한 EMAIL : {}", titl);
		logger.info("입력한 TEL : {}", cn);
		logger.info("입력한 WEIGHT : {}", date);
		
		daoNotice.update(noti);
		

	}

	@Override
	@Transactional
	public void delete(String adminCode, String noticeCode) throws Exception {

		logger.info("delete Called ============");
		logger.info("입력한 CODE : {}",  adminCode);
		logger.info("입력한 CODE : {}",  noticeCode);
		
		
		
		Notice check = daoNotice.select(adminCode,noticeCode);
		
		if(check == null)
		{
			throw new Exception();
		}

		daoNotice.delete(adminCode,noticeCode);
	
	}

	@Override
	public Notice select(String adminCode, String NoticeCode) {
		
		
		return daoNotice.select(adminCode,NoticeCode);

	}


	


	

	
	

	

}
