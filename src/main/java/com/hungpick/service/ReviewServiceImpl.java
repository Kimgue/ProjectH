package com.hungpick.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hungpick.dao.IReviewDao;
import com.hungpick.dto.ReviewRankingVo;
import com.hungpick.dto.ReviewVo;

@Service("reviewService")
public class ReviewServiceImpl implements IReviewService {
	
	@Autowired
	private IReviewDao reviewDao;
	
	private static final Logger logger = LoggerFactory.getLogger(ReviewServiceImpl.class);
	
	
	@Override
	public List<ReviewVo> sltReviewList(
			@Param(value = "brandCode") String brandCode,
			@Param(value = "menuCode") String menuCode
			) {
		logger.info("ReviewList called =========");
		
		return reviewDao.sltReviewList(brandCode, menuCode);
	}


	@Override
	public 	ReviewVo sltLookUp(
			@Param(value = "brandCode") String brandCode,
			@Param(value = "menuCode") String menuCode,
			@Param(value = "reviewCode") String reviewCode,
			@Param(value = "memberCode") String memberCode
			) {
		
		return reviewDao.sltLookUp(brandCode, menuCode, reviewCode, memberCode);
	}


	@Override
	public List<ReviewRankingVo> sltReviewRanking() {
		
		return reviewDao.sltReviewRanking();
	}

}
