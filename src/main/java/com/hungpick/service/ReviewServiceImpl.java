package com.hungpick.service;

import java.util.List;


import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hungpick.dao.IReviewDao;
import com.hungpick.dto.ReviewDto;
import com.hungpick.dto.ReviewRankingVo;
import com.hungpick.dto.ReviewVo;

@Service("reviewService")
public class ReviewServiceImpl implements IReviewService {
	
	@Autowired
	private IReviewDao reviewDao;
	
	private static final Logger logger = LoggerFactory.getLogger(ReviewServiceImpl.class);
	
	
	//상품에 대한 리뷰리스트 보기
	@Override
	public List<ReviewVo> sltReviewList(
			@Param(value = "brandCode") String brandCode,
			@Param(value = "menuCode") String menuCode
			) {
		
		logger.info("sltReviewList called =========");
		
		return reviewDao.sltReviewList(brandCode, menuCode);
	}

	//상품에 대한 상세리뷰 보기
	@Override
	public 	ReviewVo sltLookUp(
			@Param(value = "brandCode") String brandCode,
			@Param(value = "menuCode") String menuCode,
			@Param(value = "reviewCode") String reviewCode,
			@Param(value = "memberCode") String memberCode
			) {
		
		logger.info("sltLookUp called =========");
		
		return reviewDao.sltLookUp(brandCode, menuCode, reviewCode, memberCode);
	}

	
	//전체 상품 리뷰점수 순위 보기
	@Override
	public List<ReviewRankingVo> sltReviewRanking() {
		
		logger.info("sltReviewRanking called =========");
		
		return reviewDao.sltReviewRanking();
	}


	//리뷰 작성하기
	public void insertReview(
			@Param(value = "brandCode") String brandCode,
			@Param(value = "menuCode") String menuCode,
			@Param(value = "memberCode") String memberCode,
			@Param(value = "reviewScore") double reviewScore,
			@Param(value = "reviewContent") String reviewContent,
			@Param(value = "reviewImg") String reviewImg
			) {
			
		logger.info("insertReview called =========");
		
		reviewDao.insertReview(brandCode, menuCode, memberCode, reviewScore, reviewContent, reviewImg);
				
	}
	
	//승인안된 리뷰 조회
	@Override
	public List<ReviewDto> sltReviewN() {
		
		return reviewDao.sltReviewN();
	}
	
	//리뷰 승인여부 Y로 바꾸기
	@Override
	public void updateReviewY(
			@Param(value = "brandCode") String brandCode,
			@Param(value = "menuCode") String menuCode,
			@Param(value = "reviewCode") String reviewCode,
			@Param(value = "memberCode") String memberCode
			) {
		
		reviewDao.updateReviewY(brandCode, menuCode, reviewCode, memberCode);
	}
	
	//리뷰 승인후 획득포인트 회원 포인트에 더해주기
	@Override
	public void updateHoldPoint(@Param(value = "memberCode") String memberCode) {
		
		reviewDao.updateHoldPoint(memberCode);
	}
	
	//리뷰 삭제
	@Override
	public void deleteReview(
			@Param(value = "brandCode") String brandCode,
			@Param(value = "menuCode") String menuCode,
			@Param(value = "reviewCode") String reviewCode,
			@Param(value = "memberCode") String memberCode
			) {
		
		reviewDao.deleteReview(brandCode, menuCode, reviewCode, memberCode);
	};
	
	
	
}
