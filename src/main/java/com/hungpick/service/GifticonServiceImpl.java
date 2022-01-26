package com.hungpick.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hungpick.dao.IGifticonDao;
import com.hungpick.dto.Gifticon;

@Service("gifticon")
public class GifticonServiceImpl implements IGifticonService {

	@Autowired
	private IGifticonDao gifticon;

	private static final Logger logger = LoggerFactory.getLogger(NoticeServiceImpl.class);

	
	@Override
	public Gifticon select(String gifticonCode, String brandCode, String menuCode)throws Exception {
		
		return gifticon.select(gifticonCode, brandCode, menuCode);
	}

	@Override
	public List<Gifticon> selectgift() {
		
		return gifticon.selectgift();
	}

	@Override
	public void insert(Gifticon gift)throws Exception {
		
		
		String giftcode = gift.getGifticonCode();
		String brandcode = gift.getBrandCode();
		String menucode = gift.getMenuCode();
		String name = gift.getGifticonName();
		String img = gift.getGifticonImg();
		int price = gift.getGifticonPrice();
		
		logger.info("update Called ============");
		logger.info("입력한 giftcode : {}", giftcode);
		logger.info("입력한 brandcode : {}", brandcode);
		logger.info("입력한 menucode : {}", menucode);
		logger.info("입력한 name : {}", name);
		logger.info("입력한 img : {}", img);
		logger.info("입력한 price : {}", price);
		 
		
		gifticon.insert(gift);
		
		return;

	}

	@Override
	public void update(Gifticon gift)throws Exception {
		
		String giftcode = gift.getGifticonCode();
		String brandcode = gift.getBrandCode();
		String menucode = gift.getMenuCode();
		String name = gift.getGifticonName();
		String img = gift.getGifticonImg();
		int price = gift.getGifticonPrice();
		
		logger.info("update Called ============");
		logger.info("입력한 giftcode : {}", giftcode);
		logger.info("입력한 brandcode : {}", brandcode);
		logger.info("입력한 menucode : {}", menucode);
		logger.info("입력한 name : {}", name);
		logger.info("입력한 img : {}", img);
		logger.info("입력한 price : {}", price);
		
		gifticon.update(gift);

	}

	@Override
	public void delete(String gifticonCode, String brandCode, String menuCode) throws Exception {
		
		logger.info("delete Called ============");
		logger.info("삭제할 기프티콘  CODE : {}",  gifticonCode);
		logger.info("삭제할 브랜드 CODE : {}",  brandCode);
		logger.info("삭제할 메뉴 CODE : {}",  menuCode);
		
		
		Gifticon check = gifticon.select(gifticonCode, brandCode, menuCode);
		
		if(check == null)
		{
			throw new Exception();
		}
		
		
		gifticon.delete(gifticonCode, brandCode, menuCode);

	}

}
