package com.hungpick.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hungpick.dto.ReviewDto;
import com.hungpick.dto.ReviewRankingVo;
import com.hungpick.dto.ReviewVo;

public interface IReviewDao {
	
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
	
	//리뷰 작성하기
	void insertReview(
			@Param(value = "brandCode") String brandCode,
			@Param(value = "menuCode") String menuCode,
			@Param(value = "memberCode") String memberCode,
			@Param(value = "reviewScore") double reviewScore,
			@Param(value = "reviewContent") String reviewContent,
			@Param(value = "reviewImg") String reviewImg
			);
	
	//승인안된 리뷰 조회
	List<ReviewDto> sltReviewN();
	
	//리뷰 승인여부 Y로 바꾸기
	void updateReviewY(
			@Param(value = "brandCode") String brandCode,
			@Param(value = "menuCode") String menuCode,
			@Param(value = "reviewCode") String reviewCode,
			@Param(value = "memberCode") String memberCode
			);
	
	//리뷰 승인후 획득포인트 회원 포인트에 더해주기
	void updateHoldPoint(@Param(value = "memberCode") String memberCode);
	
	//리뷰 삭제
	void deleteReview(
			@Param(value = "brandCode") String brandCode,
			@Param(value = "menuCode") String menuCode,
			@Param(value = "reviewCode") String reviewCode,
			@Param(value = "memberCode") String memberCode
			);	
}
