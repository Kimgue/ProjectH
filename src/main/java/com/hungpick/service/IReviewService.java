package com.hungpick.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hungpick.dto.ReviewRankingVo;
import com.hungpick.dto.ReviewVo;

public interface IReviewService {
	
	//상품에 대한 리뷰리스트 보기
	List<ReviewVo> sltReviewList(
			@Param(value = "brandCode") String brandCode,
			@Param(value = "menuCode") String menuCode
			);
	
	//상품에 대한 상세리뷰 보기
	ReviewVo sltLookUp(
			@Param(value = "brandCode") String brandCode,
			@Param(value = "menuCode") String menuCode,
			@Param(value = "reviewCode") String reviewCode,
			@Param(value = "memberCode") String memberCode
			);
	
	//전체 상품 리뷰점수 순위 보기
	List<ReviewRankingVo> sltReviewRanking();
}
