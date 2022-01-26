package com.hungpick.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hungpick.dto.ReviewRankingVo;
import com.hungpick.dto.ReviewVo;

public interface IReviewDao {
	
	List<ReviewVo> sltReviewList(
			@Param(value = "brandCode") String brandCode,
			@Param(value = "menuCode") String menuCode
			);
	
	ReviewVo sltLookUp(
			@Param(value = "brandCode") String brandCode,
			@Param(value = "menuCode") String menuCode,
			@Param(value = "reviewCode") String reviewCode,
			@Param(value = "memberCode") String memberCode
			);

	List<ReviewRankingVo> sltReviewRanking();
}
