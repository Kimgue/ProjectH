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
		
		return reviewDao.sltLookUp(brandCode, menuCode, reviewCode, memberCode);
	}

	
	//전체 상품 리뷰점수 순위 보기
	@Override
	public List<ReviewRankingVo> sltReviewRanking() {
		
		return reviewDao.sltReviewRanking();
	}


	//리뷰 작성하기
	public ReviewDto insertReview(
			@Param(value = "brandCode") String brandCode,
			@Param(value = "menuCode") String menuCode,
			@Param(value = "memberCode") String memberCode,
			@Param(value = "reviewScore") double reviewScore,
			@Param(value = "reviewContent") String reviewContent,
			@Param(value = "reviewImg1") String reviewImg1,
			@Param(value = "reviewImg2") String reviewImg2
			) {
			
			return reviewDao.insertReview(brandCode, menuCode, memberCode, reviewScore, reviewContent, reviewImg1, reviewImg2);
					
	}
	
	
	
}
